/* $Id$
 * ----------------------------------------------------------------------
 */

#include "netsys_c.h"

#ifdef HAVE_FDOPENDIR
#include <dirent.h>
#endif

CAMLprim value netsys_int64_of_file_descr(value fd) {
#ifdef _WIN32
    switch (Descr_kind_val(fd)) {
    case KIND_HANDLE:
	return caml_copy_int64((intnat) (Handle_val(fd)));
    case KIND_SOCKET:
	return caml_copy_int64((intnat) (Socket_val(fd)));
    }
    return caml_copy_int64(0);
#else
    return caml_copy_int64(Long_val(fd));
#endif
}

/**********************************************************************/
/* OS recognition                                                     */
/**********************************************************************/

CAMLprim value netsys_is_darwin(value dummy) {
#if defined(__darwin__) || defined(__DARWIN__) || defined(__APPLE__)
    return Val_bool(1);
#else
    return Val_bool(0);
#endif
}

/**********************************************************************/
/* Standard POSIX stuff                                               */
/**********************************************************************/

CAMLprim value netsys_unix_error_of_code(value n) {
    int e;
    e = Int_val(n);
#ifdef _WIN32
    win32_maperr(e);
    e = errno;
#endif
    return(unix_error_of_code(e));
}

CAMLprim value netsys_get_nonblock(value fd)
{
#ifdef _WIN32
    caml_invalid_argument("Netsys_posix.get_nonblcok not avaiable");
#else
    int r;

    r = fcntl(Int_val(fd), F_GETFL, 0);
    if (r == -1) uerror("fcntl", Nothing);

    return Val_bool((r & O_NONBLOCK) != 0);
#endif
}

CAMLprim value netsys__exit (value n) {
#ifdef HAVE__EXIT
    _exit(Int_val(n));
    return Val_int(0);
#else
    caml_invalid_argument("Netsys._exit not available");
#endif
}


CAMLprim value netsys_sysconf_open_max (value unit) {
#ifdef HAVE_SYSCONF
    return Val_long(sysconf(_SC_OPEN_MAX));
#else
    caml_invalid_argument("Netsys.sysconf_open_max not available");
#endif
}


CAMLprim value netsys_getpgid (value pid) {
#ifdef HAVE_POSIX_PROCESS_GROUPS
    int pgid;

    pgid = getpgid(Int_val(pid));
    if (pgid == -1) uerror("getpgid", Nothing);
    return Val_int(pgid);
#else
    caml_invalid_argument("Netsys.getpgid not available");
#endif
}


CAMLprim value netsys_setpgid (value pid, value pgid) {
#ifdef HAVE_POSIX_PROCESS_GROUPS
    int r;

    r = setpgid(Int_val(pid), Int_val(pgid));
    if (r == -1) uerror("setpgid", Nothing);
    return Val_int(0);
#else
    caml_invalid_argument("Netsys.setpgid not available");
#endif
}


CAMLprim value netsys_tcgetpgrp (value fd) {
#ifdef HAVE_POSIX_TTY
    int pgid;

    pgid = tcgetpgrp(Int_val(fd));
    if (pgid == -1) uerror("tcgetpgrp", Nothing);
    return Val_int(pgid);
#else
    caml_invalid_argument("Netsys.tcgetpgrp not available");
#endif
}


CAMLprim value netsys_tcsetpgrp (value fd, value pgid) {
#ifdef HAVE_POSIX_TTY
    int r;
    
    r = tcsetpgrp(Int_val(fd), Int_val(pgid));
    if (r == -1) uerror("tcsetpgrp", Nothing);
    return Val_int(0);
#else
    caml_invalid_argument("Netsys.tcsetpgrp not available");
#endif
}


CAMLprim value netsys_ctermid (value unit) {
#ifdef HAVE_POSIX_TTY
    char *s;
    s = NULL;
    return caml_copy_string(ctermid(s));
    /* ctermid is always successful; however it can return an empty string */
#else
    caml_invalid_argument("Netsys.ctermid not available");
#endif
}


CAMLprim value netsys_ttyname (value fd) {
#ifdef HAVE_POSIX_TTY
    char *s;

    s = ttyname(Int_val(fd));
    if ( s == NULL ) uerror("ttyname", Nothing);
    return caml_copy_string(s);
#else
    caml_invalid_argument("Netsys.ttyname not available");
#endif
}


