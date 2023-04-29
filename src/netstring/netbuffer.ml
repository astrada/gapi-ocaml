(* $Id$
 * ----------------------------------------------------------------------
 *
 *)

open Netsys_types

type t = 
    { mutable buffer : Bytes.t;
      mutable buffer_length : int;  (* = String.length buffer *)
      mutable length : int;
      create_length : int;
    }

(* To help the garbage collector:
 * The 'buffer' has a minimum length of 31 bytes. This minimum can still
 * be stored in the minor heap.
 * The 'buffer' has a length which is always near a multiple of two. This
 * limits the number of different bucket sizes, and simplifies reallocation
 * of freed memory.
 *)

(* Optimal string length:
 * Every string takes: 1 word for the header, enough words for the 
 * contents + 1 Null byte (for C compatibility).
 * If the buffer grows, it is best to use a new string length such
 * that the number of words is exactly twice as large as for the previous
 * string.
 * n:              length of the previous string in bytes
 * w:              storage size of the previous string in words
 * n':             length of the new string in bytes
 * w' = 2*w:       storage size of the new string in words
 *
 * w = (n+1) / word_length + 1
 *            [it is assumed that (n+1) is always a multiple of word_length]
 *
 * n' = (2*w - 1) * word_length - 1
 *
 * n' = [2 * ( [n+1] / word_length + 1) - 1] * word_length - 1
 *    = ...
 *    = (2*n + 2) + word_length - 1
 *    = 2 * n + word_length + 1
 *
 * n'+1 is again a multiple of word_length:
 * n'+1 = 2*n + 2 + word_length
 *      = 2*(n+1) + word_length
 *      = a multiple of word_length because n+1 is a multiple of word_length
 *)

let word_length = Sys.word_size / 8       (* in bytes *)

let create n =
  let bl = max n 31 in
  { buffer = Bytes.create bl;
    buffer_length = bl;
    length = 0; 
    create_length = n }

let reset b =
  let n = b.create_length in
  let bl = max n 31 in
  b.buffer <- Bytes.create bl;
  b.buffer_length <- bl;
  b.length <- 0

let contents b =
  Bytes.sub_string b.buffer 0 b.length

let to_bytes b =
  Bytes.sub b.buffer 0 b.length

let to_tstring_poly : type s . t -> s Netstring_tstring.tstring_kind -> s =
  fun b kind ->
    match kind with
      | Netstring_tstring.String_kind ->
          contents b
      | Netstring_tstring.Bytes_kind ->
          to_bytes b
      | Netstring_tstring.Memory_kind ->
          let m =
            Bigarray.Array1.create Bigarray.char Bigarray.c_layout b.length in
          Netsys_mem.blit_bytes_to_memory b.buffer 0 m 0 b.length;
          m

let to_tstring : type s . t -> s Netstring_tstring.tstring_kind -> tstring =
  fun b kind ->
    let s = to_tstring_poly b kind in
    match kind with
      | Netstring_tstring.String_kind ->
          `String s
      | Netstring_tstring.Bytes_kind ->
          `Bytes s
      | Netstring_tstring.Memory_kind ->
          `Memory s

let e_get() =
  invalid_arg "Netbuffer.get"

let get b k =
  if k < 0 || k >= b.length then e_get();
  Bytes.unsafe_get b.buffer k
    
let nth = get

let sub_invalid() =
  raise (Invalid_argument "Netbuffer.sub")

let sub_bytes b k n =
  if k < 0 || n < 0 || k > b.length-n then
    sub_invalid();
  Bytes.sub b.buffer k n

let sub b k n =
  if k < 0 || n < 0 || k > b.length-n then
    sub_invalid();
  Bytes.sub_string b.buffer k n

let blit_to_bytes_invalid() =
  raise (Invalid_argument "Netbuffer.blit_to_bytes")

let blit_to_bytes b srcpos dest destpos n =
  if srcpos < 0 || n < 0 || srcpos > b.length-n then
    blit_to_bytes_invalid();
  Bytes.blit b.buffer srcpos dest destpos n

let blit = blit_to_bytes
let blit_to_string = blit_to_bytes

let blit_to_memory b srcpos dest destpos n =
  if srcpos < 0 || n < 0 || srcpos > b.length-n then
    raise (Invalid_argument "Netbuffer.blit_to_memory");
  Netsys_mem.blit_bytes_to_memory b.buffer srcpos dest destpos n

let blit_to_tbuffer b srcpos dest destpos n =
  match dest with
    | `Bytes s
    | `String s ->
        blit_to_bytes b srcpos s destpos n
    | `Memory m ->
        blit_to_memory b srcpos m destpos n
    
