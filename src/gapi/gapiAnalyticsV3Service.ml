(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiAnalyticsV3Model

module Scope =
struct
  let analytics = "https://www.googleapis.com/auth/analytics"
  
  let analytics_readonly = "https://www.googleapis.com/auth/analytics.readonly"
  
  
end

module DataResource =
struct
  module Ga =
  struct
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
        max_results : int;
        metrics : string;
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
        max_results = 0;
        metrics = "";
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
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.metrics) (fun x -> x) "metrics";
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
          ?(max_results = default.max_results)
          ?(metrics = default.metrics)
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
          max_results;
          metrics;
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
          ?max_results
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
        ?max_results ~metrics ?segment ?sort ~start_date ?start_index () in
      let query_parameters = Option.map GaParameters.to_key_value_list params
        in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response GaData.of_data_model) session 
      
    
  end
  
  module Mcf =
  struct
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
        ?max_results ~metrics ?sort ~start_date ?start_index () in
      let query_parameters = Option.map McfParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response McfData.of_data_model) session 
      
    
  end
  
  
end

module ManagementResource =
struct
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
  
  module DailyUploads =
  struct
    module Type =
    struct
      type t =
        | Default
        | Cost
        
      let to_string = function
        | Default -> ""
        | Cost -> "cost"
        
      let of_string = function
        | "" -> Default
        | "cost" -> Cost
        | s -> failwith ("Unexpected value for Type:" ^ s)
    
    end
    
    module DailyUploadsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* dailyUploads-specific query parameters *)
        appendNumber : int;
        end_date : string;
        max_results : int;
        reset : bool;
        start_date : string;
        start_index : int;
        _type : Type.t;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        appendNumber = 0;
        end_date = "";
        max_results = 0;
        reset = false;
        start_date = "";
        start_index = 0;
        _type = Type.Default;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.appendNumber) string_of_int "appendNumber";
        param (fun p -> p.end_date) (fun x -> x) "end-date";
        param (fun p -> p.max_results) string_of_int "max-results";
        param (fun p -> p.reset) string_of_bool "reset";
        param (fun p -> p.start_date) (fun x -> x) "start-date";
        param (fun p -> p.start_index) string_of_int "start-index";
        param (fun p -> p._type) Type.to_string "type";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(appendNumber = default.appendNumber)
          ?(end_date = default.end_date)
          ?(max_results = default.max_results)
          ?(reset = default.reset)
          ?(start_date = default.start_date)
          ?(start_index = default.start_index)
          ?(_type = default._type)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          appendNumber;
          end_date;
          max_results;
          reset;
          start_date;
          start_index;
          _type;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let delete
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ~accountId
          ~webPropertyId
          ~customDataSourceId
          ~date
          ~_type
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDataSources";
        ((fun x -> x) customDataSourceId); "dailyUploads";
        ((fun x -> x) date)] base_url in
      let params = DailyUploadsParameters.merge_parameters
        ?standard_parameters:std_params ~_type () in
      let query_parameters = Option.map
        DailyUploadsParameters.to_key_value_list params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let list
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?max_results
          ?start_index
          ~accountId
          ~webPropertyId
          ~customDataSourceId
          ~start_date
          ~end_date
          session =
      let full_url = GapiUtils.add_path_to_url ["management"; "accounts";
        ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDataSources";
        ((fun x -> x) customDataSourceId); "dailyUploads"] base_url in
      let params = DailyUploadsParameters.merge_parameters
        ?standard_parameters:std_params ~end_date ?max_results ~start_date
        ?start_index () in
      let query_parameters = Option.map
        DailyUploadsParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response DailyUploads.of_data_model) session 
      
    let upload
          ?(base_url = "https://www.googleapis.com/analytics/v3/")
          ?std_params
          ?media_source
          ?(reset = false)
          ~accountId
          ~webPropertyId
          ~customDataSourceId
          ~date
          ~appendNumber
          ~_type
          session =
      let base_path = ["management"; "accounts"; ((fun x -> x) accountId);
        "webproperties"; ((fun x -> x) webPropertyId); "customDataSources";
        ((fun x -> x) customDataSourceId); "dailyUploads";
        ((fun x -> x) date); "uploads"] in
      let media_path = [""; "resumable"; "upload"; "analytics"; "v3";
        "management"; "accounts"; ((fun x -> x) accountId); "webproperties";
        ((fun x -> x) webPropertyId); "customDataSources";
        ((fun x -> x) customDataSourceId); "dailyUploads";
        ((fun x -> x) date); "uploads"] in
      let path_to_add = if Option.is_some media_source then media_path
        else base_path in
      let full_url = GapiUtils.add_path_to_url path_to_add base_url in
      let params = DailyUploadsParameters.merge_parameters
        ?standard_parameters:std_params ~appendNumber ~reset ~_type () in
      let query_parameters = Option.map
        DailyUploadsParameters.to_key_value_list params in
      GapiService.post ?query_parameters ?media_source
        ~data:DailyUploadAppend.empty full_url
        (GapiJson.parse_json_response DailyUploadAppend.of_data_model)
        session 
      
    
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
      
    
  end
  
  
end

