/* $Id$ */


#include "netsys_c.h"

#undef Bigarray_val
#define Bigarray_val Caml_ba_array_val

#if defined(HAVE_POSIX_SEM_ANON) || defined(HAVE_POSIX_SEM_NAMED)
#include <limits.h>
#include <semaphore.h>
#endif

/**********************************************************************/
/* Semaphores                                                         */
/**********************************************************************/

#if defined(HAVE_POSIX_SEM_ANON) || defined(HAVE_POSIX_SEM_NAMED)
struct sem_block {
    sem_t *sem_ptr;
    int    sem_close_flag;
    /* Whether sem_ptr points to memory that needs to be freed */
};

#define Sem_block_val(v) ((struct sem_block *) (Data_custom_val(v)))

static void free_sem_block(value v) {
    struct sem_block *sb;
    sb = Sem_block_val(v);
#ifdef HAVE_POSIX_SEM_NAMED
    if (sb->sem_close_flag && sb->sem_ptr != NULL)
	sem_close(sb->sem_ptr);
#endif
    sb->sem_ptr = NULL;
}

static struct custom_operations sem_block_ops = {
    "",
    free_sem_block,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default
};

static value alloc_sem_block(sem_t *s, int close_flag) {
    value r;
    struct sem_block *sb;
    r = caml_alloc_custom(&sem_block_ops, sizeof(struct sem_block),
			  0, 1);
    sb = Sem_block_val(r);
    sb->sem_ptr = s;
    sb->sem_close_flag = close_flag;
    return r;
}

static int sem_open_flag_table[] = {
    O_CREAT, O_EXCL
};
#endif

CAMLprim value netsys_have_sem_anon(value dummy) 
{
#ifdef HAVE_POSIX_SEM_ANON
    return Val_bool(1);
#else
    return Val_bool(0);
#endif
}

CAMLprim value netsys_have_sem_named(value dummy) 
{
#ifdef HAVE_POSIX_SEM_NAMED
    return Val_bool(1);
#else
    return Val_bool(0);
#endif
}

CAMLprim value netsys_sem_size(value dummy) 
{
#if defined(HAVE_POSIX_SEM_ANON) || defined(HAVE_POSIX_SEM_NAMED)
    return Val_long(sizeof(sem_t));
#else
    return Val_long(1);
#endif
}

CAMLprim value netsys_sem_value_max(value dummy) 
{
#if defined(HAVE_POSIX_SEM_ANON) || defined(HAVE_POSIX_SEM_NAMED)
    unsigned int m;

#ifdef SEM_VALUE_MAX
    m = SEM_VALUE_MAX;
#else
#ifdef _SC_SEM_VALUE_MAX
    m = sysconf(_SC_SEM_VALUE_MAX);
#else
    m = 32767;   /* POSIX minimum */
#endif
#endif

#ifdef ARCH_SIXTYFOUR
    return Val_long(m);
#else
    return Val_long(m > 1073741823 ? 1073741823 : m);
#endif
#else
    return Val_long(1);
#endif
}

CAMLprim value netsys_sem_open(value namev, 
			       value flagsv,
			       value modev,
			       value initv) 
{
#ifdef HAVE_POSIX_SEM_NAMED
    sem_t *s;
    value r;
    unsigned int init;
    int flags;

    init = Long_val(initv);
    flags = caml_convert_flag_list(flagsv, sem_open_flag_table);
    s = sem_open(String_val(namev),
		 flags,
		 Int_val(modev),
		 init);
    if (s == (sem_t *) SEM_FAILED) uerror("sem_open", namev);
    r = alloc_sem_block(s, 1);
    return r;
#else
    caml_invalid_argument("Netsys.sem_open not available");
#endif
}

CAMLprim value netsys_sem_close(value srv)
{
#ifdef HAVE_POSIX_SEM_NAMED
    struct sem_block *sb;
    int code;

    sb = Sem_block_val(srv);
    if (sb->sem_ptr == NULL)
	caml_invalid_argument ("Netsys.sem_close: stale semaphore");
    code = sem_close(sb->sem_ptr);
    if (code == -1) uerror("sem_close", Nothing);
    sb->sem_ptr = NULL;
    return Val_unit;
#else
    caml_invalid_argument("Netsys.sem_close not available");
#endif
}

