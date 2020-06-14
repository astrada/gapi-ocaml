(**
 OAuth2 for TV and limited devices.

 @see <https://developers.google.com/identity/protocols/OAuth2ForDevices>
*)

module AuthorizationCode : sig
  exception RateLimitExceeded

  type t = {
    device_code : string;
    user_code : string;
    verification_url : string;
    expires_in : int;
    interval : int;
  }

  val device_code : (t, string) GapiLens.t

  val user_code : (t, string) GapiLens.t

  val verification_url : (t, string) GapiLens.t

  val expires_in : (t, int) GapiLens.t

  val interval : (t, int) GapiLens.t
end

val request_code :
  ?url:string ->
  client_id:string ->
  scope:string list ->
  GapiConversation.Session.t ->
  AuthorizationCode.t * GapiConversation.Session.t

exception AccessDenied of GapiConversation.Session.t

exception AuthorizationPending of GapiConversation.Session.t

exception SlowDown of GapiConversation.Session.t

exception InvalidClient of GapiConversation.Session.t

exception InvalidGrant of GapiConversation.Session.t

exception InvalidRequest of GapiConversation.Session.t

exception UnsupportedGrantType of GapiConversation.Session.t

val get_access_token :
  ?url:string ->
  ?grant_type:string ->
  client_id:string ->
  client_secret:string ->
  device_code:string ->
  GapiConversation.Session.t ->
  GapiAuthResponse.t * GapiConversation.Session.t

val poll_authorization_server :
  ?url:string ->
  ?grant_type:string ->
  client_id:string ->
  client_secret:string ->
  authorization_code:AuthorizationCode.t ->
  GapiConversation.Session.t ->
  GapiAuthResponse.t * GapiConversation.Session.t
