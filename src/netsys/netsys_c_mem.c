/* $Id$ */

#include "netsys_c.h"
#include "netsys_c_htab.h"
#include "netsys_c_queue.h"

#undef Bigarray_val
#define Bigarray_val Caml_ba_array_val

#ifdef HAVE_MMAP
#include <sys/types.h>
#include <sys/mman.h>
#if !defined(MAP_ANON) && defined(MAP_ANONYMOUS)
#define MAP_ANON MAP_ANONYMOUS
#endif
#endif

#undef DEBUG

#if OCAML_VERSION < 41100
#define BIGARRAY_MARSHAL_ID "_bigarray"
#else
#define BIGARRAY_MARSHAL_ID "_bigarr02"
#endif

/**********************************************************************/
/* Bigarray helpers                                                   */
/**********************************************************************/

CAMLprim value netsys_blit_memory_to_string(value memv,
					    value memoffv,
					    value sv,
					    value soffv,
					    value lenv)
{
    struct caml_ba_array *mem = Bigarray_val(memv);
    char * s = Bytes_val(sv);
    long memoff = Long_val(memoffv);
    long soff = Long_val(soffv);
    long len = Long_val(lenv);

    memmove(s + soff, ((char*) mem->data) + memoff, len);

    return Val_unit;
}


CAMLprim value netsys_blit_string_to_memory(value sv,
					    value soffv,
					    value memv,
					    value memoffv,
					    value lenv)
{
    struct caml_ba_array *mem = Bigarray_val(memv);
    const char * s = String_val(sv);
    long memoff = Long_val(memoffv);
    long soff = Long_val(soffv);
    long len = Long_val(lenv);

    memmove(((char*) mem->data) + memoff, s + soff, len);

    return Val_unit;
}


CAMLprim value netsys_memory_address(value memv)
{
    struct caml_ba_array *mem = Bigarray_val(memv);
    return caml_copy_nativeint((intnat) mem->data);
}


CAMLprim value netsys_getpagesize(value dummy)
{
#ifdef HAVE_SYSCONF
    return Val_long(sysconf(_SC_PAGESIZE));
#else
    caml_invalid_argument("Netsys_mem.getpagesize not available");
#endif
}

CAMLprim value netsys_grab(value addrv, value lenv)
{
    void *start;
    size_t length;

    start = (void *) Nativeint_val(addrv);
    length = Long_val(lenv);
    return caml_ba_alloc_dims(CAML_BA_C_LAYOUT | CAML_BA_UINT8,
			       1, start, length);
}


CAMLprim value netsys_alloc_memory_pages(value addrv, value pv, value execv)
{
#if defined(HAVE_MMAP) && defined(HAVE_SYSCONF) && defined(MAP_ANON)
    void *start;
    size_t length;
    long pgsize;
    void *data;
    int flags;
    value r;

    start = (void *) Nativeint_val(addrv);
    if (start == 0) start=NULL;    /* for formal reasons */

    length = Int_val(pv);
    pgsize = sysconf(_SC_PAGESIZE);
    length = ((length - 1) / pgsize + 1) * pgsize;  /* fixup */
    flags = PROT_READ|PROT_WRITE;
    if (Bool_val(execv)) flags |= PROT_EXEC;

    data = mmap(start, length, flags, 
		MAP_PRIVATE | MAP_ANON, (-1), 0);
    if (data == (void *) -1) uerror("mmap", Nothing);

    r = caml_ba_alloc_dims(CAML_BA_C_LAYOUT | CAML_BA_UINT8 | 
			    CAML_BA_MAPPED_FILE,
			    1, data, length);

    return r;
#else
    caml_invalid_argument("Netsys_mem.alloc_memory_pages not available");
#endif
}


CAMLprim value netsys_zero_pages(value memv, value offsv, value lenv)
{
#if defined(HAVE_MMAP) && defined(HAVE_SYSCONF) && defined(MAP_ANON) && defined (MAP_FIXED)
    struct caml_ba_array *mem = Bigarray_val(memv);
    long offs = Long_val(offsv);
    long len = Long_val(lenv);
    long pgsize = sysconf(_SC_PAGESIZE);
    char *data = ((char*) mem->data) + offs;
    void *data2;
    
    if (((uintnat) data) % pgsize == 0 && len % pgsize == 0) {
	if (len > 0) {
	    data2 = mmap(data, len, PROT_READ|PROT_WRITE, 
			 MAP_PRIVATE | MAP_ANON | MAP_FIXED,
			 (-1), 0);
	    if (data2 == (void *) -1) uerror("mmap", Nothing);
	    if (((void *) data) != data2)
		caml_failwith("Netsys_mem.zero_pages assertion failed");
	}
    }
    else
	caml_invalid_argument("Netsys_mem.zero_pages only for whole pages");

    return Val_unit;
#else
    caml_invalid_argument("Netsys_mem.zero_pages not available");
#endif
}


CAMLprim value netsys_alloc_aligned_memory(value alignv, value pv)
{
#if defined(HAVE_POSIX_MEMALIGN)
    size_t align = Long_val(alignv);
    size_t size = Long_val(pv);
    void * addr = NULL;
    int e;
    value r;

    e = posix_memalign(&addr, align, size);
    if (e != 0) unix_error(e, "posix_memalign", Nothing);

    r = caml_ba_alloc_dims(CAML_BA_C_LAYOUT | CAML_BA_UINT8 | 
			    CAML_BA_MANAGED,
			    1, addr, size);
    return r;
#else
    caml_invalid_argument("Netsys_mem.alloc_aligned_memory not available");
#endif
}


