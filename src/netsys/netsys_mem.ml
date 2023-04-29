(* $Id$ *)

open Netsys_types
open Printf

type memory = 
    (char,Bigarray.int8_unsigned_elt,Bigarray.c_layout) Bigarray.Array1.t

external blit_memory_to_string_unsafe :
           memory -> int -> Bytes.t -> int -> int -> unit
  = "netsys_blit_memory_to_string" NOALLOC

external blit_memory_to_bytes_unsafe :
           memory -> int -> Bytes.t -> int -> int -> unit
  = "netsys_blit_memory_to_string" NOALLOC

external blit_string_to_memory_unsafe : 
           string -> int -> memory ->  int -> int -> unit
  = "netsys_blit_string_to_memory" NOALLOC

external blit_bytes_to_memory_unsafe : 
           Bytes.t -> int -> memory ->  int -> int -> unit
  = "netsys_blit_string_to_memory" NOALLOC

let blit_memory_to_bytes mem memoff s soff len =
  let memlen = Bigarray.Array1.dim mem in
  let slen = Bytes.length s in
  if len < 0 || memoff < 0 || memoff > memlen - len || 
     soff < 0 || soff > slen - len 
  then
    invalid_arg "Netsys_mem.blit_memory_to_bytes";
  blit_memory_to_bytes_unsafe mem memoff s soff len

let blit_memory_to_string = blit_memory_to_bytes

let blit_string_to_memory s soff mem memoff len =
  let memlen = Bigarray.Array1.dim mem in
  let slen = String.length s in
  if len < 0 || memoff < 0 || memoff > memlen - len || 
     soff < 0 || soff > slen - len 
  then
    invalid_arg "Netsys_mem.blit_string_to_memory";
  blit_string_to_memory_unsafe s soff mem memoff len

let blit_bytes_to_memory s soff mem memoff len =
  blit_string_to_memory (Bytes.unsafe_to_string s) soff mem memoff len

let memory_of_string s =
  let n = String.length s in
  let m = Bigarray.Array1.create Bigarray.char Bigarray.c_layout n in
  blit_string_to_memory s 0 m 0 n;
  m

let memory_of_bytes s =
  memory_of_string (Bytes.unsafe_to_string s)

let bytes_of_memory m =
  let n = Bigarray.Array1.dim m in
  let s = Bytes.create n in
  blit_memory_to_bytes m 0 s 0 n;
  s

let string_of_memory m =
  Bytes.unsafe_to_string (bytes_of_memory m)

external memory_address : memory -> nativeint
  = "netsys_memory_address"

