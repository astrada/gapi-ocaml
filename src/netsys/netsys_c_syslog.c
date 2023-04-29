/* $Id$ */

#include "netsys_c.h"

#ifdef HAVE_SYSLOG
#include <syslog.h>
#endif


/**********************************************************************/
/* Syslog                                                             */
/**********************************************************************/

#ifdef HAVE_SYSLOG
static int syslog_lev_flags[] = {
    LOG_EMERG, LOG_ALERT, LOG_CRIT, LOG_ERR, LOG_WARNING, LOG_NOTICE,
    LOG_INFO, LOG_DEBUG
};

#ifndef LOG_AUTHPRIV
#define LOG_AUTHPRIV LOG_LOCAL0
#endif

#ifndef LOG_CRON
#define LOG_CRON LOG_LOCAL0
#endif

#ifndef LOG_DAEMON
#define LOG_DAEMON LOG_LOCAL0
#endif

#ifndef LOG_FTP
#define LOG_FTP LOG_LOCAL0
#endif

#ifndef LOG_KERN
#define LOG_KERN LOG_LOCAL0
#endif

#ifndef LOG_LPR
#define LOG_LPR LOG_LOCAL0
#endif

#ifndef LOG_MAIL
#define LOG_MAIL LOG_LOCAL0
#endif

#ifndef LOG_NEWS
#define LOG_NEWS LOG_LOCAL0
#endif

#ifndef LOG_SYSLOG
#define LOG_SYSLOG LOG_LOCAL0
#endif

#ifndef LOG_UUCP
#define LOG_UUCP LOG_LOCAL0
#endif

static int syslog_fac_flags[] = {
    LOG_AUTHPRIV, LOG_CRON, LOG_DAEMON, LOG_FTP, LOG_KERN, 
    LOG_LOCAL0, LOG_LOCAL1, LOG_LOCAL2, LOG_LOCAL3, LOG_LOCAL4,
    LOG_LOCAL5, LOG_LOCAL6, LOG_LOCAL7, LOG_LPR, LOG_MAIL,
    LOG_NEWS, LOG_SYSLOG, LOG_USER, LOG_UUCP, 0
};

static int syslog_opt_flags[] = {
    LOG_CONS, LOG_NDELAY, LOG_ODELAY, LOG_NOWAIT, LOG_PID
};

static char *ident_buf = NULL;
#define IDENT_BUF_LEN 256
#endif



CAMLprim value netsys_openlog(value ident,
			      value opts,
			      value fac) 
{
#ifdef HAVE_SYSLOG
    char *id;
    int options;
    int facility;

    id=NULL;
    if (Is_block(ident)) {
	if (ident_buf == NULL) {
	    ident_buf = caml_stat_alloc(IDENT_BUF_LEN);
	};
	strncpy(ident_buf, 
		String_val(Field(ident, 0)),
		IDENT_BUF_LEN-1);
	ident_buf[IDENT_BUF_LEN-1] = 0;
	id=ident_buf;
    };
    options = caml_convert_flag_list(opts, syslog_opt_flags);
    facility = syslog_fac_flags[Int_val(fac)];
    openlog(id, options, facility);
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.openlog not available");
#endif
}


CAMLprim value netsys_syslog(value fac, value lev, value msg)
{
#ifdef HAVE_SYSLOG
    int facility;
    int level;
    facility = syslog_fac_flags[Int_val(fac)];
    level = syslog_lev_flags[Int_val(lev)];
    syslog(facility | level, "%s", String_val(msg));
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.syslog not available");
#endif
}


CAMLprim value netsys_closelog(value dummy) 
{
#ifdef HAVE_SYSLOG
    closelog();
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.closelog not available");
#endif
}


