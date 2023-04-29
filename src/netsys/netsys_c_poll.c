/* $Id$ */


#include "netsys_c.h"

#ifdef HAVE_POLL
#include <sys/poll.h>
#endif


/* We only accept epoll() if we also have the eventfd() syscall. The latter
   was introduced later into Linux, so there are older systems with epoll
   but lacking eventfd.
*/

#if defined(HAVE_EPOLL) && defined(HAVE_EVENTFD)
#define HAVE_POLL_AGGREG
#define USABLE_EPOLL
#include <sys/eventfd.h>
#include <sys/epoll.h>
#define EPOLL_NUM 128
#endif

/**********************************************************************/
/* poll interface                                                     */
/**********************************************************************/

CAMLprim value netsys_pollfd_size (value dummy) {
#ifdef HAVE_POLL
    return Val_int(sizeof(struct pollfd));
#else
    return Val_int(0);
#endif
}


#define Poll_mem_val(v) ((struct pollfd **) (Data_custom_val(v)))

#ifdef HAVE_POLL
static void finalize_poll_mem(value r) {
    caml_stat_free(*(Poll_mem_val(r)));
}

static struct custom_operations poll_mem_ops = {
    "",
    finalize_poll_mem,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default
};

static value alloc_poll_mem(int n) {
    struct pollfd *p;
    value r;
    p = caml_stat_alloc(n * sizeof(struct pollfd));
    r = caml_alloc_custom(&poll_mem_ops, sizeof(p), n, 100000);
    *(Poll_mem_val(r)) = p;
    return r;
};
#endif


CAMLprim value netsys_mk_poll_mem(value n) {
#ifdef HAVE_POLL
    value s;
    struct pollfd p;
    int k;
    p.fd = 0;
    p.events = 0;
    p.revents = 0;
    s = alloc_poll_mem(n);
    for (k=0; k<n; k++) {
	(*(Poll_mem_val(s)))[k] = p;
    };
    return s;
#else
    caml_invalid_argument("netsys_mk_poll_mem");
#endif
}


CAMLprim value netsys_set_poll_mem(value s, value k, value fd, value ev, value rev) {
#ifdef HAVE_POLL
    struct pollfd p;
    p.fd = Int_val(fd);
    p.events = Int_val(ev);
    p.revents = Int_val(rev);
    (*(Poll_mem_val(s)))[Int_val(k)] = p;
    return Val_unit;
#else
    caml_invalid_argument("netsys_set_poll_mem");
#endif

}


CAMLprim value netsys_get_poll_mem(value s, value k) {
#ifdef HAVE_POLL
    struct pollfd p;
    value triple;
    p = (*(Poll_mem_val(s)))[Int_val(k)];
    triple = caml_alloc_tuple(3);
    Store_field(triple, 0, Val_int(p.fd));
    Store_field(triple, 1, Val_int(p.events));
    Store_field(triple, 2, Val_int(p.revents));
    return triple;
#else
    caml_invalid_argument("netsys_get_poll_mem");
#endif
}


CAMLprim value netsys_blit_poll_mem(value s1, value k1, value s2, value k2, value l) {
#ifdef HAVE_POLL
    struct pollfd *p1;
    struct pollfd *p2;
    p1 = *(Poll_mem_val(s1));
    p2 = *(Poll_mem_val(s2));
    memmove(p2 + Int_val(k2), p1 + Int_val(k1), l*sizeof(struct pollfd));
    return Val_unit;
#else
    caml_invalid_argument("netsys_blit_poll_mem");
#endif
};


CAMLprim value netsys_poll_constants(value dummy) {
    value r;
    r = caml_alloc_tuple(6);
    Store_field(r, 0, Val_int(CONST_POLLIN));
    Store_field(r, 1, Val_int(CONST_POLLPRI));
    Store_field(r, 2, Val_int(CONST_POLLOUT));
    Store_field(r, 3, Val_int(CONST_POLLERR));
    Store_field(r, 4, Val_int(CONST_POLLHUP));
    Store_field(r, 5, Val_int(CONST_POLLNVAL));
    return r;
}


CAMLprim value netsys_poll(value s, value nv, value tv) {
#ifdef HAVE_POLL
    struct pollfd *p;
    int n;
    long tmo, r;

    p = (*(Poll_mem_val(s)));
    n = Int_val(nv);
    tmo = Long_val(tv);
    
    caml_enter_blocking_section();
    r = poll(p, n, tmo);
    caml_leave_blocking_section();

    if (r == -1) uerror("poll", Nothing);
    
    return Val_int(r);
#else
     caml_invalid_argument("netsys_poll");
#endif
}

/**********************************************************************/
/* poll aggregation                                                   */
/**********************************************************************/


