val string_to_option :
  string -> string option

val unexpected : GdataCore.xml_data_model -> 'a

val build_namespace_table :
  (string -> string) ->
  GdataCore.xml_data_model ->
  (string * string) list

val append_namespaces :
  (string * string) list ->
  GdataCore.xml_data_model ->
  GdataCore.xml_data_model

val render_xml :
  Buffer.t ->
  GdataCore.xml_data_model ->
  unit

val data_to_xml_string :
  ?buffer_size:int ->
  GdataCore.xml_data_model ->
  string

val parse_xml :
  (unit -> int) ->
  (GdataCore.xml_data_model -> 'a) ->
  'a

val parse_xml_response :
  (GdataCore.xml_data_model -> 'a) ->
  GapiPipe.OcamlnetPipe.t ->
  'a