CAMLprim value netsys_getsid (value pid) {
#ifdef HAVE_POSIX_PROCESS_SESSIONS
    int sid;

    sid = getsid(Int_val(pid));
    if ( sid == -1 )  uerror("getsid", Nothing);
    return Val_int(sid);
#else
    caml_invalid_argument("Netsys.getsid not available");
#endif
}


CAMLprim value netsys_setreuid(value ruid, value euid) {
#ifdef HAVE_POSIX_UID
    int r;

    r = setreuid(Int_val(ruid), Int_val(euid));
    if (r == -1) uerror("setreuid", Nothing);
    return Val_int(0);
#else
    caml_invalid_argument("Netsys.setreuid not available");
#endif
}


CAMLprim value netsys_setregid(value rgid, value egid) {
#ifdef HAVE_POSIX_UID
    int r;

    r = setregid(Int_val(rgid), Int_val(egid));
    if (r == -1) uerror("setregid", Nothing);
    return Val_int(0);
#else
    caml_invalid_argument("Netsys.setregid not available");
#endif
}


CAMLprim value netsys_initgroups(value user, value gid) {
#ifdef HAVE_INITGROUPS
    long gid_i;
    int e;

    const char *user_s = String_val(user);
    gid_i = Long_val(gid);

    e = initgroups(user_s, gid_i);
    if (e < 0) uerror("initgroups", Nothing);

    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.initgroups not available");
#endif
}


CAMLprim value netsys_fsync(value fd) {
#ifdef HAVE_FSYNC
    int r;
    r = fsync(Int_val(fd));
    if (r == -1) 
	uerror("fsync", Nothing);
    return Val_unit;
#else
    caml_invalid_argument("Netsys.fsync not available");
#endif
}


CAMLprim value netsys_fdatasync(value fd) {
#ifdef HAVE_FDATASYNC
    int r;
#ifdef _XOPEN_REALTIME
    r = fsync(Int_val(fd));
#else
    r = fdatasync(Int_val(fd));
#endif
    if (r == -1) 
	uerror("fdatasync", Nothing);
    return Val_unit;
#else
    caml_invalid_argument("Netsys.fdatasync not available");
#endif
}

CAMLprim value netsys_fchdir(value fd) {
#ifdef HAVE_FCHDIR
    if (fchdir(Int_val(fd)) == -1) uerror("fchdir", Nothing);
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.fchdir not available");
#endif
}

CAMLprim value netsys_fdopendir(value fd)
{
#ifdef HAVE_FDOPENDIR
  DIR * d;
  value res;
  d = fdopendir(Int_val(fd));
  if (d == (DIR *) NULL) uerror("fdopendir", Nothing);
  res = caml_alloc_small(1, Abstract_tag);
  DIR_Val(res) = d;
  return res;
#else
  caml_invalid_argument("Netsys_posix.fdopendir not available");
#endif
}


CAMLprim value netsys_realpath (value name)    /* POSIX.1-2001 */
{
#ifdef HAVE_REALPATH
    char *name_out_s;
    value name_out;

    const char *name_in_s = String_val(name);
    name_out_s = realpath(name_in_s, NULL);   /* Note: GNU extension! */
    if (name_out_s == NULL) {
	uerror("realpath", Nothing);
    }
    else {
	name_out = caml_copy_string(name_out_s);
	free(name_out_s);
    }
    return name_out;
#else
    caml_invalid_argument("Netsys_posix.realpath not available");
#endif
}


CAMLprim value netsys_grantpt (value fd)    /* POSIX.1-2001 */
{
#ifdef HAVE_PTY
    int e;
    e = grantpt(Int_val(fd));
    if ( e < 0 ) uerror("grantpt", Nothing);
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.granpt not available");
#endif
}


CAMLprim value netsys_unlockpt (value fd)    /* POSIX.1-2001 */
{
#ifdef HAVE_PTY
    int e;
    e = unlockpt(Int_val(fd));
    if ( e < 0 ) uerror("unlockpt", Nothing);
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.unlockpt not available");
#endif
}


CAMLprim value netsys_ptsname (value fd)    /* POSIX.1-2001 */
{
#ifdef HAVE_PTY
    char *s;

    s = ptsname(Int_val(fd));
    if ( s == NULL ) uerror("ptsname", Nothing);
    return caml_copy_string(s);
#else
    caml_invalid_argument("Netsys_posix.ptsname not available");
#endif
}

