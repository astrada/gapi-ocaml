/* $Id$ */

#include "netsys_c.h"


/**********************************************************************/
/* Multicast                                                          */
/**********************************************************************/

/* This works also for win32 */

#ifndef PF_INET
#define PF_INET AF_INET
#endif

#ifndef PF_INET6
#define PF_INET6 AF_INET6
#endif

#ifndef IPPROTO_IPV6
#define IPPROTO_IPV6 41
#endif


static int socket_domain(int fd) {
    /* Return the socket domain, PF_INET or PF_INET6. Fails for non-IP 
       protos.

       fd must be a socket!
    */
    union sock_addr_union addr;
    socklen_t l;

    l = sizeof(addr);
    if (getsockname(fd, &addr.s_gen, &l) == -1) 
        uerror("getsockname", Nothing);

    switch (addr.s_gen.sa_family) {
    case AF_INET:
        return PF_INET;
#ifdef HAS_IPV6
    case AF_INET6:
        return PF_INET6;
#endif
    default:
	caml_invalid_argument("Not an Internet socket");
    }

    return 0;
}


CAMLprim value netsys_mcast_set_loop(value fd, value flag) {
    int t, r, f;

    t = socket_domain(Int_val(fd));
    f = Bool_val(flag);

    r = 0;
    switch (t) {
#ifdef IP_MULTICAST_LOOP
    case PF_INET:
        r = setsockopt(Int_val(fd), 
                       IPPROTO_IP, 
                       IP_MULTICAST_LOOP, 
                       (void *) &f, sizeof(f));
        break;
#endif
#ifdef HAS_IPV6
#ifdef IPV6_MULTICAST_LOOP
    case PF_INET6:
        r = setsockopt(Int_val(fd), 
                       IPPROTO_IPV6, 
                       IPV6_MULTICAST_LOOP, 
                       (void *) &f, sizeof(f));
        break;
#endif
#endif
    default:
	caml_invalid_argument("Netsys.mcast_set_loop");
    };

    if (r == -1)
        uerror("setsockopt",Nothing);

    return Val_unit;
}


CAMLprim value netsys_mcast_set_ttl(value fd, value ttl) {
    int t, r, v;
    int fd_sock;

#ifdef _WIN32
    if (Descr_kind_val(fd) != KIND_SOCKET)
	caml_invalid_argument("Netsys.mcast_set_ttl");
    fd_sock = Socket_val(fd);
#else
    fd_sock = Int_val(fd);
#endif
 
    t = socket_domain(fd_sock);
    v = Int_val(ttl);

    r = 0;
    switch (t) {
#ifdef IP_MULTICAST_TTL
    case PF_INET:
        r = setsockopt(fd_sock, 
                       IPPROTO_IP, 
                       IP_MULTICAST_TTL, 
                       (void *) &v, sizeof(v));
        break;
#endif
#ifdef HAS_IPV6
#ifdef IPV6_MULTICAST_HOPS
    case PF_INET6:
        r = setsockopt(fd_sock, 
                       IPPROTO_IPV6, 
                       IPV6_MULTICAST_HOPS, 
                       (void *) &v, sizeof(v));
        break;
#endif
#endif
    default:
	caml_invalid_argument("Netsys.mcast_set_ttl");
    };

    if (r == -1)
        uerror("setsockopt",Nothing);

    return Val_unit;
}


