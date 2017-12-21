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
  refresh_access_token : (unit -> string) option
  (** Optional external function used to get new access tokens. *)
}

val client_id : (oauth2_config, string) GapiLens.t
(** OAuth2 client ID lens. *)
val client_secret : (oauth2_config, string) GapiLens.t
(** OAuth2 client secret lens. *)
val refresh_access_token : (oauth2_config, (unit -> string) option) GapiLens.t
(** OAuth2 optional external token refresh function lens. *)

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
  max_send_speed : int64;
  (** If an upload exceeds this speed (counted in bytes per second) on cumulative average during the transfer, the transfer will pause to keep the average rate less than or equal to the parameter value. Defaults to unlimited speed. *)
  max_recv_speed : int64;
  (** If a download exceeds this speed (counted in bytes per second) on cumulative average during the transfer, the transfer will pause to keep the average rate less than or equal to the parameter value. Defaults to unlimited speed. *)
  low_speed_limit : int;
  (** It contains the average transfer speed in bytes per second that the transfer should be below during [low_speed_time] seconds for libcurl to consider it to be too slow and abort. Defaults to 0 (disabled). *)
  low_speed_time : int;
  (** It contains the time in number seconds that the transfer speed should be below the [low_speed_limit] for the library to consider it too slow and abort. Defaults to 0 (disabled). *)
  curl_no_signal : bool;
  (** If [true], libcurl will not use any functions that install signal handlers or any functions that cause signals to be sent to the process. This option is here to allow multi-threaded unix applications to still set/use all timeout options etc, without risking getting signals. Defaults to [true]. *)
  proxy: string option;
  (** Set the proxy to use. The parameter should be a string holding the host name or dotted numerical IP address. A numerical IPv6 address must be written within brackets. Defaults to [None].
    To specify port number in this string, append [:port] to the end of the host name. *)
  ssl_verifypeer: bool;
  (** When [ssl_verifypeer] is enabled, and the verification fails to prove that the certificate is authentic, the connection fails. When the option is disabled, the peer certificate verification succeeds regardless. Defaults to [true]. *)
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
val max_send_speed : (t, int64) GapiLens.t
(** Max send speed lens. *)
val max_recv_speed : (t, int64) GapiLens.t
(** Max receive speed lens. *)
val low_speed_limit : (t, int) GapiLens.t
(** Low speed limit lens. *)
val low_speed_time : (t, int) GapiLens.t
(** Low speed time lens. *)

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
  max_send_speed = 0L;
  max_recv_speed = 0L;
  low_speed_limit = 0;
  low_speed_time = 0;
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
  max_send_speed = 0L;
  max_recv_speed = 0L;
  low_speed_limit = 0;
  low_speed_time = 0;
 }]}

*)