CAMLprim value netsys_posix_openpt(value noctty)     /* POSIX.1-2001 */
{
#ifdef HAVE_PTY
    int fd;
    int flags;

    flags = O_RDWR;
    if (Bool_val(noctty) != 0) flags |= O_NOCTTY;

#ifdef HAVE_PTY_OPENPT
    fd = posix_openpt(flags);
#else
    fd = open("/dev/ptmx", flags);
#endif

    if (fd == -1) uerror("openpt", Nothing);
    return Val_int(fd);
#else
    caml_invalid_argument("Netsys_posix.posix_openpt not available");
#endif
}


CAMLprim value netsys_mknod (value name, value perm, value nt)
{
#ifdef _WIN32
    caml_invalid_argument("Netsys_posix.mknod not available");
#else
    mode_t m;
    dev_t d;
    int e;

    m = Long_val(perm) & 07777;
    d = 0;
    if (Is_block(nt)) {
	switch (Tag_val(nt)) {
	case 0:  /* = S_IFCHR */
	    m |= S_IFCHR;
	    d = Long_val(Field(nt,0));
	    break;
	case 1:  /* = S_IFBLK */
	    m |= S_IFBLK;
	    d = Long_val(Field(nt,0));
	    break;
	}
    }
    else {
	switch (Long_val(nt)) {
	case 0:  /* = S_IFREG */
	    m |= S_IFREG; break;
	case 1:  /* = S_IFIFO */
	    m |= S_IFIFO; break;
	case 2:  /* = S_IFSOCK */
	    m |= S_IFSOCK; break;
	}

    }

    e = mknod(String_val(name), m, d);
    if (e < 0) uerror("mknod", Nothing);

    return Val_unit;
#endif
}

/**********************************************************************/
/* "at" functions (POSIX 1-2008)                                      */
/**********************************************************************/

CAMLprim value netsys_have_at(value dummy)
{
#ifdef AT_FDCWD
    return Val_true;
#else
    return Val_false;
#endif
}

CAMLprim value netsys_at_fdcwd(value dummy)
{
#ifdef AT_FDCWD
    return Val_int(AT_FDCWD);
#else
    return Val_int(-1);
#endif
}

#ifdef HAVE_AT

#ifndef AT_EACCESS
#define AT_EACCESS 0
#endif

#ifndef AT_SYMLINK_NOFOLLOW
#define AT_SYMLINK_NOFOLLOW 0
#endif

#ifndef AT_SYMLINK_FOLLOW
#define AT_SYMLINK_FOLLOW 0
#endif

static int at_flags_table[] = {
    AT_EACCESS, AT_SYMLINK_NOFOLLOW, AT_SYMLINK_FOLLOW, AT_REMOVEDIR
};
#endif


/* Must be identical to the constants provided by the Unix module */
#ifdef HAVE_AT

/* FreeBSD does not have DSYNC/RSYNC: */
#ifndef O_DSYNC
#define O_DSYNC 0
#endif
#ifndef O_RSYNC
#define O_RSYNC 0
#endif

static int open_flag_table[] = {
  O_RDONLY, O_WRONLY, O_RDWR, O_NONBLOCK, O_APPEND, O_CREAT, O_TRUNC, O_EXCL, 
  O_NOCTTY, O_DSYNC, O_SYNC, O_RSYNC,
  0 /* O_SHARE_DELETE */, 0 /* O_CLOEXEC */, 0 /* O_KEEPEXEC */
};

enum { CLOEXEC = 1, KEEPEXEC = 2 };

static int open_cloexec_table[] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CLOEXEC, KEEPEXEC
};
#ifndef HAVE_O_KEEPEXEC
#ifndef caml_unix_cloexec_default
#define caml_unix_cloexec_default 0
#endif
#endif

#endif

CAMLprim value netsys_openat(value dirfd, value path, value flags, value perm)
{
#ifdef HAVE_AT
    CAMLparam4(dirfd, path, flags, perm);
    int ret, cv_flags, clo_flags, cloexec;
    char * p;

    /* shamelessly copied from ocaml distro */
    cv_flags = caml_convert_flag_list(flags, open_flag_table);
    clo_flags = caml_convert_flag_list(flags, open_cloexec_table);
    if (clo_flags & CLOEXEC)
        cloexec = 1;
    else if (clo_flags & KEEPEXEC)
        cloexec = 0;
    else
        cloexec = caml_unix_cloexec_default;
#if defined(O_CLOEXEC)
    if (cloexec) cv_flags |= O_CLOEXEC;
#endif
    p = caml_stat_alloc(caml_string_length(path) + 1);
    strcpy(p, String_val(path));
    caml_enter_blocking_section();
    ret = openat(Int_val(dirfd), p, cv_flags, Int_val(perm));
    caml_leave_blocking_section();
    caml_stat_free(p);
    if (ret == -1) uerror("openat", path);
#if !defined(O_CLOEXEC)
    {
        int flags = fcntl(Int_val(dirfd), F_GETFD, 0);
        if (flags == -1 || fcntl(Int_val(dirfd), F_SETFD, flags | FD_CLOEXEC) == -1)
          uerror("openat", path);
    }
#endif
    CAMLreturn (Val_int(ret));
#else
    caml_invalid_argument("Netsys_posix.openat not available");
#endif
}

