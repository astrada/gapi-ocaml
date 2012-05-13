(** Common operations for Google Data Protocol services.
  *)

val query :
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val create :
  ('a -> GdataCore.xml_data_model) ->
  ?version:string ->
  ?query_parameters:(string * string) list ->
  ?media_source:GapiMediaResource.t ->
  'a ->
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
  ('a -> GdataCore.xml_data_model) ->
  ?version:string ->
  ?etag:string ->
  ?media_source:GapiMediaResource.t ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val patch :
  ('a -> GdataCore.xml_data_model) ->
  ?version:string ->
  ?etag:string ->
  ?media_source:GapiMediaResource.t ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

val delete :
  ?version:string ->
  ?etag:string ->
  ?query_parameters:(string * string) list ->
  string ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

val batch_request :
  ('a -> GdataCore.xml_data_model) ->
  ?version:string ->
  'a ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

