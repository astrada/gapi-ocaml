val service_request :
  ?data_to_upload:(GdataCore.Metadata.xml,
                   GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
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
  ('a -> (GdataCore.Metadata.xml,
          GdataCore.Value.t) GdataCore.AnnotatedTree.t) ->
  GdataRequest.request_type ->
  string ->
  (GdataPipe.OcamlnetPipe.t -> 'a) ->
  GdataConversation.Session.t ->
  'a * GdataConversation.Session.t

