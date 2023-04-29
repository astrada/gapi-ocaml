(* $Id$ *)

(** Support module for tagged strings *)

open Netsys_types

(** GADT for encoding the string type (string/bytes/bigarray) *)
type _ tstring_kind =
  | String_kind : string tstring_kind
  | Bytes_kind : Bytes.t tstring_kind
  | Memory_kind : memory tstring_kind

(** Operations to call on strings *)
type 't tstring_ops =
    { kind : 't tstring_kind option;
      length : 't -> int;
      get : 't -> int -> char;
      unsafe_get : 't -> int -> char;
      unsafe_get3 : 't -> int -> int; (** get 3 chars packed into one int
        (first char shifted by 16 bits, second char shifted by 8 bits,
        third char unshifted) *)
      copy : 't -> 't;
      string : 't -> string;  (** if possible this function does not make a copy *)
      bytes : 't -> Bytes.t;  (** if possible this function does not make a copy *)
      sub : 't -> int -> int -> 't;
      substring : 't -> int -> int -> string;
      subbytes : 't -> int -> int -> Bytes.t;
      subpoly : 'u . 'u tstring_kind -> 't -> int -> int -> 'u;
      blit_to_bytes : 't -> int -> Bytes.t -> int -> int -> unit;
      blit_to_memory : 't -> int -> memory -> int -> int -> unit;
      index_from : 't -> int -> char -> int;
      index_from3 : 't -> int -> int -> char -> char -> char -> int; (** finds any of three chars. The second int is the search radius *)
      rindex_from : 't -> int -> char -> int;
      rindex_from3 : 't -> int -> int -> char -> char -> char -> int; (** finds any of three chars. The second int is the search radius *)
    }

(** GADT for hiding the type parameter *)
type tstring_ops_box =
  | Tstring_ops_box : 't tstring_kind * 't tstring_ops -> tstring_ops_box

(** GADT for hiding the type parameter *)
type tstring_box =
  | Tstring_box : 't tstring_kind * 't tstring_ops * 't -> tstring_box

(** GADT for hiding the type parameter. Warning: This GADT does not permit you
    to recover the kind of string
 *)
type tstring_polybox =
  | Tstring_polybox : 't tstring_ops * 't -> tstring_polybox

val string_ops : string tstring_ops
  (** Implementation of the operations for [string] *)
val bytes_ops : Bytes.t tstring_ops
  (** Implementation of the operations for [bytes] *)
val memory_ops : memory tstring_ops
  (** Implementation of the operations for [memory] *)

val ops_of_tstring : tstring -> tstring_ops_box
  (** Create a [Tstring_ops_box] *)

(** A polymorphic function for strings *)
type 'a with_fun =
    { with_fun : 's . 's tstring_ops -> 's -> 'a }

val with_tstring : 'a with_fun -> tstring -> 'a
  (** [with_tstring f ts]: Calls [f.with_fun] with the right implementation of
      the [tstring_ops] argument
   *)

val length_tstring : tstring -> int
  (** Get the length of a tagged string *)

val tstring_of_tbuffer : tbuffer -> tstring
  (** Get the tagged string of a tagged buffer *)

val polymorph_string_transformation : (string->string) -> 's tstring_ops ->
                                      't tstring_kind -> 's -> 't
  (** [polymorph_string_transformation f ops kind s]: Converts [s] to a
      string, runs [f] on this string, and converts the result to the
      type demanded by [kind]
   *)

(**/**)

val bytes_subpoly : 'u tstring_kind -> Bytes.t -> int -> int -> 'u
