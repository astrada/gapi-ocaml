exception NotModified of GdataConversation.Session.t

type request_type =
    Query
  | Create
  | Update
  | Delete

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
  GdataPipe.OcamlnetPipe.t ->
  'a

val parse_empty_response : 'a -> unit

val gdata_request :
  ?post_data:GdataCore.PostData.t ->
  ?version:string ->
  ?etag:string ->
  request_type ->
  string ->
  (GdataPipe.OcamlnetPipe.t -> 'a) ->
  GdataConversation.Session.t ->
  'a * GdataConversation.Session.t
