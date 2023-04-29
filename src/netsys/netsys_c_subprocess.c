/* $Id$ */

#include "netsys_c.h"

#ifdef HAVE_PTHREAD
#include <pthread.h>
#endif


/**********************************************************************/
/* Signals+Subprocesses                                               */
/**********************************************************************/

#ifdef HAVE_POSIX_SIGNALS
struct sigchld_atom {
    pid_t pid;          /* 0 means this atom is free */
    pid_t pgid;         /* process group ID if <> 0 */
    int   kill_flag;
    int   terminated;   /* whether terminated or not */
    int   status;       /* if terminated */
    int   ignore;       /* whether this is an ignored process */
    int   pipe_fd;      /* this fd is closed when termination is detected */
    int   kill_sent;    /* scratch variable for kill */
};

static struct sigchld_atom *sigchld_list = NULL;   /* an array of atoms */
static int                  sigchld_list_len = 0;  /* length of array */
static int                  sigchld_list_cnt = 0;  /* counts modifications */

#ifdef HAVE_PTHREAD
static int                  sigchld_init = 0;
static pthread_mutex_t      sigchld_mutex = PTHREAD_MUTEX_INITIALIZER;
static int                  sigchld_pipe_wr = (-1);
static int                  sigchld_pipe_rd = (-1);
#endif


static void sigchld_lock(int block_signal, int master_lock) {
    sigset_t set;
    int code;

    sigemptyset(&set);
    sigaddset(&set, SIGCHLD);

    /* We cannot always raise exceptions here, so we prefer to
       print errors to stderr. These are very surprising errors
       anyway.
    */
    
#ifdef HAVE_PTHREAD
    if (block_signal) {
	code = pthread_sigmask(SIG_BLOCK, &set, NULL);
	if (code != 0)
	    fprintf(stderr, "Netsys: pthread_sigmask returns: %s\n",
		    strerror(errno));
    }
    if (master_lock)
	caml_enter_blocking_section();
    code = pthread_mutex_lock(&sigchld_mutex);
    if (code != 0)
	fprintf(stderr, "Netsys: pthread_mutex_lock returns: %s\n",
		strerror(code));
    if (master_lock)
	caml_leave_blocking_section();
#else
    if (block_signal) {
	code = sigprocmask(SIG_BLOCK, &set, NULL);
	if (code == -1)
	    fprintf(stderr, "Netsys: sigprocmask returns: %s\n",
		    strerror(code));
    }
#endif
}


static void sigchld_unlock(int unblock_signal) {
    sigset_t set;
    int code;

    sigemptyset(&set);
    sigaddset(&set, SIGCHLD);

#ifdef HAVE_PTHREAD
    code = pthread_mutex_unlock(&sigchld_mutex);
    if (code != 0)
	fprintf(stderr, "Netsys: pthread_mutex_unlock returns: %s\n",
		strerror(code));
    if (unblock_signal) {
	code = pthread_sigmask(SIG_UNBLOCK, &set, NULL);
	if (code != 0)
	    fprintf(stderr, "Netsys: pthread_sigmask returns: %s\n",
		    strerror(errno));
    }
#else
    if (unblock_signal) {
	code = sigprocmask(SIG_UNBLOCK, &set, NULL);
	if (code == -1)
	    fprintf(stderr, "Netsys: sigprocmask returns: %s\n",
		    strerror(code));
    }
#endif
}


static void sigchld_process(pid_t pid) {
    int k, code, old_cnt;
    struct sigchld_atom *atom;

    /* The SIGCHLD signal is blocked in the current thread during the
       execution of sigchld_action. However, other threads can also
       try to access sigchld_list in parallel, so we have to protect
       that with a mutex.
    */
    sigchld_lock(0, 0);

    /* We check here all processes. Actually, the pid parameter is
       ignored. This is because consecutive signals can be merged
       in Unix.
    */

    old_cnt = sigchld_list_cnt;
    for (k=0; k<sigchld_list_len; k++) {
	atom = &(sigchld_list[k]);
	if (atom->pid != 0 && ! atom->terminated) {
	    code = waitpid(atom->pid, &(atom->status), WNOHANG);
	    if (code == -1)
		fprintf(stderr, "Netsys: waitpid returns error: %s\n",
			strerror(errno));
	    if (code > 0) {
		if (! atom->ignore) {
		    close(atom->pipe_fd);
		}
		atom->terminated = 1;
		if ( atom->ignore ) {
		    /* We can finally free this atom */
		    atom->pid = 0;
		};
	    }
	}
    }

    if (old_cnt != sigchld_list_cnt)
	fprintf(stderr, "Netsys: sigchld_process: bug in mutual exclusion\n");

    sigchld_unlock(0);
}



