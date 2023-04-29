(* $Id$ *)

(** Unicode character information *)

val to_lower : int -> int
  (** Converts the input letter to lowercase. Returns the input unchanged
      if it is no letter, or there is no lowercase equivalent.

      This bases on the 1:1 lowercase transformation of letters, and
      ignores any transformation mapping one letter to several chars.
   *)

val to_upper : int -> int
  (** Same for uppercase conversion *)

val to_title : int -> int
  (** Same for titlecase conversion *)

