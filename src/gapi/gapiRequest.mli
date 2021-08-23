(** Basic request to services.
  *)

exception NotModified of GapiConversation.Session.t

exception
  BadRequest of GapiConversation.Session.t * int * GapiPipe.OcamlnetPipe.t

exception
  Unauthorized of GapiConversation.Session.t * int * GapiPipe.OcamlnetPipe.t

exception PermissionDenied of GapiConversation.Session.t

exception
  Forbidden of GapiConversation.Session.t * int * GapiPipe.OcamlnetPipe.t

exception NotFound of GapiConversation.Session.t * int * GapiPipe.OcamlnetPipe.t

exception RequestTimeout of GapiConversation.Session.t

exception Conflict of GapiConversation.Session.t

exception Gone of GapiConversation.Session.t

exception PreconditionFailed of GapiConversation.Session.t

exception
  TooManyRequests of GapiConversation.Session.t * int * GapiPipe.OcamlnetPipe.t

exception
  InternalServerError of
    GapiConversation.Session.t * int * GapiPipe.OcamlnetPipe.t

exception
  ServiceUnavailable of
    GapiConversation.Session.t * int * GapiPipe.OcamlnetPipe.t

exception RefreshTokenFailed of GapiConversation.Session.t

type request_type = Query | Create | Update | Patch | Delete | QueryMeta

val parse_empty_response : 'a -> unit

val gapi_request :
  ?post_data:GapiCore.PostData.t ->
  ?version:string ->
  ?etag:string ->
  ?media_source:GapiMediaResource.t ->
  ?media_download:GapiMediaResource.download ->
  ?custom_headers:GapiCore.Header.t list ->
  ?parse_error:
    (GapiPipe.OcamlnetPipe.t -> int -> GapiConversation.Session.t -> 'a) ->
  request_type ->
  string ->
  (GapiPipe.OcamlnetPipe.t -> GapiCore.Header.t list -> 'a) ->
  GapiConversation.Session.t ->
  'a * GapiConversation.Session.t
