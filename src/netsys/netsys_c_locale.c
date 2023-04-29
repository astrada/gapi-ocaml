/* $Id$ */

#include "netsys_c.h"

#ifdef HAVE_LOCALE
#include <locale.h>
#include <langinfo.h>
#endif


/**********************************************************************/
/* minimal locale support                                             */
/**********************************************************************/

#ifdef HAVE_LOCALE
static int locale_items_table[] = {
  CODESET,  D_T_FMT, D_FMT, T_FMT, T_FMT_AMPM, AM_STR, PM_STR, DAY_1,
  DAY_2, DAY_3, DAY_4, DAY_5, DAY_6, DAY_7, ABDAY_1, ABDAY_2, ABDAY_3,
  ABDAY_4, ABDAY_5, ABDAY_6, ABDAY_7, MON_1, MON_2, MON_3, MON_4, MON_5,
  MON_6, MON_7, MON_8, MON_9, MON_10, MON_11, MON_12, ABMON_1, ABMON_2,
  ABMON_3, ABMON_4, ABMON_5, ABMON_6, ABMON_7, ABMON_8, ABMON_9, ABMON_10,
  ABMON_11, ABMON_12,
#ifndef __OpenBSD__
  ERA, ERA_D_FMT, ERA_D_T_FMT, ERA_T_FMT, ALT_DIGITS,
#else
  -1, -1, -1, -1, -1,
#endif
  RADIXCHAR, THOUSEP, YESEXPR, NOEXPR, CRNCYSTR
};
#endif

CAMLprim value netsys_query_langinfo(value locale)
{
#ifdef HAVE_LOCALE
    CAMLparam1(locale);
    CAMLlocal1(s);
    char *old_locale, *oldcopy_locale, *new_locale;
    int n, k;

    old_locale = setlocale(LC_ALL, NULL);
    if (old_locale == NULL)
	caml_failwith("Netsys_posix.query_locale: no locale support");
    oldcopy_locale = caml_stat_alloc(strlen(old_locale) + 1);
    strcpy(oldcopy_locale, old_locale);

    new_locale = setlocale(LC_ALL, String_val(locale));
    if (new_locale == NULL) {
	caml_stat_free(oldcopy_locale);
	caml_failwith("Netsys_posix.query_locale: cannot set this locale");
    }
    
    n = sizeof(locale_items_table) / sizeof(locale_items_table[0]);
    s = caml_alloc(n,0);
    for (k=0; k<n; k++) {
	Store_field(s,k,caml_copy_string(nl_langinfo(locale_items_table[k])));
    };
    
    setlocale(LC_ALL, oldcopy_locale);
    caml_stat_free(oldcopy_locale);

    CAMLreturn (s);
#else
    caml_invalid_argument("Netsys_posix.query_locale not available");
#endif
}

