val unexpected : GdataCore.xml_data_model -> 'a

val build_namespace_table :
  (string -> string) ->
  GdataCore.xml_data_model ->
  (string * string) list

val append_namespaces :
  (string * string) list ->
  GdataCore.xml_data_model ->
  GdataCore.xml_data_model