CAMLprim value netsys_map_file(value fdv,
			       value posv,
			       value addrv,
			       value sharedv,
			       value sizev)
{
#if defined(HAVE_MMAP) && defined(HAVE_SYSCONF) && !defined(_WIN32)
    int fd, shared;
    off_t pos, eofpos, basize0;
          /* Att: pos might be 64 bit even on 32 bit systems! */
    struct stat st;
    void *addr, *eff_addr;
    intnat size;
    uintnat basize;
    int64_t pos0;
    uintnat pagesize, delta;

    /* Avoid here seeking at all costs. On some systems, shared memory
       descriptors do neither allow seek, nor read/write.
    */
    fd = Int_val(fdv);
    pos0 = Int64_val(posv);
    if (((int64_t) ((off_t) pos0)) != pos0)
	caml_failwith("Netsys_mem: large files not supported on this OS");
    pos = pos0;
    addr = (void *) Nativeint_val(addrv);
    if (addr == 0) addr = NULL;
    shared = Bool_val(sharedv) ? MAP_SHARED : MAP_PRIVATE;
    size = Long_val(sizev);

    pagesize = sysconf(_SC_PAGESIZE);

    if (fstat(fd, &st) == -1) uerror("fstat", Nothing);
    eofpos = st.st_size;
    
    if (size == -1) {
	if (eofpos < pos) 
	    caml_failwith("Netsys_mem: cannot mmap - file position exceeds file size");
	basize0 = eofpos - pos;
	if (((off_t) ((uintnat) basize0)) != basize0)
	    caml_failwith("Netsys_mem: cannot mmap - file too large");
	basize = (uintnat) basize0;
    }
    else {
	if (size < 0)
	    caml_invalid_argument("netsys_map_file");
	if (eofpos - pos < size) {
	    if (ftruncate(fd, pos + size) == -1)
		uerror("ftruncate", Nothing);
	}
	basize = size;
    }
    delta = (uintnat) (pos % pagesize);
    eff_addr = mmap(addr, basize + delta, PROT_READ | PROT_WRITE,
		    shared, fd, pos - delta);
    if (eff_addr == (void*) MAP_FAILED) uerror("mmap", Nothing);
    eff_addr = (void *) ((uintnat) eff_addr + delta);

    return caml_ba_alloc_dims(CAML_BA_UINT8 | CAML_BA_C_LAYOUT | 
			       CAML_BA_MAPPED_FILE, 1, eff_addr, basize);
#else
    caml_invalid_argument("Netsys_mem.memory_map_file not available");
#endif
}


/* from mmap_unix.c: */
static void ba_unmap_file(void * addr, uintnat len)
{
#if defined(HAVE_MMAP) && defined(HAVE_SYSCONF)
  uintnat page = sysconf(_SC_PAGESIZE);
  uintnat delta = (uintnat) addr % page;
  munmap((void *)((uintnat)addr - delta), len + delta);
#endif
}



CAMLprim value netsys_memory_unmap_file(value memv) 
{
    struct caml_ba_array *b = Bigarray_val(memv);
    if ((b->flags & CAML_BA_MANAGED_MASK) == CAML_BA_MAPPED_FILE) {
	if (b->proxy == NULL) {
	    ba_unmap_file(b->data, b->dim[0]);
	    b->data = NULL;
	    b->flags = 
		(b->flags & ~CAML_BA_MANAGED_MASK) | CAML_BA_EXTERNAL;
	}
	else if (b->proxy->refcount == 1) {
	    ba_unmap_file(b->proxy->data, b->dim[0]);
	    b->proxy->data = NULL;
	    b->data = NULL;
	    b->flags = 
		(b->flags & ~CAML_BA_MANAGED_MASK) | CAML_BA_EXTERNAL;
	}
    }
    return Val_unit;
}


extern value caml_ba_reshape(value bv, value dimv);

CAMLprim value netsys_reshape(value bv)
{
    struct caml_ba_array *b;
    struct caml_ba_array *mem;
    uintnat size;
    int i,k;
    CAMLparam1(bv);
    CAMLlocal2(memv,dimv);

    b = Bigarray_val(bv);

    /* We dont't have access to caml_ba_update_proxy. The workaround is
       to call caml_ba_reshape, and to fix the returned bigarray descriptor
       afterward.
    */
    dimv = caml_alloc(b->num_dims,0);
    for (k=0; k < b->num_dims; k++) {
	Store_field(dimv, k, Val_long(b->dim[k]));
    };
    
    memv = caml_ba_reshape(bv, dimv);
    mem = Bigarray_val(memv);

    /* Compute the size of the data area: */
    size = caml_ba_element_size[b->flags & CAML_BA_KIND_MASK];
    for (i = 0; i < b->num_dims; i++)
	size *= b->dim[i];

    mem->num_dims = 1;
    mem->flags = (mem->flags & ~CAML_BA_KIND_MASK) | CAML_BA_UINT8;
    mem->flags = (mem->flags & ~CAML_BA_LAYOUT_MASK) | CAML_BA_C_LAYOUT;
    mem->dim[0] = size;

    CAMLreturn(memv);
}


/**********************************************************************/
/* Obj helpers                                                        */
/**********************************************************************/

/* From gc.h: */
#ifndef CAML_GC_H
#define Caml_white (0 << 8)
#define Caml_gray  (1 << 8)
#define Caml_blue  (2 << 8)
#define Caml_black (3 << 8)
#define Color_hd(hd) ((color_t) ((hd) & Caml_black))
#define Whitehd_hd(hd) (((hd)  & ~Caml_black)/*| Caml_white*/)
#endif

/* e.g. to get the color:

   color = Color_hd(Hd_val(value))

   to set the color:

   Hd_val(value) = Whitehd_hd(Hd_val(value)) | color
*/


CAMLprim value netsys_obj_address(value objv)
{
    return caml_copy_nativeint((intnat) Op_val(objv));
}

CAMLprim value netsys_hdr_address(value objv)
{
    return caml_copy_nativeint((intnat) Hp_val(objv));
}

CAMLprim value netsys_color(value objv)
{
    return Val_int(Color_hd(Hd_val(objv)) >> 8);
}

CAMLprim value netsys_set_color(value objv, value colv)
{
    int col;
    col = Int_val(colv);
    Hd_val(objv) = Whitehd_hd(Hd_val(objv)) | (col << 8);
    return Val_unit;
}

