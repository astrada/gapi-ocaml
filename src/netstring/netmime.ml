(* $Id$
 * ----------------------------------------------------------------------
 *
*)

open Netchannels

type store =
  [ `Memory
  | `File of string
  ]

exception Immutable of string

class type mime_header_ro = 
  object
    method fields : (string * string) list
    method field  : string -> string
    method multiple_field : string -> string list
  end

class type mime_header = 
  object
    inherit mime_header_ro
    method ro : bool
    method set_fields : (string * string) list -> unit
    method update_field : string -> string -> unit
    method update_multiple_field : string -> string list -> unit
    method delete_field : string -> unit
  end

class type mime_body_ro =
  object
    method value : string
    method store : store
    method open_value_rd : unit -> in_obj_channel
    method finalize : unit -> unit
  end

class type mime_body =
  object
    inherit mime_body_ro
    method ro : bool
    method set_value : string -> unit
    method open_value_wr : unit -> out_obj_channel
  end

type complex_mime_message = mime_header * complex_mime_body
and complex_mime_body =
  [ `Body of mime_body
  | `Parts of complex_mime_message list
  ]

type complex_mime_message_ro = mime_header_ro * complex_mime_body_ro
and complex_mime_body_ro =
  [ `Body of mime_body_ro
  | `Parts of complex_mime_message_ro list
  ]

(* Check that coercion is possible: *)
let _ = fun x -> (x : complex_mime_message :> complex_mime_message_ro)

type mime_message = mime_header * [ `Body of mime_body ]

type mime_message_ro = mime_header_ro * [ `Body of mime_body_ro ]

module CI : sig  (* case-insensitive strings *)
  type t
  val compare : t -> t -> int
  val make : string -> t
end = struct
  type t = string
  let compare (a_ci:t) (b_ci:t) =
    compare a_ci b_ci
  let make s = STRING_LOWERCASE s
end

module CIMap = Map.Make(CI)
(* Maps from case-insensitive strings to any type *)