CAMLprim value netsys_sem_unlink(value namev) 
{
#ifdef HAVE_POSIX_SEM_NAMED
    int code;
    code = sem_unlink(String_val(namev));
    if (code == -1) uerror("sem_unlink", Nothing);
    return Val_unit;
#else
    caml_invalid_argument("Netsys.sem_unlink not available");
#endif
}

CAMLprim value netsys_sem_init(value memv,
			       value posv,
			       value psharedv,
			       value initv)
{
#ifdef HAVE_POSIX_SEM_ANON
    sem_t *s;
    int code;
    unsigned int init;
    value r;

    init = Long_val(initv);
    s = (sem_t *) (((char *) Bigarray_val(memv)->data) + Long_val(posv));
    code = sem_init(s, Bool_val(psharedv), init);
    if (code == -1) uerror("sem_init", Nothing);
    r = alloc_sem_block(s, 0);
    return r;
#else
    caml_invalid_argument("Netsys.sem_init not available");
#endif
}

CAMLprim value netsys_as_sem(value memv,
			     value posv) 
{
#if defined(HAVE_POSIX_SEM_ANON)
    sem_t *s;
    value r;

    s = (sem_t *) (((char *) Bigarray_val(memv)->data) + Long_val(posv));
    r = alloc_sem_block(s, 0);
    return r;
#else
    caml_invalid_argument("Netsys.as_sem not available");
#endif
}


CAMLprim value netsys_sem_destroy(value srv)
{
#ifdef HAVE_POSIX_SEM_ANON
    struct sem_block *sb;
    int code;

    sb = Sem_block_val(srv);
    if (sb->sem_ptr == NULL)
	caml_invalid_argument ("Netsys.sem_destroy: stale semaphore");
    code = sem_destroy(sb->sem_ptr);
    if (code == -1) uerror("sem_destroy", Nothing);
    sb->sem_ptr = NULL;
    return Val_unit;
#else
    caml_invalid_argument("Netsys.sem_destroy not available");
#endif
}


CAMLprim value netsys_sem_getvalue(value srv)
{
#if defined(HAVE_POSIX_SEM_ANON) || defined(HAVE_POSIX_SEM_NAMED)
    struct sem_block *sb;
    int code;
    int sval;

    sb = Sem_block_val(srv);
    if (sb->sem_ptr == NULL)
	caml_invalid_argument ("Netsys.sem_getvalue: stale semaphore");
    code = sem_getvalue(sb->sem_ptr, &sval);
    if (code == -1) uerror("sem_getvalue", Nothing);
    if (sval < 0) sval = 0;
#ifndef ARCH_SIXTYFOUR
    if (sval > 1073741823) unix_error(EINVAL, "sem_getvalue", Nothing);
#endif
    return Val_int(sval);
#else
    caml_invalid_argument("Netsys.sem_getvalue not available");
#endif
}

CAMLprim value netsys_sem_post(value srv)
{
#if defined(HAVE_POSIX_SEM_ANON) || defined(HAVE_POSIX_SEM_NAMED)
    struct sem_block *sb;
    int code;

    sb = Sem_block_val(srv);
    if (sb->sem_ptr == NULL)
	caml_invalid_argument ("Netsys.sem_post: stale semaphore");
    code = sem_post(sb->sem_ptr);
    if (code == -1) uerror("sem_post", Nothing);
    return Val_unit;
#else
    caml_invalid_argument("Netsys.sem_post not available");
#endif
}


CAMLprim value netsys_sem_wait(value srv, value bv)
{
#if defined(HAVE_POSIX_SEM_ANON) || defined(HAVE_POSIX_SEM_NAMED)
    struct sem_block *sb;
    sem_t *s;
    int code;
    int tag;

    sb = Sem_block_val(srv);
    if (sb->sem_ptr == NULL)
	caml_invalid_argument ("Netsys.sem_wait: stale semaphore");
    tag = Int_val(bv);
    s = sb->sem_ptr;
    caml_enter_blocking_section();
    if (tag == 0)
	code = sem_wait(s);
    else
	code = sem_trywait(s);
    caml_leave_blocking_section();
    if (code == -1) uerror("sem_wait", Nothing);
    return Val_unit;
#else
    caml_invalid_argument("Netsys.sem_wait not available");
#endif
}