/**********************************************************************/
/* I/O with Bigarrays                                                 */
/**********************************************************************/

CAMLprim value netsys_mem_read(value fdv, value memv, value offv, value lenv)
{
    intnat numbytes;
    intnat ret;
    char *data;
#ifdef _WIN32
    DWORD n;
    DWORD err = 0;
#endif

    numbytes = Long_val(lenv);
    data = ((char *) (Bigarray_val(memv)->data)) + Long_val(offv);
#ifdef _WIN32
    if (Descr_kind_val(fdv) == KIND_SOCKET) {
	SOCKET h = Socket_val(fdv);
	caml_enter_blocking_section();
	ret = recv(h, data, numbytes, 0);
	if (ret == SOCKET_ERROR) err = WSAGetLastError();
	caml_leave_blocking_section();
	ret = n;
    } else {
	HANDLE h = Handle_val(fdv);
	caml_enter_blocking_section();
	if (! ReadFile(h, data, numbytes, &n, NULL)) err = GetLastError();
	caml_leave_blocking_section();
	ret = n;
    }
    if (err) {
	win32_maperr(err);
	ret = -1;
    }
#else
    caml_enter_blocking_section();
    ret = read(Int_val(fdv), data, (int) numbytes);
    caml_leave_blocking_section();   /* keeps errno intact */
#endif
    if (ret == -1) uerror("mem_read", Nothing);
    return Val_long(ret);
}


CAMLprim value netsys_mem_write(value fdv, value memv, value offv, value lenv)
{
    intnat numbytes;
    intnat ret;
    char *data;
#ifdef _WIN32
    DWORD n;
    DWORD err = 0;
#endif

    numbytes = Long_val(lenv);
    data = ((char *) (Bigarray_val(memv)->data)) + Long_val(offv);
#ifdef _WIN32
    if (Descr_kind_val(fdv) == KIND_SOCKET) {
	SOCKET h = Socket_val(fdv);
	caml_enter_blocking_section();
	ret = send(h, data, numbytes, 0);
	if (ret == SOCKET_ERROR) err = WSAGetLastError();
	caml_leave_blocking_section();
	ret = n;
    } else {
	HANDLE h = Handle_val(fdv);
	caml_enter_blocking_section();
	if (! WriteFile(h, data, numbytes, &n, NULL)) err = GetLastError();
	caml_leave_blocking_section();
	ret = n;
    }
    if (err) {
	win32_maperr(err);
	ret = -1;
    }
#else
    caml_enter_blocking_section();
    ret = write(Int_val(fdv), data, (int) numbytes);
    caml_leave_blocking_section();
#endif
    if (ret == -1) uerror("mem_write", Nothing);
    return Val_long(ret);
}


static int msg_flag_table[] = {
  MSG_OOB, MSG_DONTROUTE, MSG_PEEK
};


CAMLprim value netsys_mem_recv(value fdv, value memv, value offv, value lenv,
			       value flagsv)
{
    intnat numbytes;
    intnat ret;
    char *data;
    int flags;
#ifdef _WIN32
    DWORD err = 0;
    SOCKET s;
#else
    int s;
#endif

    numbytes = Long_val(lenv);
    data = ((char *) (Bigarray_val(memv)->data)) + Long_val(offv);
    flags = caml_convert_flag_list(flagsv, msg_flag_table);

#ifdef _WIN32
    s = Socket_val(fdv);
#else
    s = Int_val(fdv);
#endif

    caml_enter_blocking_section();
    ret = recv(s, data, (int) numbytes, flags);

#ifdef _WIN32
    if (ret == -1) err = WSAGetLastError();
    caml_leave_blocking_section();
    if (ret == -1) win32_maperr(err);
#else
    caml_leave_blocking_section();
#endif

    if (ret == -1) uerror("mem_recv", Nothing);
    return Val_long(ret);
}

CAMLprim value netsys_mem_send(value fdv, value memv, value offv, value lenv,
			       value flagsv)
{
    intnat numbytes;
    intnat ret;
    char *data;
    int flags;
#ifdef _WIN32
    DWORD err = 0;
    SOCKET s;
#else
    int s;
#endif

    numbytes = Long_val(lenv);
    data = ((char *) (Bigarray_val(memv)->data)) + Long_val(offv);
    flags = caml_convert_flag_list(flagsv, msg_flag_table);

#ifdef _WIN32
    s = Socket_val(fdv);
#else
    s = Int_val(fdv);
#endif

    caml_enter_blocking_section();
    ret = send(s, data, (int) numbytes, flags);

#ifdef _WIN32
    if (ret == -1) err = WSAGetLastError();
    caml_leave_blocking_section();
    if (ret == -1) win32_maperr(err);
#else
    caml_leave_blocking_section();
#endif

    if (ret == -1) uerror("mem_send", Nothing);
    return Val_long(ret);
}


/**********************************************************************/
/* Bigarrays as value buffers                                         */
/**********************************************************************/

CAMLprim value netsys_as_value(value memv, value offv) 
{
    struct caml_ba_array *b = Bigarray_val(memv);
    return (value) (b->data + Long_val(offv));
}

CAMLprim value netsys_value_area_add(value memv) 
{
#ifdef FANCY_PAGE_TABLES
    struct caml_ba_array *b = Bigarray_val(memv);
    int code;
    code = caml_page_table_add(In_static_data,
			       b->data,
			       b->data + b->dim[0]);
    if (code != 0) 
	caml_failwith("Netsys_mem.value_area: error");
    return Val_unit;
#else
    caml_invalid_argument("Netsys_mem.value_area");
#endif
}

CAMLprim value netsys_value_area_remove(value memv) 
{
#ifdef FANCY_PAGE_TABLES
    struct caml_ba_array *b = Bigarray_val(memv);
    caml_page_table_remove(In_static_data,
                           b->data,
                           b->data + b->dim[0]);
    /* Silently ignore errors... */
    return Val_unit;
#else
    caml_invalid_argument("Netsys_mem.value_area");
#endif
}