let unsafe_buffer b =
  b.buffer

let length b =
  b.length

let alloc_space b n =
  let rec new_size s =
    if s >= n then s else new_size(2*s + word_length + 1)
  in
  let size = min (new_size b.buffer_length) Sys.max_string_length in
  if size < n then
    failwith "Netbuffer: string too large";
  let buffer' = Bytes.create size in
  Bytes.blit b.buffer 0 buffer' 0 b.length;
  b.buffer <- buffer';
  b.buffer_length <- size

let ensure_space b n =
  (* Ensure that there are n bytes space in b *)
  if n > b.buffer_length then
    alloc_space b n

let add_internal blit b s k l =
  ensure_space b (l + b.length);
  blit s k b.buffer b.length l;
  b.length <- b.length + l

let add_substring b s k l =
  if k < 0 || l < 0 || k > String.length s-l then
    invalid_arg "Netbuffer.add_substring";
  add_internal Bytes.blit_string b s k l

let add_sub_string = add_substring

let add_string b s =
  add_substring b s 0 (String.length s)

let add_subbytes b s k l =
  if k < 0 || l < 0 || k > Bytes.length s-l then
    invalid_arg "Netbuffer.add_subbytes";
  add_internal Bytes.blit b s k l

let add_bytes b s =
  add_subbytes b s 0 (Bytes.length s)

let add_submemory b s k l =
  if k < 0 || l < 0 || k > Bigarray.Array1.dim s-l then
    invalid_arg "Netbuffer.add_submemory";
  add_internal Netsys_mem.blit_memory_to_bytes b s k l

let add_sub_memory = add_submemory

let add_subtstring b ts k l =
  match ts with
    | `String s -> add_substring b s k l
    | `Bytes s -> add_subbytes b s k l
    | `Memory s -> add_submemory b s k l

let add_tstring b ts =
  add_subtstring b ts 0 (Netsys_impl_util.tstring_length ts)

let add_subtstring_poly b ops s k l =
  let open Netstring_tstring in
  add_internal ops.blit_to_bytes b s k l

let add_tstring_poly b ops s =
  let open Netstring_tstring in
  add_subtstring_poly b ops s 0 (ops.length s)

let add_buffer b1 b2 =
  add_internal Bytes.blit b1 b2.buffer 0 b2.length

let add_char b c =
  let l = b.length in
  ensure_space b (l+1);
  Bytes.unsafe_set b.buffer l c;
  b.length <- l + 1

let add_char_2 b c1 c2 =
  let l = b.length in
  ensure_space b (l+2);
  Bytes.unsafe_set b.buffer l c1;
  Bytes.unsafe_set b.buffer (l+1) c2;
  b.length <- l + 2

let add_char_4 b c1 c2 c3 c4 =
  let l = b.length in
  ensure_space b (l+4);
  Bytes.unsafe_set b.buffer l c1;
  Bytes.unsafe_set b.buffer (l+1) c2;
  Bytes.unsafe_set b.buffer (l+2) c3;
  Bytes.unsafe_set b.buffer (l+3) c4;
  b.length <- l + 4

let space_for_additions ?len b =
  match len with
      Some l -> 
	ensure_space b (b.length + l);
	l
    | None ->
	ensure_space b (b.length + 1);
	b.buffer_length - b.length
	  
let advance b n =
  let l = b.length + n in
  if n < 0 || l > b.buffer_length then
    invalid_arg "Netbuffer.advance";
  b.length <- l

let add_inplace ?len b f =
  let len' = space_for_additions ?len b in
  let n = f b.buffer b.length len' in
  advance b n;
  n

let area_for_additions ?len b =
  let len' = space_for_additions ?len b in
  (b.buffer, b.length, len')

let insert_internal name blit length b p s k l =
  if p < 0 || p > b.length ||
       k < 0 || l < 0 || k > length s - l
  then
    invalid_arg ("Netbuffer." ^ name);
  ensure_space b (l + b.length);
  Bytes.unsafe_blit b.buffer p b.buffer (p+l) (b.length - p);
  blit s k b.buffer p l;
  b.length <- b.length + l

let insert_substring =
  insert_internal "insert_substring" Bytes.blit_string String.length

let insert_sub_string = insert_substring

let insert_string b p s =
  insert_internal
    "insert_string" Bytes.blit_string String.length b p s 0 (String.length s)

let insert_subbytes =
  insert_internal "insert_subbytes" Bytes.blit Bytes.length

let insert_submemory =
  insert_internal
    "inser_submemory"
    Netsys_mem.blit_memory_to_bytes 
    Bigarray.Array1.dim

let insert_subtstring b p ts k l =
  match ts with
    | `String s -> insert_substring b p s k l
    | `Bytes s -> insert_subbytes b p s k l
    | `Memory s -> insert_submemory b p s k l


