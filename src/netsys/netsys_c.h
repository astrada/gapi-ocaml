/* $Id$ */

#ifndef NETSYS_C_H
#define NETSYS_C_H

#include "config.h"

/* Linux: make all system prototypes available */
#define _GNU_SOURCE

#define CAML_INTERNALS

/* POSIX: we want POSIX.1-2008 if possible */
/* #define _XOPEN_SOURCE 700 */

#ifdef _WIN32
#include "config_win32.h"

#define _WIN32_WINNT 0x0502
#define WIN32_LEAN_AND_MEAN
#include <wtypes.h>
#include <winbase.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <aclapi.h>

#ifndef FILE_FLAG_FIRST_PIPE_INSTANCE
#define FILE_FLAG_FIRST_PIPE_INSTANCE 0x00080000
#endif

#else

#include "config_posix.h"
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <time.h>
#include <grp.h>
#include <limits.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#endif


/* Standard C headers (all OS) */

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

#include "caml/misc.h"
/* misc.h also includes OCaml's config.h
   All HAS_* macros come from there. All HAVE_* macros come from our own
   config.h
*/

#include "caml/mlvalues.h"
#include "caml/alloc.h"
#include "caml/memory.h"
#include "caml/fail.h"
#include "caml/signals.h"
#include "caml/custom.h"
#include "caml/callback.h"
#include "caml/bigarray.h"
#include "caml/version.h"

#ifndef Bytes_val
#define Bytes_val(x) String_val(x)
#endif

#ifdef HAVE_POLL
#define CONST_POLLIN POLLIN
#define CONST_POLLPRI POLLPRI
#define CONST_POLLOUT POLLOUT
#define CONST_POLLERR POLLERR
#define CONST_POLLHUP POLLHUP
#define CONST_POLLNVAL POLLNVAL
#else
#define CONST_POLLIN 0x1
#define CONST_POLLPRI 0x2
#define CONST_POLLOUT 0x4
#define CONST_POLLERR 0x8
#define CONST_POLLHUP 0x10
#define CONST_POLLNVAL 0x20
#endif

/**********************************************************************/
/* From memory.h                                                      */
/**********************************************************************/

#ifdef FANCY_PAGE_TABLES
#define Not_in_heap 0
#define In_heap 1
#define In_young 2
#define In_static_data 4
#define In_code_area 8
int caml_page_table_add(int kind, void * start, void * end);
int caml_page_table_remove(int kind, void * start, void * end);

#ifdef HAVE_NEW_MODIFY

/* need full memory.h support */

#ifdef ARCH_SIXTYFOUR
/* 64 bits: Represent page table as a sparse hash table */
int caml_page_table_lookup(void * addr);
#define Classify_addr(a) (caml_page_table_lookup((void *)(a)))
#else
/* 32 bits: Represent page table as a 2-level array */
#define Pagetable2_log 11
#define Pagetable2_size (1 << Pagetable2_log)
#define Pagetable1_log (Page_log + Pagetable2_log)
#define Pagetable1_size (1 << (32 - Pagetable1_log))
CAMLextern unsigned char * caml_page_table[Pagetable1_size];
#define Pagetable_index1(a) (((uintnat)(a)) >> Pagetable1_log)
#define Pagetable_index2(a) \
  ((((uintnat)(a)) >> Page_log) & (Pagetable2_size - 1))
#define Classify_addr(a) \
  caml_page_table[Pagetable_index1(a)][Pagetable_index2(a)]
#endif

#define Is_in_heap(a) (Classify_addr(a) & In_heap)

/* Stuff from minor_gc.h */

#if !defined(OCAML_VERSION) || OCAML_VERSION < 40400
CAMLextern char *caml_young_start;
CAMLextern char *caml_young_end;
struct caml_ref_table {
  value **base;
  value **end;
  value **threshold;
  value **ptr;
  value **limit;
  asize_t size;
  asize_t reserve;
};
extern void caml_realloc_ref_table (struct caml_ref_table *);
#define Is_young(val) \
    ((char *)(val) < (char *)caml_young_end && \
     (char *)(val) > (char *)caml_young_start)
CAMLextern struct caml_ref_table caml_ref_table;
#else
#define CAML_NAME_SPACE
#include <caml/minor_gc.h>
#undef CAML_NAME_SPACE
#ifdef Caml_state_field
#define caml_ref_table (*(Caml_state_field(ref_table)))
#endif
#endif


/* Stuff from major_gc.h */

extern int caml_gc_phase;
#define Phase_mark 0

extern void caml_darken (value, value *);

#endif

#endif

/**********************************************************************/
/* From unixsupport.h                                                 */
/**********************************************************************/

#define Nothing ((value) 0)

#ifdef _WIN32
#include "caml/unixsupport.h"
#define netsysw32_win_alloc_handle win_alloc_handle
#else

/* POSIX */

/* Since OCaml 3.10 there is unixsupport.h, and we could also include
   this file.
*/

extern value unix_error_of_code (int errcode);
extern void unix_error (int errcode, char * cmdname, value arg) Noreturn;
extern void uerror (char * cmdname, value arg) Noreturn;

#define DIR_Val(v) *((DIR **) &Field(v, 0))

#endif

/**********************************************************************/
/* From signals.h                                                     */
/**********************************************************************/

CAMLextern int caml_convert_signal_number (int);
CAMLextern int caml_rev_convert_signal_number (int);

/**********************************************************************/
/* From socketaddr.h                                                  */
/**********************************************************************/

#ifdef HAS_SOCKLEN_T
typedef socklen_t socklen_param_type;
#else
typedef int socklen_param_type;
#endif

union sock_addr_union {
    struct sockaddr s_gen;
#ifndef _WIN32
    struct sockaddr_un s_unix;
#endif
    struct sockaddr_in s_inet;
#ifdef HAS_IPV6
    struct sockaddr_in6 s_inet6;
#endif
};

#define GET_INET_ADDR(v) (*((struct in_addr *) (v)))

#ifdef HAS_IPV6
#define GET_INET6_ADDR(v) (*((struct in6_addr *) (v)))
#endif


/**********************************************************************/
/* bigarrays                                                          */
/**********************************************************************/

extern int caml_ba_element_size[];


#endif
