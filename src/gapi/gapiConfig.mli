(** Configuration module.

  Configures Ocurl and authorization method.

  *)

type debug_function =
    Standard
  | Custom of (Curl.t -> Curl.curlDebugType -> string -> unit)

type client_login_config = {
  username : string;
  password : string;
}

val username : (client_login_config, string) GapiLens.t
val password : (client_login_config, string) GapiLens.t

type oauth1_config = {
  signature_method : GapiCore.SignatureMethod.t;
  consumer_key : string;
  consumer_secret : string;
}

val signature_method : (oauth1_config, GapiCore.SignatureMethod.t) GapiLens.t
val consumer_key : (oauth1_config, string) GapiLens.t
val consumer_secret : (oauth1_config, string) GapiLens.t

type oauth2_config = {
  client_id : string;
  client_secret : string;
}

val client_id : (oauth2_config, string) GapiLens.t
val client_secret : (oauth2_config, string) GapiLens.t

type auth_config =
    NoAuth
  | ClientLogin of client_login_config
  | OAuth1 of oauth1_config
  | OAuth2 of oauth2_config

type t = {
  application_name : string;
  debug : debug_function option;
  timeout : int option;
  connect_timeout : int option;
  compress : bool;
  auth : auth_config;
}

val application_name : (t, string) GapiLens.t
val debug : (t, debug_function option) GapiLens.t
val timeout : (t, int option) GapiLens.t
val connect_timeout : (t, int option) GapiLens.t
val compress : (t, bool) GapiLens.t
val auth : (t, auth_config) GapiLens.t

val default : t

val default_debug : t