CAMLprim value netsys_have_event_aggregation (value dummy) {
#ifdef HAVE_POLL_AGGREG
    return Val_bool(1);
#else
    return Val_bool(0);
#endif
}

/*------------------------------------------------------------*/

#ifdef HAVE_POLL_AGGREG
struct poll_aggreg {
    int fd;
    int need_cancel;
#ifdef USABLE_EPOLL
    int cancel_fd;
#endif
};


#define Poll_aggreg_val(v) ((struct poll_aggreg **) (Data_custom_val(v)))

static void finalize_poll_aggreg(value r) {
    caml_stat_free(*(Poll_aggreg_val(r)));
}

static struct custom_operations poll_aggreg_ops = {
    "",
    finalize_poll_aggreg,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default
};

static value alloc_poll_aggreg(void) {
    struct poll_aggreg *p;
    value r;
    p = caml_stat_alloc(sizeof(struct poll_aggreg));
    r = caml_alloc_custom(&poll_aggreg_ops, sizeof(p), 1, 0);
    *(Poll_aggreg_val(r)) = p;
    return r;
};
#endif

/*------------------------------------------------------------*/


CAMLprim value netsys_create_event_aggreg(value cancelv)
{
#ifdef HAVE_POLL_AGGREG
    struct poll_aggreg *pa;
    value r;
    int fd, cancel_fd;
    int code;
    int e;

#ifdef USABLE_EPOLL
    fd = epoll_create(128);
    if (fd == -1) uerror("epoll_create", Nothing);
    code = fcntl(fd, F_SETFD, FD_CLOEXEC);
    if (code == -1) {
	e = errno;
	close(fd);
	unix_error(e, "fcntl", Nothing);
    };
    r = alloc_poll_aggreg();
    pa = *(Poll_aggreg_val(r));
    pa->fd = fd;
    pa->need_cancel = Bool_val(cancelv);
    pa->cancel_fd = -1;
    if (pa->need_cancel) {
	struct epoll_event ee;

	cancel_fd = eventfd(0, 0);
	if (cancel_fd == -1) {
	    e = errno;
	    close(fd);
	    unix_error(e, "eventfd", Nothing);
	};
	code = fcntl(cancel_fd, F_SETFD, FD_CLOEXEC);
	if (code == -1) {
	    e = errno;
	    close(fd);
	    close(cancel_fd);
	    unix_error(e, "fcntl", Nothing);
	};
	ee.events = EPOLLIN;  /* not oneshot! */
	ee.data.u64 = 1;  /* reserved value */
	code = epoll_ctl(fd, EPOLL_CTL_ADD, cancel_fd, &ee);
	if (code == -1) {
	    e = errno;
	    close(fd);
	    close(cancel_fd);
	    unix_error(e, "epoll_ctl (ADD)", Nothing);
	};
	pa->cancel_fd = cancel_fd;
    };
#endif
    return r;
#else
    caml_invalid_argument("Netsys_posix.create_event_aggregator not available");
#endif
}


CAMLprim value netsys_destroy_event_aggreg(value pav)
{
#ifdef HAVE_POLL_AGGREG
    struct poll_aggreg *pa;
    int code;

    pa = *(Poll_aggreg_val(pav));
    code = close(pa->fd);
    if (code == -1) uerror("close", Nothing);
    if (pa->cancel_fd >= 0) {
	code = close(pa->cancel_fd);
	if (code == -1) uerror("close", Nothing);
    };
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.destroy_event_aggregator not available");
#endif
}


CAMLprim value netsys_event_aggreg_fd(value pav)
{
#ifdef HAVE_POLL_AGGREG
    struct poll_aggreg *pa;

    pa = *(Poll_aggreg_val(pav));
    return Val_int(pa->fd);
#else
    caml_invalid_argument("Netsys_posix.event_aggregator_fd not available");
#endif
}


#ifdef USABLE_EPOLL
static int translate_to_epoll_events(int i) {
    int o;
    o = 0;
    if ((i & POLLIN) != 0) o |= EPOLLIN;
    if ((i & POLLOUT) != 0) o |= EPOLLOUT;
    if ((i & POLLPRI) != 0) o |= EPOLLPRI;
    return o;
}
#endif


#ifdef USABLE_EPOLL
static int translate_to_poll_events(int i) {
    int o;
    o = 0;
    if ((i & EPOLLIN) != 0) o |= POLLIN;
    if ((i & EPOLLOUT) != 0) o |= POLLOUT;
    if ((i & EPOLLPRI) != 0) o |= POLLPRI;
    return o;
}
#endif


