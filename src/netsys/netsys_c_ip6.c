/* $Id$ */

/* Test for IPv6 */

#include "netsys_c.h"

#ifdef HAVE_GETIFADDRS
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
/* #include <netdb.h> */
#include <ifaddrs.h>
#endif


#define IS_ADDR_GLOBAL(addr) (!IN6_IS_ADDR_LOOPBACK(addr) &&    \
                              !IN6_IS_ADDR_MULTICAST(addr) &&   \
                              !IN6_IS_ADDR_LINKLOCAL(addr) && \
                              !IN6_IS_ADDR_SITELOCAL(addr) && \
                              !IN6_IS_ADDR_V4MAPPED(addr) && \
                              !IN6_IS_ADDR_V4COMPAT(addr))

/* NB. Unique Local IPv6 addresses (RFC 4193, fc*, fd*) count as global */

CAMLprim value netsys_test_for_ip6_global_addr(value dummy) {
#ifdef HAVE_GETIFADDRS
    struct ifaddrs *ifaddr, *ifcur;
    int found;
    int family;

    if (getifaddrs(&ifaddr) == -1) {
        uerror("getifaddrs", Nothing);
    }

    found = 0;
    for (ifcur = ifaddr; !found && ifcur != NULL; ifcur = ifcur->ifa_next) {
        if (ifcur->ifa_addr == NULL)
            continue;
        
        family = ifcur->ifa_addr->sa_family;
        if (family == AF_INET6) {
             struct sockaddr_in6 *sa6;
             /* char host[NI_MAXHOST]; */
             sa6 = (struct sockaddr_in6*) ifcur->ifa_addr;
             /*getnameinfo(ifcur->ifa_addr,
                           sizeof(struct sockaddr_in6),
                           host, NI_MAXHOST, NULL, 0, NI_NUMERICHOST);
             printf ("found: %s\n", host);
             */
             if (IS_ADDR_GLOBAL(&(sa6->sin6_addr)))
                 found=1;
        }
    }

    freeifaddrs(ifaddr);

    return Val_bool(found);

#else
    return Val_bool(0);
#endif
}
