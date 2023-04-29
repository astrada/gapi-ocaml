/* $Id$ */

#ifdef __sun__
/* Solaris needs this for getting "isfinite" */
#define __C99FEATURES__
#endif

#include "netsys_c.h"
#include "netsys_c_event.h"
#include <math.h>
#include <limits.h>

#ifdef HAVE_TIMERFD
#include <sys/timerfd.h>
#endif

/* Clock-related functions */

#ifdef HAVE_CLOCK
static void make_timespec(value tspair, struct timespec *ts) {
    double d, i;
    long n, r;

    d = Double_val(Field(tspair,0));
    if (!isfinite(d) || d < 0 || d > LONG_MAX-1)
	caml_failwith("Netsys_posix: time value out of range");
    n = Long_val(Field(tspair,1));
    if (n < 0 || n > 999999999)
	caml_failwith("Netsys_posix: time value out of range");
    i = floor(d);
    r = floor((d - i) * 1E9);
    r = r + n;
    while (r > 999999999) {
	r = r - 1000000000;
	i = i + 1;
    };
    ts->tv_sec = i;
    ts->tv_nsec = r;
}
#endif


#ifdef HAVE_CLOCK
static value alloc_timespec_pair(double sec, long nsec) {
    CAMLparam0();
    CAMLlocal1(tsout);
    tsout = caml_alloc(2,0);
    Store_field(tsout, 0, caml_copy_double(sec));
    Store_field(tsout, 1, Val_long(nsec));
    CAMLreturn(tsout);
}
#endif


#ifdef HAVE_CLOCK
static void clockid_val(value c, clockid_t *out) {
    *out = 0;
    if (Is_long(c)) {
	switch(Long_val(c)) {
	case 0:
	    *out = CLOCK_REALTIME;
	    break;
	case 1:
#ifdef _POSIX_MONOTONIC_CLOCK
	    *out = CLOCK_MONOTONIC;
	    break;
#else
	    caml_failwith("Netsys_posix: CLOCK_MONOTONIC is not supported");
#endif
	}
    }
    else {
	const char * s;
	s = String_val(Field(c,0));
	memcpy(out, s, sizeof(clockid_t));
    }
}
#endif



CAMLprim value netsys_nanosleep(value tspair, value tsref)
{
#ifdef HAVE_CLOCK
    CAMLparam2(tspair,tsref);
    CAMLlocal1(tsout);
    struct timespec t_in, t_out;
    int r, e;

    make_timespec(tspair, &t_in);

    caml_enter_blocking_section();
    r = nanosleep(&t_in, &t_out);
    e = errno;
    caml_leave_blocking_section();


    tsout = alloc_timespec_pair(t_out.tv_sec, t_out.tv_nsec);
    Store_field(tsref, 0, tsout);

    if (r == -1) unix_error(e, "nanosleep", Nothing);
   
    CAMLreturn(Val_unit);
#else
    caml_invalid_argument("Netsys_posix.nanosleep not available");
#endif
}


CAMLprim value netsys_clock_gettime(value clock)
{
#ifdef HAVE_CLOCK
    CAMLparam1(clock);
    CAMLlocal1(tsout);
    clockid_t c;
    struct timespec ts;
    int r;

    clockid_val(clock, &c);
    r = clock_gettime(c, &ts);
    if (r == -1) uerror("clock_gettime", Nothing);
    
    tsout = alloc_timespec_pair(ts.tv_sec, ts.tv_nsec);
    
    CAMLreturn(tsout);
#else
    caml_invalid_argument("Netsys_posix.clock_gettime not available");
#endif
}


CAMLprim value netsys_clock_settime(value clock, value tspair)
{
#ifdef HAVE_CLOCK
    CAMLparam2(clock,tspair);
    clockid_t c;
    struct timespec ts;
    int r;

    clockid_val(clock, &c);
    make_timespec(tspair, &ts);

    r = clock_settime(c, &ts);
    if (r == -1) uerror("clock_settime", Nothing);
    
    CAMLreturn(Val_unit);
#else
    caml_invalid_argument("Netsys_posix.clock_settime not available");
#endif
}


