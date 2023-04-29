(* $Id$ *)

open Netsys_types

type _ tstring_kind =
  | String_kind : string tstring_kind
  | Bytes_kind : Bytes.t tstring_kind
  | Memory_kind : memory tstring_kind

type 't tstring_ops =
    { kind : 't tstring_kind option;
      length : 't -> int;
      get : 't -> int -> char;
      unsafe_get : 't -> int -> char;
      unsafe_get3 : 't -> int -> int; (* get 3 chars packed into one int *)
      copy : 't -> 't;
      string : 't -> string;
      bytes : 't -> Bytes.t;
      sub : 't -> int -> int -> 't;
      substring : 't -> int -> int -> string;
      subbytes : 't -> int -> int -> Bytes.t;
      subpoly : 'u . 'u tstring_kind -> 't -> int -> int -> 'u;
      blit_to_bytes : 't -> int -> Bytes.t -> int -> int -> unit;
      blit_to_memory : 't -> int -> memory -> int -> int -> unit;
      index_from : 't -> int -> char -> int;
      index_from3 : 't -> int -> int -> char -> char -> char -> int;
      rindex_from : 't -> int -> char -> int;
      rindex_from3 : 't -> int -> int -> char -> char -> char -> int;
    }

type tstring_ops_box =
  | Tstring_ops_box : 't tstring_kind * 't tstring_ops -> tstring_ops_box

type tstring_box =
  | Tstring_box : 't tstring_kind * 't tstring_ops * 't -> tstring_box

