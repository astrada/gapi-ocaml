(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiDiscoveryV1Model

module ApisResource =
struct
  module ApisParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* apis-specific query parameters *)
      name : string;
      preferred : bool;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      name = "";
      preferred = false;
      
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
      param (fun p -> p.name) (fun x -> x) "name";
      param (fun p -> p.preferred) string_of_bool "preferred";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(name = default.name)
        ?(preferred = default.preferred)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        name;
        preferred;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let getRest
        ?(base_url = "https://www.googleapis.com/discovery/v1/")
        ?std_params
        ~api
        ~version
        session =
    let full_url = GapiUtils.add_path_to_url ["apis"; ((fun x -> x) api);
      ((fun x -> x) version); "rest"] base_url in
    let params = ApisParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map ApisParameters.to_key_value_list params
      in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response RestDescription.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/discovery/v1/")
        ?std_params
        ?(preferred = false)
        ?name
        session =
    let full_url = GapiUtils.add_path_to_url ["apis"] base_url in
    let params = ApisParameters.merge_parameters
      ?standard_parameters:std_params ?name ~preferred () in
    let query_parameters = Option.map ApisParameters.to_key_value_list params
      in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response DirectoryList.of_data_model) session 
    
  
end