#ifdef HAVE_PTHREAD
/* This function runs in a separate thread */
static void *sigchld_consumer(void *arg) {
    int n;
    char buf[sizeof(pid_t)];
    pid_t pid;

    while (1) {
	n=read(sigchld_pipe_rd, buf, sizeof(pid_t));
	if (n==0)
	    break;
	else if(n==-1) {
	    if (errno == EINTR)
		continue;
	    else
		break;
	} else if (n != sizeof(pid_t))
	    break;
	memcpy(&pid, buf, sizeof(pid_t));
	sigchld_process(pid);
    }

    if (n != 0)
	fprintf(stderr,
		"Netsys: sigchld_consumer thread terminates after error\n");

    return NULL;
}

/* This function can be called from the signal handler */
static void sigchld_producer(pid_t pid) {
    char buf[sizeof(pid_t)];
    int n;

    if (!sigchld_init) return;   /* careful */

    memcpy(buf, &pid, sizeof(pid_t));
    while (1) {
	n=write(sigchld_pipe_wr, buf, sizeof(pid_t));
	if (n != -1 || errno != EINTR) break;
    }
}
#endif


static void sigchld_action(int signo, siginfo_t *info, void *ctx) {
    /* This is the sa_sigaction-style signal handler */
    pid_t pid;
    int saved_errno;

    saved_errno = errno;

    if (info->si_code == CLD_EXITED || info->si_code == CLD_KILLED 
	|| info->si_code == CLD_DUMPED
	) {

	pid = info->si_pid;
	/* In a single-threaded environment, we can directly call
           sigchld_process here. It is ensured that there is no other
           accessor of sigchld_list as SIGCHLD is blocked.
      
           In a multi-threaded environment, we call sigchld_producer
           instead. This writes the pid to a pipe, where another thread
           (sigchld_consumer) expects it, and the other thread calls
           then sigchld_process. This construction is necessary because
           there is no other way of ensuring that there is only one
           accessor of sigchld_list at a time
	*/
#ifdef HAVE_PTHREAD
	sigchld_producer(pid);
#else
	sigchld_process(pid);
#endif
    }

    errno = saved_errno;
}


static int sigchld_init_mt(void) {
#ifdef HAVE_PTHREAD
    int filedes[2];
    pthread_t pthr;
    int close_sigchld_pipe_rd = 0;
    int close_sigchld_pipe_wr = 0;
    int eflag = 1;
    
    do {  /* to define an exit for [break] */
	if (sigchld_init) { eflag = 0; break; };  /* already initialized */
	if (pipe(filedes) == -1) break;
	sigchld_pipe_rd = filedes[0];
	sigchld_pipe_wr = filedes[1];
	close_sigchld_pipe_rd = 1;
	close_sigchld_pipe_wr = 1;
	if (fcntl(sigchld_pipe_rd, F_SETFD, FD_CLOEXEC) == -1) break;
	if (fcntl(sigchld_pipe_wr, F_SETFD, FD_CLOEXEC) == -1) break;
	if (pthread_create(&pthr, NULL, &sigchld_consumer, NULL) != 0)
	    break;
	eflag = 0;
	sigchld_init = 1;
    } while (0);
    
    if (eflag) {
	int saved_errno = errno;
	if (close_sigchld_pipe_rd) close(sigchld_pipe_rd);
	if (close_sigchld_pipe_wr) close(sigchld_pipe_wr);
	errno = saved_errno;
	return (-1);
    };
    return 0;
#endif
}

#endif  /* HAVE_POSIX_SIGNALS */


