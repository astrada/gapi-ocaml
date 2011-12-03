(**
  * Functional lenses
  *
  * Based on F# implementation in FSharpx
  * (https://github.com/fsharp/fsharpx/blob/master/src/FSharpx.Core/Lens.fs)
  *
  * See also:
  * http://bugsquash.blogspot.com/2011/11/lenses-in-f.html
  * http://stackoverflow.com/questions/8179485/updating-nested-immutable-data-structures
  * http://stackoverflow.com/questions/5767129/lenses-fclabels-data-accessor-which-library-for-structure-access-and-mutatio
  *)

type ('a, 'b) t = {
  get : 'a -> 'b;
  set : 'b -> 'a -> 'a
}

val modify : ('a, 'b) t -> ('b -> 'b) -> 'a -> 'a

(* Combinators *)

val compose : ('a, 'b) t -> ('c, 'a) t -> ('c, 'b) t

val pair : ('a, 'b) t -> ('c, 'd) t -> ('a * 'c, 'b * 'd) t

val cond : ('a -> bool) -> ('a, 'b) t -> ('a, 'b) t -> ('a, 'b) t

(* Stock lenses *)

val ignore : ('a, unit) t

val id : ('a, 'a) t

val first : ('a * 'b, 'a) t

val second : ('a * 'b, 'b) t

val head : ('a list, 'a) t

val tail : ('a list, 'a list) t

val for_hash : 'a -> (('a, 'b) Hashtbl.t, 'b option) t

val for_array : int -> ('a array, 'a) t

val for_list : int -> ('a list, 'a) t

(* List combinators *)

val list_map : ('a, 'b) t -> ('a list, 'b list) t

(* Isomorphism *)

val xmap : ('a -> 'b) -> ('b -> 'a) -> ('c, 'a) t -> ('c, 'b) t

module Infix :
sig
  val ( |. ) : 'a -> ('a, 'b) t -> 'b

  val ( ^= ) : ('a, 'b) t -> 'b -> 'a -> 'a

  val ( ^%= ) : ('a, 'b) t -> ('b -> 'b) -> 'a -> 'a

  (* Composition *)

  val ( |-- ) : ('a, 'b) t -> ('b, 'c) t -> ('a, 'c) t

  val ( --| ) : ('a, 'b) t -> ('c, 'a) t -> ('c, 'b) t

  val ( *** ) : ('a, 'b) t -> ('c, 'd) t -> ('a * 'c, 'b * 'd) t

  (* Pseudo-imperatives *)

  val ( += ) : ('a, int) t -> int -> 'a -> 'a

  val ( -= ) : ('a, int) t -> int -> 'a -> 'a

end