CAMLprim value netsys_mcast_add_membership(value fd,
					   value group_addr, 
					   value if_addr) {
    int t, r;
    int fd_sock;

#ifdef _WIN32
    if (Descr_kind_val(fd) != KIND_SOCKET)
	caml_invalid_argument("Netsys.mcast_add_membership");
    fd_sock = Socket_val(fd);
#else
    fd_sock = Int_val(fd);
#endif

    t = socket_domain(fd_sock);

    r = 0;
    switch (t) {
#ifdef IP_ADD_MEMBERSHIP
    case PF_INET: {
        struct ip_mreq mreq;
        if (caml_string_length(group_addr) != 4 || caml_string_length(if_addr) != 4 )
            caml_invalid_argument("Netsys.mcast_add_membership: Not an IPV4 address");
        memcpy(&mreq.imr_multiaddr,
               &GET_INET_ADDR(group_addr),
               4);
        memcpy(&mreq.imr_interface,
               &GET_INET_ADDR(if_addr),
               4);
        r = setsockopt(fd_sock, 
                       IPPROTO_IP, 
                       IP_ADD_MEMBERSHIP, 
                       (void *) &mreq, sizeof(mreq));
        break;
    }
#endif
#ifdef HAS_IPV6
#ifdef IPV6_ADD_MEMBERSHIP
    case PF_INET6: {
        struct ipv6_mreq mreq;
        if (caml_string_length(group_addr) != 16 || caml_string_length(if_addr) != 16 )
            caml_invalid_argument("Netsys.mcast_add_membership: Not an IPV6 address");
        memcpy(&mreq.ipv6mr_multiaddr,
               &GET_INET6_ADDR(group_addr),
               16);
	/*
        memcpy(&mreq.ipv6mr_interface,
               &GET_INET6_ADDR(if_addr),
               16);
	*/
	mreq.ipv6mr_interface = 0;   /* FIXME */
        r = setsockopt(fd_sock, 
                       IPPROTO_IPV6, 
                       IPV6_ADD_MEMBERSHIP, 
                       (void *) &mreq, sizeof(mreq));
        break;
    }
#endif
#endif
    default:
	caml_invalid_argument("Netsys.mcast_add_membership");
    };
    if (r == -1)
        uerror("setsockopt",Nothing);

    return Val_unit;
}


CAMLprim value netsys_mcast_drop_membership(value fd, 
					    value group_addr, 
					    value if_addr) {
    int t, r;
    int fd_sock;

#ifdef _WIN32
    if (Descr_kind_val(fd) != KIND_SOCKET)
	caml_invalid_argument("Netsys.mcast_drop_membership");
    fd_sock = Socket_val(fd);
#else
    fd_sock = Int_val(fd);
#endif

    t = socket_domain(fd_sock);

    r = 0;
    switch (t) {
#ifdef IP_DROP_MEMBERSHIP
    case PF_INET: {
        struct ip_mreq mreq;
        if (caml_string_length(group_addr) != 4 || caml_string_length(if_addr) != 4 )
            caml_invalid_argument("Netsys.mcast_drop_membership: Not an IPV4 address");
        memcpy(&mreq.imr_multiaddr,
               &GET_INET_ADDR(group_addr),
               4);
        memcpy(&mreq.imr_interface,
               &GET_INET_ADDR(if_addr),
               4);
        r = setsockopt(fd_sock,
                       IPPROTO_IP, 
                       IP_DROP_MEMBERSHIP, 
                       (void *) &mreq, sizeof(mreq));
        break;
    }
#endif
#ifdef HAS_IPV6
#ifdef IPV6_DROP_MEMBERSHIP
    case PF_INET6: {
        struct ipv6_mreq mreq;
        if (caml_string_length(group_addr) != 16 || caml_string_length(if_addr) != 16 )
            caml_invalid_argument("Netsys.mcast_drop_membership: Not an IPV6 address");
        memcpy(&mreq.ipv6mr_multiaddr,
               &GET_INET6_ADDR(group_addr),
               16);
	mreq.ipv6mr_interface = 0;   /* FIXME */
	/*
        memcpy(&mreq.ipv6mr_interface,
               &GET_INET6_ADDR(if_addr),
               16);
	*/
        r = setsockopt(fd_sock,
                       IPPROTO_IPV6, 
                       IPV6_DROP_MEMBERSHIP, 
                       &mreq, sizeof(mreq));
        break;
    }
#endif
#endif
    default:
	caml_invalid_argument("Netsys.mcast_drop_membership");
    };

    if (r == -1)
        uerror("setsockopt",Nothing);

    return Val_unit;
}


