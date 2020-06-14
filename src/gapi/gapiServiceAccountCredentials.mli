type t = {
  _type : string;
  project_id : string;
  private_key_id : string;
  private_key : string;
  client_email : string;
  client_id : string;
  auth_uri : string;
  token_uri : string;
  auth_provider_x509_cert_url : string;
  client_x509_cert_url : string;
}

val _type : (t, string) GapiLens.t

val project_id : (t, string) GapiLens.t

val private_key_id : (t, string) GapiLens.t

val private_key : (t, string) GapiLens.t

val client_email : (t, string) GapiLens.t

val client_id : (t, string) GapiLens.t

val auth_uri : (t, string) GapiLens.t

val token_uri : (t, string) GapiLens.t

val auth_provider_x509_cert_url : (t, string) GapiLens.t

val client_x509_cert_url : (t, string) GapiLens.t

val to_data_model : t -> GapiJson.json_data_model

val to_json : t -> Yojson.Safe.json

val parse_json : string -> t

val parse_json_file : string -> t
