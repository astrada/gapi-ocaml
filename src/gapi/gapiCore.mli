(** Common types used throughout the library.
  
  This module defines the data types used to represent the data model of JSON and XML documents, and some utility types related to HTTP protocol.
  *)

val library_version : string

module AnnotatedTree : sig
  type ('a, 'b) t = Leaf of 'a * 'b | Node of 'a * ('a, 'b) t list

  val map : ('a -> 'b) -> 'a list -> 'b list

  val kfold :
    ('a -> (('b -> 'b) -> 'c) list -> ('a, 'd) t -> ('b -> 'b) -> 'c) ->
    ('a -> 'd -> ('a, 'd) t -> ('b -> 'b) -> 'c) ->
    ('a, 'd) t ->
    'c

  val xfold :
    ('a -> 'b list -> ('a, 'c) t -> 'b) ->
    ('a -> 'c -> ('a, 'c) t -> 'b) ->
    ('a, 'c) t ->
    'b

  val fold : ('a -> 'b list -> 'b) -> ('a -> 'c -> 'b) -> ('a, 'c) t -> 'b
end

module HttpMethod : sig
  type t = GET | POST | PUT | DELETE | PATCH | HEAD

  val to_string : t -> string
end

module PostData : sig
  type body =
    | String of string
    | File of string * int * int64
    | Buffer of
        (char, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t

  type t = Fields of (string * string) list | Body of body * string

  val empty : t
end

module Header : sig
  type t =
    | HttpStatus of string * int * string
    | ContentType of string
    | Location of string
    | Authorization of string
    | ETag of string
    | IfNoneMatch of string
    | IfMatch of string
    | GdataVersion of string
    | ContentRange of string
    | Range of string
    | UploadContentType of string
    | UploadContentLength of string
    | Slug of string
    | ContentLength of string
    | KeyValueHeader of string * string
    | OtherHeader of string

  val to_string : t -> string

  val parse : string -> t
end

module SignatureMethod : sig
  type t = RSA_SHA1 | HMAC_SHA1

  val to_string : t -> string
end