type tstring_polybox =
  | Tstring_polybox : 't tstring_ops * 't -> tstring_polybox
  (* Warning: you cannot match on the type 't here *)

let str_subpoly : type u . u tstring_kind -> string -> int -> int -> u =
  function
  | String_kind -> String.sub
  | Bytes_kind -> (fun s pos len ->
                     let b = Bytes.create len in
                     Bytes.blit_string s pos b 0 len;
                     b
                  )
  | Memory_kind -> (fun s pos len ->
                      let m =
                        Bigarray.Array1.create Bigarray.char Bigarray.c_layout
                                               len in
                      Netsys_mem.blit_string_to_memory s pos m 0 len;
                      m
                   )


let str_index_from3 s p n c1 c2 c3 =
  (* FIXME: implement in C *)
  let sn = String.length s in
  if n < 0 || p < 0 || p > sn-n then
    invalid_arg "index_from3";
  let lim = p+n in
  let p = ref p in
  while !p < lim &&
          (let c = String.unsafe_get s !p in c <> c1 && c <> c2 && c <> c3)
  do
    incr p
  done;
  if !p >= lim then raise Not_found;
  !p

let str_rindex_from3 s p n c1 c2 c3 =
  (* FIXME: implement in C *)
  let sn = String.length s in
  if n < 0 || p < -1 || p >= sn || n-1 > p then
    invalid_arg "rindex_from";
  let lim = p-n+1 in
  let p = ref p in
  while !p >= lim && 
           (let c = String.unsafe_get s !p in c <> c1 && c <> c2 && c <> c3)
  do
    decr p
  done;
  if !p < lim then raise Not_found;
  !p

let string_ops =
  { kind = Some String_kind;
    length = String.length;
    get = String.get;
    unsafe_get = String.unsafe_get;
    unsafe_get3 = (fun s k ->
                     let c0 = Char.code (String.unsafe_get s k) in
                     let c1 = Char.code (String.unsafe_get s (k+1)) in
                     let c2 = Char.code (String.unsafe_get s (k+2)) in
                     (c0 lsl 16) lor (c1 lsl 8) lor c2
                  );
    copy = STRING_COPY;   (* ... for the time being ... *)
    string = (fun s -> s);
    bytes = Bytes.of_string;
    sub = String.sub;
    substring = String.sub;
    subbytes = (fun s p l ->
                  let b = Bytes.create l in
                  Bytes.blit_string s p b 0 l;
                  b
               );
    subpoly = str_subpoly;
    blit_to_bytes = Bytes.blit_string;
    blit_to_memory = Netsys_mem.blit_string_to_memory;
    index_from = String.index_from;
    index_from3 = str_index_from3;
    rindex_from = String.rindex_from;
    rindex_from3 = str_rindex_from3;
  }

let bytes_index_from3 s p n c1 c2 c3 =
  str_index_from3 (Bytes.unsafe_to_string s) p n c1 c2 c3

let bytes_rindex_from3 s p n c1 c2 c3 =
  str_rindex_from3 (Bytes.unsafe_to_string s) p n c1 c2 c3

let bytes_subpoly : type u . u tstring_kind -> Bytes.t -> int -> int -> u =
  function
  | String_kind -> Bytes.sub_string
  | Bytes_kind -> Bytes.sub
  | Memory_kind -> (fun s pos len ->
                      let m =
                        Bigarray.Array1.create Bigarray.char Bigarray.c_layout
                                               len in
                      Netsys_mem.blit_bytes_to_memory s pos m 0 len;
                      m
                   )

let bytes_ops =
  { kind = Some Bytes_kind;
    length = Bytes.length;
    get = Bytes.get;
    unsafe_get = Bytes.unsafe_get;
    unsafe_get3 = (fun s k ->
                     let c0 = Char.code (Bytes.unsafe_get s k) in
                     let c1 = Char.code (Bytes.unsafe_get s (k+1)) in
                     let c2 = Char.code (Bytes.unsafe_get s (k+2)) in
                     (c0 lsl 16) lor (c1 lsl 8) lor c2
                  );
    copy = Bytes.copy;
    string = Bytes.to_string;
    bytes = (fun s -> s);
    sub = Bytes.sub;
    substring = Bytes.sub_string;
    subbytes = Bytes.sub;
    subpoly = bytes_subpoly;
    blit_to_bytes = Bytes.blit;
    blit_to_memory = Netsys_mem.blit_bytes_to_memory;
    index_from = Bytes.index_from;
    index_from3 = bytes_index_from3;
    rindex_from = Bytes.rindex_from;
    rindex_from3 = bytes_rindex_from3;
  }

let mem_index_from3 m p n c1 c2 c3 =
  (* FIXME: implement in C *)
  let sn = Bigarray.Array1.dim m in
  if n < 0 || p < 0 || p > sn-n then
    invalid_arg "index_from";
  let lim = p+n in
  let p = ref p in
  while
    !p < lim &&
      (let c = Bigarray.Array1.unsafe_get m !p in c <> c1 && c <> c2 && c <> c3)
  do
    incr p
  done;
  if !p >= lim then raise Not_found;
  !p

let mem_index_from m p c =
  let sn = Bigarray.Array1.dim m in
  mem_index_from3 m p (sn-p) c c c

let mem_rindex_from3 m p n c1 c2 c3 =
  (* FIXME: implement in C *)
  let sn = Bigarray.Array1.dim m in
  if n < 0 || p < -1 || p >= sn || n-1 > p then
    invalid_arg "rindex_from";
  let lim = p-n+1 in
  let p = ref p in
  while
    !p >= lim &&
      (let c = Bigarray.Array1.unsafe_get m !p in c <> c1 && c <> c2 && c <> c3)
  do
    decr p
  done;
  if !p < lim then raise Not_found;
  !p

let mem_rindex_from m p c =
  mem_rindex_from3 m p (p+1) c c c

let mem_sub m1 p len = 
  let m2 =
    Bigarray.Array1.create Bigarray.char Bigarray.c_layout len in
  Bigarray.Array1.blit
    (Bigarray.Array1.sub m1 p len)
    m2;
  m2

let mem_subpoly : type u . u tstring_kind -> memory -> int -> int -> u =
  function
  | String_kind -> (fun m pos len ->
                     Netsys_mem.string_of_memory
                       (Bigarray.Array1.sub m pos len)
                   )
  | Bytes_kind -> (fun m pos len ->
                     Netsys_mem.bytes_of_memory
                       (Bigarray.Array1.sub m pos len)
                  )
  | Memory_kind -> mem_sub

let memory_ops =
  { kind = Some Memory_kind;
    length = (Bigarray.Array1.dim : memory -> int);
    get = Bigarray.Array1.get;
    unsafe_get = Bigarray.Array1.unsafe_get;
    unsafe_get3 = (fun s k ->
                     let c0 = Char.code (Bigarray.Array1.unsafe_get s k) in
                     let c1 = Char.code (Bigarray.Array1.unsafe_get s (k+1)) in
                     let c2 = Char.code (Bigarray.Array1.unsafe_get s (k+2)) in
                     (c0 lsl 16) lor (c1 lsl 8) lor c2
                  );
    copy = (fun m1 ->
              let n = Bigarray.Array1.dim m1 in
              mem_sub m1 0 n
           );
    string = Netsys_mem.string_of_memory;
    bytes = Netsys_mem.bytes_of_memory;
    sub = mem_sub;
    substring = (fun m p l ->
                   let m1 = Bigarray.Array1.sub m p l in
                   Netsys_mem.string_of_memory m1
                );
    subbytes = (fun m p l ->
                  let m1 = Bigarray.Array1.sub m p l in
                  Netsys_mem.bytes_of_memory m1
               );
    subpoly = mem_subpoly;
    blit_to_bytes = Netsys_mem.blit_memory_to_bytes;
    blit_to_memory = (fun m1 p1 m2 p2 l ->
                        let sub1 = Bigarray.Array1.sub m1 p1 l in
                        let sub2 = Bigarray.Array1.sub m2 p2 l in
                        Bigarray.Array1.blit sub1 sub2
                     );
    index_from = mem_index_from;
    index_from3 = mem_index_from3;
    rindex_from = mem_rindex_from;
    rindex_from3 = mem_rindex_from3;
  }

let ops_of_tstring =
  function
  | `String _ ->
      Tstring_ops_box(String_kind, string_ops)
  | `Bytes _ ->
      Tstring_ops_box(Bytes_kind, bytes_ops)
  | `Memory _ ->
      Tstring_ops_box(Memory_kind, memory_ops)


type 'a with_fun =
    { with_fun : 's . 's tstring_ops -> 's -> 'a }

let with_tstring : 'a with_fun -> tstring -> 'a =
  fun f ->
    function
    | `String s ->
        f.with_fun string_ops s
    | `Bytes s ->
        f.with_fun bytes_ops s
    | `Memory s ->
        f.with_fun memory_ops s


let length_tstring ts =
  with_tstring
    { with_fun = (fun ops s -> ops.length s) }
    ts

let polymorph_string_transformation
  : type s t . (string->string) -> s tstring_ops -> t tstring_kind -> s -> t =
  (fun f ops out_kind s ->
     let s' = f (ops.string s) in
     match out_kind with
       | String_kind ->
           s'
       | Bytes_kind ->
           Bytes.of_string s'
       | Memory_kind ->
           Netsys_mem.memory_of_string s'
  )


let tstring_of_tbuffer =
  function
  | `Bytes s -> `Bytes s
  | `String s -> `Bytes s
  | `Memory m -> `Memory m
