/* $Id$ */

#include "netsys_c.h"

#define NETSYS_INTERNAL
#include "netsys_c_event.h"

#ifdef HAVE_EVENTFD
#include <sys/eventfd.h>
#endif

#ifdef HAVE_TIMERFD
#include <sys/timerfd.h>
#endif

#ifdef HAVE_PTHREAD
#include <pthread.h>
#endif

#ifdef HAVE_POLL
#include <poll.h>
#endif


#define Not_event_val(v) ((struct not_event **) (Data_custom_val(v)))


static void finalize_not_event(value v) {
    caml_stat_free(*(Not_event_val(v)));
}


static struct custom_operations not_event_ops = {
    "",
    finalize_not_event,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default
};


static value alloc_not_event(void) {
    struct not_event *p;
    value r;
    p = caml_stat_alloc(sizeof(struct not_event));
    r = caml_alloc_custom(&not_event_ops, sizeof(p), 0, 1);
    *(Not_event_val(r)) = p;
    return r;
};


CAMLprim value netsys_destroy_not_event(value nev)
{
    struct not_event *p;
#ifdef HAVE_POLL
    p = *(Not_event_val(nev));
    if (p->fd1 >= 0) close(p->fd1);
    p->fd1 = -1;
    if (p->fd2 >= 0) close(p->fd2);
    p->fd2 = -1;
#endif
    return(Val_unit);
}


struct not_event *netsys_not_event_of_value(value nev)
{
    return *(Not_event_val(nev));
}


void netsys_not_event_signal(struct not_event *ne)
{
#ifndef HAVE_GCC_COMPARE_AND_SWAP
#ifdef HAVE_POSIX_SIGNALS
    sigset_t set, oldset;
#endif
#endif

#ifdef HAVE_POLL
    switch (ne->type) {
    case NE_PIPE:

#ifdef HAVE_GCC_COMPARE_AND_SWAP
	/* The elegant solution. See
	   http://gcc.gnu.org/onlinedocs/gcc-4.1.2/gcc/Atomic-Builtins.html
	   for documentation
	*/
	if (__sync_bool_compare_and_swap(&(ne->state), 0, 1)) {
	    if (ne->fd2 >= 0) {
                int n;
		n = write(ne->fd2, "X", 1);
                if (n == -1) {
                    fprintf(stderr, "Cannot write to signaling pipe [netsys_c_event.c]\n");
                }
	    }
	}

#else
	/* We have to protect against concurrent calls of this functions
	   from signal handlers and from other threads. First, we block
	   signals for this thread. Once we did this, the only other
	   reason for running this can be another thread calling this
	   function. The second measure is to use a mutex to block the
	   other thread temporarily.

	   NB If called from a signal handler, and if we use a pipe,
	   this function is not absolutely correct. Actually, we are
	   not allowed to call pthread_mutex_lock. It's not
	   async-signal-safe. - TO BE SOLVED
	*/

#ifdef HAVE_POSIX_SIGNALS
	sigfillset(&set);
#ifdef HAVE_PTHREAD
	pthread_sigmask(SIG_BLOCK, &set, &oldset);
#else
	sigprocmask(SIG_BLOCK, &set, &oldset);
#endif /* HAVE_PTHREAD */
#endif /* HAVE_POSIX_SIGNALS */

#ifdef HAVE_PTHREAD
	pthread_mutex_lock(&(ne->mutex));
#endif /* HAVE_PTHREAD */

	if (ne->state == 0) {
	    ne->state = 1;
	    if (ne->fd2 >= 0)
		write(ne->fd2, "X", 1);
	}

#ifdef HAVE_PTHREAD
	pthread_mutex_unlock(&(ne->mutex));
#endif /* HAVE_PTHREAD */

#ifdef HAVE_POSIX_SIGNALS
#ifdef HAVE_PTHREAD
	pthread_sigmask(SIG_SETMASK, &oldset, NULL);
#else
	sigprocmask(SIG_SETMASK, &oldset, NULL);
#endif /* HAVE_PTHREAD */
#endif /* HAVE_POSIX_SIGNALS */
#endif /* HAVE_GCC_COMPARE_AND_SWAP */

	break;

    case NE_EVENTFD:
	{
	    int64_t buf;
	    buf = 1;
	    if (ne->fd1 >= 0) {
                int n;
		n = write(ne->fd1, (char *) &buf, 8);
                if (n == -1) {
                    fprintf(stderr, "Cannot write to signaling pipe [netsys_c_event.c]\n");
                }
	    };
	    break;
	}

    case NE_TIMERFD:
	/* not supported */
	break;
    }
   
#endif /* HAVE_POLL */
}


