/* $Id$ */

/* These are the pre-ocaml-4.01 definitions of caml_modify and
   caml_initialize that permit it to modify out of heap values.

   In the ocaml sources, caml_modify and caml_initialize are defined
   as weak symbols, and we can override them here.
*/

#include "netsys_c.h"

#ifdef HAVE_NEW_MODIFY
/* implies FANCY_PAGE_TABLES */


void caml_modify (value *fp, value val)
{
    value _old_ = *(fp);
    *(fp) = (val);
    if (Is_in_heap (fp)){
        if (caml_gc_phase == Phase_mark) caml_darken (_old_, NULL);
        if (Is_block (val) && Is_young (val)
            && ! (Is_block (_old_) && Is_young (_old_))){
            if (caml_ref_table.ptr >= caml_ref_table.limit){
                caml_realloc_ref_table (&caml_ref_table);
            }
            *caml_ref_table.ptr++ = (fp);
        }
    }
}


void caml_initialize (value *fp, value val)
{
  *fp = val;
  if (Is_block (val) && Is_young (val) && Is_in_heap (fp)){
    if (caml_ref_table.ptr >= caml_ref_table.limit){
      caml_realloc_ref_table (&caml_ref_table);
    }
    *caml_ref_table.ptr++ = fp;
  }
}

#endif