CAMLprim value netsys_add_event_source(value pav, value pushv)
{
#ifdef HAVE_POLL_AGGREG
    struct poll_aggreg *pa;
    int code;
    int fd;
    value v;
#ifdef USABLE_EPOLL
    struct epoll_event ee;
#endif

    pa = *(Poll_aggreg_val(pav));
    v = Field(pushv, 1);
    fd = Int_val(Field(v, 0));

#ifdef USABLE_EPOLL
    ee.events = 
	translate_to_epoll_events(Int_val(Field(pushv, 2))) | EPOLLONESHOT;
    ee.data.u64 = Long_val(Field(pushv, 0)) << 1;
    code = epoll_ctl(pa->fd, EPOLL_CTL_ADD, fd, &ee);
    if (code == -1) uerror("epoll_ctl (ADD)", Nothing);
#endif

    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.add_event_source not available");
#endif
}


CAMLprim value netsys_del_event_source(value pav, value idv, value tagv)
{
#ifdef HAVE_POLL_AGGREG
    struct poll_aggreg *pa;
    int code;
    int fd;
#ifdef USABLE_EPOLL
    struct epoll_event ee;
#endif

    pa = *(Poll_aggreg_val(pav));
    fd = Int_val(Field(tagv, 0));  /* EV_FD */

#ifdef USABLE_EPOLL
    code = epoll_ctl(pa->fd, EPOLL_CTL_DEL, fd, &ee);
    if (code == -1) uerror("epoll_ctl (DEL)", Nothing);
#endif

    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.del_event_source not available");
#endif
}


CAMLprim value netsys_interrupt_aggreg(value pav)
{
#ifdef HAVE_POLL_AGGREG
    struct poll_aggreg *pa;

    pa = *(Poll_aggreg_val(pav));
    if (pa->cancel_fd >= 0) {
	uint64_t buf;
        int n;
	buf = 1;
	n = write(pa->cancel_fd, (char *) &buf, 8);
        if (n == -1) uerror("write", Nothing);
    };
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.interrupt_event_aggregator not available");
#endif
}


CAMLprim value netsys_push_event_sources(value pav, value pushlistv)
{
#ifdef HAVE_POLL_AGGREG
    struct poll_aggreg *pa;
    int code;
    int fd;
    value v_pushlist_l;
    value v_pushlist_hd;
#ifdef USABLE_EPOLL
    struct epoll_event ee;
#endif

    pa = *(Poll_aggreg_val(pav));
    v_pushlist_l = pushlistv;
    while (Is_block(v_pushlist_l)) {
	v_pushlist_hd = Field(v_pushlist_l, 0);
	v_pushlist_l  = Field(v_pushlist_l, 1);
	fd = Int_val(Field(Field(v_pushlist_hd, 1), 0));
#ifdef USABLE_EPOLL
	ee.events = 
	    translate_to_epoll_events(Int_val(Field(v_pushlist_hd, 2))) | 
	    EPOLLONESHOT;
	ee.data.u64 = Long_val(Field(v_pushlist_hd, 0)) << 1;
	code = epoll_ctl(pa->fd, EPOLL_CTL_MOD, fd, &ee);
	if (code == -1) uerror("epoll_ctl (MOD)", Nothing);
#endif
    };
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.push_event_sources not available");
#endif
}


CAMLprim value netsys_poll_event_sources(value pav, value tmov)
{
#ifdef HAVE_POLL_AGGREG
    struct poll_aggreg *pa;
    int code;
    int tmo;
    int k;
    int e;
#ifdef USABLE_EPOLL
    struct epoll_event ee[EPOLL_NUM];
#endif
    CAMLparam2(pav, tmov);
    CAMLlocal3(r, r_item, r_cons);

    tmo = Int_val(tmov);
    pa = *(Poll_aggreg_val(pav));

#ifdef USABLE_EPOLL
    caml_enter_blocking_section();
    code = epoll_wait(pa->fd, ee, EPOLL_NUM, tmo);
    e = errno;
    caml_leave_blocking_section();
    if (code == -1) unix_error(e, "epoll_wait", Nothing);

    r = Val_int(0);
    for (k=0; k<code; k++) {
	if (ee[k].data.u64 == 1) {  /* This is the reserved cancel_fd */
	    uint64_t buf;
            int n;
	    n = read(pa->cancel_fd, (char *) &buf, 8);
            if (n == -1) unix_error(errno, "read", Nothing);
	}
	else {
	    r_item = caml_alloc(3,0);
	    Store_field(r_item, 0, Val_long(ee[k].data.u64 >> 1));
	    Store_field(r_item, 1, Val_long(0)); /* i.e. mask = 0 */
	    Store_field(r_item, 2, 
			Val_int(translate_to_poll_events(ee[k].events)));
	    r_cons = caml_alloc(2,0);
	    Store_field(r_cons, 0, r_item);
	    Store_field(r_cons, 1, r);
	    r = r_cons;
	}
    };

#endif

    CAMLreturn(r);
#else
    caml_invalid_argument("Netsys_posix.pull_event_sources not available");
#endif
}
