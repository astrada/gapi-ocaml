(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiAnalyticsV3Model

module Scope =
struct
  let analytics = "https://www.googleapis.com/auth/analytics"
  
  let analytics_edit = "https://www.googleapis.com/auth/analytics.edit"
  
  let analytics_manage_users = "https://www.googleapis.com/auth/analytics.manage.users"
  
  let analytics_manage_users_readonly = "https://www.googleapis.com/auth/analytics.manage.users.readonly"
  
  let analytics_provision = "https://www.googleapis.com/auth/analytics.provision"
  
  let analytics_readonly = "https://www.googleapis.com/auth/analytics.readonly"
  
  
end

module DataResource =
struct
  module Ga =
  struct
    module Output =
    struct
      type t =
        | Default
        | DataTable
        | Json
        
      let to_string = function
        | Default -> ""
        | DataTable -> "dataTable"
        | Json -> "json"
        
      let of_string = function
        | "" -> Default
        | "dataTable" -> DataTable
        | "json" -> Json
        | s -> failwith ("Unexpected value for Output:" ^ s)
    
    end
    
    module SamplingLevel =
    struct
      type t =
        | Default
        | DEFAULT
        | FASTER
        | HIGHER_PRECISION
        
      let to_string = function
        | Default -> ""
        | DEFAULT -> "DEFAULT"
        | FASTER -> "FASTER"
        | HIGHER_PRECISION -> "HIGHER_PRECISION"
        
      let of_string = function
        | "" -> Default
        | "DEFAULT" -> DEFAULT
        | "FASTER" -> FASTER
        | "HIGHER_PRECISION" -> HIGHER_PRECISION
        | s -> failwith ("Unexpected value for SamplingLevel:" ^ s)
    
    end
    
    module GaParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* ga-specific query parameters *)
        dimensions : string;
        end_date : string;
        filters : string;
        ids : string;
        include_empty_rows : bool;
        max_results : int;
        metrics : string;
        output : Output.t;
        samplingLevel : SamplingLevel.t;
        segment : string;
        sort : string;
        start_date : string;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        dimensions = "";
        end_date = "";
        filters = "";
        ids = "";
        include_empty_rows = false;
        max_results = 0;
        metrics = "";
        output = Output.Default;
        samplingLevel = SamplingLevel.Default;
        segment = "";
        sort = "";
        start_date = "";
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.dimensions) (fun x -> x) "dimensions";
        param (fun p -> p.end_date) (fun x -> x) "end-date";
        param (fun p -> p.filters) (fun x -> x) "filters";
        param (fun p -> p.ids) (fun x -> x) "ids";
        param (fun p -> p.include_empty_rows) string_of_bool "include-empty-rows";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.metrics) (fun x -> x) "metrics";
        param (fun p -> p.output) Output.to_string "output";
        param (fun p -> p.samplingLevel) SamplingLevel.to_string "samplingLevel";
        param (fun p -> p.segment) (fun x -> x) "segment";
        param (fun p -> p.sort) (fun x -> x) "sort";
        param (fun p -> p.start_date) (fun x -> x) "start-date";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(dimensions = default.dimensions)
          ?(end_date = default.end_date)
          ?(filters = default.filters)
          ?(ids = default.ids)
          ?(include_empty_rows = default.include_empty_rows)
          ?(max_results = default.max_results)
          ?(metrics = default.metrics)
          ?(output = default.output)
          ?(samplingLevel = default.samplingLevel)
          ?(segment = default.segment)
          ?(sort = default.sort)
          ?(start_date = default.start_date)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          dimensions;
          end_date;
          filters;
          ids;
          include_empty_rows;
          max_results;
          metrics;
          output;
          samplingLevel;
          segment;
          sort;
          start_date;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ?dimensions
          ?filters
          ?include_empty_rows
          ?max_results
          ?output
          ?samplingLevel
          ?segment
          ?sort
          ?start_index
          ~ids
          ~start_date
          ~end_date
          ~metrics
          session =
      let full_url = GapiUtils.add_path_to_url ["data"; "ga"] base_url in
      let params = GaParameters.merge_parameters
        ?standard_parameters:std_params ?dimensions ~end_date ?filters ~ids
        ?include_empty_rows ?max_results ~metrics ?output ?samplingLevel
        ?segment ?sort ~start_date ?start_index () in
      let query_parameters = Option.map GaParameters.to_key_value_list params
        in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response GaData.of_data_model) session 
      
    
  end
  
  module Mcf =
  struct
    module SamplingLevel =
    struct
      type t =
        | Default
        | DEFAULT
        | FASTER
        | HIGHER_PRECISION
        
      let to_string = function
        | Default -> ""
        | DEFAULT -> "DEFAULT"
        | FASTER -> "FASTER"
        | HIGHER_PRECISION -> "HIGHER_PRECISION"
        
      let of_string = function
        | "" -> Default
        | "DEFAULT" -> DEFAULT
        | "FASTER" -> FASTER
        | "HIGHER_PRECISION" -> HIGHER_PRECISION
        | s -> failwith ("Unexpected value for SamplingLevel:" ^ s)
    
    end
    
    module McfParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* mcf-specific query parameters *)
        dimensions : string;
        end_date : string;
        filters : string;
        ids : string;
        max_results : int;
        metrics : string;
        samplingLevel : SamplingLevel.t;
        sort : string;
        start_date : string;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        dimensions = "";
        end_date = "";
        filters = "";
        ids = "";
        max_results = 0;
        metrics = "";
        samplingLevel = SamplingLevel.Default;
        sort = "";
        start_date = "";
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.dimensions) (fun x -> x) "dimensions";
        param (fun p -> p.end_date) (fun x -> x) "end-date";
        param (fun p -> p.filters) (fun x -> x) "filters";
        param (fun p -> p.ids) (fun x -> x) "ids";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.metrics) (fun x -> x) "metrics";
        param (fun p -> p.samplingLevel) SamplingLevel.to_string "samplingLevel";
        param (fun p -> p.sort) (fun x -> x) "sort";
        param (fun p -> p.start_date) (fun x -> x) "start-date";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(dimensions = default.dimensions)
          ?(end_date = default.end_date)
          ?(filters = default.filters)
          ?(ids = default.ids)
          ?(max_results = default.max_results)
          ?(metrics = default.metrics)
          ?(samplingLevel = default.samplingLevel)
          ?(sort = default.sort)
          ?(start_date = default.start_date)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          dimensions;
          end_date;
          filters;
          ids;
          max_results;
          metrics;
          samplingLevel;
          sort;
          start_date;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ?dimensions
          ?filters
          ?max_results
          ?samplingLevel
          ?sort
          ?start_index
          ~ids
          ~start_date
          ~end_date
          ~metrics
          session =
      let full_url = GapiUtils.add_path_to_url ["data"; "mcf"] base_url in
      let params = McfParameters.merge_parameters
        ?standard_parameters:std_params ?dimensions ~end_date ?filters ~ids
        ?max_results ~metrics ?samplingLevel ?sort ~start_date ?start_index
        () in
      let query_parameters = Option.map McfParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response McfData.of_data_model) session 
      
    
  end
  
  module Realtime =
  struct
    module RealtimeParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* realtime-specific query parameters *)
        dimensions : string;
        filters : string;
        ids : string;
        max_results : int;
        metrics : string;
        sort : string;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        dimensions = "";
        filters = "";
        ids = "";
        max_results = 0;
        metrics = "";
        sort = "";
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.dimensions) (fun x -> x) "dimensions";
        param (fun p -> p.filters) (fun x -> x) "filters";
        param (fun p -> p.ids) (fun x -> x) "ids";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.metrics) (fun x -> x) "metrics";
        param (fun p -> p.sort) (fun x -> x) "sort";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(dimensions = default.dimensions)
          ?(filters = default.filters)
          ?(ids = default.ids)
          ?(max_results = default.max_results)
          ?(metrics = default.metrics)
          ?(sort = default.sort)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          dimensions;
          filters;
          ids;
          max_results;
          metrics;
          sort;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ?dimensions
          ?filters
          ?max_results
          ?sort
          ~ids
          ~metrics
          session =
      let full_url = GapiUtils.add_path_to_url ["data"; "realtime"] base_url
        in
      let params = RealtimeParameters.merge_parameters
        ?standard_parameters:std_params ?dimensions ?filters ~ids
        ?max_results ~metrics ?sort () in
      let query_parameters = Option.map RealtimeParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response RealtimeData.of_data_model) session 
      
    
  end
  
  
