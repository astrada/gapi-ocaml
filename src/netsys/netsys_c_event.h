/* $Id$ */

#ifndef NETSYS_C_EVENT_H
#define NETSYS_C_EVENT_H

#ifdef NETSYS_INTERNAL

#include "netsys_c.h"
#ifdef HAVE_PTHREAD
#include <pthread.h>
#endif

enum not_event_type {
    NE_PIPE = 0,
    NE_EVENTFD = 1,
    NE_TIMERFD = 2
};

struct not_event {
    enum not_event_type    type;
#ifdef HAVE_POSIX_SIGNALS
    volatile sig_atomic_t  state;    /* 0=off, 1=on, only for NE_PIPE */
    int                    fd1;
    int                    fd2;      /* only for NE_PIPE */
    int                    allow_user_add;
#ifdef HAVE_PTHREAD
    pthread_mutex_t        mutex;
#endif
#endif
};

#else

#include "caml/mlvalues.h"

struct not_event;

#endif

extern struct not_event *netsys_not_event_of_value(value v);
/* Extracts the [not_event] from an OCaml value [v]. Users of this
   function should take care to keep [v] reachable while they use
   [not_event], because [not_event] will be destroyed when
   [v] is garbage-collected.
*/

extern void netsys_not_event_signal(struct not_event *ne);
/* Signals the notification event. This is allowed from any thread,
   and from signal handlers. The function may block for short periods
   of time.
*/

extern value netsys_create_not_event(value);
/* Create a new event as value. The arg is the bool whether the user
   can set the event
*/

extern int netsys_return_not_event_fd(value);
/* Returns the fd directly (no dup) */

extern value netsys_destroy_not_event(value);
/* Closes the event passed as arg. Return unit. */

#ifdef HAVE_TIMERFD
extern value netsys_not_event_timerfd(int clockid);
/* Creates a new [not_event] value for a notification based on a
   timerfd. The clock is identified by [clockid].
*/

#endif

#endif