CAMLprim value netsys_install_sigchld_handler(value dummy) {
#ifdef HAVE_POSIX_SIGNALS
    int code;
    struct sigaction action;
    int k;

    sigchld_lock(1, 1);
 
    memset(&action, 0, sizeof(struct sigaction));
    action.sa_sigaction = sigchld_action;
    sigemptyset(&(action.sa_mask));
    action.sa_flags = SA_SIGINFO | SA_NOCLDSTOP;

    if (sigchld_list == NULL) {
	sigchld_list_len = 100;
	sigchld_list = 
	    (struct sigchld_atom *) malloc(sigchld_list_len * 
					   sizeof(struct sigchld_atom));
	if (sigchld_list == NULL) 
	    caml_failwith("Cannot allocate memory");

	for (k=0; k<sigchld_list_len; k++)
	    sigchld_list[k].pid = 0;
    };

    code = sigaction(SIGCHLD,
		     &action,
		     NULL);
    if (code == -1) {
	code = errno;
	sigchld_unlock(1);
	errno = code;
	uerror("sigaction", Nothing);
    };

    sigchld_unlock(1);

    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.install_subprocess_handler not available");
#endif
}


CAMLprim value netsys_subprocess_cleanup_after_fork(value dummy) {
#ifdef HAVE_POSIX_SIGNALS
    int k;
    struct sigchld_atom *atom;
    int reinit = 0;
    if (sigchld_list != NULL) {
	reinit = 1;
	for (k=0; k<sigchld_list_len; k++) {
	    atom = &(sigchld_list[k]);
	    if (atom->pid != 0 && ! atom->ignore && ! atom->terminated) {
		close(atom->pipe_fd);
	    }
	};
	free(sigchld_list);
	sigchld_list = NULL;
    }
#ifdef HAVE_PTHREAD
    if (sigchld_init) {
	close(sigchld_pipe_rd);
	close(sigchld_pipe_wr);
	sigchld_init = 0;
	pthread_mutex_init(&sigchld_mutex, NULL);
    }
#endif
    if (reinit)
	netsys_install_sigchld_handler(dummy);
#endif
    return Val_unit;
}


CAMLprim value netsys_watch_subprocess(value pid_v, value pgid_v, 
				       value kill_flag_v) {
#ifdef HAVE_POSIX_SIGNALS
    int k, atom_idx;
    struct sigchld_atom *atom;
    int pfd[2];
    value r;
    pid_t pid, pgid;
    int status, code, kill_flag;
    
    if (sigchld_list == NULL)
	caml_failwith("Netsys_posix.watch_subprocess: uninitialized");

    if (pipe(pfd) == -1)
	uerror("pipe", Nothing);

    if (fcntl(pfd[0], F_SETFD, FD_CLOEXEC) == -1) {
	code = errno;
	close(pfd[0]);
	close(pfd[1]);
	errno = code;
	uerror("set_close_on_exec", Nothing);
    };

    if (fcntl(pfd[1], F_SETFD, FD_CLOEXEC) == -1) {
	code = errno;
	close(pfd[0]);
	close(pfd[1]);
	errno = code;
	uerror("set_close_on_exec", Nothing);
    };

    pid = Int_val(pid_v);
    pgid = Int_val(pgid_v);
    kill_flag = Bool_val(kill_flag_v);

    /* First block the signal handler and other threads from concurrent
       accesses:
    */
    sigchld_lock(1, 1);

#ifdef HAVE_PTHREAD
    if (!sigchld_init) {
	/* Delayed initialization of the helper thread, and the descriptors
           communicating with it. This cannot not be done at install time
           as this collides with fork() requirements: After a fork() it is
           unclear whether this whole machinery is still used. The fork
           cleanup function above reinstalls the signal handler (which is ok
           and expected). It would be too much to also do this stuff then.
	*/
	if (sigchld_init_mt() == -1) {
	    int saved_errno = errno;
	    sigchld_unlock(1);
	    unix_error(saved_errno,
		       "netsys_watch_subprocess [delayed init]",
		       Nothing);
	}
    }
#endif

    /* Search for a free atom: */
    atom=NULL;
    atom_idx = 0;
    for (k=0; k<sigchld_list_len && atom==NULL; k++) {
	if (sigchld_list[k].pid == 0) {
	    atom = &(sigchld_list[k]);
	    atom_idx = k;
	}
    }

    if (atom == NULL) {
	/* Nothing found. Reallocate. */
	int old_size;

	old_size = sigchld_list_len;
	sigchld_list_len += sigchld_list_len;

	sigchld_list = 
	    (struct sigchld_atom *) realloc( (struct sigchld_atom *)
					     sigchld_list,
					     sigchld_list_len * 
					     sizeof(struct sigchld_atom) );

	if (sigchld_list == NULL) {
	    sigchld_unlock(1);
	    close(pfd[0]);
	    close(pfd[1]);
	    caml_failwith("Cannot allocate memory");
	};

	for (k=old_size; k<sigchld_list_len; k++)
	    sigchld_list[k].pid = 0;

	atom = &(sigchld_list[old_size]);
	atom_idx = old_size;
    };

    /* Try waitpid once. Maybe the process is already terminated! */
    code = waitpid(pid, &status, WNOHANG);

    if (code == -1) {
	code = errno;
	sigchld_unlock(1);
	close(pfd[0]);
	close(pfd[1]);
	errno = code;
	uerror("waitpid", Nothing);
    };

    if (code == 0) {  /* not yet terminated */
	atom->pid = pid;
	atom->pgid = pgid;
	atom->kill_flag = kill_flag;
	atom->terminated = 0;
	atom->status = 0;
	atom->ignore = 0;
	atom->pipe_fd = pfd[1];
    } else {
	close(pfd[1]);
	atom->pid = pid;
	atom->pgid = pgid;
	atom->kill_flag = kill_flag;
	atom->terminated = 1;
	atom->status = status;
	atom->ignore = 0;
	atom->pipe_fd = -1;
    };
    sigchld_list_cnt++;

    sigchld_unlock(1);

    r = caml_alloc(2,0);
    Field(r,0) = Val_int(pfd[0]);
    Field(r,1) = Val_int(atom_idx);
    
    return r;
#else
    caml_invalid_argument("Netsys_posix.watch_subprocess not available");
#endif
}


