(* $Id$
 * ----------------------------------------------------------------------
 *
 *)

(** Wrapper for regexps with [Str] syntax
 *
 * This module was written at a time when we had only the [Str] module
 * for regular expressions. However, [Str] has an interface that does
 * not work for multi-threaded programs, because the state of the module
 * is visible to the outside. The module [Netstring_str] is similar to [Str],
 * but has a thread-compatible interface.
 *
 * For an explanation why we need this module, please read {!Regexp}.
 *)

(** {b Supported regexp syntax}
 *
 * {[
 * .             matches every character but newline
 * e*            matches e several times
 * e+            matches e several times but at least once
 * e?            matches e optionally
 * e{m,n}        matches e at least m times and at most n times
 * e1\|e2        matches e1 or e2
 * [set]         matches the characters from set
 * [^set]        matches the characters except from set
 * \(...\)       group paranthesis
 * \n            back reference (n is digit)
 * ^             matches at beginning of line
 * $             matches at end of line
 * ]}
 *
 * This is exactly what [Str] supports. Character classes
 * are not implemented.
 *)

type regexp
  (** The type of regular expressions *)

type split_result = Str.split_result = Text of string | Delim of string;;
  (** Here we keep compatibility with [Str] *)

type result;;
  (** The type of matching results *)

val regexp: string -> regexp
  (** Parses a regexp *)
val regexp_case_fold: string -> regexp
  (** Parses a case-insensitive regexp *)
val quote: string -> string
  (** Quotes a string such that it can be included in a regexp *)
val regexp_string: string -> regexp
  (** Returns a regexp that matches exactly the string *)
val regexp_string_case_fold: string -> regexp
  (** Returns a case-insensitive regexp that matches exactly the string *)

val quote_set : string -> string
  (** Returns a regexp (as string) that matches any of the characters in
      the argument. The argument must be non-empty
   *)

val string_match: 
      regexp -> string -> int -> result option
  (** Matches the string at the position with the regexp. Returns
   * [None] if no match is found. Returns [Some r] on success,
   * and [r] describes the match.
   *)

val bytes_match: 
      regexp -> Bytes.t -> int -> result option
  (** Same for bytes *)

val search_forward: 
      regexp -> string -> int -> (int * result)
  (** Searches a match of the string with the regexp, starting at
   * the position and in forward direction.
   * Raises [Not_found] if no match could be found.
   * Returns [(p,r)] when a match at position [p] is found,
   * described by [r].
   *)

val search_forward_bytes: 
      regexp -> Bytes.t -> int -> (int * result)
  (** Same for bytes *)

val search_backward: 
      regexp -> string -> int -> (int * result)
  (** Searches a match of the string with the regexp, starting at
   * the position and in backward direction.
   * Raises [Not_found] if no match could be found.
   * Returns [(p,r)] when a match at position [p] is found,
   * described by [r].
   *)

val search_backward_bytes :
      regexp -> Bytes.t -> int -> (int * result)
  (** Same for bytes *)

(* NOT SUPPORTED:
 *
 *  val string_partial_match: 
 *        ?groups:int -> pat:regexp -> string -> pos:int -> result option
 *
 * The function [string_partial_match] cannot be emulated using PCRE.
 *)

val matched_string : result -> string -> string
  (** Extracts the matched part from the string. The string argument
   * must be the same string passed to [string_match] or the search
   * functions, and the result argument must be the corresponding
   * result.
   *)

val matched_bytes : result -> Bytes.t -> Bytes.t
  (** Same for bytes *)

val match_beginning : result -> int
  (** Returns the position where the matched part begins *)

val match_end : result -> int
  (** Returns the position where the matched part ends *)

val matched_group : result -> int -> string -> string
  (** Extracts the substring the nth group matches from the whole
   * string. The string argument
   * must be the same string passed to [string_match] or the search
   * functions, and the result argument must be the corresponding
   * result.
   *)

val matched_group_bytes : result -> int -> Bytes.t -> Bytes.t
  (** Same for bytes *)

val group_beginning : result -> int -> int
  (** Returns the position where the substring matching the nth
   * group begins 
   *)

val group_end : result -> int -> int
  (** Returns the position where the substring matching the nth
   * group ends 
   *)

val global_replace: regexp -> (*templ:*) string -> string -> string
  (** [global_replace re templ s]: Replaces all matchings of [re] in
   * [s] by [templ].
   *
   * In [templ] one can refer to matched groups by the backslash notation:
   * [\1] refers to the first group, [\2] to the second etc.
   * [\0] is the whole match. [\\ ] is the backslash character.
   *)

val replace_first: regexp -> (*templ:*) string -> string -> string
  (** [replace_first re templ s]: Replaces the first match of [re] in
   * [s] by [templ].
   *
   * In [templ] one can refer to matched groups by the backslash notation:
   * [\1] refers to the first group, [\2] to the second etc.
   * [\0] is the whole match. [\\ ] is the backslash character.
   *)

val global_substitute :
       regexp -> (result -> string -> string) -> string -> string
  (** [global_substitute re subst s]: Applies the substitution function
   * [subst] to all matchings of [re] in [s], and returns the 
   * transformed string. [subst] is called with the current [result]
   * of the match and the whole string [s].
   *)

val substitute_first:
       regexp -> (result -> string -> string) -> string -> string
  (** [substitute_first re subst s]: Applies the substitution function
   * [subst] to the first matching of [re] in [s], and returns the 
   * transformed string. [subst] is called with the current [result]
   * of the match and the whole string [s].
   *)

(* replace_matched: not available *)

val split: regexp -> string -> string list
  (** Splits the string according to the regexp in substrings.
   * Occurrences of the delimiter at the beginning and the end
   * are ignored.
   *)

val bounded_split: regexp -> string -> int -> string list
  (** Splits into at most [n] substrings, based on [split] *)
val split_delim: regexp -> string -> string list
  (** Same as [split], but occurrences of the delimiter at the beginning 
   * and the end are returned as empty strings
   *)
val bounded_split_delim: regexp -> string -> int -> string list
  (** Splits into at most [n] substrings, based on [split_delim] *)
val full_split: regexp -> string -> split_result list
  (** Like [split_delim], but returns the delimiters in the result *)
val bounded_full_split: regexp -> string -> int -> split_result list
  (** Splits into at most [n] substrings, based on [full_split] *)

val string_before: string -> int -> string
  (** The first [n] characters of a string *)
val string_after: string -> int -> string
  (** The last [n] characters of a string *)
val first_chars: string -> int -> string
  (** Same as [string_before] *)
val last_chars: string -> int -> string
  (** Same as [string_after] *)

(* Private: *)

(* NOT NECESSARY:
 * val init_mt : (unit -> unit) -> (unit -> unit) -> unit
 * In previous versions of Netstring_str it was necessary to intialize the
 * module in a special way when used in multi-threaded environment. This
 * is no longer necessary.
 *)

module Debug : sig
  val enable : bool ref
end