CAMLprim value netsys_create_not_event(value allow_user_add)
{
#ifdef HAVE_POLL
    struct not_event *p;
    value r;
    int x;
    int e;
#ifndef HAVE_EVENTFD
    int pipefd[2];
#endif

    r = alloc_not_event();
    p = *(Not_event_val(r));
    p->state = 0;
    p->fd1 = -1;
    p->fd2 = -1;
    p->allow_user_add = Bool_val(allow_user_add);
#ifdef HAVE_PTHREAD
    x = pthread_mutex_init(&(p->mutex), NULL);
    if (x != 0) unix_error(x, "pthread_mutex_init", Nothing);
#endif

#ifdef HAVE_EVENTFD
    p->type = NE_EVENTFD;
    x = eventfd(0, 0);
    if (x == -1) uerror("eventfd", Nothing);
    p->fd1 = x;
    x = fcntl(p->fd1, F_SETFD, FD_CLOEXEC);
    if (x == -1) {
	e = errno;
	close(p->fd1);
	unix_error(e, "fcntl", Nothing);
    }
#else
    p->type = NE_PIPE;
    x = pipe(pipefd);
    if (x == -1) uerror("pipe", Nothing);
    p->fd1 = pipefd[0];
    p->fd2 = pipefd[1];
    x = fcntl(p->fd1, F_SETFD, FD_CLOEXEC);
    if (x == -1) {
	e = errno;
	close(p->fd1);
	close(p->fd2);
	unix_error(e, "fcntl", Nothing);
    }
    x = fcntl(p->fd2, F_SETFD, FD_CLOEXEC);
    if (x == -1) {
	e = errno;
	close(p->fd1);
	close(p->fd2);
	unix_error(e, "fcntl", Nothing);
    }
#endif
    return r;
#else
    caml_invalid_argument("Netsys_posix.create_event not available");
#endif
}


#ifdef HAVE_TIMERFD
CAMLprim value netsys_not_event_timerfd(int clockid)
{
    struct not_event *p;
    value r;
    int x;
    int e;

    r = alloc_not_event();
    p = *(Not_event_val(r));
    p->state = 0;
    p->fd1 = -1;
    p->fd2 = -1;
    p->allow_user_add = 0;

    p->type = NE_TIMERFD;
    x = timerfd_create(clockid, 0);
    if (x == -1) uerror("timerfd_create", Nothing);
    p->fd1 = x;
    x = fcntl(p->fd1, F_SETFD, FD_CLOEXEC);
    if (x == -1) {
	e = errno;
	close(p->fd1);
	unix_error(e, "fcntl", Nothing);
    }
    return r;
}
#endif


CAMLprim value netsys_set_nonblock_not_event(value nev)
{
#ifdef HAVE_POLL
    struct not_event *ne;
    int x;

    ne = *(Not_event_val(nev));

    if (ne->fd1 == -1) 
	caml_failwith("Netsys_posix.set_nonblock_event: already destroyed");
    
    x = fcntl(ne->fd1, F_GETFL, 0);
    if (x == -1) uerror("fcntl", Nothing);

    x = fcntl(ne->fd1, F_SETFL, x | O_NONBLOCK);
    if (x == -1) uerror("fcntl", Nothing);

    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.set_nonblock_event not available");
#endif
}


CAMLprim value netsys_get_not_event_fd_nodup(value nev)
{
#ifdef HAVE_POLL
    struct not_event *ne;
    int fd, code;
    ne = *(Not_event_val(nev));
    if (ne->fd1 == -1) 
	caml_failwith("Netsys_posix.get_event_fd_nodup: already destroyed");
    return Val_int(ne->fd1);
#else
    caml_invalid_argument("Netsys_posix.get_event_fd not available");
#endif
}


