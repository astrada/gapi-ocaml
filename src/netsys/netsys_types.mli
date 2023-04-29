(* $Id$ *)

(** Types for all Netsys modules *)

(** {2 Bytes and characters} *)

(** Remember that up to OCaml-4.01 there was only the [string] type,
    and strings were mutable (although frequently used as if there were
    immutable). Since OCaml-4.02 there is the immutable [string] and
    the mutable [bytes] type.

    The general strategy for switching to the string/bytes scheme is
    to replace [string] everywhere with [bytes], and to provide
    additional functions taking strings as input or output where it
    makes sense. There are exceptions, though, e.g. when the string
    acts as a key in a data structure.

    The type name "string" also occurs in function names (e.g.
    "get_string") and in variant names (e.g. [String_case]). As we
    want to be backward compatible, we keep the old names for functions
    on [bytes], and mark them as deprecated. 
 *)

type memory = 
    (char,Bigarray.int8_unsigned_elt,Bigarray.c_layout) Bigarray.Array1.t
  (** We consider 1-dimensional bigarrays of chars as memory buffers.
      They have the useful property that the garbage collector cannot
      relocate them, i.e. the address is fixed. Also, one can mmap
      a file, and connect the bigarray with shared memory.
   *)

type tbuffer = [ `Bytes of Bytes.t | `Memory of memory | `String of Bytes.t ]
  (** A tagged buffer. Note that the [`String] case is deprecated, and only
      provided for backward compatibility.
   *)

type tstring = [ `Bytes of Bytes.t | `Memory of memory | `String of string ]
  (** A tagged string which is considered as immutable. See also the
      support module {!Netstring_tstring}.
   *)

(** See {!Netxdr_mstring.mstring} for documentation *)
class type mstring =
object
  method length : int
  method blit_to_bytes :  int -> Bytes.t -> int -> int -> unit
  method blit_to_string :  int -> Bytes.t -> int -> int -> unit
    DEPRECATED("Use blit_to_bytes instead.")
  method blit_to_memory : int -> memory -> int -> int -> unit
  method as_bytes : Bytes.t * int
  method as_string : string * int
  method as_memory : memory * int
  method preferred : [ `Memory | `Bytes ]
end



exception EAGAIN_RD
exception EAGAIN_WR
  (** A read or write cannot be done because the descriptor is in
      non-blocking mode and would block. This corresponds to the
      [Unix.EAGAIN] error but includes whether it was a read or write.

      When the read or write is possible, the interrupted function should
      simply be again called.

      These two exceptions are preferred by TLS providers.
   *)

exception TLS_switch_request
  (** The server requested a rehandshake (this exception is thrown
      in the client)
   *)

exception TLS_switch_response of bool
      (** The client accepted or denied a rehandshake (this exception is thrown
          in the server). [true] means acceptance.
       *)

exception TLS_error of string
      (** A fatal error occurred (i.e. the session needs to be terminated).
          The string is a symbol identifying the error.
       *)

exception TLS_warning of string
      (** A non-fatal error occurred. The interrupted function should be
          called again.
          The string is a symbol identifying the warning.
       *)