CAMLprim value netsys_clock_getres(value clock)
{
#ifdef HAVE_CLOCK
    CAMLparam1(clock);
    CAMLlocal1(tsout);
    clockid_t c;
    struct timespec ts;
    int r;

    clockid_val(clock, &c);

    r = clock_getres(c, &ts);
    if (r == -1) uerror("clock_getres", Nothing);
    
    tsout = alloc_timespec_pair(ts.tv_sec, ts.tv_nsec);
    
    CAMLreturn(tsout);
#else
    caml_invalid_argument("Netsys_posix.clock_getres not available");
#endif
}


CAMLprim value netsys_clock_getcpuclockid(value pid) {
#if defined(HAVE_CLOCK) && defined(_POSIX_CPUTIME) && _POSIX_CPUTIME > 0
    CAMLparam1(pid);
    CAMLlocal1(v);
    clockid_t c;
    int r;
    char *s;

    r = clock_getcpuclockid(Long_val(pid), &c);
    if (r != 0) unix_error(r, "clock_getcpuclockid", Nothing);

    v = caml_alloc_string(sizeof(clockid_t));
    s = String_val(v);

    memcpy(s, &c, sizeof(clockid_t));

    CAMLreturn(v);
#else
    caml_invalid_argument("Netsys_posix.clock_getcpuclockid not available");
#endif
}


CAMLprim value netsys_have_posix_timer(value dummy) {
#if defined(HAVE_CLOCK) && defined(HAVE_POSIX_TIMER)
    return Val_bool(1);
#else
    return Val_bool(0);
#endif
}


#if defined(HAVE_CLOCK) && defined(HAVE_POSIX_TIMER)
static void forward_to_event(union sigval sv) {
    struct not_event *ne;
    ne = (struct not_event *) sv.sival_ptr;
    netsys_not_event_signal(ne);
}
#endif

/* We assume the following representation for posix_timer:

   type timer_mech =
     | TT_POSIX of string     (* string contains the timer_t value *)
     | TT_TIMERFD of int      (* the fd *)

   type posix_timer = timer_mech * not_event

   not_event is simple Val_int(0) if not used.
 */


CAMLprim value netsys_timer_create(value clock, value texp) {
#if defined(HAVE_CLOCK) && defined(HAVE_POSIX_TIMER)
    clockid_t c;
    timer_t tm;
    struct sigevent sev;
    struct not_event *ne;
    int code;
    int tcase;  /* 0 = timer_create, 1 = timerfd */
    CAMLparam2(clock, texp);
    CAMLlocal3(v_timer, v_event, v);

    clockid_val(clock, &c);
    memset(&sev, 0, sizeof(struct sigevent));
    tcase = 0;
    v_event = Val_int(0);
    
    if (Is_long(texp)) {
	switch (Int_val(texp)) {
	case 0:
	    /* TEXP_NONE */
	    sev.sigev_notify = SIGEV_NONE;
	    break;
	case 1:
	    /* TEXP_EVENT_CREATE */
#ifdef HAVE_TIMERFD
	    v_event = netsys_not_event_timerfd(c);
	    tcase = 1;
	    break;
#else
	    /* as for TEXP_EVENT */
#ifdef HAVE_PTHREAD
	    v_event = netsys_create_not_event(Val_bool(0));
	    ne = netsys_not_event_of_value(v_event);
	    sev.sigev_notify = SIGEV_THREAD;
	    sev.sigev_notify_function = forward_to_event;
	    sev.sigev_value.sival_ptr = ne;
	    break;
#else
	    caml_failwith("Netsys_posix.timer_create: unsupported type of timer");
#endif
#endif
	}
    }
    else {
	switch (Tag_val(texp)) {
	case 0:
	    /* TEXP_EVENT */
#ifdef HAVE_PTHREAD
	    v_event = Field(texp,0);
	    ne = netsys_not_event_of_value(v_event);
	    sev.sigev_notify = SIGEV_THREAD;
	    sev.sigev_notify_function = forward_to_event;
	    sev.sigev_value.sival_ptr = ne;
	    break;
#else
	    caml_failwith("Netsys_posix.timer_create: unsupported type of timer");
#endif
	case 1:
	    /* TEXP_SIGNAL */
	    sev.sigev_notify = SIGEV_SIGNAL;
	    sev.sigev_signo = 
		caml_convert_signal_number(Int_val(Field(texp,0)));
	    break;
	}
    };

    switch (tcase) {
    case 0:
	code = timer_create(c, &sev, &tm);
	if (code == -1) uerror("timer_create", Nothing);
	v = caml_alloc_string(sizeof(timer_t));
	memcpy(Bytes_val(v), (char *) &tm, sizeof(timer_t));
	v_timer = caml_alloc(1, 0);
	Store_field(v_timer, 0, v);
	break;
#ifdef HAVE_TIMERFD
    case 1:
	v_timer = caml_alloc(1, 1);
	Store_field(v_timer, 0, Val_int(netsys_return_not_event_fd(v_event)));
	break;
#endif
    };

    v = caml_alloc(2,0);
    Store_field(v, 0, v_timer);
    Store_field(v, 1, v_event);
    CAMLreturn(v);
#else
    caml_invalid_argument("Netsys_posix.timer_create not available");
#endif
}


