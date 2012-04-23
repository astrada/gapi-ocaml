(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiOauth2V2Model

module UserinfoResource =
struct
  module V2 =
  struct
    module Me =
    struct
      let get
            ?(base_url = "https://www.googleapis.com/")
            ?std_params
            session =
        let full_url = GapiUtils.add_path_to_url ["userinfo"; "v2"; "me"]
          base_url in
        let params = GapiService.StandardParameters.merge_parameters
          ?standard_parameters:std_params () in
        let query_parameters = Option.map
          GapiService.StandardParameters.to_key_value_list params in
        GapiService.get ?query_parameters full_url
          (GapiJson.parse_json_response Userinfo.of_data_model) session 
        
      
    end
    
    
  end
  
  let get ?(base_url = "https://www.googleapis.com/") ?std_params session =
    let full_url = GapiUtils.add_path_to_url ["oauth2"; "v2"; "userinfo"]
      base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Userinfo.of_data_model) session 
    
  
end

module Oauth2Parameters =
struct
  type t = {
    (* Standard query parameters *)
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string;
    key : string;
    (* oauth2-specific query parameters *)
    access_token : string;
    alg : string;
    android_device_id : string;
    app_id : string;
    audience : string;
    client_id : string;
    force : bool;
    hl : string;
    id_token : string;
    origin : string;
    response_type : string;
    scope : string;
    
  }
  
  let default = {
    fields = "";
    prettyPrint = true;
    quotaUser = "";
    userIp = "";
    key = "";
    access_token = "";
    alg = "";
    android_device_id = "";
    app_id = "";
    audience = "";
    client_id = "";
    force = false;
    hl = "";
    id_token = "";
    origin = "";
    response_type = "";
    scope = "";
    
  }
  
  let to_key_value_list qp =
    let param get_value to_string name =
      GapiService.build_param default qp get_value to_string name in [
    param (fun p -> p.fields) (fun x -> x) "fields";
    param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
    param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
    param (fun p -> p.userIp) (fun x -> x) "userIp";
    param (fun p -> p.key) (fun x -> x) "key";
    param (fun p -> p.access_token) (fun x -> x) "access_token";
    param (fun p -> p.alg) (fun x -> x) "alg";
    param (fun p -> p.android_device_id) (fun x -> x) "android_device_id";
    param (fun p -> p.app_id) (fun x -> x) "app_id";
    param (fun p -> p.audience) (fun x -> x) "audience";
    param (fun p -> p.client_id) (fun x -> x) "client_id";
    param (fun p -> p.force) string_of_bool "force";
    param (fun p -> p.hl) (fun x -> x) "hl";
    param (fun p -> p.id_token) (fun x -> x) "id_token";
    param (fun p -> p.origin) (fun x -> x) "origin";
    param (fun p -> p.response_type) (fun x -> x) "response_type";
    param (fun p -> p.scope) (fun x -> x) "scope";
    
  ] |> List.concat
  
  let merge_parameters
      ?(standard_parameters = GapiService.StandardParameters.default)
      ?(access_token = default.access_token)
      ?(alg = default.alg)
      ?(android_device_id = default.android_device_id)
      ?(app_id = default.app_id)
      ?(audience = default.audience)
      ?(client_id = default.client_id)
      ?(force = default.force)
      ?(hl = default.hl)
      ?(id_token = default.id_token)
      ?(origin = default.origin)
      ?(response_type = default.response_type)
      ?(scope = default.scope)
      () =
    let parameters = {
      fields = standard_parameters.GapiService.StandardParameters.fields;
      prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
      quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
      userIp = standard_parameters.GapiService.StandardParameters.userIp;
      key = standard_parameters.GapiService.StandardParameters.key;
      access_token;
      alg;
      android_device_id;
      app_id;
      audience;
      client_id;
      force;
      hl;
      id_token;
      origin;
      response_type;
      scope;
      
    } in
    if parameters = default then None else Some parameters
  
end

let issueTokenGet
      ?(base_url = "https://www.googleapis.com/")
      ?std_params
      ?alg
      ?android_device_id
      ?app_id
      ?audience
      ?force
      ?hl
      ?origin
      ~client_id
      ~response_type
      ~scope
      session =
  let full_url = GapiUtils.add_path_to_url ["oauth2"; "v2"; "IssueToken"]
    base_url in
  let params = Oauth2Parameters.merge_parameters
    ?standard_parameters:std_params ?alg ?android_device_id ?app_id ?audience
    ~client_id ?force ?hl ?origin ~response_type ~scope () in
  let query_parameters = Option.map Oauth2Parameters.to_key_value_list params
    in
  GapiService.get ?query_parameters full_url
    (GapiJson.parse_json_response Oauth2IssueTokenV2Response.of_data_model)
    session 
  
let tokeninfo
      ?(base_url = "https://www.googleapis.com/")
      ?std_params
      ?access_token
      ?id_token
      session =
  let full_url = GapiUtils.add_path_to_url ["oauth2"; "v2"; "tokeninfo"]
    base_url in
  let params = Oauth2Parameters.merge_parameters
    ?standard_parameters:std_params ?access_token ?id_token () in
  let query_parameters = Option.map Oauth2Parameters.to_key_value_list params
    in
  GapiService.post ?query_parameters ~data:Tokeninfo.empty full_url
    (GapiJson.parse_json_response Tokeninfo.of_data_model) session 
  