/* Same, but no dup */
int netsys_return_not_event_fd(value nev)
{
#ifdef HAVE_POLL
    struct not_event *ne;
    int fd;
    ne = *(Not_event_val(nev));
    if (ne->fd1 == -1) 
	caml_failwith("Netsys_posix.get_event_fd: already destroyed");
    fd = ne->fd1;
    return fd;
#else
    caml_invalid_argument("Netsys_posix.get_event_fd not available");
#endif
}


CAMLprim value netsys_return_all_not_event_fd(value nev)
{
#ifdef HAVE_POLL
    struct not_event *ne;
    CAMLparam1(nev);
    CAMLlocal2(v1, v2);

    ne = *(Not_event_val(nev));
    v1 = Val_int(0);
    if (ne->fd1 != -1) {
	v2 = caml_alloc(2,0);
	Store_field(v2, 0, Val_int(ne->fd1));
	Store_field(v2, 1, v1);
	v1 = v2;
    };
    if (ne->fd2 != -1) {
	v2 = caml_alloc(2,0);
	Store_field(v2, 0, Val_int(ne->fd2));
	Store_field(v2, 1, v1);
	v1 = v2;
    };
    CAMLreturn(v1);
#else
    return Val_int(0);
#endif
}


CAMLprim value netsys_set_not_event(value nev)
{
#ifdef HAVE_POLL
    struct not_event *ne;
    CAMLparam1(nev);
    ne = *(Not_event_val(nev));
    if (ne->fd1 == -1) 
	caml_failwith("Netsys_posix.set_event: already destroyed");
    if (!ne->allow_user_add)
	caml_failwith("Netsys_posix.set_event: not allowed for this type of event");
    caml_enter_blocking_section();
    netsys_not_event_signal(ne);
    caml_leave_blocking_section();
    CAMLreturn(Val_unit);
#else
    caml_invalid_argument("Netsys_posix.set_event not available");
#endif
}


CAMLprim value netsys_wait_not_event(value nev)
{
#ifdef HAVE_POLL
    struct not_event *ne;
    struct pollfd p;
    int code, e;
    CAMLparam1(nev);
    ne = *(Not_event_val(nev));
    
    if (ne->fd1 == -1) 
	caml_failwith("Netsys_posix.wait_event: already destroyed");

    caml_enter_blocking_section();
    p.fd = ne->fd1;
    p.events = POLLIN;
    p.revents = 0;
    code = poll(&p, 1, (-1));
    e = errno;
    caml_leave_blocking_section();

    if (code == -1) unix_error(e, "poll", Nothing);
    CAMLreturn(Val_unit);
#else
    caml_invalid_argument("Netsys_posix.wait_event not available");
#endif
}


CAMLprim value netsys_consume_not_event(value nev)
{
#ifdef HAVE_POLL
    struct not_event *ne;
    int64_t n;
    char buf[1];
    int code, ok, e;
    CAMLparam1(nev);
    ne = *(Not_event_val(nev));
    
    if (ne->fd1 == -1) 
	caml_failwith("Netsys_posix.consume_event: already destroyed");

    caml_enter_blocking_section();

    code=0;
    ok=0;
    n=0;
    e=0;
    switch (ne->type) {
    case NE_PIPE:
	code = read(ne->fd1, buf, 1);
	ok = (code == 1);
	e = errno;
	break;
    case NE_EVENTFD:
    case NE_TIMERFD:
	code = read(ne->fd1, (char *) &n, 8);
	ok = (code == 8);
	e = errno;
	break;
    }

    caml_leave_blocking_section();

    if (code == -1) unix_error(e, "read", Nothing);
    if (!ok) unix_error(EINVAL, "read (result invalid)", Nothing);

    ne->state = 0;
    /* No need to block signals, or to use the mutex. The next signaller
       will see it, and write another byte into the pipe.
    */

    CAMLreturn(Val_unit);
#else
    caml_invalid_argument("Netsys_posix.wait_event not available");
#endif
}
