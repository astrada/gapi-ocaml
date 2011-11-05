module Op :
sig
  val ( |> ) : 'a -> ('a -> 'b) -> 'b

  val ( <<< ) : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b

  val ( >>> ) : ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c

end

val is_weak_etag : string -> bool

val merge_query_string : (string * string) list -> string -> string

val unexpected : GdataCore.xml_data_model -> 'a

val build_namespace_table :
  (string -> string) ->
  GdataCore.xml_data_model ->
  (string * string) list

val append_namespaces :
  (string * string) list ->
  GdataCore.xml_data_model ->
  GdataCore.xml_data_model

