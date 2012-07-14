(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiSiteVerificationV1Model

module Scope =
struct
  let siteverification = "https://www.googleapis.com/auth/siteverification"
  
  let siteverification_verify_only = "https://www.googleapis.com/auth/siteverification.verify_only"
  
  
end

module WebResourceResource =
struct
  module WebResourceParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* webResource-specific query parameters *)
      verificationMethod : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      verificationMethod = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.verificationMethod) (fun x -> x) "verificationMethod";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(verificationMethod = default.verificationMethod)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        verificationMethod;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/siteVerification/v1/")
        ?std_params
        ~id
        session =
    let full_url = GapiUtils.add_path_to_url ["webResource";
      ((fun x -> x) id)] base_url in
    let params = WebResourceParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map WebResourceParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/siteVerification/v1/")
        ?etag
        ?std_params
        ~id
        session =
    let full_url = GapiUtils.add_path_to_url ["webResource";
      ((fun x -> x) id)] base_url in
    let params = WebResourceParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map WebResourceParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response SiteVerificationWebResourceResource.of_data_model)
      session 
    
  let getToken
        ?(base_url = "https://www.googleapis.com/siteVerification/v1/")
        ?std_params
        siteVerificationWebResourceGettokenRequest
        session =
    let full_url = GapiUtils.add_path_to_url ["token"] base_url in
    let params = WebResourceParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map WebResourceParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json SiteVerificationWebResourceGettokenRequest.to_data_model)
      ~data:siteVerificationWebResourceGettokenRequest full_url
      (GapiJson.parse_json_response SiteVerificationWebResourceGettokenResponse.of_data_model)
      session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/siteVerification/v1/")
        ?std_params
        ~verificationMethod
        siteVerificationWebResourceResource
        session =
    let full_url = GapiUtils.add_path_to_url ["webResource"] base_url in
    let params = WebResourceParameters.merge_parameters
      ?standard_parameters:std_params ~verificationMethod () in
    let query_parameters = Option.map WebResourceParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json SiteVerificationWebResourceResource.to_data_model)
      ~data:siteVerificationWebResourceResource full_url
      (GapiJson.parse_json_response SiteVerificationWebResourceResource.of_data_model)
      session 
    
  let list
        ?(base_url = "https://www.googleapis.com/siteVerification/v1/")
        ?std_params
        session =
    let full_url = GapiUtils.add_path_to_url ["webResource"] base_url in
    let params = WebResourceParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map WebResourceParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response SiteVerificationWebResourceListResponse.of_data_model)
      session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/siteVerification/v1/")
        ?std_params
        ~id
        siteVerificationWebResourceResource
        session =
    let full_url = GapiUtils.add_path_to_url ["webResource";
      ((fun x -> x) id)] base_url in
    let params = WebResourceParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map WebResourceParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters
      ~data_to_post:(GapiJson.render_json SiteVerificationWebResourceResource.to_data_model)
      ~data:siteVerificationWebResourceResource full_url
      (GapiJson.parse_json_response SiteVerificationWebResourceResource.of_data_model)
      session 
    
  let update
        ?(base_url = "https://www.googleapis.com/siteVerification/v1/")
        ?std_params
        ~id
        siteVerificationWebResourceResource
        session =
    let full_url = GapiUtils.add_path_to_url ["webResource";
      ((fun x -> x) id)] base_url in
    let params = WebResourceParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map WebResourceParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters
      ~data_to_post:(GapiJson.render_json SiteVerificationWebResourceResource.to_data_model)
      ~data:siteVerificationWebResourceResource full_url
      (GapiJson.parse_json_response SiteVerificationWebResourceResource.of_data_model)
      session 
    
  
end