external reshape : 'a -> memory = "netsys_reshape"
  (* 'a = any bigarray *)

let memory_of_bigarray b = reshape b
let memory_of_bigarray_1 b = reshape b
let memory_of_bigarray_2 b = reshape b
let memory_of_bigarray_3 b = reshape b

external getpagesize : unit -> int
  = "netsys_getpagesize"

let pagesize =
  try getpagesize()
  with Invalid_argument _ -> 4096

external netsys_alloc_memory_pages : nativeint -> int -> bool -> memory
  = "netsys_alloc_memory_pages"

let alloc_memory_pages ?(addr=0n) ?(exec=false) len =
  netsys_alloc_memory_pages addr len exec

external alloc_aligned_memory : int -> int -> memory
  = "netsys_alloc_aligned_memory"

external netsys_map_file : 
           Unix.file_descr -> int64 -> nativeint -> bool -> int -> memory
  = "netsys_map_file"

let memory_map_file fd ?(pos=0L) ?(addr=0n) shared size =
  netsys_map_file fd pos addr shared size

external memory_unmap_file : memory -> unit
  = "netsys_memory_unmap_file"

external netsys_zero_pages : memory -> int -> int -> unit
  = "netsys_zero_pages"

let zero_pages mem pos len =
  let memlen = Bigarray.Array1.dim mem in
  if len < 0 || pos < 0 || pos > memlen - len then
    invalid_arg "Netsys_mem.zero_pages (index out of range)";
  netsys_zero_pages mem pos len

external grab : nativeint -> int -> memory
  = "netsys_grab"

external as_value : memory -> int -> 'a
  = "netsys_as_value"

let as_obj mem offs = Obj.repr(as_value mem offs)

external netsys_value_area_add : memory -> unit 
  = "netsys_value_area_add"

external netsys_value_area_remove : memory -> unit 
  = "netsys_value_area_remove"

let value_area m =
  netsys_value_area_add m;
  Gc.finalise netsys_value_area_remove m;
  ()

external obj_address : Obj.t -> nativeint
  = "netsys_obj_address"

external hdr_address : Obj.t -> nativeint
  = "netsys_hdr_address"

external init_header : memory -> int -> int -> int -> unit
  = "netsys_init_header"

external cmp_bytes : Bytes.t -> Bytes.t -> int
  = "netsys_cmp_string"

external cmp_string : string -> string -> int
  = "netsys_cmp_string"

external netsys_init_string : memory -> int -> int -> unit
  = "netsys_init_string"

let init_string_bytelen len =
  let ws = Sys.word_size / 8 in  (* word size in bytes *)
  ((len + ws) / ws + 1) * ws
  

exception Out_of_space

let _ = 
  Callback.register_exception "Netsys_mem.Out_of_space" Out_of_space



let init_string mem offset len =
  let ws = Sys.word_size / 8 in  (* word size in bytes *)
  let memlen = Bigarray.Array1.dim mem in
  if offset < 0 || len < 0 then
    invalid_arg "Netsys_mem.init_string";
  let blen = init_string_bytelen len in
  if blen > memlen - offset then
    raise Out_of_space;
  netsys_init_string mem offset len;
  (offset+ws, blen)


let init_array_bytelen size =
  let ws = Sys.word_size / 8 in  (* word size in bytes *)
  (size + 1) * ws
  

let init_array mem offset size =
  let ws = Sys.word_size / 8 in  (* word size in bytes *)
  let memlen = Bigarray.Array1.dim mem in
  if offset < 0 || size < 0 then
    invalid_arg "Netsys_mem.init_array";
  let blen = init_array_bytelen size in
  if blen > memlen - offset then
    raise Out_of_space;
  init_header mem offset 0 size;
  Bigarray.Array1.fill (Bigarray.Array1.sub mem (offset+ws) (size*ws)) '\001';
  (offset+ws, blen)


let init_float_array_bytelen size =
  let ws = Sys.word_size / 8 in  (* word size in bytes *)
  if ws = 4 then
    (2*size + 1) * ws
  else
    (size+1) * ws


let init_float_array mem offset size =
  let ws = Sys.word_size / 8 in  (* word size in bytes *)
  let memlen = Bigarray.Array1.dim mem in
  if offset < 0 || size < 0 then
    invalid_arg "Netsys_mem.init_array";
  let blen = init_float_array_bytelen size in
  if blen > memlen - offset then
    raise Out_of_space;
  init_header mem offset Obj.double_array_tag size;
  Bigarray.Array1.fill (Bigarray.Array1.sub mem (offset+ws) (size*ws)) '\001';
  (offset+ws, blen)


type init_value_flag =
  | Copy_bigarray
  | Copy_custom_int
  | Copy_atom
  | Copy_simulate
  | Copy_conditionally
  | Keep_atom

type custom_ops = nativeint

external netsys_init_value : 
  memory -> int -> 'a -> init_value_flag list -> nativeint -> 
  (string * custom_ops) list -> ((int*int) list) -> (int * int)
  = "netsys_init_value_bc" "netsys_init_value"

let init_value ?targetaddr ?(target_custom_ops=[]) ?(cc=[])
               mem offset v flags =
  let taddr = 
    match targetaddr with
      | None ->
	  memory_address mem
      | Some a ->
	  a in
  let cc =
    List.map
      (fun (s,e) ->
         ( Nativeint.to_int (Nativeint.shift_right s 1),
           Nativeint.to_int (Nativeint.shift_right e 1)
         )
      ) 
      cc in
  netsys_init_value mem offset v flags taddr target_custom_ops cc

external get_custom_ops : 'a -> string * custom_ops
  = "netsys_get_custom_ops"

external copy_value : init_value_flag list -> 'a -> 'a
  = "netsys_copy_value"

type color = White | Gray | Blue | Black

external color : Obj.t -> color
  = "netsys_color"

external set_color : Obj.t -> color -> unit
  = "netsys_set_color"

external is_bigarray : Obj.t -> bool
  = "netsys_is_bigarray"

external netsys_mem_read : Unix.file_descr -> memory -> int -> int -> int
  = "netsys_mem_read"

external netsys_mem_write : Unix.file_descr -> memory -> int -> int -> int
  = "netsys_mem_write"

let mem_read fd mem off len =
  if len < 0 || off < 0 || len > Bigarray.Array1.dim mem - off then
    invalid_arg "Netsys_mem.mem_read";
  netsys_mem_read fd mem off len

let mem_write fd mem off len =
  if len < 0 || off < 0 || len > Bigarray.Array1.dim mem - off then
    invalid_arg "Netsys_mem.mem_write";
  netsys_mem_write fd mem off len

external netsys_mem_recv : 
  Unix.file_descr -> memory -> int -> int -> Unix.msg_flag list -> int
  = "netsys_mem_recv"

(*
external netsys_mem_recvfrom :
  Unix.file_descr -> memory -> int -> int -> Unix.msg_flag list ->
  int * Unix.sockaddr
  = "netsys_mem_recvfrom"
 *)

external netsys_mem_send :
  Unix.file_descr -> memory -> int -> int -> Unix.msg_flag list -> int
  = "netsys_mem_send"

(*
external netsys_mem_sendto :
  Unix.file_descr -> memory -> int -> int -> Unix.msg_flag list -> 
  Unix.sockaddr -> int
  = "netsys_mem_sendto" "netsys_mem_sendto_native"
 *)

let mem_recv fd mem off len flags =
  if len < 0 || off < 0 || len > Bigarray.Array1.dim mem - off then
    invalid_arg "Netsys_mem.mem_recv";
  netsys_mem_recv fd mem off len flags

(*
let mem_recvfrom fd mem off len flags =
  if len < 0 || off < 0 || len > Bigarray.Array1.dim mem - off then
    invalid_arg "Netsys_mem.mem_recvfrom";
  netsys_mem_recvfrom fd mem off len flags
 *)

let mem_send fd mem off len flags =
  if len < 0 || off < 0 || len > Bigarray.Array1.dim mem - off then
    invalid_arg "Netsys_mem.mem_send";
  netsys_mem_send fd mem off len flags

(*
let mem_sendto fd mem off len flags addr =
  if len < 0 || off < 0 || len > Bigarray.Array1.dim mem - off then
    invalid_arg "Netsys_mem.mem_sendto";
  netsys_mem_sendto fd mem off len flags addr
 *)

let min_pool_factor = 4
let max_pool_factor = 8


type bigblock =
    { bb_id : < >;
      mutable bb_use_counter : int;
      mutable bb_mem : memory;
      mutable bb_age : int;
    }

type memory_pool =
    { pool_block_size : int;
      mutable pool_blocks : (int * bigblock * bool ref) list;
      (* The bool is set to [false] if the block is unused *)
      mutable pool_free_blocks : (memory * int * bigblock) list;
      (* The int is the GC age *)
      pool_mutex : Netsys_oothr.mutex;
      mutable pool_factor : int;
      mutable pool_free_age : int;
    }

let create_pool bsize =
  if bsize <= 0 || bsize mod pagesize <> 0 then
    invalid_arg "Netsys_mem.create_pool";
  let m = !Netsys_oothr.provider # create_mutex() in
  { pool_block_size = bsize;
    pool_blocks = [];
    pool_free_blocks = [];
    pool_mutex = m;
    pool_factor = min_pool_factor;
    pool_free_age = 0;
  }

let pool_move_to_free_list p =
  let age = (Gc.quick_stat()).Gc.major_collections in
  let ub, fb =
    List.partition
      (fun (_, _, is_used) -> !is_used)
      p.pool_blocks in
  p.pool_blocks <- ub;
  (* prerr_endline ("Found new free blocks: " ^ string_of_int (List.length fb));*)
  p.pool_free_blocks <- 
    (List.map 
       (fun (k,bb,_) -> 
	  let m =
	    Bigarray.Array1.sub 
	      bb.bb_mem (k * p.pool_block_size) p.pool_block_size in
	  (m, k, bb)
       )
       fb
    ) @ p.pool_free_blocks;
  List.iter
    (fun (_,bb,_) -> 
       bb.bb_use_counter <- bb.bb_use_counter - 1;
       bb.bb_age <- age
    ) 
    fb


(*
let bb_finalise _ =
  prerr_endline "bb_finalise"
 *)

let pool_alloc_blocks p =
  pool_move_to_free_list p;
  if p.pool_free_blocks = [] then (
    let age = (Gc.quick_stat()).Gc.major_collections in
    (* Nothing free, so we have to allocate new blocks: *)
    let bigblock_size = p.pool_factor * p.pool_block_size in
    let bigblock_mem =
      try alloc_memory_pages bigblock_size
      with Invalid_argument _ -> (* OS does not support it... *)
        Bigarray.Array1.create
          Bigarray.char Bigarray.c_layout bigblock_size in
    let bigblock =
      { bb_id = (object end);
	bb_use_counter = 0;
	bb_mem = bigblock_mem;
	bb_age = age;
      } in
    (* Gc.finalise bb_finalise bigblock_mem; *)
    for k = 0 to p.pool_factor - 1 do
      let m =
	Bigarray.Array1.sub 
	  bigblock_mem (k * p.pool_block_size) p.pool_block_size in
      p.pool_free_blocks <- (m, k, bigblock) :: p.pool_free_blocks
    done;
    (* prerr_endline ("alloc blocks: " ^ string_of_int p.pool_factor); *)
    p.pool_factor <- min max_pool_factor (p.pool_factor * 2);
  )
  else
    p.pool_factor <- min_pool_factor

let pool_free_blocks ?(force=false) p =
  let age = (Gc.quick_stat()).Gc.major_collections in
  if force || age > p.pool_free_age then (
    pool_move_to_free_list p;
    let db, fb =
      List.partition
	(fun (_, _, bb) -> 
	   bb.bb_use_counter = 0 && (force || age - bb.bb_age >= 2))
	p.pool_free_blocks in
    (* Sort the free blocks, to achieve that big, filled blocks are preferred
       when new blocks are taken from the free list. So small and quite empty
       blocks are more likely to be given back to the OS.
       - Hopefully this is not too expensive.
     *)
    let fb_sorted =
      List.sort
	(fun (_,_,bb1) (_,_,bb2) ->
	   (* highest use counter first, then oldest *)
	   match bb2.bb_use_counter - bb1.bb_use_counter with
	     | 0 -> Oo.id bb1.bb_id - Oo.id bb2.bb_id
	     | d -> d
	)
	fb in
    p.pool_free_blocks <- fb_sorted;
    p.pool_free_age <- age;
    (* prerr_endline ("pool_free_blocks db=" ^ string_of_int (List.length db))*)
      (* unmap_file is not supported for the "bigblock" approach CHECK *)
  )

let pool_reclaim p =
  pool_free_blocks ~force:true p

let set_false v _ =
  (* prerr_endline "finaliser"; *)
  v := false

let pool_alloc_memory2 p =
  Netsys_oothr.serialize
    p.pool_mutex
    (fun () ->
       let do_free_check = ref true in
       if p.pool_free_blocks = [] then (
	 pool_alloc_blocks p;
	 do_free_check := false
       );
       match p.pool_free_blocks with
	 | (m,k,bb) :: l ->
	     p.pool_free_blocks <- l;
	     bb.bb_use_counter <- bb.bb_use_counter + 1;
	     let is_used = ref true in
	     let free = set_false is_used in  (* avoid referencing m ! *)
	     let free2 = set_false is_used in
	     if !do_free_check && l <> [] then
	       pool_free_blocks p;
	     p.pool_blocks <- (k,bb,is_used) :: p.pool_blocks;
	     Gc.finalise free m;
	     (m,free2)
	 | [] ->
	     assert false
    )
    ()

let pool_alloc_memory p =
  fst(pool_alloc_memory2 p)

let pool_block_size p =
  p.pool_block_size

let default_block_size =
  pagesize * 16

let default_pool =
  create_pool default_block_size

let small_block_size =
  pagesize

let small_pool =
  create_pool small_block_size

let pool_report p =
  let b = Buffer.create 500 in
  bprintf b "POOL GENERAL PARAMETERS:\n\n";
  bprintf b "pool_block_size=%d\n" p.pool_block_size;
  bprintf b "pool_factor=%d\n" p.pool_factor;
  bprintf b "length pool_blocks=%d  (used+prop)\n" (List.length p.pool_blocks);
  bprintf b "length pool_free_blocks=%d\n\n" (List.length p.pool_free_blocks);
  
  let bb_tab = Hashtbl.create 10 in

  let add_bb bb =
    if not (Hashtbl.mem bb_tab bb.bb_id) then (
      let cnt_used = ref 0 in
      let cnt_prop = ref 0 in
      Hashtbl.add bb_tab bb.bb_id (bb, cnt_used, cnt_prop)
    )
  in

  List.iter (fun (_,bb,_) -> add_bb bb) p.pool_blocks;
  List.iter (fun (_,_,bb) -> add_bb bb) p.pool_free_blocks;
  
  List.iter
    (fun (k,bb,is_used) ->
       let (_,cnt_used,cnt_prop) = Hashtbl.find bb_tab bb.bb_id in
       if !is_used then 
	 incr cnt_used
       else
	 incr cnt_prop
    )
    p.pool_blocks;
  
  bprintf b "POOL BY BIGBLOCK:\n\n";
  Hashtbl.iter
    (fun bb_id (bb,cnt_used,cnt_prop) ->
       let size = Bigarray.Array1.dim bb.bb_mem / p.pool_block_size in
       bprintf b "block %d: age=%d size=%d used=%d propagate=%d free=%d\n"
	 (Oo.id bb_id)
	 bb.bb_age
	 size
	 !cnt_used
	 !cnt_prop
	 (size - !cnt_used - !cnt_prop)
    )
    bb_tab;

  Buffer.contents b
