(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiPagespeedonlineV1Model

module PagespeedapiResource =
struct
  module Strategy =
  struct
    type t =
      | Default
      | Desktop
      | Mobile
      
    let to_string = function
      | Default -> ""
      | Desktop -> "desktop"
      | Mobile -> "mobile"
      
    let of_string = function
      | "" -> Default
      | "desktop" -> Desktop
      | "mobile" -> Mobile
      | s -> failwith ("Unexpected value for Strategy:" ^ s)
  
  end
  
  module PagespeedapiParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* pagespeedapi-specific query parameters *)
      locale : string;
      rule : string list;
      screenshot : bool;
      strategy : Strategy.t;
      url : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      locale = "";
      rule = [];
      screenshot = false;
      strategy = Strategy.Default;
      url = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.locale) (fun x -> x) "locale";
      GapiService.build_params qp (fun p -> p.rule) (fun x -> x) "rule";
      param (fun p -> p.screenshot) string_of_bool "screenshot";
      param (fun p -> p.strategy) Strategy.to_string "strategy";
      param (fun p -> p.url) (fun x -> x) "url";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(locale = default.locale)
        ?(rule = default.rule)
        ?(screenshot = default.screenshot)
        ?(strategy = default.strategy)
        ?(url = default.url)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        locale;
        rule;
        screenshot;
        strategy;
        url;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let runpagespeed
        ?(base_url = "https://www.googleapis.com/pagespeedonline/v1/")
        ?std_params
        ?(screenshot = false)
        ?locale
        ?rule
        ?strategy
        ~url
        session =
    let full_url = GapiUtils.add_path_to_url ["runPagespeed"] base_url in
    let params = PagespeedapiParameters.merge_parameters
      ?standard_parameters:std_params ?locale ?rule ~screenshot ?strategy
      ~url () in
    let query_parameters = Option.map
      PagespeedapiParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Result.of_data_model) session 
    
  
end