CAMLprim value netsys_init_header(value memv, value offv, value tagv,
				  value sizev)
{
    struct caml_ba_array *b = Bigarray_val(memv);
    intnat off = Long_val(offv);
    intnat size = Long_val(sizev);
    int tag = Int_val(tagv);
    value *m;

#ifdef ARCH_SIXTYFOUR
    if (off % 8 != 0)
	caml_invalid_argument("Netsys_mem.init_header");
#else
    if (off % 4 != 0)
	caml_invalid_argument("Netsys_mem.init_header");
#endif

    m = (value *) (((char *) b->data) + off);
    m[0] = /* Make_header (wosize, tag, Caml_white) */
	(value) (((header_t) size << 10) + tag);

    return Val_unit;
    
}

CAMLprim value netsys_cmp_string(value s1, value s2)
{
    mlsize_t l1, l2, k;
    unsigned char *c1, *c2;
    if (s1 == s2) return Val_int(0);
    l1 = caml_string_length(s1);
    l2 = caml_string_length(s2);
    c1 = (unsigned char *) String_val(s1);
    c2 = (unsigned char *) String_val(s2);
    k = 0;
    while (k < l1 && k < l2) {
	if (*c1 != *c2) 
	    return Val_int( (int) *c1 - (int) *c2 );
	c1++;
	c2++;
	k++;
    }
    return Val_long ( l1 - l2 );
}


CAMLprim value netsys_init_string(value memv, value offv, value lenv) 
{
    struct caml_ba_array *b = Bigarray_val(memv);
    intnat off = Long_val(offv);
    intnat len = Long_val(lenv);
    value *m;
    char *m_b;
    mlsize_t wosize;
    mlsize_t offset_index;

#ifdef ARCH_SIXTYFOUR
    if (off % 8 != 0)
	caml_invalid_argument("Netsys_mem.init_string");
#else
    if (off % 4 != 0)
	caml_invalid_argument("Netsys_mem.init_string");
#endif

    m = (value *) (((char *) b->data) + off);
    m_b = (char *) m;
    wosize = (len + sizeof (value)) / sizeof (value);  /* >= 1 */
    
    m[0] = /* Make_header (wosize, String_tag, Caml_white) */
	(value) (((header_t) wosize << 10) + String_tag);
    m[wosize] = 0;

    offset_index = Bsize_wsize (wosize) - 1;
    m_b[offset_index + sizeof(value)] = offset_index - len;

    return Val_unit;
}


struct named_custom_ops {
    char *name;
    void *ops;
    struct named_custom_ops *next;
};

#ifndef CAML_MAJOR_GC_H
extern uintnat caml_allocated_words;
#endif


/* enable_atoms:
     0 = throw error
     1 = do not copy them
     2 = create copy
   enable_bigarrays:
     0 = throw error
     1 = copy them to malloc'ed memory
     2 = copy them to buffer memory
*/