/* Must be identical to the constants provided by the Unix module */
#ifdef HAVE_AT
static int access_permission_table[] = {
  R_OK, W_OK, X_OK, F_OK
};
#endif


CAMLprim value netsys_faccessat(value dirfd, value path, value perms, 
				value flags)
{
#ifdef HAVE_AT
    int ret, cv_perms, cv_flags;
    cv_perms = caml_convert_flag_list(perms, access_permission_table);
    cv_flags = caml_convert_flag_list(flags, at_flags_table);
    cv_flags &= (AT_EACCESS | AT_SYMLINK_NOFOLLOW);
    ret = faccessat(Int_val(dirfd), String_val(path), cv_perms, cv_flags);
    if (ret == -1)
	uerror("faccessat", path);
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.faccessat not available");
#endif
}


CAMLprim value netsys_mkdirat(value dirfd, value path, value perm)
{
#ifdef HAVE_AT
    if (mkdirat(Int_val(dirfd), String_val(path), Int_val(perm)) == -1) 
	uerror("mkdirat", path);
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.mkdirat not available");
#endif
}


CAMLprim value netsys_renameat(value olddirfd, value oldpath,
			       value newdirfd, value newpath)
{
#ifdef HAVE_AT
    if (renameat(Int_val(olddirfd), String_val(oldpath),
		 Int_val(newdirfd), String_val(newpath)) == -1)
	uerror("renameat", oldpath);
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.renameat not available");
#endif
}


CAMLprim value netsys_linkat(value olddirfd, value oldpath,
			     value newdirfd, value newpath, value flags)
{
#ifdef HAVE_AT
    int cv_flags;
    cv_flags = caml_convert_flag_list(flags, at_flags_table);
    cv_flags &= AT_SYMLINK_FOLLOW;  /* only allowed flag here */
    if (linkat(Int_val(olddirfd), String_val(oldpath),
	       Int_val(newdirfd), String_val(newpath), cv_flags) == -1)
	uerror("linkat", oldpath);
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.linkat not available");
#endif
}


CAMLprim value netsys_unlinkat(value dirfd, value path, value flags)
{
#ifdef HAVE_AT
    int cv_flags;
    cv_flags = caml_convert_flag_list(flags, at_flags_table);
    cv_flags &= AT_REMOVEDIR;  /* only allowed flag here */
    if (unlinkat(Int_val(dirfd), String_val(path), cv_flags) == -1)
	uerror("unlinkat", path);
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.unlinkat not available");
#endif
}


CAMLprim value netsys_symlinkat(value oldpath,
				value newdirfd, value newpath)
{
#ifdef HAVE_AT
    if (symlinkat(String_val(oldpath),
		  Int_val(newdirfd), String_val(newpath)) == -1)
	uerror("symlinkat", oldpath);
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.symlinkat not available");
#endif
}


CAMLprim value netsys_mkfifoat(value dirfd, value path, value mode)
{
#ifdef HAVE_MKFIFOAT
    if (mkfifoat(Int_val(dirfd), String_val(path), Int_val(mode)) == -1)
	uerror("mkfifoat", path);
    return Val_unit;
#else
    caml_invalid_argument("Netsys_posix.mkfifoat not available");
#endif
}


CAMLprim value netsys_readlinkat(value dirfd, value path)
{
#ifdef HAVE_AT
  char buffer[PATH_MAX];
  int len;
  len = readlinkat(Int_val(dirfd), String_val(path), buffer, sizeof(buffer)-1);
  if (len == -1) uerror("readlinkat", path);
  buffer[len] = '\0';
  return caml_copy_string(buffer);
#else
    caml_invalid_argument("Netsys_posix.readlinkat not available");
#endif
}
