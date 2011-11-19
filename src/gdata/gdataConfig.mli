type debug_function =
    Standard
  | Custom of (Curl.t -> Curl.curlDebugType -> string -> unit)

type client_login_config =
    { username : string;
      password : string }

type oauth1_config =
    { signature_method : GapiCore.SignatureMethod.t;
      consumer_key : string;
      consumer_secret : string }

type oauth2_config =
    { client_id : string;
      client_secret : string }

type auth_config =
    NoAuth
  | ClientLogin of client_login_config
  | OAuth1 of oauth1_config
  | OAuth2 of oauth2_config

type t =
    { debug : debug_function option;
      timeout : int option;
      connect_timeout : int option;
      compress : bool;
      auth : auth_config }

val default : t

val default_debug : t

