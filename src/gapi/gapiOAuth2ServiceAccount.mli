(** OAuth 2.0 authorization API implementation for service accounts.
  *)

(**
 * [get_access_token path scopes]: returns the access token for the service
 * account. [service_account_data_path] is the path of the JSON file
 * containing the account data (client id, private key, etc.), [scopes] is a
 * list of the permissions that the application requests.
 *
 * @param url URL of the auth endpoint (defaults to
 * https://www.googleapis.com/oauth2/v4/token).
 * @param assertion_timestamp The time (Unix Epoch) the assertion is issued
 * (defaults to now).
 * @param assertion_expiration The time (Unix Epoch) the assertion expires
 * (defaults to now + 1 hour).
 * @param user_to_impersonate Email of the user to impersonate (for G Suite
 * domains).
 *
 * @see https://developers.google.com/identity/protocols/OAuth2ServiceAccount *)
val get_access_token :
  ?url:string ->
  ?assertion_timestamp:float ->
  ?assertion_expiration:float ->
  ?user_to_impersonate:string ->
  service_account_credentials_json:string ->
  scopes:string list ->
  GapiConversation.Session.t ->
  GapiAuthResponse.t * GapiConversation.Session.t