CAMLprim value netsys_ignore_subprocess(value atom_idx_v) {
#ifdef HAVE_POSIX_SIGNALS
    int atom_idx;
    struct sigchld_atom *atom;

    atom_idx = Int_val(atom_idx_v);

    sigchld_lock(1, 1);

    atom = &(sigchld_list[atom_idx]);
    if (!atom->ignore && !atom->terminated)
	close(atom->pipe_fd);
    atom->ignore = 1;
    
    sigchld_unlock(1);

    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.ignore_subprocess not available");
#endif
}


CAMLprim value netsys_forget_subprocess(value atom_idx_v) {
#ifdef HAVE_POSIX_SIGNALS
    int atom_idx;
    struct sigchld_atom *atom;

    sigchld_lock(1, 1);

    atom_idx = Int_val(atom_idx_v);
    atom = &(sigchld_list[atom_idx]);

    atom->pid = 0;
    if (!atom->ignore && !atom->terminated)
	close(atom->pipe_fd);

    sigchld_unlock(1);

    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.forget_subprocess not available");
#endif
}


#define TAG_WEXITED 0
#define TAG_WSIGNALED 1
#define TAG_WSTOPPED 2


CAMLprim value netsys_get_subprocess_status(value atom_idx_v) {
#ifdef HAVE_POSIX_SIGNALS
    int atom_idx;
    struct sigchld_atom *atom;
    struct sigchld_atom copy;
    value r, st;

    atom_idx = Int_val(atom_idx_v);

    sigchld_lock(1, 1);

    /* We cannot allocate OCaml memory while we have the lock
       (otherwise we could call a finalizer for a watched process... 
       resulting in a deadlock)

       So create a copy.
    */
    atom = &(sigchld_list[atom_idx]);
    memcpy(&copy, atom, sizeof(struct sigchld_atom));
    sigchld_unlock(1);

    if (copy.terminated) {
	if (WIFEXITED(copy.status)) {
	    st = caml_alloc_small(1, TAG_WEXITED);
	    Field(st, 0) = Val_int(WEXITSTATUS(copy.status));
	}
	else {
	    st = caml_alloc_small(1, TAG_WSIGNALED);
	    Field(st, 0) = 
		Val_int(caml_rev_convert_signal_number(WTERMSIG(copy.status)));
	};
	r = caml_alloc(1,0);
	Field(r, 0) = st;
    }
    else {
	r = Val_int(0);
    }

    return r;
#else
    caml_invalid_argument("Netsys_posix.forget_subprocess not available");
#endif
}


