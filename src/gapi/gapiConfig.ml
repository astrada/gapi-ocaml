type debug_function =
  | Standard
  | Custom of (Curl.t -> Curl.curlDebugType -> string -> unit)

type client_login_config = {
  username : string;
  password : string;
}
let username = {
  GapiLens.get = (fun x -> x.username);
  GapiLens.set = (fun v x -> { x with username = v })
}
let password = {
  GapiLens.get = (fun x -> x.password);
  GapiLens.set = (fun v x -> { x with password = v })
}

type oauth1_config = {
  signature_method : GapiCore.SignatureMethod.t;
  consumer_key : string;
  consumer_secret : string;
}
let signature_method = {
  GapiLens.get = (fun x -> x.signature_method);
  GapiLens.set = (fun v x -> { x with signature_method = v })
}
let consumer_key = {
  GapiLens.get = (fun x -> x.consumer_key);
  GapiLens.set = (fun v x -> { x with consumer_key = v })
}
let consumer_secret = {
  GapiLens.get = (fun x -> x.consumer_secret);
  GapiLens.set = (fun v x -> { x with consumer_secret = v })
}

type oauth2_config = {
  client_id : string;
  client_secret : string;
  refresh_access_token : (unit -> string) option
}
let client_id = {
  GapiLens.get = (fun x -> x.client_id);
  GapiLens.set = (fun v x -> { x with client_id = v })
}
let client_secret = {
  GapiLens.get = (fun x -> x.client_secret);
  GapiLens.set = (fun v x -> { x with client_secret = v })
}
let refresh_access_token = {
  GapiLens.get = (fun x -> x.refresh_access_token);
  GapiLens.set = (fun v x -> { x with refresh_access_token = v })
}

type oauth2_service_account_config = {
  service_account_credentials_json : string;
  scopes : string list;
  user_to_impersonate : string option;
  refresh_service_account_access_token : (unit -> string) option
}
let service_account_credentials_json = {
  GapiLens.get = (fun x -> x.service_account_credentials_json);
  GapiLens.set = (fun v x -> { x with service_account_credentials_json = v })
}
let scopes = {
  GapiLens.get = (fun x -> x.scopes);
  GapiLens.set = (fun v x -> { x with scopes = v })
}
let user_to_impersonate = {
  GapiLens.get = (fun x -> x.user_to_impersonate);
  GapiLens.set = (fun v x -> { x with user_to_impersonate = v })
}
let refresh_service_account_access_token = {
  GapiLens.get = (fun x -> x.refresh_service_account_access_token);
  GapiLens.set = (fun v x -> { x with refresh_service_account_access_token = v })
}

type auth_config =
    NoAuth
  | ClientLogin of client_login_config
  | OAuth1 of oauth1_config
  | OAuth2 of oauth2_config
  | OAuth2ServiceAccount of oauth2_service_account_config

(* TODO: proxy config? ip, port, user+pwd *)
type t = {
  application_name : string;
  debug : debug_function option;
  timeout : int option;
  connect_timeout : int option;
  compress : bool;
  auth : auth_config;
  upload_chunk_size : int;
  max_send_speed : int64;
  max_recv_speed : int64;
  low_speed_limit : int;
  low_speed_time : int;
  curl_no_signal : bool;
  proxy: string option;
  ssl_verifypeer: bool;
}

let application_name = {
  GapiLens.get = (fun x -> x.application_name);
  GapiLens.set = (fun v x -> { x with application_name = v })
}
let debug = {
  GapiLens.get = (fun x -> x.debug);
  GapiLens.set = (fun v x -> { x with debug = v })
}
let timeout = {
  GapiLens.get = (fun x -> x.timeout);
  GapiLens.set = (fun v x -> { x with timeout = v })
}
let connect_timeout = {
  GapiLens.get = (fun x -> x.connect_timeout);
  GapiLens.set = (fun v x -> { x with connect_timeout = v })
}
let compress = {
  GapiLens.get = (fun x -> x.compress);
  GapiLens.set = (fun v x -> { x with compress = v })
}
let auth = {
  GapiLens.get = (fun x -> x.auth);
  GapiLens.set = (fun v x -> { x with auth = v })
}
let upload_chunk_size = {
  GapiLens.get = (fun x -> x.upload_chunk_size);
  GapiLens.set = (fun v x -> { x with upload_chunk_size = v })
}
let max_send_speed = {
  GapiLens.get = (fun x -> x.max_send_speed);
  GapiLens.set = (fun v x -> { x with max_send_speed = v })
}
let max_recv_speed = {
  GapiLens.get = (fun x -> x.max_recv_speed);
  GapiLens.set = (fun v x -> { x with max_recv_speed = v })
}
let low_speed_limit = {
  GapiLens.get = (fun x -> x.low_speed_limit);
  GapiLens.set = (fun v x -> { x with low_speed_limit = v })
}
let low_speed_time = {
  GapiLens.get = (fun x -> x.low_speed_time);
  GapiLens.set = (fun v x -> { x with low_speed_time = v })
}
let curl_no_signal = {
  GapiLens.get = (fun x -> x.curl_no_signal);
  GapiLens.set = (fun v x -> { x with curl_no_signal = v })
}
let proxy = {
  GapiLens.get = (fun x -> x.proxy);
  GapiLens.set = (fun v x -> { x with proxy = v })
}
let ssl_verifypeer = {
  GapiLens.get = (fun x -> x.ssl_verifypeer);
  GapiLens.set = (fun v x -> { x with ssl_verifypeer = v })
}

let default = {
  application_name = "gapi-ocaml";
  debug = None;
  timeout = None;
  connect_timeout = None;
  compress = true;
  auth = NoAuth;
  upload_chunk_size = 10485760;
  max_send_speed = 0L;
  max_recv_speed = 0L;
  low_speed_limit = 0;
  low_speed_time = 0;
  curl_no_signal = true;
  proxy = None;
  ssl_verifypeer = true;
}

let default_debug = {
  application_name = "gapi-ocaml";
  debug = Some Standard;
  timeout = None;
  connect_timeout = None;
  compress = false;
  auth = NoAuth;
  upload_chunk_size = 10485760;
  max_send_speed = 0L;
  max_recv_speed = 0L;
  low_speed_limit = 0;
  low_speed_time = 0;
  curl_no_signal = true;
  proxy = None;
  ssl_verifypeer = true;
}

