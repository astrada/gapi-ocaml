(** OAuth 2.0 authorization API implementation.
  *)

val parse_token_info :
  GapiPipe.OcamlnetPipe.t -> GapiAuthResponse.t

val parse_error :
  GapiPipe.OcamlnetPipe.t -> int -> 'a

val authorization_code_url :
  ?base_url:string ->
  ?access_type:string ->
  ?approval_prompt:string ->
  ?state:string ->
  redirect_uri:string ->
  scope:string list ->
  response_type:string ->
  string ->
  string

val get_access_token :
  ?url:string ->
  ?grant_type:string ->
  client_id:string ->
  client_secret:string ->
  code:string ->
  redirect_uri:string ->
  GapiConversation.Session.t ->
  GapiAuthResponse.t * GapiConversation.Session.t

val refresh_access_token :
  ?url:string ->
  ?grant_type:string ->
  client_id:string ->
  client_secret:string ->
  refresh_token:string ->
  GapiConversation.Session.t ->
  GapiAuthResponse.t * GapiConversation.Session.t

val revoke_token :
  ?url:string ->
  refresh_token:string ->
  GapiConversation.Session.t ->
  unit * GapiConversation.Session.t