int netsys_init_value_1(struct htab *t,
			struct nqueue *q,
			char *dest,
			char *dest_end,
			value orig,  
			int enable_bigarrays, 
			int enable_customs,
			int enable_atoms,
                        int enable_cc,
			int simulation,
			void *target_addr,
			struct named_custom_ops *target_custom_ops,
                        value cc,
			int color,
			intnat *start_offset,
			intnat *bytelen
			)
{
    void *orig_addr;
    void *work_addr;
    value work;
    int   work_tag;
    char *work_header;
    size_t work_bytes;
    size_t work_words;
    void *copy_addr;
    value copy;
    char *copy_header;
    header_t copy_header1;
    int   copy_tag;
    size_t copy_words;
    void *fixup_addr;
    char *dest_cur;
    char *dest_ptr;
    int code, i;
    intnat addr_delta;
    struct named_custom_ops *ops_ptr;
    void *int32_target_ops;
    void *int64_target_ops;
    void *nativeint_target_ops;
    void *bigarray_target_ops;

#ifdef DEBUG
    fprintf(stderr,
            "dest=%lx dest_end=%lx orig=%lx target=%lx en_b=%d en_c=%d en_a=%d sim=%d color=%d\n",
            (intnat) dest, (intnat) dest_end, Long_val(orig), (intnat) target_addr,
            enable_bigarrays, enable_customs, enable_atoms, simulation,
            color);
#endif

    copy = 0;

    dest_cur = dest;
    addr_delta = ((char *) target_addr) - dest;

    if (dest_cur >= dest_end && !simulation) return (-4);   /* out of space */

    if (!Is_block(orig)) {
#ifdef DEBUG
        fprintf(stderr, "DEBUG: Unboxed value\n");
#endif
        return (-2);
    };

    orig_addr = (void *) orig;
    code = netsys_queue_add(q, orig_addr);
    if (code != 0) {
#ifdef DEBUG
        fprintf(stderr, "DEBUG: From netsys_queue_add: %d\n", code);
#endif
        return code;
    }

    /* initialize *_target_ops */
    bigarray_target_ops = NULL;
    int32_target_ops = NULL;
    int64_target_ops = NULL;
    nativeint_target_ops = NULL;
    ops_ptr = target_custom_ops;
    while (ops_ptr != NULL) {
	if (strcmp(ops_ptr->name, BIGARRAY_MARSHAL_ID) == 0)
	    bigarray_target_ops = ops_ptr->ops;
	else if (strcmp(ops_ptr->name, "_i") == 0)
	    int32_target_ops = ops_ptr->ops;
	else if (strcmp(ops_ptr->name, "_j") == 0)
	    int64_target_ops = ops_ptr->ops;
	else if (strcmp(ops_ptr->name, "_n") == 0)
	    nativeint_target_ops = ops_ptr->ops;
	ops_ptr = ops_ptr->next;
    };

    /* First pass: Iterate over the addresses found in q. Ignore
       addresses already seen in the past (which are in t). For
       new addresses, make a copy, and add these copies to t.
    */

    /* fprintf(stderr, "first pass, orig_addr=%lx simulation=%d addr_delta=%lx\n",
       (unsigned long) orig_addr, simulation, addr_delta);
    */

    code = netsys_queue_take(q, &work_addr);
    while (code != (-3)) {
	if (code != 0) {
#ifdef DEBUG
            fprintf(stderr, "DEBUG: From netsys_queue_take: %d\n", code);
#endif
            return code;
        }

	/* fprintf(stderr, "work_addr=%lx\n", (unsigned long) work_addr); */

	code = netsys_htab_lookup(t, work_addr, &copy_addr);
	if (code != 0) {
#ifdef DEBUG
            fprintf(stderr, "DEBUG: From netsys_htab_lookup: %d\n", code);
#endif
            return code;
        };

	if (copy_addr == NULL) {
	    /* The address is unknown, so copy the value */

	    /* Body of first pass */
	    work = (value) work_addr;
	    work_tag = Tag_val(work);
	    work_header = (char *) Hp_val(work);
	    
	    if (work_tag < No_scan_tag) {
		/* It is a scanned value (with subvalues) */
		
		switch(work_tag) {
		case Object_tag:
		case Closure_tag:
		case Lazy_tag:
		case Forward_tag:
#ifdef DEBUG                    
                    fprintf(stderr, "DEBUG: Unsupported tag\n");
#endif
		    return (-2);   /* unsupported */
		}

		work_words = Wosize_hp(work_header);
		if (work_words == 0) {
		    if (!enable_atoms) {
#ifdef DEBUG
                        fprintf(stderr, "DEBUG: Unsupported atom\n");
#endif
                        return (-2);
                    }
		    if (enable_atoms == 1) goto next;
		};
		
		/* Do the copy. */

		work_bytes = Bhsize_hp(work_header);
		copy_header = dest_cur;
		dest_cur += work_bytes;
		if (dest_cur > dest_end && !simulation) return (-4);
		
		if (simulation) 
		    copy_addr = work_addr;
		else {
		    memcpy(copy_header, work_header, work_bytes);
		    copy = Val_hp(copy_header);
		    copy_addr = (void *) copy;
		    Hd_val(copy) = Whitehd_hd(Hd_val(copy)) | color;
		}

		/* Add the association (work_addr -> copy_addr) to t: */

		code = netsys_htab_add(t, work_addr, copy_addr);
		if (code < 0) {
#ifdef DEBUG
                    fprintf(stderr, "DEBUG: From netsys_htab_add: %d\n", code);
#endif
                    return code;
                }

		/* Add the sub values of work_addr to q: */

		for (i=0; i < work_words; ++i) {
		    value field = Field(work, i);
		    if (Is_block (field)) {
                        if (enable_cc) {
                            value cc_rest, cc_pair;
                            intnat start, end;
                            cc_rest = cc;
                            while (Is_block(cc_rest)) {
                                cc_pair = Field(cc_rest, 0);  /* List.hd */
                                start = Long_val(Field(cc_pair,0)) << 1;
                                end = Long_val(Field(cc_pair,1)) << 1;
                                if (field >= start && field < end)
                                    goto cont_for;
                                cc_rest = Field(cc_rest, 1);  /* List.tl */
                            }
                        };
			code = netsys_queue_add(q, (void *) field);
			if (code != 0) {
#ifdef DEBUG
                            fprintf(stderr, "DEBUG: From netsys_queue_add: %d\n", code);
#endif
                            return code;
                        }
		    }
                cont_for:
                    continue;
		}
	    }
	    else {
		/* It an opaque value */
		int do_copy = 0;
		int do_bigarray = 0;
		void *target_ops = NULL;
		char caml_id = ' ';  /* only b, i, j, n */
		/* Check for bigarrays and other custom blocks */
		switch (work_tag) {
		case Abstract_tag:
#ifdef DEBUG
                    fprintf(stderr, "DEBUG: Unsupported abstract tag\n");
#endif
		    return(-2);
		case String_tag:
		    do_copy = 1; break;
		case Double_tag:
		    do_copy = 1; break;
		case Double_array_tag:
		    do_copy = 1; break;
		case Custom_tag: 
		    {
			struct custom_operations *custom_ops;
			const char *id;

			custom_ops = Custom_ops_val(work);
			id = custom_ops->identifier;

			if (id[0] == '_') {
			    switch (id[1]) {
			    case 'b':
				if (!enable_bigarrays) {
#ifdef DEBUG
                                    fprintf(stderr, "DEBUG: Unsupported bigarray\n");
#endif
                                    return (-2);
                                };
				if (strcmp(id, BIGARRAY_MARSHAL_ID) == 0) {
				    caml_id = 'b';
				    break;
				}
			    case 'i': /* int32_t */
			    case 'j': /* int64_t */
			    case 'n': /* nativeint */
				if (!enable_customs) {
#ifdef DEBUG
                                    fprintf(stderr, "DEBUG: Unsupported custom value\n");
#endif
                                    return (-2);
                                };
				if (id[2] == 0) {
				    caml_id = id[1];
				    break;
				}
			    default:
#ifdef DEBUG
                                fprintf(stderr, "DEBUG: Unknown custom _value\n");
#endif
				return (-2);
			    }
			}
			else {
#ifdef DEBUG
                            fprintf(stderr, "DEBUG: Unknown custom value\n");
#endif
			    return (-2);
                        }
		    }
		}; /* switch */

		switch (caml_id) {  /* look closer at some cases */
		case 'b': {
		    target_ops = bigarray_target_ops;
		    do_copy = 1;
		    do_bigarray = 1;
		    break;
		}
		case 'i':
		    target_ops = int32_target_ops; do_copy = 1; break;
		case 'j':
		    target_ops = int64_target_ops; do_copy = 1; break;
		case 'n':
		    target_ops = nativeint_target_ops; do_copy = 1; break;
		};

		if (do_copy) {  
		    /* Copy the value */
		    work_bytes = Bhsize_hp(work_header);
		    copy_header = dest_cur;
		    dest_cur += work_bytes;

		    if (simulation)
			copy_addr = work_addr;
		    else {
			if (dest_cur > dest_end) return (-4);
			memcpy(copy_header, work_header, work_bytes);
			copy = Val_hp(copy_header);
			copy_addr = (void *) copy;
			Hd_val(copy) = Whitehd_hd(Hd_val(copy)) | color;
			if (target_ops != NULL)
			    Custom_ops_val(copy) = target_ops;
		    }
		    
		    code = netsys_htab_add(t, work_addr, copy_addr);
		    if (code < 0) {
#ifdef DEBUG
                        fprintf(stderr, "DEBUG: From netsys_htab_add: %d\n", code);
#endif
                        return code;
                    }
		}

		if (do_bigarray) {
		    /* postprocessing for copying bigarrays */
		    struct caml_ba_array *b_work, *b_copy;
		    void * data_copy;
		    char * data_header;
		    header_t data_header1;
		    size_t size = 1;
		    size_t size_aligned;
		    size_t size_words;
		    b_work = Bigarray_val(work);
		    b_copy = Bigarray_val(copy);
		    for (i = 0; i < b_work->num_dims; i++) {
			size = size * b_work->dim[i];
		    };
		    size = 
			size * 
			caml_ba_element_size[b_work->flags & CAML_BA_KIND_MASK];

		    size_aligned = size;
		    if (size%sizeof(void *) != 0)
			size_aligned += sizeof(void *) - (size%sizeof(void *));
		    size_words = Wsize_bsize(size_aligned);

		    /* If we put the copy of the bigarray into our own
		       dest buffer, also generate an abstract header,
		       so it can be skipped when iterating over it.

		       We use here a special representation, so we can
		       encode any length in this header (with a normal
		       Ocaml header we are limited by Max_wosize, e.g.
		       16M on 32 bit systems). The special representation
		       is an Abstract_tag with zero length, followed
		       by the real length (in words)

                       NB. This convention is also understood by the
                       GC algorithm in Netmcore_heap.
		    */
		    
		    if (enable_bigarrays == 2) {
			data_header = dest_cur;
			dest_cur += 2*sizeof(void *);
			data_copy = dest_cur;
			dest_cur += size_aligned;
		    } else if (!simulation) {
			data_header = NULL;
			data_copy = caml_stat_alloc(size_aligned);
		    };

		    if (!simulation) {
			if (dest_cur > dest_end) return (-4);

			/* Initialize header: */
			
			if (data_header != NULL) {
			    data_header1 = Abstract_tag;
			    memcpy(data_header, 
				   (char *) &data_header1,
				   sizeof(header_t));
			    memcpy(data_header + sizeof(header_t),
				   (size_t *) &size_words,
				   sizeof(size_t));
			};

			/* Copy bigarray: */
			
			memcpy(data_copy, b_work->data, size);
			b_copy->data = data_copy;
			b_copy->proxy = NULL;

			/* as the copy resides in our own buffer, it is
			   now externally managed.
			*/
			b_copy->flags = 
			    (b_copy->flags & ~CAML_BA_MANAGED_MASK) |
			    (enable_bigarrays == 2 ? 
			     CAML_BA_EXTERNAL :
			     CAML_BA_MANAGED);
		    }
		}

	    } /* if (work_tag < No_scan_tag) */
	} /* if (copy_addr == NULL) */

	/* Switch to next address in q: */
    next:
	code = netsys_queue_take(q, &work_addr);
    } /* while */
#ifdef DEBUG
    fprintf(stderr, "End pass 1\n");    
#endif

    /* Second pass. The copied blocks still have fields pointing to the
       original blocks. We fix that now by iterating once over the copied
       memory block.
    */

    if (!simulation) {
#ifdef DEBUG
        fprintf(stderr, "second pass\n");
#endif
	dest_ptr = dest;
	while (dest_ptr < dest_cur) {
	    copy_header1 = *((header_t *) dest_ptr);
	    copy_tag = Tag_hd(copy_header1);
	    copy_words = Wosize_hd(copy_header1);
	    copy = (value) (dest_ptr + sizeof(void *));
	    
	    if (copy_tag < No_scan_tag) {
		for (i=0; i < copy_words; ++i) {
		    value field = Field(copy, i);
		    if (Is_block (field)) {
			/* It is a pointer. Try to fix it up. */
			code = netsys_htab_lookup(t, (void *) field,
						  &fixup_addr);
			if (code != 0) { 
#ifdef DEBUG
                            fprintf(stderr, "DEBUG: From netsys_htab_lookup (pass2): %d\n", code);
#endif
                            return code;
                        }

			if (fixup_addr != NULL)
			    Field(copy,i) = 
				(value) (((char *) fixup_addr) + addr_delta);
		    }
		}
	    }
	    else if (copy_tag == Abstract_tag && copy_words == 0) {
		/* our special representation for skipping data regions */
		copy_words = ((size_t *) dest_ptr)[1] + 1;
	    };
	    
	    dest_ptr += (copy_words + 1) * sizeof(void *);
	}
    }	

    /* hey, fine. Return result */
    *start_offset = sizeof(void *);
    *bytelen = dest_cur - dest;

    /* fprintf(stderr, "return regularly\n");*/

    return 0;
}