#if defined(HAVE_CLOCK) && defined(HAVE_POSIX_TIMER)
static void extract_timer(value v, timer_t *out) {
    memcpy((char *) out, String_val(v), sizeof(timer_t));
}
#endif


CAMLprim value netsys_timer_settime(value timer, value abstime, 
				    value ival, value exp) 
{
#if defined(HAVE_CLOCK) && defined(HAVE_POSIX_TIMER)
    timer_t tm;
    struct itimerspec it;
    int code;
    int fd;

    fd=0;
    make_timespec(ival, &(it.it_interval));
    make_timespec(exp, &(it.it_value));

    switch (Tag_val(Field(timer, 0))) {
    case 0:
	/* POSIX timer */
	extract_timer(Field(Field(timer, 0), 0), &tm);
 	code = timer_settime(tm,
			     Bool_val(abstime) ? TIMER_ABSTIME : 0,
			     &it,
			     NULL);
	if (code == -1) uerror("timer_settime", Nothing);
	break;
#ifdef HAVE_TIMERFD
    case 1:
	/* TIMERFD */
	fd = Int_val(Field(Field(timer, 0), 0));
	code = timerfd_settime(fd,
			       Bool_val(abstime) ? TFD_TIMER_ABSTIME : 0,
			       &it,
			       NULL);
	if (code == -1) uerror("timerfd_settime", Nothing);
	break;
#endif
    };

    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.timer_settime not available");
#endif
}


CAMLprim value netsys_timer_gettime(value timer) {
#if defined(HAVE_CLOCK) && defined(HAVE_POSIX_TIMER)
    timer_t tm;
    struct itimerspec it;
    int code;
    int fd;
    value r;

    fd = 0;
    switch (Tag_val(Field(timer, 0))) {
    case 0:
	/* POSIX timer */
	extract_timer(Field(Field(timer, 0), 0), &tm);
	code = timer_gettime(tm, &it);
	if (code == -1) uerror("timer_gettime", Nothing);
	break;
#ifdef HAVE_TIMERFD
    case 1:
	/* TIMERFD */
	fd = Int_val(Field(Field(timer, 0), 0));
	code = timerfd_gettime(fd, &it);
	if (code == -1) uerror("timerfd_gettime", Nothing);
	break;
#endif
    };

    r = alloc_timespec_pair(it.it_value.tv_sec,
			    it.it_value.tv_nsec);
    return r;
#else
    caml_invalid_argument("Netsys_posix.timer_gettime not available");
#endif
}


CAMLprim value netsys_timer_delete(value timer) {
#if defined(HAVE_CLOCK) && defined(HAVE_POSIX_TIMER)
    timer_t tm;
    int code;

    switch (Tag_val(Field(timer, 0))) {
    case 0:
	/* POSIX timer */
	extract_timer(Field(Field(timer, 0), 0), &tm);
	code = timer_delete(tm);
	if (code == -1) uerror("timer_delete", Nothing);
	break;
#ifdef HAVE_TIMERFD
    case 1:
	/* TIMERFD */
	netsys_destroy_not_event(Field(timer, 1));
	break;
#endif
    }
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.timer_delete not available");
#endif
}


CAMLprim value netsys_timer_event(value timer) {
#if defined(HAVE_CLOCK) && defined(HAVE_POSIX_TIMER)
    if (Is_block(Field(timer, 1))) {
	return Field(timer,1);
    }
    else {
	caml_failwith("Netsys_posix.timer_event: timer is not connected with event");
    }
#else
    caml_invalid_argument("Netsys_posix.timer_delete not available");
#endif
}
