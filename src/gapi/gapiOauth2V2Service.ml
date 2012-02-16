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
    id_token : string;
    
  }
  
  let default = {
    fields = "";
    prettyPrint = true;
    quotaUser = "";
    userIp = "";
    key = "";
    access_token = "";
    id_token = "";
    
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
    param (fun p -> p.id_token) (fun x -> x) "id_token";
    
  ] |> List.concat
  
  let merge_parameters
      ?(standard_parameters = GapiService.StandardParameters.default)
      ?(access_token = default.access_token)
      ?(id_token = default.id_token)
      () =
    let parameters = {
      fields = standard_parameters.GapiService.StandardParameters.fields;
      prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
      quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
      userIp = standard_parameters.GapiService.StandardParameters.userIp;
      key = standard_parameters.GapiService.StandardParameters.key;
      access_token;
      id_token;
      
    } in
    if parameters = default then None else Some parameters
  
end

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
  