static int init_value_flags[] = { 1, 2, 4, 8, 16, 32 };

static struct htab *stat_tab = NULL;
static struct nqueue *stat_queue = NULL;

static int prep_stat_tab(void)
{
    int code, need_init;
    need_init=0;
    if (stat_tab == NULL) {
	stat_tab = (struct htab *) malloc(sizeof(struct htab));
	if (stat_tab == NULL) {
	    errno = ENOMEM;
	    return (-1);
	};
	need_init=1;
    };
    if (need_init || stat_tab->table == NULL) {
	code = netsys_htab_init(stat_tab, 256);
	if (code != 0) return code;
    }
    else
	netsys_htab_clear(stat_tab);
    return 0;
}


static void unprep_stat_tab(void)
{
    if (stat_tab->table_size > 256)
	netsys_htab_free(stat_tab);
}


static int prep_stat_queue(void)
{
    int code, need_init;
    need_init=0;
    if (stat_queue == NULL) {
	stat_queue = (struct nqueue *) malloc(sizeof(struct nqueue));
	if (stat_queue == NULL) {
	    errno = ENOMEM;
	    return (-1);
	};
	need_init=1;
    };
    if (need_init || stat_queue->table == NULL) {
	code = netsys_queue_init(stat_queue, 256);
	if (code != 0) return code;
    }
    else
	netsys_queue_clear(stat_queue);
    return 0;
}


