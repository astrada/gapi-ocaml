val query :
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GdataConversation.Session.t ->
  'a * GdataConversation.Session.t

val create :
  ?version:string ->
  'a ->
  ('a -> GdataCore.xml_data_model) ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GdataConversation.Session.t ->
  'a * GdataConversation.Session.t

val read :
  ?version:string ->
  ?etag:string ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GdataConversation.Session.t ->
  'a * GdataConversation.Session.t

val update :
  ?version:string ->
  ?etag:string ->
  'a ->
  ('a -> GdataCore.xml_data_model) ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GdataConversation.Session.t ->
  'a * GdataConversation.Session.t

val delete :
  ?version:string ->
  ?etag:string ->
  string ->
  GdataConversation.Session.t ->
  unit * GdataConversation.Session.t

val batch_request :
  ?version:string ->
  'a ->
  ('a -> GdataCore.xml_data_model) ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GdataConversation.Session.t ->
  'a * GdataConversation.Session.t

