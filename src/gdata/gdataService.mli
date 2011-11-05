val service_request :
  ?query_parameters:(string * string) list ->
  ?data_to_upload:GdataCore.xml_data_model ->
  ?version:string ->
  ?etag:string ->
  ?request_type:GdataRequest.request_type ->
  string ->
  (GdataPipe.OcamlnetPipe.t -> 'a) ->
  GdataConversation.Session.t ->
  'a * GdataConversation.Session.t

val service_query_with_default :
  ?version:string ->
  ?etag:string ->
  'a ->
  string ->
  (GdataPipe.OcamlnetPipe.t -> 'a) ->
  GdataConversation.Session.t ->
  'a * GdataConversation.Session.t

val service_request_with_data :
  ?version:string ->
  ?etag:string ->
  'a ->
  ('a -> GdataCore.xml_data_model) ->
  GdataRequest.request_type ->
  string ->
  (GdataPipe.OcamlnetPipe.t -> 'a) ->
  GdataConversation.Session.t ->
  'a * GdataConversation.Session.t

