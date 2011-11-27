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

val update : ('a, 'b) t -> ('b -> 'b) -> 'a -> 'a

val compose : ('a, 'b) t -> ('c, 'a) t -> ('c, 'b) t

val pair : ('a, 'b) t -> ('c, 'd) t -> ('a * 'c, 'b * 'd) t

val cond : ('a -> bool) -> ('a, 'b) t -> ('a, 'b) t -> ('a, 'b) t

val first : ('a * 'b, 'a) t

val second : ('a * 'b, 'b) t

val id : ('a, 'a) t

val for_hash : 'a -> (('a, 'b) Hashtbl.t, 'b option) t

val for_array : int -> ('a array, 'a) t

val for_list : int -> ('a list, 'a) t

val list_map : ('a, 'b) t -> ('a list, 'b list) t

val xmap : ('a -> 'b) -> ('b -> 'a) -> ('c, 'a) t -> ('c, 'b) t

val ign : ('a, unit) t

module Op :
sig
  val ( >>| ) : ('a, 'b) t -> ('b, 'c) t -> ('a, 'c) t

  val ( |<< ) : ('a, 'b) t -> ('c, 'a) t -> ('c, 'b) t

  val ( *** ) : ('a, 'b) t -> ('c, 'd) t -> ('a * 'c, 'b * 'd) t

  val ( += ) : ('a, int) t -> int -> 'a -> 'a

  val ( -= ) : ('a, int) t -> int -> 'a -> 'a

  val ( =! ) : ('a, 'b) t -> 'b -> 'a -> 'a

end

