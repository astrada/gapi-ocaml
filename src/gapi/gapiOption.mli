(* Implementation of the Option module for older compilers.
 *
 * https://caml.inria.fr/pub/docs/manual-ocaml/libref/Option.html *)
val iter : ('a -> unit) -> 'a option -> unit

val map : ('a -> 'b) -> 'a option -> 'b option

val is_some : 'a option -> bool

val is_none : 'a option -> bool

val value : 'a option -> default:'a -> 'a

val get : 'a option -> 'a