static void unprep_stat_queue(void)
{
    if (netsys_queue_size(stat_queue) > 256)
	netsys_queue_free(stat_queue);
}

value netsys_init_value(value memv, 
			value offv, 
			value orig,  
			value flags,
			value targetaddrv,
			value target_custom_ops,
                        value cc
			)
{
    int code;
    value r;
    intnat start_offset, bytelen;
    int  cflags;
    void *targetaddr;
    char *mem_data;
    char *mem_end;
    intnat off;
    struct named_custom_ops *ops, *old_ops, *next_ops;

#ifdef DEBUG
    fprintf(stderr,"Start netsys_init_value\n");    
#endif
    code = prep_stat_tab();
    if (code != 0) {
#ifdef DEBUG
        fprintf(stderr, "DEBUG Bad prep_stat_tab\n");
#endif
        goto exit;
    }

    code = prep_stat_queue();
    if (code != 0) {
#ifdef DEBUG
        fprintf(stderr, "DEBUG Bad prep_stat_queue\n");
#endif
        goto exit;
    }

    off = Long_val(offv);
    if (off % sizeof(void *) != 0) { 
#ifdef DEBUG
        fprintf(stderr, "DEBUG Bad alignment\n");
#endif
        code=(-2); goto exit; 
    }

    cflags = caml_convert_flag_list(flags, init_value_flags);
    targetaddr = (void *) (Nativeint_val(targetaddrv) + off);

    ops = NULL;
    while (Is_block(target_custom_ops)) {
	value pair;
	old_ops = ops;
	pair = Field(target_custom_ops,0);
	ops = (struct named_custom_ops*) 
	          caml_stat_alloc(sizeof(struct named_custom_ops));
	ops->name = caml_stat_alloc(caml_string_length(Field(pair,0))+1);
	strcmp(ops->name, String_val(Field(pair,0)));
	ops->ops = (void *) Nativeint_val(Field(pair,1));
	ops->next = old_ops;
	target_custom_ops = Field(target_custom_ops,1);
    };

    mem_data = ((char *) Bigarray_val(memv)->data) + off;
    mem_end = mem_data + Bigarray_val(memv)->dim[0];

    /* note: the color of the new values does not matter because bigarrays
       are ignored by the GC. So we pass 0 (white).
    */
    
    code = netsys_init_value_1(stat_tab, stat_queue, mem_data, mem_end, orig, 
			       (cflags & 1) ? 2 : 0, 
			       (cflags & 2) ? 1 : 0, 
			       (cflags & 4) ? 2 : ((cflags & 32) ? 1 : 0),
                               (cflags & 16) ? 1 : 0,
			       cflags & 8,
			       targetaddr, ops, cc, 0,
			       &start_offset, &bytelen);
#ifdef DEBUG
    fprintf(stderr, "Done netsys_init_value code=%d\n", code);
#endif
    if (code != 0) goto exit;

    unprep_stat_tab();
    unprep_stat_queue();

    while (ops != NULL) {
	next_ops = ops->next;
	caml_stat_free(ops->name);
	caml_stat_free(ops);
	ops = next_ops;
    };
    
    r = caml_alloc_small(2,0);
    Field(r,0) = Val_long(start_offset + off);
    Field(r,1) = Val_long(bytelen);

    return r;

 exit:
    unprep_stat_queue();
    unprep_stat_tab();

    switch(code) {
    case (-1):
	unix_error(errno, "netsys_init_value", Nothing);
    case (-2):
#ifdef DEBUG
        fprintf(stderr, "Lib err\n");
#endif
	caml_failwith("Netsys_mem.init_value: Library error");
    case (-4):
	caml_raise_constant(*caml_named_value("Netsys_mem.Out_of_space"));
    default:
	caml_failwith("Netsys_mem.init_value: Unknown error");
    }
}


value netsys_init_value_bc(value * argv, int argn)
{
    return
	netsys_init_value(argv[0], argv[1], argv[2], argv[3],
			  argv[4], argv[5], argv[6]);
}


/* The following is inspired by intern.c in the ocaml runtime.
   We first count how many words we are going to need, then we
   allocate these at once, and then fill them as in init_value.

   So what we do here is to allocate a single string, and to overwrite
   this memory region with many values. This is allowed by the runtime,
   provided we do not leave any unused byte behind, and we put the
   right GC color into all the values (the same color the string got).

   There is one caveat: For 32 bit platforms, there is no official
   way of allocating more than 4M words at once, so we have to
   fall back to undocumented low-level functions (same as in
   intern.c)

*/