end

module ManagementResource =
struct
  module AccountSummaries =
  struct
    module AccountSummariesParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* accountSummaries-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          session =
      let full_url = GapiUtils.add_path_to_url ["management";
        "accountSummaries"] base_url in
      let params = AccountSummariesParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        AccountSummariesParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response AccountSummaries.of_data_model) session 
      
    
  end
  
  module AccountUserLinks =
  struct
    module AccountUserLinksParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* accountUserLinks-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let delete
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~linkId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "entityUserLinks"; ((fun x -> x) linkId)]
        base_url in
      let params = AccountUserLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        AccountUserLinksParameters.to_key_value_list params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          entityUserLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "entityUserLinks"] base_url in
      let params = AccountUserLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        AccountUserLinksParameters.to_key_value_list params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json EntityUserLink.to_data_model)
        ~data:entityUserLink full_url
        (GapiJson.parse_json_response EntityUserLink.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "entityUserLinks"] base_url in
      let params = AccountUserLinksParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        AccountUserLinksParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response EntityUserLinks.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~linkId
          entityUserLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "entityUserLinks"; ((fun x -> x) linkId)]
        base_url in
      let params = AccountUserLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        AccountUserLinksParameters.to_key_value_list params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json EntityUserLink.to_data_model)
        ~data:entityUserLink full_url
        (GapiJson.parse_json_response EntityUserLink.of_data_model) session 
      
    
  end
  
  module Accounts =
  struct
    module AccountsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* accounts-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts"]
        base_url in
      let params = AccountsParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map AccountsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response Accounts.of_data_model) session 
      
    
  end
  
  module CustomDataSources =
  struct
    module CustomDataSourcesParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* customDataSources-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDataSources"] base_url in
      let params = CustomDataSourcesParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        CustomDataSourcesParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response CustomDataSources.of_data_model)
        session 
      
    
  end
  
  module CustomDimensions =
  struct
    module CustomDimensionsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* customDimensions-specific query parameters *)
        ignoreCustomDataSourceLinks : bool;
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        ignoreCustomDataSourceLinks = false;
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.ignoreCustomDataSourceLinks) string_of_bool "ignoreCustomDataSourceLinks";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(ignoreCustomDataSourceLinks = default.ignoreCustomDataSourceLinks)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          ignoreCustomDataSourceLinks;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ~accountId
          ~webPropertyId
          ~customDimensionId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDimensions";
        ((fun x -> x) customDimensionId)] base_url in
      let params = CustomDimensionsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        CustomDimensionsParameters.to_key_value_list params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response CustomDimension.of_data_model) session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          customDimension
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDimensions"] base_url in
      let params = CustomDimensionsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        CustomDimensionsParameters.to_key_value_list params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json CustomDimension.to_data_model)
        ~data:customDimension full_url
        (GapiJson.parse_json_response CustomDimension.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDimensions"] base_url in
      let params = CustomDimensionsParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        CustomDimensionsParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response CustomDimensions.of_data_model) session 
      
    let patch
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?(ignoreCustomDataSourceLinks = false)
          ~accountId
          ~webPropertyId
          ~customDimensionId
          customDimension
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDimensions";
        ((fun x -> x) customDimensionId)] base_url in
      let params = CustomDimensionsParameters.merge_parameters
        ?standard_parameters:std_params ~ignoreCustomDataSourceLinks () in
      let query_parameters = Option.map
        CustomDimensionsParameters.to_key_value_list params in
      GapiService.patch ?query_parameters
        ~data_to_post:(GapiJson.render_json CustomDimension.to_data_model)
        ~data:customDimension full_url
        (GapiJson.parse_json_response CustomDimension.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?(ignoreCustomDataSourceLinks = false)
          ~accountId
          ~webPropertyId
          ~customDimensionId
          customDimension
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDimensions";
        ((fun x -> x) customDimensionId)] base_url in
      let params = CustomDimensionsParameters.merge_parameters
        ?standard_parameters:std_params ~ignoreCustomDataSourceLinks () in
      let query_parameters = Option.map
        CustomDimensionsParameters.to_key_value_list params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json CustomDimension.to_data_model)
        ~data:customDimension full_url
        (GapiJson.parse_json_response CustomDimension.of_data_model) session 
      
    
  end
  
  module CustomMetrics =
  struct
    module CustomMetricsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* customMetrics-specific query parameters *)
        ignoreCustomDataSourceLinks : bool;
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        ignoreCustomDataSourceLinks = false;
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.ignoreCustomDataSourceLinks) string_of_bool "ignoreCustomDataSourceLinks";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(ignoreCustomDataSourceLinks = default.ignoreCustomDataSourceLinks)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          ignoreCustomDataSourceLinks;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ~accountId
          ~webPropertyId
          ~customMetricId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customMetrics";
        ((fun x -> x) customMetricId)] base_url in
      let params = CustomMetricsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        CustomMetricsParameters.to_key_value_list params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response CustomMetric.of_data_model) session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          customMetric
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customMetrics"] base_url in
      let params = CustomMetricsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        CustomMetricsParameters.to_key_value_list params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json CustomMetric.to_data_model)
        ~data:customMetric full_url
        (GapiJson.parse_json_response CustomMetric.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customMetrics"] base_url in
      let params = CustomMetricsParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        CustomMetricsParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response CustomMetrics.of_data_model) session 
      
    let patch
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?(ignoreCustomDataSourceLinks = false)
          ~accountId
          ~webPropertyId
          ~customMetricId
          customMetric
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customMetrics";
        ((fun x -> x) customMetricId)] base_url in
      let params = CustomMetricsParameters.merge_parameters
        ?standard_parameters:std_params ~ignoreCustomDataSourceLinks () in
      let query_parameters = Option.map
        CustomMetricsParameters.to_key_value_list params in
      GapiService.patch ?query_parameters
        ~data_to_post:(GapiJson.render_json CustomMetric.to_data_model)
        ~data:customMetric full_url
        (GapiJson.parse_json_response CustomMetric.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?(ignoreCustomDataSourceLinks = false)
          ~accountId
          ~webPropertyId
          ~customMetricId
          customMetric
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customMetrics";
        ((fun x -> x) customMetricId)] base_url in
      let params = CustomMetricsParameters.merge_parameters
        ?standard_parameters:std_params ~ignoreCustomDataSourceLinks () in
      let query_parameters = Option.map
        CustomMetricsParameters.to_key_value_list params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json CustomMetric.to_data_model)
        ~data:customMetric full_url
        (GapiJson.parse_json_response CustomMetric.of_data_model) session 
      
    
  end
  
  module Experiments =
  struct
    module ExperimentsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* experiments-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let delete
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~experimentId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "experiments"; ((fun x -> x) experimentId)] base_url in
      let params = ExperimentsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ExperimentsParameters.to_key_value_list params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~experimentId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "experiments"; ((fun x -> x) experimentId)] base_url in
      let params = ExperimentsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ExperimentsParameters.to_key_value_list params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response Experiment.of_data_model) session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          experiment
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "experiments"] base_url in
      let params = ExperimentsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ExperimentsParameters.to_key_value_list params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json Experiment.to_data_model)
        ~data:experiment full_url
        (GapiJson.parse_json_response Experiment.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          ~profileId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "experiments"] base_url in
      let params = ExperimentsParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        ExperimentsParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response Experiments.of_data_model) session 
      
    let patch
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~experimentId
          experiment
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "experiments"; ((fun x -> x) experimentId)] base_url in
      let params = ExperimentsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ExperimentsParameters.to_key_value_list params in
      GapiService.patch ?query_parameters
        ~data_to_post:(GapiJson.render_json Experiment.to_data_model)
        ~data:experiment full_url
        (GapiJson.parse_json_response Experiment.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~experimentId
          experiment
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "experiments"; ((fun x -> x) experimentId)] base_url in
      let params = ExperimentsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ExperimentsParameters.to_key_value_list params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json Experiment.to_data_model)
        ~data:experiment full_url
        (GapiJson.parse_json_response Experiment.of_data_model) session 
      
    
  end
  
  module Filters =
  struct
    module FiltersParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* filters-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let delete
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~filterId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "filters"; ((fun x -> x) filterId)]
        base_url in
      let params = FiltersParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map FiltersParameters.to_key_value_list
        params in
      GapiService.delete ?query_parameters full_url
        (GapiJson.parse_json_response Filter.of_data_model) session 
      
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ~accountId
          ~filterId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "filters"; ((fun x -> x) filterId)]
        base_url in
      let params = FiltersParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map FiltersParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response Filter.of_data_model) session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          filter
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "filters"] base_url in
      let params = FiltersParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map FiltersParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json Filter.to_data_model)
        ~data:filter full_url
        (GapiJson.parse_json_response Filter.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "filters"] base_url in
      let params = FiltersParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map FiltersParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response Filters.of_data_model) session 
      
    let patch
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~filterId
          filter
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "filters"; ((fun x -> x) filterId)]
        base_url in
      let params = FiltersParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map FiltersParameters.to_key_value_list
        params in
      GapiService.patch ?query_parameters
        ~data_to_post:(GapiJson.render_json Filter.to_data_model)
        ~data:filter full_url
        (GapiJson.parse_json_response Filter.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~filterId
          filter
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "filters"; ((fun x -> x) filterId)]
        base_url in
      let params = FiltersParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map FiltersParameters.to_key_value_list
        params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json Filter.to_data_model)
        ~data:filter full_url
        (GapiJson.parse_json_response Filter.of_data_model) session 
      
    
  end
  
  module Goals =
  struct
    module GoalsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* goals-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~goalId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "goals"; ((fun x -> x) goalId)] base_url in
      let params = GoalsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map GoalsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response Goal.of_data_model) session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          goal
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "goals"] base_url in
      let params = GoalsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map GoalsParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json Goal.to_data_model) ~data:goal
        full_url (GapiJson.parse_json_response Goal.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          ~profileId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "goals"] base_url in
      let params = GoalsParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map GoalsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response Goals.of_data_model) session 
      
    let patch
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~goalId
          goal
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "goals"; ((fun x -> x) goalId)] base_url in
      let params = GoalsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map GoalsParameters.to_key_value_list
        params in
      GapiService.patch ?query_parameters
        ~data_to_post:(GapiJson.render_json Goal.to_data_model) ~data:goal
        full_url (GapiJson.parse_json_response Goal.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~goalId
          goal
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "goals"; ((fun x -> x) goalId)] base_url in
      let params = GoalsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map GoalsParameters.to_key_value_list
        params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json Goal.to_data_model) ~data:goal
        full_url (GapiJson.parse_json_response Goal.of_data_model) session 
      
    
  end
  
  module ProfileFilterLinks =
  struct
    module ProfileFilterLinksParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* profileFilterLinks-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let delete
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~linkId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "profileFilterLinks"; ((fun x -> x) linkId)] base_url in
      let params = ProfileFilterLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ProfileFilterLinksParameters.to_key_value_list params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~linkId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "profileFilterLinks"; ((fun x -> x) linkId)] base_url in
      let params = ProfileFilterLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ProfileFilterLinksParameters.to_key_value_list params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response ProfileFilterLink.of_data_model)
        session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          profileFilterLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "profileFilterLinks"] base_url in
      let params = ProfileFilterLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ProfileFilterLinksParameters.to_key_value_list params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json ProfileFilterLink.to_data_model)
        ~data:profileFilterLink full_url
        (GapiJson.parse_json_response ProfileFilterLink.of_data_model)
        session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          ~profileId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "profileFilterLinks"] base_url in
      let params = ProfileFilterLinksParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        ProfileFilterLinksParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response ProfileFilterLinks.of_data_model)
        session 
      
    let patch
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~linkId
          profileFilterLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "profileFilterLinks"; ((fun x -> x) linkId)] base_url in
      let params = ProfileFilterLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ProfileFilterLinksParameters.to_key_value_list params in
      GapiService.patch ?query_parameters
        ~data_to_post:(GapiJson.render_json ProfileFilterLink.to_data_model)
        ~data:profileFilterLink full_url
        (GapiJson.parse_json_response ProfileFilterLink.of_data_model)
        session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~linkId
          profileFilterLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "profileFilterLinks"; ((fun x -> x) linkId)] base_url in
      let params = ProfileFilterLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ProfileFilterLinksParameters.to_key_value_list params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json ProfileFilterLink.to_data_model)
        ~data:profileFilterLink full_url
        (GapiJson.parse_json_response ProfileFilterLink.of_data_model)
        session 
      
    
  end
  
  module ProfileUserLinks =
  struct
    module ProfileUserLinksParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* profileUserLinks-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let delete
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~linkId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "entityUserLinks"; ((fun x -> x) linkId)] base_url in
      let params = ProfileUserLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ProfileUserLinksParameters.to_key_value_list params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          entityUserLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "entityUserLinks"] base_url in
      let params = ProfileUserLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ProfileUserLinksParameters.to_key_value_list params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json EntityUserLink.to_data_model)
        ~data:entityUserLink full_url
        (GapiJson.parse_json_response EntityUserLink.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          ~profileId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "entityUserLinks"] base_url in
      let params = ProfileUserLinksParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        ProfileUserLinksParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response EntityUserLinks.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~linkId
          entityUserLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "entityUserLinks"; ((fun x -> x) linkId)] base_url in
      let params = ProfileUserLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        ProfileUserLinksParameters.to_key_value_list params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json EntityUserLink.to_data_model)
        ~data:entityUserLink full_url
        (GapiJson.parse_json_response EntityUserLink.of_data_model) session 
      
    
  end
  
  module Profiles =
  struct
    module ProfilesParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* profiles-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let delete
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId)]
        base_url in
      let params = ProfilesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map ProfilesParameters.to_key_value_list
        params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId)]
        base_url in
      let params = ProfilesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map ProfilesParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response Profile.of_data_model) session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          profile
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"] base_url in
      let params = ProfilesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map ProfilesParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json Profile.to_data_model)
        ~data:profile full_url
        (GapiJson.parse_json_response Profile.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"] base_url in
      let params = ProfilesParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map ProfilesParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response Profiles.of_data_model) session 
      
    let patch
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          profile
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId)]
        base_url in
      let params = ProfilesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map ProfilesParameters.to_key_value_list
        params in
      GapiService.patch ?query_parameters
        ~data_to_post:(GapiJson.render_json Profile.to_data_model)
        ~data:profile full_url
        (GapiJson.parse_json_response Profile.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          profile
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId)]
        base_url in
      let params = ProfilesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map ProfilesParameters.to_key_value_list
        params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json Profile.to_data_model)
        ~data:profile full_url
        (GapiJson.parse_json_response Profile.of_data_model) session 
      
    
  end
  
  module Segments =
  struct
    module SegmentsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* segments-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "segments"]
        base_url in
      let params = SegmentsParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map SegmentsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response Segments.of_data_model) session 
      
    
  end
  
  module UnsampledReports =
  struct
    module UnsampledReportsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* unsampledReports-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          ~unsampledReportId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "unsampledReports"; ((fun x -> x) unsampledReportId)] base_url in
      let params = UnsampledReportsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        UnsampledReportsParameters.to_key_value_list params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response UnsampledReport.of_data_model) session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~profileId
          unsampledReport
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "unsampledReports"] base_url in
      let params = UnsampledReportsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        UnsampledReportsParameters.to_key_value_list params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json UnsampledReport.to_data_model)
        ~data:unsampledReport full_url
        (GapiJson.parse_json_response UnsampledReport.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          ~profileId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "profiles"; ((fun x -> x) profileId);
        "unsampledReports"] base_url in
      let params = UnsampledReportsParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        UnsampledReportsParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response UnsampledReports.of_data_model) session 
      
    
  end
  
  module Uploads =
  struct
    module UploadsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* uploads-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let deleteUploadData
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~customDataSourceId
          analyticsDataimportDeleteUploadDataRequest
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDataSources";
        ((fun x -> x) customDataSourceId); "deleteUploadData"] base_url in
      let params = UploadsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map UploadsParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json AnalyticsDataimportDeleteUploadDataRequest.to_data_model)
        ~data:analyticsDataimportDeleteUploadDataRequest full_url
        GapiRequest.parse_empty_response session 
      
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ~accountId
          ~webPropertyId
          ~customDataSourceId
          ~uploadId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDataSources";
        ((fun x -> x) customDataSourceId); "uploads";
        ((fun x -> x) uploadId)] base_url in
      let params = UploadsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map UploadsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response Upload.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          ~customDataSourceId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDataSources";
        ((fun x -> x) customDataSourceId); "uploads"] base_url in
      let params = UploadsParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map UploadsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response Uploads.of_data_model) session 
      
    let uploadData
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?media_source
          ~accountId
          ~webPropertyId
          ~customDataSourceId
          session =
      let base_path = ["management"; "accounts"; ((fun x -> x) accountId);
        "webproperties"; ((fun x -> x) webPropertyId); "customDataSources";
        ((fun x -> x) customDataSourceId); "uploads"] in
      let media_path = [""; "resumable"; "upload"; "analytics"; "v3";
        "management"; "accounts"; ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDataSources";
        ((fun x -> x) customDataSourceId); "uploads"] in
      let path_to_add = if Option.is_some media_source then media_path
        else base_path in
      let full_url = GapiUtils.add_path_to_url path_to_add base_url in
      let params = UploadsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map UploadsParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters ?media_source ~data:Upload.empty
        full_url (GapiJson.parse_json_response Upload.of_data_model) session 
      
    
  end
  
  module WebPropertyAdWordsLinks =
  struct
    module WebPropertyAdWordsLinksParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* webPropertyAdWordsLinks-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let delete
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~webPropertyAdWordsLinkId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "entityAdWordsLinks";
        ((fun x -> x) webPropertyAdWordsLinkId)] base_url in
      let params = WebPropertyAdWordsLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebPropertyAdWordsLinksParameters.to_key_value_list params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ~accountId
          ~webPropertyId
          ~webPropertyAdWordsLinkId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "entityAdWordsLinks";
        ((fun x -> x) webPropertyAdWordsLinkId)] base_url in
      let params = WebPropertyAdWordsLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebPropertyAdWordsLinksParameters.to_key_value_list params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response EntityAdWordsLink.of_data_model)
        session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          entityAdWordsLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "entityAdWordsLinks"] base_url in
      let params = WebPropertyAdWordsLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebPropertyAdWordsLinksParameters.to_key_value_list params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json EntityAdWordsLink.to_data_model)
        ~data:entityAdWordsLink full_url
        (GapiJson.parse_json_response EntityAdWordsLink.of_data_model)
        session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "entityAdWordsLinks"] base_url in
      let params = WebPropertyAdWordsLinksParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        WebPropertyAdWordsLinksParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response EntityAdWordsLinks.of_data_model)
        session 
      
    let patch
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~webPropertyAdWordsLinkId
          entityAdWordsLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "entityAdWordsLinks";
        ((fun x -> x) webPropertyAdWordsLinkId)] base_url in
      let params = WebPropertyAdWordsLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebPropertyAdWordsLinksParameters.to_key_value_list params in
      GapiService.patch ?query_parameters
        ~data_to_post:(GapiJson.render_json EntityAdWordsLink.to_data_model)
        ~data:entityAdWordsLink full_url
        (GapiJson.parse_json_response EntityAdWordsLink.of_data_model)
        session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~webPropertyAdWordsLinkId
          entityAdWordsLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "entityAdWordsLinks";
        ((fun x -> x) webPropertyAdWordsLinkId)] base_url in
      let params = WebPropertyAdWordsLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebPropertyAdWordsLinksParameters.to_key_value_list params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json EntityAdWordsLink.to_data_model)
        ~data:entityAdWordsLink full_url
        (GapiJson.parse_json_response EntityAdWordsLink.of_data_model)
        session 
      
    
  end
  
  module Webproperties =
  struct
    module WebpropertiesParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* webproperties-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let get
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?etag
          ?std_params
          ~accountId
          ~webPropertyId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId)] base_url in
      let params = WebpropertiesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebpropertiesParameters.to_key_value_list params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response Webproperty.of_data_model) session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          webproperty
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties"] base_url in
      let params = WebpropertiesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebpropertiesParameters.to_key_value_list params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json Webproperty.to_data_model)
        ~data:webproperty full_url
        (GapiJson.parse_json_response Webproperty.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties"] base_url in
      let params = WebpropertiesParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        WebpropertiesParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response Webproperties.of_data_model) session 
      
    let patch
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          webproperty
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId)] base_url in
      let params = WebpropertiesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebpropertiesParameters.to_key_value_list params in
      GapiService.patch ?query_parameters
        ~data_to_post:(GapiJson.render_json Webproperty.to_data_model)
        ~data:webproperty full_url
        (GapiJson.parse_json_response Webproperty.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          webproperty
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId)] base_url in
      let params = WebpropertiesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebpropertiesParameters.to_key_value_list params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json Webproperty.to_data_model)
        ~data:webproperty full_url
        (GapiJson.parse_json_response Webproperty.of_data_model) session 
      
    
  end
  
  module WebpropertyUserLinks =
  struct
    module WebpropertyUserLinksParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* webpropertyUserLinks-specific query parameters *)
        max_results : int;
        start_index : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        max_results = 0;
        start_index = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.start_index) string_of_int "start-index";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(max_results = default.max_results)
          ?(start_index = default.start_index)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          max_results;
          start_index;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let delete
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~linkId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "entityUserLinks";
        ((fun x -> x) linkId)] base_url in
      let params = WebpropertyUserLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebpropertyUserLinksParameters.to_key_value_list params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          entityUserLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "entityUserLinks"] base_url in
      let params = WebpropertyUserLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebpropertyUserLinksParameters.to_key_value_list params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json EntityUserLink.to_data_model)
        ~data:entityUserLink full_url
        (GapiJson.parse_json_response EntityUserLink.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "entityUserLinks"] base_url in
      let params = WebpropertyUserLinksParameters.merge_parameters
        ?standard_parameters:std_params ?max_results ?start_index () in
      let query_parameters = Option.map
        WebpropertyUserLinksParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response EntityUserLinks.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~linkId
          entityUserLink
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "entityUserLinks";
        ((fun x -> x) linkId)] base_url in
      let params = WebpropertyUserLinksParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        WebpropertyUserLinksParameters.to_key_value_list params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json EntityUserLink.to_data_model)
        ~data:entityUserLink full_url
        (GapiJson.parse_json_response EntityUserLink.of_data_model) session 
      
    
  end
  
  
end

module MetadataResource =
struct
  module Columns =
  struct
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~reportType
          session =
      let full_url = GapiUtils.add_path_to_url ["metadata";
        ((fun x -> x) reportType); "columns"] base_url in
      let params = GapiService.StandardParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        GapiService.StandardParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response Columns.of_data_model) session 
      
    
  end
  
  
end

module ProvisioningResource =
struct
  let createAccountTicket
        ?(base_url = "https://www.googleapis.com/analytics/v3/")
        ?std_params
        accountTicket
        session =
    let full_url = GapiUtils.add_path_to_url ["provisioning";
      "createAccountTicket"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json AccountTicket.to_data_model)
      ~data:accountTicket full_url
      (GapiJson.parse_json_response AccountTicket.of_data_model) session 
    
  
end

