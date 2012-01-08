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
            ?parameters
            session =
        let full_url = GapiUtils.add_path_to_url ["userinfo"; "v2"; "me"]
          base_url in
        let params = GapiService.StandardParameters.merge_parameters
          ?standard_parameters:parameters () in
        let query_parameters = Option.map
          GapiService.StandardParameters.to_key_value_list params in
        GapiService.get ?query_parameters full_url
          (GapiJson.parse_json_response Userinfo.of_data_model) session 
        
      
    end
    
    
  end
  
  let get ?(base_url = "https://www.googleapis.com/") ?parameters session =
    let full_url = GapiUtils.add_path_to_url ["oauth2"; "v2"; "userinfo"]
      base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:parameters () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Userinfo.of_data_model) session 
    
  
end

