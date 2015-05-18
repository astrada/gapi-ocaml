module Infix :
sig
  val ( |> ) : 'a -> ('a -> 'b) -> 'b

  val ( -| ) : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b

  val ( |- ) : ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c

end

val is_weak_etag : string -> bool

val etag_option : string -> string option

val merge_query_string : (string * string) list -> string -> string

val add_path_to_url :
  ?encoded:bool ->
  string list -> string -> string

val string_after_char : char -> string -> string

val wait_exponential_backoff : int -> unit

