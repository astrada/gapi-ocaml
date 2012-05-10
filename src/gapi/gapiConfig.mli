(** Configuration module.

  Configures Ocurl and authorization method.

  *)

(** Curl debug function used to log server interactions. *)
type debug_function =
    Standard
    (** Standard debug function that prints everything on standard output. *)
  | Custom of (Curl.t -> Curl.curlDebugType -> string -> unit)
    (** Custom debug function. *)

(** Client Login parameters. *)
type client_login_config = {
  username : string;
  (** Username of the Google account. *)
  password : string;
  (** Password of the Google account. *)
}

val username : (client_login_config, string) GapiLens.t
(** Client Login username lens. *)
val password : (client_login_config, string) GapiLens.t
(** Client Login password lens. *)

(** OAuth 1.0a parameters. *)
type oauth1_config = {
  signature_method : GapiCore.SignatureMethod.t;
  (** Signature method used to sign requests. ([HMAC_SHA1] is the only supported method) *)
  consumer_key : string;
  (** Consumer key. *)
  consumer_secret : string;
  (** Consumer secret. *)
}

val signature_method : (oauth1_config, GapiCore.SignatureMethod.t) GapiLens.t
(** OAuth1 signature method lens. *)
val consumer_key : (oauth1_config, string) GapiLens.t
(** OAuth1 consumer key lens. *)
val consumer_secret : (oauth1_config, string) GapiLens.t
(** OAuth1 consumer secret lens. *)

(** OAuth 2 parameters. *)
type oauth2_config = {
  client_id : string;
  (** Client ID. *)
  client_secret : string;
  (** Client secret. *)
}

val client_id : (oauth2_config, string) GapiLens.t
(** OAuth2 client ID lens. *)
val client_secret : (oauth2_config, string) GapiLens.t
(** OAuth2 client secret lens. *)

(** Authorization method. *)
type auth_config =
    NoAuth
    (** No authorization. *)
  | ClientLogin of client_login_config
    (** Client Login. *)
  | OAuth1 of oauth1_config
    (** OAuth1. *)
  | OAuth2 of oauth2_config
    (** OAuth2. *)

(** Library configuration. *)
type t = {
  application_name : string;
  (** Application name, used to build User-Agent HTTP header. *)
  debug : debug_function option;
  (** Debug function used to dump HTTP session. Use [None] to disable debug output. *)
  timeout : int option;
  (** Global timeout. [None] defaults to no timeout. *)
  connect_timeout : int option;
  (** Connection timeout. [None] defaults to 300 seconds. *)
  compress : bool;
  (** Compress requests. (Not yet supported) *)
  auth : auth_config;
  (** Authorization configuration. *)
  upload_chunk_size : int;
  (** Chunk default size (in bytes) used by resumable upload. Should be a multiple of 512KB. *)
}

val application_name : (t, string) GapiLens.t
(** Application name lens. *)
val debug : (t, debug_function option) GapiLens.t
(** Debug function lens. *)
val timeout : (t, int option) GapiLens.t
(** Timeout lens. *)
val connect_timeout : (t, int option) GapiLens.t
(** Connection timeout lens. *)
val compress : (t, bool) GapiLens.t
(** Compression flag lens. *)
val auth : (t, auth_config) GapiLens.t
(** Authorization configuration lens. *)
val upload_chunk_size : (t, int) GapiLens.t
(** Upload chunk size lens. *)

val default : t
(** Default configuration.

 {[let default = {
  application_name = "gapi-ocaml";
  debug = None;
  timeout = None;
  connect_timeout = None;
  compress = true;
  auth = NoAuth;
  upload_chunk_size = 10485760; (* 10MB *)
 }]}

*)

val default_debug : t
(** Default configuration with debug output enabled.

 {[let default_debug = {
  application_name = "gapi-ocaml";
  debug = Some Standard;
  timeout = None;
  connect_timeout = None;
  compress = false;
  auth = NoAuth;
  upload_chunk_size = 10485760; (* 10MB *)
 }]}

*)

