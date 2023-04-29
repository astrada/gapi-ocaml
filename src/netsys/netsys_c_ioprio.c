/* $Id$ */

#include "netsys_c.h"


/**********************************************************************/
/* I/O priorities (Linux-only)                                        */
/**********************************************************************/

/* Available since kernel 2.6.13 */

/* There is no glibc support for these calls. 
   See http://sourceware.org/bugzilla/show_bug.cgi?id=4464
   for Drepper's opinion about that.
*/

#ifdef __linux__

#if defined(__i386__)
#define __NR_ioprio_set         289
#define __NR_ioprio_get         290
#define ioprio_supported
#elif defined(__ppc__)
#define __NR_ioprio_set         273
#define __NR_ioprio_get         274
#define ioprio_supported
#elif defined(__x86_64__)
#define __NR_ioprio_set         251
#define __NR_ioprio_get         252
#define ioprio_supported
#elif defined(__ia64__)
#define __NR_ioprio_set         1274
#define __NR_ioprio_get         1275
#define ioprio_supported
/* Other architectures unsupported */
#endif

#endif
/* __linux__ */


#ifdef ioprio_supported

static inline int ioprio_set (int which, int who, int ioprio)
{
    return syscall (__NR_ioprio_set, which, who, ioprio);
}

static inline int ioprio_get (int which, int who)
{
        return syscall (__NR_ioprio_get, which, who);
}

enum {
        IOPRIO_CLASS_NONE,
        IOPRIO_CLASS_RT,
        IOPRIO_CLASS_BE,
        IOPRIO_CLASS_IDLE,
};

enum {
        IOPRIO_WHO_PROCESS = 1,
        IOPRIO_WHO_PGRP,
        IOPRIO_WHO_USER,
};

#define IOPRIO_CLASS_SHIFT      13
#define IOPRIO_PRIO_MASK        0xff

#endif
/* ioprio_supported */


CAMLprim value netsys_ioprio_get(value target) {
#ifdef ioprio_supported
    int ioprio;
    int ioprio_class;
    int ioprio_data;
    value result;

    switch (Tag_val(target)) {
    case 0:
	ioprio = ioprio_get(IOPRIO_WHO_PROCESS, Int_val(Field(target, 0)));
	break;
    case 1:
	ioprio = ioprio_get(IOPRIO_WHO_PGRP, Int_val(Field(target, 0)));
	break;
    case 2:
	ioprio = ioprio_get(IOPRIO_WHO_USER, Int_val(Field(target, 0)));
	break;
    default:
	caml_failwith("netsys_ioprio_get: internal error");
    }

    if (ioprio == -1)
	uerror("ioprio_get", Nothing);

    ioprio_class = ioprio >> IOPRIO_CLASS_SHIFT;
    ioprio_data = ioprio & IOPRIO_PRIO_MASK;

    switch (ioprio_class) {
    case IOPRIO_CLASS_NONE:
	result = Val_long(0);
	break;
    case IOPRIO_CLASS_RT:
	result = caml_alloc(1, 0);
	Store_field(result, 0, Val_int(ioprio_data));
	break;
    case IOPRIO_CLASS_BE:
	result = caml_alloc(1, 1);
	Store_field(result, 0, Val_int(ioprio_data));
	break;
    case IOPRIO_CLASS_IDLE:
	result = Val_long(1);
	break;
    default:
	caml_failwith("netsys_ioprio_get: Unexpected result");
    }
    
    return result;

#else
    /* not ioprio_supported: */
    unix_error(ENOSYS, "ioprio_get", Nothing);
#endif
    /* ioprio_supported */
}


CAMLprim value netsys_ioprio_set(value target, value ioprio_arg) {
#ifdef ioprio_supported
    int ioprio;
    int ioprio_class;
    int ioprio_data;
    int sysres;

    if (Is_block(ioprio_arg)) {
	switch (Tag_val(ioprio_arg)) {
	case 0:
	    ioprio_class = IOPRIO_CLASS_RT;
	    ioprio_data = Int_val(Field(ioprio_arg, 0));
	    break;
	case 1:
	    ioprio_class = IOPRIO_CLASS_BE;
	    ioprio_data = Int_val(Field(ioprio_arg, 0));
	    break;
	default:
	    caml_failwith("netsys_ioprio_set: internal error");
	}
    } else {
	switch (Long_val(ioprio_arg)) {
	case 0:
	    /* Makes no sense. We behave in the same way as ionice */
	    ioprio_class = IOPRIO_CLASS_BE;
	    ioprio_data = 4;
	    break;
	case 1:
	    ioprio_class = IOPRIO_CLASS_IDLE;
	    ioprio_data = 7;
	    break;
	default:
	    caml_failwith("netsys_ioprio_set: internal error");
	}
    };

    ioprio = (ioprio_class << IOPRIO_CLASS_SHIFT) | (ioprio_data & IOPRIO_PRIO_MASK);

    switch (Tag_val(target)) {
    case 0:
	sysres = ioprio_set(IOPRIO_WHO_PROCESS, Int_val(Field(target, 0)), ioprio);
	break;
    case 1:
	sysres = ioprio_set(IOPRIO_WHO_PGRP, Int_val(Field(target, 0)), ioprio);
	break;
    case 2:
	sysres = ioprio_set(IOPRIO_WHO_USER, Int_val(Field(target, 0)), ioprio);
	break;
    default:
	caml_failwith("netsys_ioprio_set: internal error");
    }

    if (sysres == -1)
	uerror("ioprio_set", Nothing);

    return Val_unit;
#else
    /* not ioprio_supported: */
    unix_error(ENOSYS, "ioprio_set", Nothing);
#endif
    /* ioprio_supported */
}
