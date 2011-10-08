exception NotModified of GdataConversation.Session.t

type request_type =
    Query
  | Create
  | Update
  | Delete

val render_xml :
  Buffer.t ->
  (GdataCore.Metadata.xml,
   GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  unit

val data_to_xml_string :
  ?buffer_size:int ->
  (GdataCore.Metadata.xml,
   GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  string

val parse_xml :
  (unit -> int) ->
  ((GdataCore.Metadata.xml,
    GdataCore.Value.t) GdataCore.AnnotatedTree.t -> 'a) ->
  'a

val parse_xml_response :
  ((GdataCore.Metadata.xml,
    GdataCore.Value.t) GdataCore.AnnotatedTree.t -> 'a) ->
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

