(** Functional lenses.
  
  Based on F# implementation in {{:https://github.com/fsharp/fsharpx}FSharpx}
  (see {{:https://github.com/fsharp/fsharpx/blob/master/src/FSharpx.Core/Lens.fs}src/FSharpx.Core/Lens.fs} for the original implementation)
  
  @see <http://bugsquash.blogspot.com/2011/11/lenses-in-f.html> Lenses in F#
  @see <http://stackoverflow.com/questions/8179485/updating-nested-immutable-data-structures> Stackoverflow question about Updating nested immutable data structures
  @see <http://stackoverflow.com/questions/5767129/lenses-fclabels-data-accessor-which-library-for-structure-access-and-mutatio> Haskell libraries for structure access and mutation
  @see <http://www.youtube.com/watch?v=efv0SQNde5Q> Functional lenses for Scala by Edward Kmett on YouTube
  @see <http://patternsinfp.wordpress.com/2011/01/31/lenses-are-the-coalgebras-for-the-costate-comonad/> Lenses are the coalgebras for the costate comonad by Jeremy Gibbons
  *)

type ('a, 'b) t = {
  get : 'a -> 'b;  (** Functional getter *)
  set : 'b -> 'a -> 'a;  (** Functional setter *)
}
(** Lens type definition *)

val modify : ('a, 'b) t -> ('b -> 'b) -> 'a -> 'a
(** Updates a value through a lens *)

(** {3 Combinators} *)

val compose : ('a, 'b) t -> ('c, 'a) t -> ('c, 'b) t
(** Sequentially composes two lenses *)

val pair : ('a, 'b) t -> ('c, 'd) t -> ('a * 'c, 'b * 'd) t
(** Pairs two lenses *)

val cond : ('a -> bool) -> ('a, 'b) t -> ('a, 'b) t -> ('a, 'b) t
(** Selects a lens checking a predicate.
  
  [cond pred lensTrue lensFalse]: [pred] is applied to source. If [true], [lensTrue] is selected. If [false], [lensFalse] is selected. *)

(** {3 State monad integration} *)

val get_state : ('a, 'b) t -> 'a -> 'b * 'a
(** Gets a value from the state monad. *)

val put_state : ('a, 'b) t -> 'b -> 'a -> unit * 'a
(** Puts a value in the state monad. *)

val modify_state : ('a, 'b) t -> ('b -> 'b) -> 'a -> unit * 'a
(** Modifies a value in the state monad. *)

(** {3 Stock lenses} *)

val ignore : ('a, unit) t
(** Trivial lens *)

val id : ('a, 'a) t
(** Identity lens *)

val first : ('a * 'b, 'a) t
(** Gets/sets the first element in a pair *)

val second : ('a * 'b, 'b) t
(** Gets/sets the second element in a pair *)

val head : ('a list, 'a) t
(** Gets/sets the first element in a list *)

val tail : ('a list, 'a list) t
(** Gets/sets the tail of a list *)

val for_hash : 'a -> (('a, 'b) Hashtbl.t, 'b option) t
(** Lens for a particular key in a hashtable *)

val for_assoc : 'a -> (('a * 'b) list, 'b option) t
(** Lens for a particular key in an associative list *)

val for_array : int -> ('a array, 'a) t
(** Lens for a particular position in an array *)

val for_list : int -> ('a list, 'a) t
(** Lens for a particular position in a list *)

val option_get : ('a option, 'a) t
(** Lens for extracting the value from an option type (same as Option.get) *)

(** {3 List combinators} *)

val list_map : ('a, 'b) t -> ('a list, 'b list) t
(** Creates a lens that maps the given lens in a list *)

(** {3 Isomorphism} *)

val xmap : ('a -> 'b) -> ('b -> 'a) -> ('c, 'a) t -> ('c, 'b) t
(** Applies an isomorphism to the value viewed through a lens *)

(** Infix operators *)
module Infix : sig
  val ( |. ) : 'a -> ('a, 'b) t -> 'b
  (** Get operator *)

  val ( ^= ) : ('a, 'b) t -> 'b -> 'a -> 'a
  (** Set operator *)

  val ( ^%= ) : ('a, 'b) t -> ('b -> 'b) -> 'a -> 'a
  (** Mod operator *)

  (** {3 Composition} *)

  val ( |-- ) : ('a, 'b) t -> ('b, 'c) t -> ('a, 'c) t
  (** Flipped compose operator *)

  val ( --| ) : ('a, 'b) t -> ('c, 'a) t -> ('c, 'b) t
  (** Compose operator *)

  val ( *** ) : ('a, 'b) t -> ('c, 'd) t -> ('a * 'c, 'b * 'd) t
  (** Pair operator *)

  (** {3 Pseudo-imperatives} *)

  val ( += ) : ('a, int) t -> int -> 'a -> 'a

  val ( -= ) : ('a, int) t -> int -> 'a -> 'a
end

(** Infix operators for the state monad *)
module StateInfix : sig
  val ( ^=! ) : ('a, 'b) t -> 'b -> 'a -> unit * 'a
  (** Set operator *)

  (** {3 Pseudo-imperatives} *)

  val ( +=! ) : ('a, int) t -> int -> 'a -> unit * 'a

  val ( -=! ) : ('a, int) t -> int -> 'a -> unit * 'a

  val ( @=! ) : ('a, 'b list) t -> 'b list -> 'a -> unit * 'a
end