CAMLprim value netsys_kill_subprocess(value sig_v, value atom_idx_v) {
#ifdef HAVE_POSIX_SIGNALS
    int atom_idx;
    struct sigchld_atom *atom;
    int sig;

    atom_idx = Int_val(atom_idx_v);
    sig = caml_convert_signal_number(Int_val(sig_v));

    sigchld_lock(1, 1);

    atom = &(sigchld_list[atom_idx]);
    if (!atom->terminated) {
	kill(atom->pid, sig);
    }

    sigchld_unlock(1);

    return Val_unit;

#else
    caml_invalid_argument("Netsys_posix.kill_subprocess not available");
#endif
}


CAMLprim value netsys_killpg_subprocess(value sig_v, value atom_idx_v) {
#ifdef HAVE_POSIX_SIGNALS
    int atom_idx;
    struct sigchld_atom *atom;
    int sig, k;
    pid_t pgid;
    int exists;

    atom_idx = Int_val(atom_idx_v);
    sig = caml_convert_signal_number(Int_val(sig_v));

    sigchld_lock(1, 1);

    atom = &(sigchld_list[atom_idx]);
    pgid = atom->pgid;

    if (pgid > 0) {
	/* Does any process for pgid exist in the watch list? */
	exists = 0;
	for (k=0; k<sigchld_list_len && !exists; k++) {
	    exists=sigchld_list[k].pid != 0 && !sigchld_list[k].terminated;
	}
	if (exists) {
	    kill(-pgid, sig);
	}
    }

    sigchld_unlock(1);

    return Val_unit;

#else
    caml_invalid_argument("Netsys_posix.killpg_subprocess not available");
#endif
}


CAMLprim value netsys_kill_all_subprocesses(value sig_v, value o_flag_v,
					    value ng_flag_v) {
#ifdef HAVE_POSIX_SIGNALS
    int sig;
    int o_flag, ng_flag;
    struct sigchld_atom *atom;
    int k;

    if (sigchld_list == NULL)
	caml_failwith("Netsys_posix.watch_subprocess: uninitialized");

    sig = caml_convert_signal_number(Int_val(sig_v));
    o_flag = Bool_val(o_flag_v);
    ng_flag = Bool_val(ng_flag_v);

    sigchld_lock(1, 1);

    for (k=0; k<sigchld_list_len; k++) {
	atom = &(sigchld_list[k]);
	if (atom->pid != 0 && 
	    !atom->terminated && 
	    (!ng_flag || atom->pgid==0) &&
	    (o_flag || atom->kill_flag)) {
	    
	    kill(atom->pid, sig);
	}
    }

    sigchld_unlock(1);

    return Val_unit;

#else
    caml_invalid_argument("Netsys_posix.kill_all_subprocesses not available");
#endif
}


CAMLprim value netsys_killpg_all_subprocesses(value sig_v, value o_flag_v) {
#ifdef HAVE_POSIX_SIGNALS
    struct sigchld_atom *atom;
    int sig;
    int o_flag;
    int k,j;
    pid_t pgid;

    if (sigchld_list == NULL)
	caml_failwith("Netsys_posix.watch_subprocess: uninitialized");

    sig = caml_convert_signal_number(Int_val(sig_v));
    o_flag = Bool_val(o_flag_v);

    sigchld_lock(1, 1);

    /* delete kill_sent: */
    for (k=0; k<sigchld_list_len; k++) {
	sigchld_list[k].kill_sent = 0;
    };

    /* check processes: */
    for (k=0; k<sigchld_list_len; k++) {
	atom = &(sigchld_list[k]);
	if (atom->pid != 0 && 
	    !atom->terminated && 
	    atom->pgid > 0 &&
	    !atom->kill_sent &&
	    (o_flag || atom->kill_flag)) {
	    
	    pgid = atom->pgid;
	    kill(-pgid, sig);
	    
	    for (j=k+1; j<sigchld_list_len; j++) {
		if (sigchld_list[j].pid != 0 && sigchld_list[j].pgid == pgid)
		    sigchld_list[j].kill_sent = 1;
	    }
	}
    }

    sigchld_unlock(1);

    return Val_unit;

#else
    caml_invalid_argument("Netsys_posix.killpg_all_subprocesses not available");
#endif
}


