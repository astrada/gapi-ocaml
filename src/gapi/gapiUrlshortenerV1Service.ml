(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiUrlshortenerV1Model

module Scope =
struct
  let urlshortener = "https://www.googleapis.com/auth/urlshortener"
  
  
end

module UrlResource =
struct
  module Projection =
  struct
    type t =
      | Default
      | ANALYTICS_CLICKS
      | ANALYTICS_TOP_STRINGS
      | FULL
      
    let to_string = function
      | Default -> ""
      | ANALYTICS_CLICKS -> "ANALYTICS_CLICKS"
      | ANALYTICS_TOP_STRINGS -> "ANALYTICS_TOP_STRINGS"
      | FULL -> "FULL"
      
    let of_string = function
      | "" -> Default
      | "ANALYTICS_CLICKS" -> ANALYTICS_CLICKS
      | "ANALYTICS_TOP_STRINGS" -> ANALYTICS_TOP_STRINGS
      | "FULL" -> FULL
      | s -> failwith ("Unexpected value for Projection:" ^ s)
  
  end
  
  module UrlParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* url-specific query parameters *)
      projection : Projection.t;
      shortUrl : string;
      start_token : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      projection = Projection.Default;
      shortUrl = "";
      start_token = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.projection) Projection.to_string "projection";
      param (fun p -> p.shortUrl) (fun x -> x) "shortUrl";
      param (fun p -> p.start_token) (fun x -> x) "start-token";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(projection = default.projection)
        ?(shortUrl = default.shortUrl)
        ?(start_token = default.start_token)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        projection;
        shortUrl;
        start_token;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/urlshortener/v1/")
        ?std_params
        ?projection
        ~shortUrl
        session =
    let full_url = GapiUtils.add_path_to_url ["url"] base_url in
    let params = UrlParameters.merge_parameters
      ?standard_parameters:std_params ?projection ~shortUrl () in
    let query_parameters = Option.map UrlParameters.to_key_value_list params
      in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Url.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/urlshortener/v1/")
        ?std_params
        url
        session =
    let full_url = GapiUtils.add_path_to_url ["url"] base_url in
    let params = UrlParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map UrlParameters.to_key_value_list params
      in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json Url.to_data_model) ~data:url
      full_url (GapiJson.parse_json_response Url.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/urlshortener/v1/")
        ?std_params
        ?projection
        ?start_token
        session =
    let full_url = GapiUtils.add_path_to_url ["url"; "history"] base_url in
    let params = UrlParameters.merge_parameters
      ?standard_parameters:std_params ?projection ?start_token () in
    let query_parameters = Option.map UrlParameters.to_key_value_list params
      in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response UrlHistory.of_data_model) session 
    
  
end

