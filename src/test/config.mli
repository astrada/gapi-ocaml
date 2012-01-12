type t = (string, string) Hashtbl.t

val parse : ?filename:string -> unit -> (string, string) Hashtbl.t

val save : ?filename:string -> (string, string) Hashtbl.t -> unit

val get : ('a, 'b) Hashtbl.t -> 'a -> 'b

val set : ('a, 'b) Hashtbl.t -> 'a -> 'b -> unit

