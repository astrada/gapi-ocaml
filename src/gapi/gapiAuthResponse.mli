(** Stores data from authorization responses.
  *)

module ClientLogin : sig
  type auth_token = string

  type captcha = { url : string; token : string }

  val url : (captcha, string) GapiLens.t

  val token : (captcha, string) GapiLens.t
end

module OAuth1 : sig
  type request_token = {
    request_token : string;
    request_token_secret : string;
    callback_confirmed : bool;
  }

  val request_token : (request_token, string) GapiLens.t

  val request_token_secret : (request_token, string) GapiLens.t

  val callback_confirmed : (request_token, bool) GapiLens.t

  type auth_token = { auth_token : string; verifier : string }

  val auth_token : (auth_token, string) GapiLens.t

  val verifier : (auth_token, string) GapiLens.t

  type access_token = { access_token : string; access_token_secret : string }

  val access_token : (access_token, string) GapiLens.t

  val access_token_secret : (access_token, string) GapiLens.t
end

module AuthSub : sig
  type token_info = { target : string; scope : string; secure : bool }

  val target : (token_info, string) GapiLens.t

  val scope : (token_info, string) GapiLens.t

  val secure : (token_info, bool) GapiLens.t
end

module OAuth2 : sig
  type auth_code = string

  type access_token = {
    access_token : string;
    token_type : string;
    expires_in : int;
    refresh_token : string;
  }

  val access_token : (access_token, string) GapiLens.t

  val token_type : (access_token, string) GapiLens.t

  val expires_in : (access_token, int) GapiLens.t

  val refresh_token : (access_token, string) GapiLens.t
end

type t =
  | ClientLoginAuthToken of ClientLogin.auth_token
  | ClientLoginCaptcha of ClientLogin.captcha
  | OAuth1RequestToken of OAuth1.request_token
  | OAuth1AuthorizeToken of OAuth1.auth_token
  | OAuth1GetAccessToken of OAuth1.access_token
  | AuthSubTokenInfo of AuthSub.token_info
  | OAuth2AuthCode of OAuth2.auth_code
  | OAuth2AccessToken of OAuth2.access_token

val client_login_auth_token : (t, ClientLogin.auth_token option) GapiLens.t

val client_login_captcha : (t, ClientLogin.captcha option) GapiLens.t

val oauth1_request_token : (t, OAuth1.request_token option) GapiLens.t

val oauth1_authorize_token : (t, OAuth1.auth_token option) GapiLens.t

val oauth1_get_access_token : (t, OAuth1.access_token option) GapiLens.t

val auth_sub_token_info : (t, AuthSub.token_info option) GapiLens.t

val oauth2_auth_code : (t, OAuth2.auth_code option) GapiLens.t

val oauth2_access_token : (t, OAuth2.access_token option) GapiLens.t
