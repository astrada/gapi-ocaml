open GapiUtils.Infix
open GapiDiscoveryV1Model

module DiscoveryParameters =
struct
  type t = {
    (* Standard query parameters *)
    fields : string;
    prettyPrint : bool;
    quotaUser : string;
    userIp : string;
    (* Discovery-specific query parameters *)
    label : string;
    name : string;
    preferred : bool
  }

  let default = {
    fields = "";
    prettyPrint = true;
    quotaUser = "";
    userIp = "";
    label = "";
    name = "";
    preferred = false
  }

  let to_key_value_list qp =
    let param get_value to_string name =
      GapiService.build_param default qp get_value to_string name
    in
      [param (fun p -> p.fields) Std.identity "fields";
       param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
       param (fun p -> p.quotaUser) Std.identity "quotaUser";
       param (fun p -> p.userIp) Std.identity "userIp";
       param (fun p -> p.label) Std.identity "label";
       param (fun p -> p.name) Std.identity "name";
       param (fun p -> p.preferred) string_of_bool "preferred"]
      |> List.concat

  let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(label = default.label)
        ?(name = default.name)
        ?(preferred = default.preferred)
        () =
    let parameters =
      { fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        label;
        name;
        preferred
      }
    in
      if parameters = default then None else Some parameters

end

module ApisResource =
struct
  let getRest
        ?(url = "https://www.googleapis.com/discovery/v1/apis")
        ?parameters
        ~api
        ~version
        session =
    let query_parameters = GapiService.map_standard_parameters parameters in
    let url' = GapiUtils.add_path_to_url
                 [api; version; "rest"]
                 url
    in
      GapiService.query
        ?query_parameters
        url'
        (GapiJson.parse_json_response RestDescription.of_data_model)
        session
       
  let list
        ?(url = "https://www.googleapis.com/discovery/v1/apis")
        ?parameters
        ?label
        ?name
        ?preferred
        session =
    let params = DiscoveryParameters.merge_parameters
                   ?standard_parameters:parameters
                   ?label ?name ?preferred () in
    let query_parameters = Option.map
                             DiscoveryParameters.to_key_value_list
                             params
    in
      GapiService.query
        ?query_parameters
        url
        (GapiJson.parse_json_response DirectoryList.of_data_model)
        session

end

