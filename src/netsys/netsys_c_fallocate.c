/* $Id$ */

#include "netsys_c.h"

/**********************************************************************/
/* POSIX fallocate                                                    */
/**********************************************************************/

/* A lately added POSIX function */

CAMLprim value netsys_have_posix_fallocate(value dummy) {
#ifdef HAVE_POSIX_FALLOCATE
    return Val_bool(1);
#else
    return Val_bool(0);
#endif
}


CAMLprim value netsys_fallocate(value fd, value start, value len) {
#ifdef HAVE_POSIX_FALLOCATE
    int r;
    int64_t start_int, len_int;
    off_t start_off, len_off;
    /* Att: off_t might be 64 bit even on 32 bit systems! */

    start_int = Int64_val(start);
    len_int = Int64_val(len);

    if ( ((int64_t) ((off_t) start_int)) != start_int )
	caml_failwith("Netsys.fadvise: large files not supported on this OS");
    if ( ((int64_t) ((off_t) len_int)) != len_int )
	caml_failwith("Netsys.fadvise: large files not supported on this OS");

    start_off = start_int;
    len_off = len_int;

    r = posix_fallocate(Int_val(fd), start_off, len_off);
    /* does not set errno! */
    if (r != 0) 
	unix_error(r, "posix_fallocate64", Nothing);
    return Val_unit;
#else
    caml_invalid_argument("Netsys.fallocate not available");
#endif
}

