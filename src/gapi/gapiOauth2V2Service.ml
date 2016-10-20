(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiOauth2V2Model

module Scope =
struct
  let plus_login = "https://www.googleapis.com/auth/plus.login"
  
  let plus_me = "https://www.googleapis.com/auth/plus.me"
  
  let userinfo_email = "https://www.googleapis.com/auth/userinfo.email"
  
  let userinfo_profile = "https://www.googleapis.com/auth/userinfo.profile"
  
  
end

module UserinfoResource =
struct
  module V2 =
  struct
    module Me =
    struct
      let get
            ?(base_url = "https://www.googleapis.com/")
            ?etag
            ?std_params
            session =
        let full_url = GapiUtils.add_path_to_url ["userinfo"; "v2"; "me"]
          base_url in
        let params = GapiService.StandardParameters.merge_parameters
          ?standard_parameters:std_params () in
        let query_parameters = Option.map
          GapiService.StandardParameters.to_key_value_list params in
        GapiService.get ?query_parameters ?etag full_url
          (GapiJson.parse_json_response Userinfoplus.of_data_model) session 
        
      
    end
    
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/")
        ?etag
        ?std_params
        session =
    let full_url = GapiUtils.add_path_to_url ["oauth2"; "v2"; "userinfo"]
      base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Userinfoplus.of_data_model) session 
    
  
end

module Oauth2Parameters =
struct
  type t = {
    (* Standard query parameters *)
    alt : string;
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string;
    key : string;
    (* oauth2-specific query parameters *)
    access_token : string;
    id_token : string;
    token_handle : string;
    
  }
  
  let default = {
    alt = "";
    fields = "";
    prettyPrint = true;
    quotaUser = "";
    userIp = "";
    key = "";
    access_token = "";
    id_token = "";
    token_handle = "";
    
  }
  
  let to_key_value_list qp =
    let param get_value to_string name =
      GapiService.build_param default qp get_value to_string name in [
    param (fun p -> p.alt) (fun x -> x) "alt";
    param (fun p -> p.fields) (fun x -> x) "fields";
    param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
    param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
    param (fun p -> p.userIp) (fun x -> x) "userIp";
    param (fun p -> p.key) (fun x -> x) "key";
    param (fun p -> p.access_token) (fun x -> x) "access_token";
    param (fun p -> p.id_token) (fun x -> x) "id_token";
    param (fun p -> p.token_handle) (fun x -> x) "token_handle";
    
  ] |> List.concat
  
  let merge_parameters
      ?(standard_parameters = GapiService.StandardParameters.default)
      ?(access_token = default.access_token)
      ?(id_token = default.id_token)
      ?(token_handle = default.token_handle)
      () =
    let parameters = {
      alt = standard_parameters.GapiService.StandardParameters.alt;
      fields = standard_parameters.GapiService.StandardParameters.fields;
      prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
      quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
      userIp = standard_parameters.GapiService.StandardParameters.userIp;
      key = standard_parameters.GapiService.StandardParameters.key;
      access_token;
      id_token;
      token_handle;
      
    } in
    if parameters = default then None else Some parameters
  
end

let getCertForOpenIdConnect
      ?(base_url = "https://www.googleapis.com/")
      ?std_params
      session =
  let full_url = GapiUtils.add_path_to_url ["oauth2"; "v2"; "certs"] base_url
    in
  let params = Oauth2Parameters.merge_parameters
    ?standard_parameters:std_params () in
  let query_parameters = Option.map Oauth2Parameters.to_key_value_list params
    in
  GapiService.get ?query_parameters full_url
    (GapiJson.parse_json_response Jwk.of_data_model) session 
  
let tokeninfo
      ?(base_url = "https://www.googleapis.com/")
      ?std_params
      ?access_token
      ?id_token
      ?token_handle
      session =
  let full_url = GapiUtils.add_path_to_url ["oauth2"; "v2"; "tokeninfo"]
    base_url in
  let params = Oauth2Parameters.merge_parameters
    ?standard_parameters:std_params ?access_token ?id_token ?token_handle ()
    in
  let query_parameters = Option.map Oauth2Parameters.to_key_value_list params
    in
  GapiService.post ?query_parameters ~data:Tokeninfo.empty full_url
    (GapiJson.parse_json_response Tokeninfo.of_data_model) session 
  
