module AnnotatedTree :
sig
  type ('a, 'b) t =
      Leaf of 'a * 'b
    | Node of 'a * ('a, 'b) t list

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

  val fold :
    ('a -> 'b list -> 'b) ->
    ('a -> 'c -> 'b) ->
    ('a, 'c) t ->
    'b

end

module Value :
sig
  type t =
      Int of int
    | String of string
    | List of t list
    | Record of (string * t) list
    | Variant of string * t list

end

module Type :
sig
  type t =
      Int
    | String
    | List of t
    | Tuple of t list
    | Option of t
    | Record of (string * t) list
    | Variant of (string * t list) list

end

module HttpMethod :
sig
  type t =
      GET
    | POST
    | PUT
    | DELETE
    | PATCH

  val to_string : t -> string

end

module PostData :
sig
  type t =
      Fields of (string * string) list
    | Body of string * string

end

module Header :
sig
  type t =
      ContentType of string
    | Location of string
    | Authorization of string
    | ETag of string
    | IfNoneMatch of string
    | IfMatch of string
    | GdataVersion of string
    | KeyValueHeader of string * string
    | OtherHeader of string

  val to_string : t -> string

  val parse : string -> t

end

module SignatureMethod :
sig
  type t =
      RSA_SHA1
    | HMAC_SHA1
  
  val to_string : t -> string

end

