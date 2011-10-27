module Op :
sig
  val ( |> ) : 'a -> ('a -> 'b) -> 'b

  val ( <<< ) : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b

  val ( >>> ) : ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c

end

val is_weak_etag : string -> bool

val merge_query_string : (string * string) list -> string -> string