value netsys_copy_value(value flags, value orig)
{
    int code;
    int cflags;
    intnat start_offset, bytelen;
    mlsize_t wosize;
    char *dest, *dest_end, *extra_block, *extra_block_end;
    int color;
    struct named_custom_ops bigarray_ops;
    struct named_custom_ops caml_int32_ops;
    struct named_custom_ops caml_int64_ops;
    struct named_custom_ops caml_nativeint_ops;
    CAMLparam2(orig,flags);
    CAMLlocal1(block);

    /* First test on trivial cases: */
    if (Is_long(orig) || Wosize_val(orig) == 0) {
	CAMLreturn(orig);
    };

    code = prep_stat_tab();
    if (code != 0) goto exit;

    code = prep_stat_queue();
    if (code != 0) goto exit;

    cflags = caml_convert_flag_list(flags, init_value_flags);

    /* fprintf (stderr, "counting\n"); */

    /* Count only! */
    code = netsys_init_value_1(stat_tab, stat_queue, NULL, NULL, orig, 
			       (cflags & 1) ? 1 : 0,  /* enable_bigarrays */
			       (cflags & 2) ? 1 : 0,  /* enable_customs */
			       1, /* enable_atoms */
                               0, /* enable_cc */
			       1, /* simulate */
			       NULL, NULL, 0, 0, &start_offset, &bytelen);
    if (code != 0) goto exit;

    /* fprintf (stderr, "done counting bytelen=%ld\n", bytelen); */

    /* set up the custom ops. We always set this, because we assume that
       the values in [orig] are not trustworthy
    */
    bigarray_ops.name = BIGARRAY_MARSHAL_ID;
    bigarray_ops.ops = 
	Custom_ops_val(caml_ba_alloc_dims(CAML_BA_UINT8 | CAML_BA_C_LAYOUT, 
					   1, NULL, 1));
    bigarray_ops.next = &caml_int32_ops;

    caml_int32_ops.name = "_i";
    caml_int32_ops.ops = Custom_ops_val(caml_copy_int32(0));
    caml_int32_ops.next = &caml_int64_ops;

    caml_int64_ops.name = "_j";
    caml_int64_ops.ops = Custom_ops_val(caml_copy_int64(0));
    caml_int64_ops.next = &caml_nativeint_ops;

    caml_nativeint_ops.name = "_n";
    caml_nativeint_ops.ops = Custom_ops_val(caml_copy_nativeint(0));
    caml_nativeint_ops.next = NULL;

    /* alloc */

    extra_block = NULL;
    extra_block_end = NULL;

    /* shamelessly copied from intern.c */
    wosize = Wosize_bhsize(bytelen);
    /* fprintf (stderr, "wosize=%ld\n", wosize); */
    if (wosize > Max_wosize) {
	/* Round desired size up to next page */
	asize_t request = ((bytelen + Page_size - 1) >> Page_log) << Page_log;
	extra_block = caml_alloc_for_heap(request);
	if (extra_block == NULL) caml_raise_out_of_memory();
	extra_block_end = extra_block + request;
	color = caml_allocation_color(extra_block);
	dest = extra_block;
	dest_end = dest + bytelen;
	block = Val_hp(extra_block);
    } else {
	if (wosize <= Max_young_wosize){
	    block = caml_alloc_small (wosize, String_tag);
	}else{
	    block = caml_alloc_shr (wosize, String_tag);
	}
	color = Color_hd(Hd_val(block));
	dest = (char *) Hp_val(block);
	dest_end = dest + bytelen;
    }

    /* fprintf (stderr, "done alloc\n"); */

    /* Now it's the real copy */

    netsys_htab_clear(stat_tab);
    netsys_queue_clear(stat_queue);
    
    code = netsys_init_value_1(stat_tab, stat_queue, dest, dest_end, orig, 
			       (cflags & 1) ? 1 : 0,  /* enable_bigarrays */
			       (cflags & 2) ? 1 : 0,  /* enable_customs */
			       1, /* enable_atoms */
                               0, /* enable_cc */
			       0, /* simulate */
			       dest, &bigarray_ops, 0, color,
			       &start_offset, &bytelen);
    if (code != 0) goto exit;

    unprep_stat_tab();
    unprep_stat_queue();

    /* fprintf (stderr, "done copied\n"); */

    /* Also from intern.c: */
    if (extra_block != NULL) {
	if (dest_end < extra_block_end){
	    /* caml_make_free_blocks is not exported... So do it on
	       our own: put a dummy header into the gap.
	    */
	    int sz = extra_block_end - dest_end;
	    * ((header_t *) dest_end) = 
		(header_t) (Wosize_bhsize (sz)) << 10;
	};
	caml_allocated_words +=
	    Wsize_bsize ((char *) dest_end - extra_block);
	caml_add_to_heap(extra_block);
    };

    /*
    { 
	int k;
	intnat *m;
	m = ((intnat *) block)-1;
	for (k=0; k<=wosize; k++) {
	    fprintf(stderr, "k=%d: %016Lx\n", k, m[k]);
	};
    };
    */

    CAMLreturn(block);

 exit:
    unprep_stat_tab();
    unprep_stat_queue();

    switch(code) {
    case (-1):
	unix_error(errno, "netsys_copy_value", Nothing);
    case (-2):
	caml_failwith("Netsys_mem.copy_value: Library error");
    case (-4):
	caml_raise_constant(*caml_named_value("Netsys_mem.Out_of_space"));
    default:
	caml_failwith("Netsys_mem.copy_value: Unknown error");
    }
}


value netsys_get_custom_ops (value v) 
{
    struct custom_operations *custom_ops;
    CAMLparam1(v);
    CAMLlocal1(r);

    if (Is_block(v) && Tag_val(v) == Custom_tag) {
	custom_ops = Custom_ops_val(v);
	r = caml_alloc_small(2,0);
	Field(r,0) = caml_copy_string(custom_ops->identifier);
	Field(r,1) = caml_copy_nativeint((intnat) custom_ops);
    }
    else 
	caml_invalid_argument("Netsys_mem.get_custom_ops");

    CAMLreturn(r);
}


value netsys_is_bigarray(value v) {
    struct custom_operations *custom_ops;
    CAMLparam1(v);
    CAMLlocal1(r);

    if (Is_block(v) && Tag_val(v) == Custom_tag) {
	custom_ops = Custom_ops_val(v);
        r = Val_bool(strcmp(custom_ops->identifier, BIGARRAY_MARSHAL_ID)==0);
    }
    else
        r = Val_bool(0);

    CAMLreturn(r);
}
