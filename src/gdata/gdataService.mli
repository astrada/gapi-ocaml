val query :
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val create :
  ?version:string ->
  'a ->
  ('a -> GdataCore.xml_data_model) ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val read :
  ?version:string ->
  ?etag:string ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val update :
  ?version:string ->
  ?etag:string ->
  'a ->
  ('a -> GdataCore.xml_data_model) ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val delete :
  ?version:string ->
  ?etag:string ->
  string ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val batch_request :
  ?version:string ->
  'a ->
  ('a -> GdataCore.xml_data_model) ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

