(* $Id$ *)

(** Bigarrays as memory buffers *)

open Netsys_types

type memory = 
    Netsys_types.memory
  (** We consider 1-dimensional bigarrays of chars as memory buffers.
      They have the useful property that the garbage collector cannot
      relocate them, i.e. the address is fixed. Also, one can mmap
      a file, and connect the bigarray with shared memory.
   *)

(** {2 General} *)

val blit_memory_to_bytes : memory -> int -> Bytes.t -> int -> int -> unit
  (** [blit_memory_to_bytes src srcoff dst dstoff len] copies [len] characters
      from buffer [src], starting at character number [srcoff], to
      string [dst], starting at character number [dstoff]

      Raise [Invalid_argument] if [srcoff] and [len] do not
      designate a valid subbuffer of [src], or if [dstoff] and [len]
      do not designate a valid substring of [dst]. *)

val blit_memory_to_string : memory -> int -> Bytes.t -> int -> int -> unit
  DEPRECATED("Use blit_memory_to_bytes instead.")

external blit_memory_to_bytes_unsafe : 
     memory -> int -> Bytes.t -> int -> int -> unit
     =  "netsys_blit_memory_to_string" NOALLOC
  (** Unsafe version *)

external blit_memory_to_string_unsafe : 
     memory -> int -> Bytes.t -> int -> int -> unit
     =  "netsys_blit_memory_to_string" NOALLOC
  DEPRECATED("Use blit_memory_to_bytes_unsafe instead.")

val blit_bytes_to_memory : Bytes.t -> int -> memory ->  int -> int -> unit
  (** [blit_bytes_to_memory src srcoff dst dstoff len] copies [len] characters
      from string [src], starting at character number [srcoff], to
      buffer [dst], starting at character number [dstoff]

      Raise [Invalid_argument] if [srcoff] and [len] do not
      designate a valid substring of [src], or if [dstoff] and [len]
      do not designate a valid subbuffer of [dst]. *)

external blit_bytes_to_memory_unsafe : 
           Bytes.t -> int -> memory ->  int -> int -> unit
  = "netsys_blit_string_to_memory" NOALLOC
  (** Unsafe version *)

val blit_string_to_memory : string -> int -> memory -> int -> int -> unit
  (** [blit_string_to_memory src srcoff dst dstoff len]: A version for
      immutable strings *)

external blit_string_to_memory_unsafe : 
           string -> int -> memory ->  int -> int -> unit
  = "netsys_blit_string_to_memory" NOALLOC
  (** Unsafe version *)

val memory_of_bytes : Bytes.t -> memory
  (** Return a new bigarray as a copy of the string *)

val memory_of_string : string -> memory
  (** Return a new bigarray as a copy of the string *)

val bytes_of_memory : memory -> Bytes.t
  (** Return a new string as a copy of the bigarray *)

val string_of_memory : memory -> string
  (** Return a new string as a copy of the bigarray *)

val memory_address : memory -> nativeint
  (** Returns the start address of the buffer *)

