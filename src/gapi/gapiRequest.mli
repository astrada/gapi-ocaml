exception NotModified of GapiConversation.Session.t

type request_type =
    Query
  | Create
  | Update
  | Delete

val parse_empty_response : 'a -> unit

val gapi_request :
  ?post_data:GapiCore.PostData.t ->
  ?version:string ->
  ?etag:string ->
  request_type ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

