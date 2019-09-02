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

let _type = {
  GapiLens.get = (fun x -> x._type);
  GapiLens.set = (fun v x -> { x with _type = v });
}
let project_id = {
  GapiLens.get = (fun x -> x.project_id);
  GapiLens.set = (fun v x -> { x with project_id = v });
}
let private_key_id = {
  GapiLens.get = (fun x -> x.private_key_id);
  GapiLens.set = (fun v x -> { x with private_key_id = v });
}
let private_key = {
  GapiLens.get = (fun x -> x.private_key);
  GapiLens.set = (fun v x -> { x with private_key = v });
}
let client_email = {
  GapiLens.get = (fun x -> x.client_email);
  GapiLens.set = (fun v x -> { x with client_email = v });
}
let client_id = {
  GapiLens.get = (fun x -> x.client_id);
  GapiLens.set = (fun v x -> { x with client_id = v });
}
let auth_uri = {
  GapiLens.get = (fun x -> x.auth_uri);
  GapiLens.set = (fun v x -> { x with auth_uri = v });
}
let token_uri = {
  GapiLens.get = (fun x -> x.token_uri);
  GapiLens.set = (fun v x -> { x with token_uri = v });
}
let auth_provider_x509_cert_url = {
  GapiLens.get = (fun x -> x.auth_provider_x509_cert_url);
  GapiLens.set = (fun v x -> { x with auth_provider_x509_cert_url = v });
}
let client_x509_cert_url = {
  GapiLens.get = (fun x -> x.client_x509_cert_url);
  GapiLens.set = (fun v x -> { x with client_x509_cert_url = v });
}

let empty = {
  _type = "";
  project_id = "";
  private_key_id = "";
  private_key = "";
  client_email = "";
  client_id = "";
  auth_uri = "";
  token_uri = "";
  auth_provider_x509_cert_url = "";
  client_x509_cert_url = "";
}

let render_content x = 
  [GapiJson.render_string_value "type" x._type;
   GapiJson.render_string_value "project_id" x.project_id;
   GapiJson.render_string_value "private_key_id" x.private_key_id;
   GapiJson.render_string_value "private_key" x.private_key;
   GapiJson.render_string_value "client_email" x.client_email;
   GapiJson.render_string_value "client_id" x.client_id;
   GapiJson.render_string_value "auth_uri" x.auth_uri;
   GapiJson.render_string_value "token_uri" x.token_uri;
   GapiJson.render_string_value "auth_provider_x509_cert_url"
     x.auth_provider_x509_cert_url;
   GapiJson.render_string_value "client_x509_cert_url" x.client_x509_cert_url;
  ]

let render x = 
  GapiJson.render_object "" (render_content x)

let parse x = function
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
       `String v) ->
    { x with _type = v }
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "project_id"; data_type = GapiJson.Scalar },
       `String v) ->
    { x with project_id = v }
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "private_key_id"; data_type = GapiJson.Scalar },
       `String v) ->
    { x with private_key_id = v }
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "private_key"; data_type = GapiJson.Scalar },
       `String v) ->
    { x with private_key = v }
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "client_email"; data_type = GapiJson.Scalar },
       `String v) ->
    { x with client_email = v }
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "client_id"; data_type = GapiJson.Scalar },
       `String v) ->
    { x with client_id = v }
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "auth_uri"; data_type = GapiJson.Scalar },
       `String v) ->
    { x with auth_uri = v }
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "token_uri"; data_type = GapiJson.Scalar },
       `String v) ->
    { x with token_uri = v }
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "auth_provider_x509_cert_url";
         data_type = GapiJson.Scalar },
       `String v) ->
    { x with auth_provider_x509_cert_url = v }
  | GapiCore.AnnotatedTree.Leaf
      ({ GapiJson.name = "client_x509_cert_url"; data_type = GapiJson.Scalar },
       `String v) ->
    { x with client_x509_cert_url = v }
  | e ->
    GapiJson.unexpected "GapiServiceAccountCredentials.parse" e x

let to_data_model = GapiJson.render_root render

let of_data_model = GapiJson.parse_root parse empty

let to_json x = to_data_model x |> GapiJson.data_model_to_json

let parse_json json_string =
  let json = Yojson.Safe.from_string json_string in
  let tree = GapiJson.json_to_data_model json in
  of_data_model tree

let parse_json_file path =
  let json = Yojson.Safe.from_file path in
  let tree = GapiJson.json_to_data_model json in
  of_data_model tree