val memory_of_bigarray : ('a, 'b, 'c) Bigarray.Genarray.t -> memory
val memory_of_bigarray_1 : ('a, 'b, 'c) Bigarray.Array1.t -> memory
val memory_of_bigarray_2 : ('a, 'b, 'c) Bigarray.Array2.t -> memory
val memory_of_bigarray_3 : ('a, 'b, 'c) Bigarray.Array3.t -> memory
  (** These functions return an arbitrary bigarray as [memory].

      Due to a bug in the OCaml runtime, this is for now limited to
      arrays of up to 2G size (in bytes). (The bug exists at least
      up to OCaml-3.12.1.)
   *)

(** {2 Allocation and memory-mapping} *)

val getpagesize : unit -> int
  (** Returns the size of a page as reported by [sysconf].

      On many systems, a page has 4096 bytes, but this cannot be relied
      upon.

      This function is only available if the system has [sysconf].
   *)

val pagesize : int
  (** The best guess at the page size *)

val alloc_memory_pages : ?addr:nativeint -> ?exec:bool -> int -> memory
  (** Allocates memory in units of pages. The memory buffer will start
      on a page boundary.

      The passed int is the requested number of {b bytes}. The size of
      the buffer is rounded up so a whole number of pages is allocated.

      Optionally, one can request a certain address [addr] (which must
      be a multiple of the page size). There is, however, no guarantee
      that this wish can be fulfilled. In any way, one should check with
      [memory_address] what the start address really is.

      If [exec], the memory region is marked as executable.

      This function is only available if the system has [sysconf], [mmap],
      and allows to allocate anonymous memory with [mmap] (outside POSIX
      but common).
   *)

val alloc_aligned_memory : int -> int -> memory
  (** [alloc_aligned_memory alignment size]: Allocates a buffer of [size]
      whose start address is a multiple of [alignment]. The [alignment]
      must be a power of two, and at least [Sys.word_size/8].

      Aligned memory can be useful for ensuring that the whole memory
      block is in the same cache line. A cache line typically has
      64 or 128 bytes - but this is very platform-specific. (Linux:
      look at [/proc/cpuinfo].)

      This function is only available if the system has [posix_memalign].
   *)

val memory_map_file : Unix.file_descr -> 
                      ?pos:int64 -> 
                      ?addr:nativeint ->
                       bool -> int -> memory
  (** [memory_map_file fd shared size]: Maps [size] bytes of the file
      [fd] into memory, and returns the memory buffer like
      [Bigarray.Array1.map_file]. [pos] and [shared] have the same
      meaning as there. In [addr] one can suggest a start address.
      There is, however, no guarantee that this wish can be fulfilled.
   *)

val memory_unmap_file : memory -> unit
  (** Unmaps the file. The memory block must have been allocated
      with [memory_map_file] or with [Bigarray.Array1.map_file].

      {b Note that the data pointer of the bigarray is set to NULL,
      and that any further access of the array will trigger a
      segmentation violation!} The intention of this function is to
      control when the file mapping is removed. Normally, this is
      done first when the GC finalizer is run.

      It is required that there are no subarrays at the time of
      calling this function. (If so, the function does nothing.)
   *)

val zero_pages : memory -> int -> int -> unit
  (** [zero_pages m pos len]: If possible, the memory pages in the
      range [pos] to [pos+len-1] of [m] are allocated again, so that
      they replace the previous pages.

      It is required that the start address of the range is a
      multiple of the page size, and the [len] is a multiple of
      the page size. Fails with [Invalid_argument] if the requirements
      are not met, or the function is otherwise unavailable.

      Calling [zero_pages] is sometimes an optimization when old
      memory pages can be dropped, and when the alternative of
      overwriting these pages would imply a copy-on-write operation.
   *)

val grab : nativeint -> int -> memory
  (** [grab addr len]: Interprets the address range from [addr] to
      [addr+len-1] as [memory] bigarray.

      This function does not allocate! It assumes that the given
      address range points to valid memory.
   *)


(** {2 Interpreting memory as values} *)

val as_value : memory -> int -> 'a
  (** [as_value mem offset]: Returns a pointer to [mem+offset]. There
      must be a valid boxed value at this address (i.e. at 
      the word preceding [mem+offset] there must be a valid block
      header, followed by a valid value of the right type). However,
      this is not checked:

      {b This is an unsafe function that may crash the program if used
      in the wrong way!}

      It is possible that the memory block is deallocated while the
      returned value still exists. Any attempt to access the value will
      result into undefined behavior (anything from funny results
      to crashes may happen).

      Some Ocaml primitives might not work on the returned values
      (polymorphic equality, marshalling, hashing) unless 
      {!Netsys_mem.value_area} is called for the memory block.
   *)

val as_obj : memory -> int -> Obj.t
  (** Same as [as_value] but returns the value as [Obj.t] *)

val value_area : memory -> unit
  (** Marks the memory block as value area. This enables that the
      value primitives (polymorphic equality, marshalling, hashing)
      return meaningful results. The memory area is automatically
      unmarked when the finaliser for the memory block is run.

      Be careful when marking sub arrays.

      This function is first available since O'Caml 3.11.
   *)

val obj_address : Obj.t -> nativeint
val hdr_address : Obj.t -> nativeint
  (** These two functions return the address of the [Obj.t] and the
      address of the header of the [Obj.t], respectively.

      Note that this can only be relied upon if the input object
      cannot be moved around by the garbage collector!
   *)

val cmp_bytes : Bytes.t -> Bytes.t -> int
  (** Compares two strings like [String.compare]. This also works
      when the strings reside outside the O'Caml heap, e.g. in a
      [memory] block.
   *)

val cmp_string : string -> string -> int
  (** A version for immutable strings *)


exception Out_of_space

val init_header : memory -> int -> int -> int -> unit
  (** [init_header mem offset tag size]: Initializes the word at
      [mem+offset] as an Ocaml value header with the given [tag]
      and the given [size] (in words). The GC color is always set
      to "white".
   *)

val init_string : memory -> int -> int -> (int * int)
  (** [let voffset, bytelen = init_string mem offset len]: 
      Initializes the memory at [offset]
      and following bytes as Ocaml string with length [len].
      Returns in [voffset] the offset where the value starts
      (i.e. [offset] plus one word), and in [bytelen] the number
      of bytes used in [mem]. 

      [offset] must be a multiple of the word size in bytes.

      The string can be accessed with
      {[ let s = (as_value mem voffset : string) ]}

      The function is useful for initializing shared memory as string
      so that several processes can directly access the string.

      The string has the GC color [White].

      Raises [Out_of_space] if the memory block is too small.
   *)

val init_string_bytelen : int -> int
  (** Returns [bytelen] if [init_string] was called with the passed
      [len].
   *)


val init_array : memory -> int -> int -> (int * int)
  (** [let voffset, bytelen = init_array mem offset size]: 
      Initializes the memory at [offset]
      and following bytes as Ocaml array with [size] elements.
      Returns in [voffset] the offset where the value starts
      (i.e. [offset] plus one word), and in [bytelen] the number
      of bytes used in [mem]. 

      The array cannot be used as float array.

      [offset] must be a multiple of the word size in bytes.

      The array can be accessed with
      {[ let a = (as_value mem voffset : _ array) ]}

      The elements of the array have a value but it might not be
      valid for the element type of the array. Because of this, it
      is unwise to access the elements before setting them for the
      first time.

      The array has the GC color [White].

      Raises [Out_of_space] if the memory block is too small.
   *)

val init_float_array : memory -> int -> int -> (int * int)
  (** Same for arrays of floats *)

val init_array_bytelen : int -> int
  (** Returns [bytelen] if [init_array] was called with the passed
      [size].
   *)

val init_float_array_bytelen : int -> int
  (** Same for arrays of floats *)

type custom_ops = nativeint

type init_value_flag = 
  | Copy_bigarray
  | Copy_custom_int
  | Copy_atom
  | Copy_simulate
  | Copy_conditionally
  | Keep_atom

val init_value : 
      ?targetaddr:nativeint -> 
      ?target_custom_ops:(string * custom_ops) list ->
      ?cc:(nativeint * nativeint) list ->
      memory -> int -> 'a -> init_value_flag list -> (int * int)
  (** [let voffset, bytelen = init_value mem offset v flags]:
      Initializes the memory at [offset] and following bytes as
      copy of the boxed value [v]. 
      Returns in [voffset] the offset where the value starts
      (i.e. [offset] plus one word), and in [bytelen] the number
      of bytes used in [mem]. 

      The copied value can then be accessed with
      {[ let v' = (as_value mem voffset : 'a) ]}

      [offset] must be a multiple of the word size in bytes.

      The input value [v] must be heap-allocated. Also, a number of
      restrictions and caveats apply:
      - Objects, closures, and lazy values are not supported
      - Bigarrays are only supported if the [Copy_bigarray] flag
        is given. In this case, a copy of the bigarray is also made
        and appended to the value copy (i.e. it is also placed into
        the buffer [mem]).
      - Abstract and custom values need to be enabled. For
        [int32], [int64], and [nativeint] the flag [Copy_custom_int]
        enables copying, and for bigarrays the flag [Copy_bigarray].
        Generally, there is a function pointer in such data blocks which
        might be invalid when the memory buffer is loaded into a 
        different executable. This specific problem can be fixed
        by passing [target_custom_ops] with the right pointers.
      - Atoms (i.e. zero-sized blocks such as empty arrays) are only
        supported if the [Copy_atom] or [Keep_atom] flags are present,
        otherwise the function fails. [Keep_atom] means here to keep
        atoms as-is. This is correct, but also keeps references to
        the atom definitions which live outside [mem]. [Copy_atom] means to
        create a copy of the atom as a zero-sized block outside the
        atom table. This way the value in [mem] is self-contained,
        but this unfortunately breaks some assumptions of the
        OCaml code generator. In particular, comparisons like
        [if array=[| |] then...] may yield wrong results.
      - The input value may reside outside the Ocaml heap. This may break
        badly written C wrappers that do not use abstract or custom
        tags to mark foreign data.

      The function raises [Out_of_space] if the memory block is too small.
      Cyclic input values are supported, and value sharing is kept intact.

      If the [Copy_simulate] flag is given, [mem] is not modified.
      In simulation mode, it is pretended that [mem] is as large
      as necessary to hold the value, no matter how large [mem] really
      is. The returned values [voffset] and [bytelen] reflect how much
      of [mem] would have been used.

      If the [targetaddr] argument is passed, it is assumed that the
      memory block is mapped at this address and not at the address it
      is really mapped. This is useful for preparing memory that is going
      to be mapped at a different address than it is right now.

      The new value has the GC color [White].

      If bigarrays are copied, the copy also includes the data part.
      The data part is directly following the bigarray block, and is
      represented in a special implementation-defined way.

      If the [Copy_conditionally] flag is set, the condition [cc] is
      evaluated for every block, and only if [cc] returns true, the block
      is copied. [cc] is a list of addresses [(start,end)], and a block
      is not copied if its address lies in any of these address ranges.
      Otherwise the block is copied. As an exception of the foregoing,
      the first block (i.e. [v]) is always copied.
   *)

val get_custom_ops : 'a -> (string * custom_ops)
  (** Returns custom ops for a sample value (or [Invalid_argument]) *)

val copy_value : init_value_flag list -> 'a -> 'a
  (** [copy_value flags v]: Creates a deep copy of [v] and returns it.
      The copy is allocated in the normal Ocaml heap.

      Restrictions:
      - Objects, closures, and lazy values are not supported (FIXME)
      - Bigarrays are only supported if the [Copy_bigarray] flag
        is given. In this case, a copy of bigarrays are also made,
        and placed into additional buffers obtained via [stat_alloc].
      - Abstract and custom values need to be enabled. For
        [int32], [int64], and [nativeint] the flag [Copy_custom_int]
        enables copying, and for bigarrays the flag [Copy_bigarray].
      - Atoms are automatically fixed. [Copy_atoms] is ignored.

      Cyclic input values are supported. [Copy_simulate] is ignored.
   *)

type color = White | Gray | Blue | Black
    (** GC colors *)

val color : Obj.t -> color
  (** Return the GC color *)

val set_color : Obj.t -> color -> unit
  (** Set the GC color *)

val is_bigarray : Obj.t -> bool
  (** Checks whether the objects ia actually a bigarray *)


(** {2 I/O using [memory] as buffers} *)

val mem_read : Unix.file_descr -> memory -> int -> int -> int
  (** A version of [Unix.read] that uses a [memory] buffer.
     Some OS allow faster I/O when [memory] is page-aligned
     (see [alloc_memory_pages]). Also, a copy in the stub function
     can be avoided. Both effects can result in a considerable speedup.
   *)

val mem_write : Unix.file_descr -> memory -> int -> int -> int
  (** A version of [Unix.single_write] that uses a [memory] buffer. *)

val mem_recv : Unix.file_descr -> memory -> int -> int -> Unix.msg_flag list ->
                 int
val mem_send : Unix.file_descr -> memory -> int -> int -> Unix.msg_flag list ->
                  int
  (** Versions of [Unix.recv], and [Unix.send]
      using [memory] buffers.
   *)
 (* N.B. recvfrom, sendto missing because of difficulties accessing sockaddr
    from C
  *)

(** {2 Buffer pools} *)

type memory_pool
  (** A pool of [memory] blocks that are all the same size and page-aligned
      (if the OS supports this). The pool tries to bundle memory allocations
      so that not for every block a system call is required. This reduces
      the number of system calls, and the number of entries in the process
      page table. Also, unused blocks are automatically returned to the
      pool.
   *)

val create_pool : int -> memory_pool
  (** Create a new pool. The argument is the size of the memory blocks
      (must be a multiple of the page size) 
   *)

val pool_alloc_memory : memory_pool -> memory
  (** [let m = pool_alloc_memory p]: 
      Gets a memory block [m] from the pool [p]. If required, new blocks are 
      automatically allocated and added to the pool. This function is
      thread-safe.

      The memory block is automatically garbage-collected.
   *)

val pool_alloc_memory2 : memory_pool -> (memory * (unit->unit))
  (** [let m, free = pool_alloc_memory2 p]: 
      Gets a memory block [m] from the pool [p] like [pool_alloc_memory].
      This function also returns the function [free] marking the
      block as free again. The block can then be immediately recycled
      for another use.

      If [free] is not called, the block [m] is first recycled when it
      is not referenced any more (like in [pool_alloc_memory]).
   *)

val pool_reclaim : memory_pool -> unit
  (** Reclaim as much memory as possible *)
  
val pool_block_size : memory_pool -> int
  (** Returns the size of the memory blocks in bytes *)

val default_block_size : int
  (** The default block size, normally 64 K (or better, 16 times the
      page size)
   *)

val default_pool : memory_pool
  (** The default pool with the default block size. This pool is used
      by Ocamlnet itself as much as possible
   *)

val small_block_size : int
  (** The block size of [small_pool], normally 4K (or better, the
      page size)
   *)

val small_pool : memory_pool
  (** Another standard pool where the blocks are smaller than in
      [default_pool].
   *)

val pool_report : memory_pool -> string
  (** Returns a report describing the memory allocation in the pool *)
