type t = (string, string) Hashtbl.t

val parse : string -> (string, string) Hashtbl.t

val save : (string, string) Hashtbl.t -> string -> unit

val get : ('a, 'b) Hashtbl.t -> 'a -> 'b

val set : ('a, 'b) Hashtbl.t -> 'a -> 'b -> unit