let insert_char_invalid() =
   invalid_arg "Netbuffer.insert_char"

let insert_char b p c =
  if p < 0 || p > b.length then
    insert_char_invalid();
  ensure_space b (1 + b.length);
  Bytes.unsafe_blit b.buffer p b.buffer (p+1) (b.length - p);
  Bytes.set b.buffer p c;
  b.length <- b.length + 1


let e_set() =
  invalid_arg "Netbuffer.set"

let set b k c =
  if k < 0 || k >= b.length then e_set();
  Bytes.unsafe_set b.buffer k c

let put_string_invalid() =
  invalid_arg "Netbuffer.put_string"

let put_string b p s =
  if p < 0 || p > b.length then
    put_string_invalid();
  let len = max b.length (p + String.length s) in
  ensure_space b len;
  String.unsafe_blit s 0 b.buffer p (String.length s);
  b.length <- len

let blit_from_internal name blit length src srcpos b p n =
  if p < 0 || p > b.length || srcpos < 0 || n < 0 || srcpos > length src - n
  then
    invalid_arg ("Netbuffer." ^ name);
  let len = max b.length (p + n) in
  ensure_space b len;
  blit src srcpos b.buffer p n;
  b.length <- len

let blit_from_string =
  blit_from_internal "blit_from_string" Bytes.blit_string String.length

let blit_from_bytes =
  blit_from_internal "blit_from_bytes" Bytes.blit Bytes.length

let blit_from_memory =
  blit_from_internal
    "blit_from_memory"
    Netsys_mem.blit_memory_to_bytes
    Bigarray.Array1.dim

let blit_from_tstring ts p1 b p2 n =
  match ts with
    | `String s -> blit_from_string s p1 b p2 n
    | `Bytes s -> blit_from_bytes s p1 b p2 n
    | `Memory s -> blit_from_memory s p1 b p2 n

let delete b k l =
  (* deletes l bytes at position k in b *)
  let n = b.buffer_length in
  if k+l <> n && k <> n then
    Bytes.blit b.buffer (k+l) b.buffer k (n-l-k);
  b.length <- b.length - l;
  ()

let try_shrinking b =
  (* If the buffer size decreases drastically, reallocate the buffer *)
  if b.length < (b.buffer_length / 2) then begin
    let rec new_size s =
      if s >= b.length then s else new_size(2*s + word_length + 1)
    in
    let size = new_size 31 in
    let buffer' = Bytes.create size in
    Bytes.blit b.buffer 0 buffer' 0 b.length;
    b.buffer <- buffer';
    b.buffer_length <- size
  end 

let clear b =
  delete b 0 (b.length)
  
let index_from_invalid() =
  raise (Invalid_argument "Netbuffer.index_from")

let index_from b k c =
  if k > b.length then
    index_from_invalid();
  let p = Bytes.index_from b.buffer k c in
  if p >= b.length then raise Not_found;
  p

let print_buffer b =
  Format.printf
    "<NETBUFFER: %d/%d>"
    b.length
    b.buffer_length
;;
