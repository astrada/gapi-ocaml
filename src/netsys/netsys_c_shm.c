/* $Id$ */

#include "netsys_c.h"

#ifdef HAVE_POSIX_SHM
#include <sys/mman.h>
#endif

/**********************************************************************/
/* POSIX shared memory                                                */
/**********************************************************************/

/* This is from the POSIX realtime extensions. Not every POSIX-type OS
 * supports it.
 */

CAMLprim value netsys_have_posix_shm(value dummy) {
#ifdef HAVE_POSIX_SHM
    return Val_bool(1);
#else
    return Val_bool(0);
#endif
}

#ifdef HAVE_POSIX_SHM
static int shm_open_flag_table[] = {
    O_RDONLY, O_RDWR, O_CREAT, O_EXCL, O_TRUNC
};
#endif


CAMLprim value netsys_shm_open(value path, value flags, value perm)
{
#ifdef HAVE_POSIX_SHM
    CAMLparam3(path, flags, perm);
    int ret, cv_flags;
    char * p;

    cv_flags = caml_convert_flag_list(flags, shm_open_flag_table);
    p = caml_stat_alloc(caml_string_length(path) + 1);
    strcpy(p, String_val(path));
    ret = shm_open(p, cv_flags, Int_val(perm));
    caml_stat_free(p);
    if (ret == -1) uerror("shm_open", path);
    CAMLreturn (Val_int(ret));
#else
    caml_invalid_argument("Netsys.shm_open not available");
#endif
}


CAMLprim value netsys_shm_unlink(value path)
{
#ifdef HAVE_POSIX_SHM
    int ret;

    ret = shm_unlink(String_val(path));
    if (ret == -1) uerror("shm_unlink", path);
    return Val_unit;
#else
    caml_invalid_argument("Netsys.shm_unlink not available");
#endif
}

