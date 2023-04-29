/* $Id$ */

#include "netsys_c.h"


#ifdef HAVE_GPROF
extern int moncontrol(int);
#endif

value netsys_moncontrol(value flag) {
#ifdef HAVE_GPROF
    moncontrol(Bool_val(flag));
#endif
    return Val_unit;
}
