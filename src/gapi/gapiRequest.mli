(** Basic request to services.
  *)

exception NotModified of GapiConversation.Session.t
exception PreconditionFailed of GapiConversation.Session.t

type request_type =
    Query
  | Create
  | Update
  | Patch
  | Delete

val parse_empty_response : 'a -> unit

val gapi_request :
  ?post_data:GapiCore.PostData.t ->
  ?version:string ->
  ?etag:string ->
  ?media_source:GapiMediaResource.t ->
  ?parse_error:(GapiPipe.OcamlnetPipe.t -> int -> 'a) ->
  request_type ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t

