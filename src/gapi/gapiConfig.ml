type debug_function =
    Standard
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
}
let client_id = {
  GapiLens.get = (fun x -> x.client_id);
  GapiLens.set = (fun v x -> { x with client_id = v })
}
let client_secret = {
  GapiLens.get = (fun x -> x.client_secret);
  GapiLens.set = (fun v x -> { x with client_secret = v })
}
type auth_config =
    NoAuth
  | ClientLogin of client_login_config
  | OAuth1 of oauth1_config
  | OAuth2 of oauth2_config

(* TODO: proxy config? ip, port, user+pwd *)
type t = {
  application_name : string;
  debug : debug_function option;
  timeout : int option;
  connect_timeout : int option;
  compress : bool;
  auth : auth_config;
  upload_chunk_size : int;
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

let default = {
  application_name = "gapi-ocaml";
  debug = None;
  timeout = None;
  connect_timeout = None;
  compress = true;
  auth = NoAuth;
  upload_chunk_size = 10485760;
}

let default_debug = {
  application_name = "gapi-ocaml";
  debug = Some Standard;
  timeout = None;
  connect_timeout = None;
  compress = false;
  auth = NoAuth;
  upload_chunk_size = 10485760;
}