module DL : sig  (* doubly-linked lists *)
  type 'a t
  type 'a cell
  val create : unit -> 'a t
  val is_empty : 'a t -> bool
  val cell : 'a -> 'a cell
  val contents : 'a cell -> 'a
  val first : 'a t -> 'a cell (* or Not_found *)
  val last : 'a t -> 'a cell (* or Not_found *)
  val prev : 'a cell -> 'a cell (* or Not_found *)
  val next : 'a cell -> 'a cell (* or Not_found *)
  val iter : ('a cell -> unit) -> 'a t -> unit
  val delete : 'a cell -> unit
  val insert_after : neo:'a cell -> 'a cell -> unit
  val add_at_end : neo:'a cell -> 'a t -> unit
  val replace : neo:'a cell -> 'a cell -> unit
  val of_list : 'a list -> 'a t
  val to_list : 'a t -> 'a list
end = struct
  type 'a t =
    { mutable first : 'a cell option;
      mutable last : 'a cell option;
    }
  and 'a cell =
    { mutable prev : 'a cell option;
      mutable next : 'a cell option;
      mutable list : 'a t option;
      contents : 'a;
    }
  let create() = 
    { first = None; last = None }
  let is_empty l =
    l.first = None
  let cell x =
    { prev = None; next = None; list = None; contents = x }
  let contents c =
    c.contents
  let first l =
    match l.first with Some c -> c | None -> raise Not_found
  let last l =
    match l.last with Some c -> c | None -> raise Not_found
  let prev c =
    match c.prev with Some c' -> c' | None -> raise Not_found
  let next c =
    match c.next with Some c' -> c' | None -> raise Not_found
  let iter f l =
    match l.first with
      Some c ->
      f c;
      let current = ref c in
      while (let c0 = ! current in c0.next) <> None do  (* Error in camlp4 *)
        current := next !current;
        f !current
      done; ()
    | None ->
      ()
  let delete c =
    match c.list with
      Some l ->
      ( match c.prev with
          Some p ->
          p.next <- c.next
        | None ->
          l.first <- c.next
      );
      ( match c.next with
          Some n ->
          n.prev <- c.prev
        | None ->
          l.last <- c.prev
      );
      c.prev <- None;
      c.next <- None;
      c.list <- None
    | None -> 
      failwith "DL.delete: cannot delete free cell"
  let insert_after ~neo c =
    if neo.list <> None then
      failwith "DL.insert_after: new cell must be free";
    match c.list with
      Some l ->
      let nx = c.next in
      c.next <- Some neo;
      neo.prev <- Some c;
      ( match nx with
          Some n ->
          n.prev <- Some neo;
          neo.next <- Some n;
        | None ->
          l.last <- Some neo;
          neo.next <- None
      );
      neo.list <- Some l
    | None -> 
      failwith "DL.insert_after: cannot insert after free cell"
  let add_at_end ~neo l =
    if neo.list <> None then
      failwith "DL.insert_after: new cell must be free";
    match l.last with
      Some n ->
      n.next <- Some neo;
      neo.prev <- Some n;
      neo.next <- None;
      neo.list <- Some l;
      l.last <- Some neo
    | None ->
      l.last <- Some neo;
      l.first <- Some neo;
      neo.prev <- None;
      neo.next <- None;
      neo.list <- Some l
  let replace ~neo c =
    if neo.list <> None then
      failwith "DL.replace: new cell must be free";
    match c.list with
      Some l ->
      ( match c.prev with
          Some p ->
          p.next <- Some neo
        | None ->
          l.first <- Some neo
      );
      neo.prev <- c.prev;
      ( match c.next with
          Some n ->
          n.prev <- Some neo
        | None ->
          l.last <- Some neo
      );
      neo.next <- c.next;
      neo.list <- Some l;
      c.prev <- None;
      c.next <- None;
      c.list <- None
    | None -> 
      failwith "DL.replace: cannot replace free cell"
  let of_list l =
    let dl = create() in
    List.iter
      (fun x -> 
         add_at_end ~neo:(cell x) dl
      )
      l;
    dl
  let rec to_list dl =
    chain_to_list dl.first
  and chain_to_list chain =
    match chain with
      None -> []
    | Some c -> c.contents :: chain_to_list c.next

end


class basic_mime_header h : mime_header =
  object (self)
    val mutable hdr_map = lazy (assert false)
    val mutable hdr_dl  = lazy (assert false)

    initializer
      self # do_set_fields h

    method ro = false
    (* Heirs can redefine [ro] to make this object immutable *)

    method fields = 
      DL.to_list (Lazy.force hdr_dl)

    method field n = 
      let m = Lazy.force hdr_map in
      match CIMap.find (CI.make n) m with
        [] -> raise Not_found
      | cell :: _ -> snd (DL.contents cell)

    method multiple_field n =
      let m = Lazy.force hdr_map in
      try 
        List.map 
          (fun cell -> snd (DL.contents cell)) 
          (CIMap.find (CI.make n) m) 
      with Not_found -> []

    method set_fields h =
      if self#ro then raise (Immutable "set_fields");
      self # do_set_fields h

    method private do_set_fields h =
      hdr_dl <- lazy (DL.of_list h);
      hdr_map <- lazy begin
        (* This seems to be expensive (O(n log n)). Because of this we do it only
         * on demand; maybe nobody accesses the header at all
        *)
        let m = ref CIMap.empty in
        DL.iter
          (fun cell ->
             let (n,v) = DL.contents cell in
             let n_ci = CI.make n in
             let current = 
               try CIMap.find n_ci !m 
               with Not_found -> [] 
             in
             m := CIMap.add n_ci (cell :: current) !m;
          )
          (Lazy.force hdr_dl);
        CIMap.map List.rev !m
      end

    method update_field n v =
      if self#ro then raise (Immutable "update_field");
      self # update_multiple_field n [v]

    method update_multiple_field n vl =
      if self#ro then raise (Immutable "update_multiple_field");
      let n_ci = CI.make n in
      let m = Lazy.force hdr_map in
      let dl = Lazy.force hdr_dl in
      (* Algorithm: First try to replace existing values.
       * If there are more new values than old values,
       * at the excess values after the last old value,
       * or if not possible, at the end.
      *)
      let insert_point =
        ref None in
      let old_cells =
        ref(try CIMap.find n_ci m with Not_found -> []) in
      let new_vals  = ref vl in
      let new_cells = ref [] in
      while !old_cells <> [] || !new_vals <> [] do
        match !old_cells, !new_vals with
          (old_cell :: old_cells'), (new_val :: new_vals') ->
          (* Only update if the value has changed: *)
          let (old_n, old_val) = DL.contents old_cell in
          if old_val = new_val then (
            new_cells := old_cell :: !new_cells;
            insert_point := Some old_cell;
          )
          else (
            let new_cell = DL.cell (n, new_val) in
            DL.replace ~neo:new_cell old_cell;
            insert_point := Some new_cell;
            new_cells := new_cell :: !new_cells
          );
          old_cells := old_cells';
          new_vals  := new_vals';
        | [], (new_val :: new_vals') ->
          let new_cell = DL.cell (n, new_val) in
          ( match !insert_point with
              Some p ->
              DL.insert_after ~neo:new_cell p;
            | None ->
              DL.add_at_end ~neo:new_cell dl
          );
          new_vals := new_vals';
          insert_point := Some new_cell;
          new_cells := new_cell :: !new_cells
        | (old_cell :: old_cells'), [] ->
          DL.delete old_cell;
          old_cells := old_cells'
        | [], [] ->
          assert false
      done;
      let m' = CIMap.add n_ci (List.rev !new_cells) m in
      hdr_map <- lazy m'

    method delete_field n =
      if self#ro then raise (Immutable "delete_field");
      let n_ci = CI.make n in
      let m = Lazy.force hdr_map in
      let old_cells =
        try CIMap.find n_ci m with Not_found -> [] in
      List.iter DL.delete old_cells;
      let m' = CIMap.remove n_ci m in
      hdr_map <- lazy m';
  end ;;


let basic_mime_header = new basic_mime_header


class wrap_mime_header hdr : mime_header =
  object(self)
    method fields = hdr#fields
    method field = hdr#field
    method multiple_field = hdr#multiple_field
    method ro = hdr#ro
    (* Heirs can redefine [ro] to make this object immutable *)
    method set_fields fields =
      if self#ro then raise(Immutable "set_fields");
      hdr#set_fields fields
    method update_field n v = 
      if self#ro then raise(Immutable "update_field");
      hdr#update_field n v
    method update_multiple_field n v =
      if self#ro then raise(Immutable "update_multiple_fields");
      hdr#update_multiple_field n v
    method delete_field n = 
      if self#ro then raise(Immutable "delete_field");
      hdr#delete_field n
  end


class wrap_mime_header_ro hdr : mime_header =
  object(self)
    method fields = hdr#fields
    method field = hdr#field
    method multiple_field = hdr#multiple_field
    method ro = true
    method set_fields _ =
      raise (Immutable "set_fields")
    method update_field _ _ =
      raise (Immutable "update_field")
    method update_multiple_field _ _ =
      raise (Immutable "update_multiple_field")
    method delete_field _ =
      raise (Immutable "delete_field")
  end


let wrap_mime_header_ro = new wrap_mime_header_ro


class memory_mime_body v : mime_body =
  object (self)
    val mutable value = v
    val mutable finalized = false

    method value = 
      if finalized then self # finalized();
      value
    method store = 
      `Memory
    method open_value_rd() = 
      if finalized then self # finalized();
      new input_string value
    method finalize() = 
      finalized <- true

    method ro = 
      (* Heirs can redefine [ro] to make this object immutable *)
      false

    method set_value s = 
      if self#ro then raise (Immutable "set_value");
      if finalized then self # finalized();
      value <- s;

    method open_value_wr() =
      if self#ro then raise (Immutable "open_value_wr");
      if finalized then self # finalized();
      let b = Netbuffer.create 60 in
      new output_netbuffer ~onclose:(fun () -> value <- Netbuffer.contents b) b;

    method private finalized() =
      failwith "Netmime.memory_mime_body: object is finalized";
  end ;;


let memory_mime_body = new memory_mime_body


class file_mime_body ?(fin=false) f : mime_body =
  object (self)
    val mutable finalized = false
    val fin = fin
    val filename = f
    val cached_value = Weak.create 1

    method ro = 
      (* Heirs can redefine [ro] to make this object immutable *)
      false
    method store = 
      `File filename

    method value =
      if finalized then self # finalized();
      match Weak.get cached_value 0 with
        None ->
        with_in_obj_channel
          (new input_channel (open_in_bin filename))
          (fun objch ->
             let v = string_of_in_obj_channel objch in
             Weak.set cached_value 0 (Some v);
             v
          )
      | Some v -> v

    method open_value_rd() =
      if finalized then self # finalized();
      new input_channel (open_in_bin filename)

    method set_value s =
      if self#ro then raise (Immutable "set_value");
      if finalized then self # finalized();
      with_out_obj_channel 
        (new output_channel (open_out_bin filename))
        (fun ch -> ch # output_string s);

    method open_value_wr() =
      if self#ro then raise (Immutable "open_value_wr");
      if finalized then self # finalized();
      new output_channel (open_out_bin filename)

    method finalize () =
      if fin && not finalized then begin
        try Sys.remove filename with _ -> ()
      end;
      finalized <- true

    method private finalized() =
      failwith "Netmime.file_mime_body: object is finalized";
  end ;;


let file_mime_body = new file_mime_body


class wrap_mime_body bdy : mime_body =
  object (self)
    method value = bdy#value
    method store = bdy#store
    method open_value_rd = bdy#open_value_rd
    method finalize = bdy#finalize
    method ro = bdy#ro
    method set_value = bdy#set_value
    method open_value_wr = bdy#open_value_wr
  end


class wrap_mime_body_ro bdy : mime_body =
  object (self)
    method value = bdy#value
    method store = bdy#store
    method open_value_rd = bdy#open_value_rd
    method finalize = bdy#finalize
    method ro = true
    method set_value _ =
      raise (Immutable "set_value")
    method open_value_wr _ =
      raise (Immutable "open_value_wr")
  end


let wrap_mime_body_ro = new wrap_mime_body_ro


let rec wrap_complex_mime_message_ro (h,cb) =
  (wrap_mime_header_ro h,
   match cb with
     `Body b  -> `Body(wrap_mime_body_ro b)
   | `Parts p -> `Parts(List.map wrap_complex_mime_message_ro p)
  )
;;
