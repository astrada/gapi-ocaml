(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiAdsenseV1_1Model

let scope = "https://www.googleapis.com/auth/adsense"

let scope_readonly = "https://www.googleapis.com/auth/adsense.readonly"

module AccountsResource =
struct
  module Adclients =
  struct
    module AdclientsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* adclients-specific query parameters *)
        maxResults : int;
        pageToken : string;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        maxResults = 0;
        pageToken = "";
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.maxResults) string_of_int "maxResults";
        param (fun p -> p.pageToken) (fun x -> x) "pageToken";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(maxResults = default.maxResults)
          ?(pageToken = default.pageToken)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          maxResults;
          pageToken;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let list
          ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
          ?parameters
          ?maxResults
          ?pageToken
          ~accountId
          session =
      let full_url = GapiUtils.add_path_to_url ["accounts";
        ((fun x -> x) accountId); "adclients"] base_url in
      let params = AdclientsParameters.merge_parameters
        ?standard_parameters:parameters ?maxResults ?pageToken () in
      let query_parameters = Option.map AdclientsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response AdClients.of_data_model) session 
      
    
  end
  
  module Adunits =
  struct
    module Customchannels =
    struct
      module CustomchannelsParameters =
      struct
        type t = {
          (* Standard query parameters *)
          fields : string;
          prettyPrint : bool;
          quotaUser : string;
          userIp : string;
          key : string;
          (* customchannels-specific query parameters *)
          maxResults : int;
          pageToken : string;
          
        }
        
        let default = {
          fields = "";
          prettyPrint = true;
          quotaUser = "";
          userIp = "";
          key = "";
          maxResults = 0;
          pageToken = "";
          
        }
        
        let to_key_value_list qp =
          let param get_value to_string name =
            GapiService.build_param default qp get_value to_string name in [
          param (fun p -> p.fields) (fun x -> x) "fields";
          param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
          param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
          param (fun p -> p.userIp) (fun x -> x) "userIp";
          param (fun p -> p.key) (fun x -> x) "key";
          param (fun p -> p.maxResults) string_of_int "maxResults";
          param (fun p -> p.pageToken) (fun x -> x) "pageToken";
          
        ] |> List.concat
        
        let merge_parameters
            ?(standard_parameters = GapiService.StandardParameters.default)
            ?(maxResults = default.maxResults)
            ?(pageToken = default.pageToken)
            () =
          let parameters = {
            fields = standard_parameters.GapiService.StandardParameters.fields;
            prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
            quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
            userIp = standard_parameters.GapiService.StandardParameters.userIp;
            key = standard_parameters.GapiService.StandardParameters.key;
            maxResults;
            pageToken;
            
          } in
          if parameters = default then None else Some parameters
        
      end
      
      let list
            ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
            ?parameters
            ?maxResults
            ?pageToken
            ~accountId
            ~adClientId
            ~adUnitId
            session =
        let full_url = GapiUtils.add_path_to_url ["accounts";
          ((fun x -> x) accountId); "adclients"; ((fun x -> x) adClientId);
          "adunits"; ((fun x -> x) adUnitId); "customchannels"] base_url in
        let params = CustomchannelsParameters.merge_parameters
          ?standard_parameters:parameters ?maxResults ?pageToken () in
        let query_parameters = Option.map
          CustomchannelsParameters.to_key_value_list params in
        GapiService.get ?query_parameters full_url
          (GapiJson.parse_json_response CustomChannels.of_data_model) session 
        
      
    end
    
    module AdunitsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* adunits-specific query parameters *)
        includeInactive : bool;
        maxResults : int;
        pageToken : string;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        includeInactive = false;
        maxResults = 0;
        pageToken = "";
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.includeInactive) string_of_bool "includeInactive";
        param (fun p -> p.maxResults) string_of_int "maxResults";
        param (fun p -> p.pageToken) (fun x -> x) "pageToken";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(includeInactive = default.includeInactive)
          ?(maxResults = default.maxResults)
          ?(pageToken = default.pageToken)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          includeInactive;
          maxResults;
          pageToken;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let get
          ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
          ?parameters
          ~accountId
          ~adClientId
          ~adUnitId
          session =
      let full_url = GapiUtils.add_path_to_url ["accounts";
        ((fun x -> x) accountId); "adclients"; ((fun x -> x) adClientId);
        "adunits"; ((fun x -> x) adUnitId)] base_url in
      let params = AdunitsParameters.merge_parameters
        ?standard_parameters:parameters () in
      let query_parameters = Option.map AdunitsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response AdUnit.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
          ?parameters
          ?includeInactive
          ?maxResults
          ?pageToken
          ~accountId
          ~adClientId
          session =
      let full_url = GapiUtils.add_path_to_url ["accounts";
        ((fun x -> x) accountId); "adclients"; ((fun x -> x) adClientId);
        "adunits"] base_url in
      let params = AdunitsParameters.merge_parameters
        ?standard_parameters:parameters ?includeInactive ?maxResults
        ?pageToken () in
      let query_parameters = Option.map AdunitsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response AdUnits.of_data_model) session 
      
    
  end
  
  module Customchannels =
  struct
    module Adunits =
    struct
      module AdunitsParameters =
      struct
        type t = {
          (* Standard query parameters *)
          fields : string;
          prettyPrint : bool;
          quotaUser : string;
          userIp : string;
          key : string;
          (* adunits-specific query parameters *)
          includeInactive : bool;
          maxResults : int;
          pageToken : string;
          
        }
        
        let default = {
          fields = "";
          prettyPrint = true;
          quotaUser = "";
          userIp = "";
          key = "";
          includeInactive = false;
          maxResults = 0;
          pageToken = "";
          
        }
        
        let to_key_value_list qp =
          let param get_value to_string name =
            GapiService.build_param default qp get_value to_string name in [
          param (fun p -> p.fields) (fun x -> x) "fields";
          param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
          param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
          param (fun p -> p.userIp) (fun x -> x) "userIp";
          param (fun p -> p.key) (fun x -> x) "key";
          param (fun p -> p.includeInactive) string_of_bool "includeInactive";
          param (fun p -> p.maxResults) string_of_int "maxResults";
          param (fun p -> p.pageToken) (fun x -> x) "pageToken";
          
        ] |> List.concat
        
        let merge_parameters
            ?(standard_parameters = GapiService.StandardParameters.default)
            ?(includeInactive = default.includeInactive)
            ?(maxResults = default.maxResults)
            ?(pageToken = default.pageToken)
            () =
          let parameters = {
            fields = standard_parameters.GapiService.StandardParameters.fields;
            prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
            quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
            userIp = standard_parameters.GapiService.StandardParameters.userIp;
            key = standard_parameters.GapiService.StandardParameters.key;
            includeInactive;
            maxResults;
            pageToken;
            
          } in
          if parameters = default then None else Some parameters
        
      end
      
      let list
            ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
            ?parameters
            ?includeInactive
            ?maxResults
            ?pageToken
            ~accountId
            ~adClientId
            ~customChannelId
            session =
        let full_url = GapiUtils.add_path_to_url ["accounts";
          ((fun x -> x) accountId); "adclients"; ((fun x -> x) adClientId);
          "customchannels"; ((fun x -> x) customChannelId); "adunits"]
          base_url in
        let params = AdunitsParameters.merge_parameters
          ?standard_parameters:parameters ?includeInactive ?maxResults
          ?pageToken () in
        let query_parameters = Option.map AdunitsParameters.to_key_value_list
          params in
        GapiService.get ?query_parameters full_url
          (GapiJson.parse_json_response AdUnits.of_data_model) session 
        
      
    end
    
    module CustomchannelsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* customchannels-specific query parameters *)
        maxResults : int;
        pageToken : string;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        maxResults = 0;
        pageToken = "";
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.maxResults) string_of_int "maxResults";
        param (fun p -> p.pageToken) (fun x -> x) "pageToken";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(maxResults = default.maxResults)
          ?(pageToken = default.pageToken)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          maxResults;
          pageToken;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let get
          ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
          ?parameters
          ~accountId
          ~adClientId
          ~customChannelId
          session =
      let full_url = GapiUtils.add_path_to_url ["accounts";
        ((fun x -> x) accountId); "adclients"; ((fun x -> x) adClientId);
        "customchannels"; ((fun x -> x) customChannelId)] base_url in
      let params = CustomchannelsParameters.merge_parameters
        ?standard_parameters:parameters () in
      let query_parameters = Option.map
        CustomchannelsParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response CustomChannel.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
          ?parameters
          ?maxResults
          ?pageToken
          ~accountId
          ~adClientId
          session =
      let full_url = GapiUtils.add_path_to_url ["accounts";
        ((fun x -> x) accountId); "adclients"; ((fun x -> x) adClientId);
        "customchannels"] base_url in
      let params = CustomchannelsParameters.merge_parameters
        ?standard_parameters:parameters ?maxResults ?pageToken () in
      let query_parameters = Option.map
        CustomchannelsParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response CustomChannels.of_data_model) session 
      
    
  end
  
  module Reports =
  struct
    module ReportsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* reports-specific query parameters *)
        currency : string;
        dimension : string;
        endDate : string;
        filter : string;
        locale : string;
        maxResults : int;
        metric : string;
        sort : string;
        startDate : string;
        startIndex : int;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        currency = "";
        dimension = "";
        endDate = "";
        filter = "";
        locale = "";
        maxResults = 0;
        metric = "";
        sort = "";
        startDate = "";
        startIndex = 0;
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.currency) (fun x -> x) "currency";
        param (fun p -> p.dimension) (fun x -> x) "dimension";
        param (fun p -> p.endDate) (fun x -> x) "endDate";
        param (fun p -> p.filter) (fun x -> x) "filter";
        param (fun p -> p.locale) (fun x -> x) "locale";
        param (fun p -> p.maxResults) string_of_int "maxResults";
        param (fun p -> p.metric) (fun x -> x) "metric";
        param (fun p -> p.sort) (fun x -> x) "sort";
        param (fun p -> p.startDate) (fun x -> x) "startDate";
        param (fun p -> p.startIndex) string_of_int "startIndex";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(currency = default.currency)
          ?(dimension = default.dimension)
          ?(endDate = default.endDate)
          ?(filter = default.filter)
          ?(locale = default.locale)
          ?(maxResults = default.maxResults)
          ?(metric = default.metric)
          ?(sort = default.sort)
          ?(startDate = default.startDate)
          ?(startIndex = default.startIndex)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          currency;
          dimension;
          endDate;
          filter;
          locale;
          maxResults;
          metric;
          sort;
          startDate;
          startIndex;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let generate
          ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
          ?parameters
          ?currency
          ?dimension
          ?filter
          ?locale
          ?maxResults
          ?metric
          ?sort
          ?startIndex
          ~accountId
          ~startDate
          ~endDate
          session =
      let full_url = GapiUtils.add_path_to_url ["accounts";
        ((fun x -> x) accountId); "reports"] base_url in
      let params = ReportsParameters.merge_parameters
        ?standard_parameters:parameters ?currency ?dimension ~endDate ?filter
        ?locale ?maxResults ?metric ?sort ~startDate ?startIndex () in
      let query_parameters = Option.map ReportsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response AdsenseReportsGenerateResponse.of_data_model)
        session 
      
    
  end
  
  module Urlchannels =
  struct
    module UrlchannelsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* urlchannels-specific query parameters *)
        maxResults : int;
        pageToken : string;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        maxResults = 0;
        pageToken = "";
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.maxResults) string_of_int "maxResults";
        param (fun p -> p.pageToken) (fun x -> x) "pageToken";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(maxResults = default.maxResults)
          ?(pageToken = default.pageToken)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          maxResults;
          pageToken;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let list
          ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
          ?parameters
          ?maxResults
          ?pageToken
          ~accountId
          ~adClientId
          session =
      let full_url = GapiUtils.add_path_to_url ["accounts";
        ((fun x -> x) accountId); "adclients"; ((fun x -> x) adClientId);
        "urlchannels"] base_url in
      let params = UrlchannelsParameters.merge_parameters
        ?standard_parameters:parameters ?maxResults ?pageToken () in
      let query_parameters = Option.map
        UrlchannelsParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response UrlChannels.of_data_model) session 
      
    
  end
  
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
      maxResults : int;
      pageToken : string;
      tree : bool;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0;
      pageToken = "";
      tree = false;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.tree) string_of_bool "tree";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(tree = default.tree)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        pageToken;
        tree;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
        ?parameters
        ?tree
        ~accountId
        session =
    let full_url = GapiUtils.add_path_to_url ["accounts";
      ((fun x -> x) accountId)] base_url in
    let params = AccountsParameters.merge_parameters
      ?standard_parameters:parameters ?tree () in
    let query_parameters = Option.map AccountsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Account.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
        ?parameters
        ?maxResults
        ?pageToken
        session =
    let full_url = GapiUtils.add_path_to_url ["accounts"] base_url in
    let params = AccountsParameters.merge_parameters
      ?standard_parameters:parameters ?maxResults ?pageToken () in
    let query_parameters = Option.map AccountsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Accounts.of_data_model) session 
    
  
end

module AdclientsResource =
struct
  module AdclientsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* adclients-specific query parameters *)
      maxResults : int;
      pageToken : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0;
      pageToken = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        pageToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let list
        ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
        ?parameters
        ?maxResults
        ?pageToken
        session =
    let full_url = GapiUtils.add_path_to_url ["adclients"] base_url in
    let params = AdclientsParameters.merge_parameters
      ?standard_parameters:parameters ?maxResults ?pageToken () in
    let query_parameters = Option.map AdclientsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response AdClients.of_data_model) session 
    
  
end

module AdunitsResource =
struct
  module Customchannels =
  struct
    module CustomchannelsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* customchannels-specific query parameters *)
        maxResults : int;
        pageToken : string;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        maxResults = 0;
        pageToken = "";
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.maxResults) string_of_int "maxResults";
        param (fun p -> p.pageToken) (fun x -> x) "pageToken";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(maxResults = default.maxResults)
          ?(pageToken = default.pageToken)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          maxResults;
          pageToken;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let list
          ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
          ?parameters
          ?maxResults
          ?pageToken
          ~adClientId
          ~adUnitId
          session =
      let full_url = GapiUtils.add_path_to_url ["adclients";
        ((fun x -> x) adClientId); "adunits"; ((fun x -> x) adUnitId);
        "customchannels"] base_url in
      let params = CustomchannelsParameters.merge_parameters
        ?standard_parameters:parameters ?maxResults ?pageToken () in
      let query_parameters = Option.map
        CustomchannelsParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response CustomChannels.of_data_model) session 
      
    
  end
  
  module AdunitsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* adunits-specific query parameters *)
      includeInactive : bool;
      maxResults : int;
      pageToken : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      includeInactive = false;
      maxResults = 0;
      pageToken = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.includeInactive) string_of_bool "includeInactive";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(includeInactive = default.includeInactive)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        includeInactive;
        maxResults;
        pageToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
        ?parameters
        ~adClientId
        ~adUnitId
        session =
    let full_url = GapiUtils.add_path_to_url ["adclients";
      ((fun x -> x) adClientId); "adunits"; ((fun x -> x) adUnitId)] base_url
      in
    let params = AdunitsParameters.merge_parameters
      ?standard_parameters:parameters () in
    let query_parameters = Option.map AdunitsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response AdUnit.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
        ?parameters
        ?includeInactive
        ?maxResults
        ?pageToken
        ~adClientId
        session =
    let full_url = GapiUtils.add_path_to_url ["adclients";
      ((fun x -> x) adClientId); "adunits"] base_url in
    let params = AdunitsParameters.merge_parameters
      ?standard_parameters:parameters ?includeInactive ?maxResults ?pageToken
      () in
    let query_parameters = Option.map AdunitsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response AdUnits.of_data_model) session 
    
  
end

module CustomchannelsResource =
struct
  module Adunits =
  struct
    module AdunitsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* adunits-specific query parameters *)
        includeInactive : bool;
        maxResults : int;
        pageToken : string;
        
      }
      
      let default = {
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        includeInactive = false;
        maxResults = 0;
        pageToken = "";
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.includeInactive) string_of_bool "includeInactive";
        param (fun p -> p.maxResults) string_of_int "maxResults";
        param (fun p -> p.pageToken) (fun x -> x) "pageToken";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(includeInactive = default.includeInactive)
          ?(maxResults = default.maxResults)
          ?(pageToken = default.pageToken)
          () =
        let parameters = {
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          includeInactive;
          maxResults;
          pageToken;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let list
          ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
          ?parameters
          ?includeInactive
          ?maxResults
          ?pageToken
          ~adClientId
          ~customChannelId
          session =
      let full_url = GapiUtils.add_path_to_url ["adclients";
        ((fun x -> x) adClientId); "customchannels";
        ((fun x -> x) customChannelId); "adunits"] base_url in
      let params = AdunitsParameters.merge_parameters
        ?standard_parameters:parameters ?includeInactive ?maxResults
        ?pageToken () in
      let query_parameters = Option.map AdunitsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response AdUnits.of_data_model) session 
      
    
  end
  
  module CustomchannelsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* customchannels-specific query parameters *)
      maxResults : int;
      pageToken : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0;
      pageToken = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        pageToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
        ?parameters
        ~adClientId
        ~customChannelId
        session =
    let full_url = GapiUtils.add_path_to_url ["adclients";
      ((fun x -> x) adClientId); "customchannels";
      ((fun x -> x) customChannelId)] base_url in
    let params = CustomchannelsParameters.merge_parameters
      ?standard_parameters:parameters () in
    let query_parameters = Option.map
      CustomchannelsParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response CustomChannel.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
        ?parameters
        ?maxResults
        ?pageToken
        ~adClientId
        session =
    let full_url = GapiUtils.add_path_to_url ["adclients";
      ((fun x -> x) adClientId); "customchannels"] base_url in
    let params = CustomchannelsParameters.merge_parameters
      ?standard_parameters:parameters ?maxResults ?pageToken () in
    let query_parameters = Option.map
      CustomchannelsParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response CustomChannels.of_data_model) session 
    
  
end

module ReportsResource =
struct
  module ReportsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* reports-specific query parameters *)
      accountId : string;
      currency : string;
      dimension : string;
      endDate : string;
      filter : string;
      locale : string;
      maxResults : int;
      metric : string;
      sort : string;
      startDate : string;
      startIndex : int;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      accountId = "";
      currency = "";
      dimension = "";
      endDate = "";
      filter = "";
      locale = "";
      maxResults = 0;
      metric = "";
      sort = "";
      startDate = "";
      startIndex = 0;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.accountId) (fun x -> x) "accountId";
      param (fun p -> p.currency) (fun x -> x) "currency";
      param (fun p -> p.dimension) (fun x -> x) "dimension";
      param (fun p -> p.endDate) (fun x -> x) "endDate";
      param (fun p -> p.filter) (fun x -> x) "filter";
      param (fun p -> p.locale) (fun x -> x) "locale";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.metric) (fun x -> x) "metric";
      param (fun p -> p.sort) (fun x -> x) "sort";
      param (fun p -> p.startDate) (fun x -> x) "startDate";
      param (fun p -> p.startIndex) string_of_int "startIndex";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(accountId = default.accountId)
        ?(currency = default.currency)
        ?(dimension = default.dimension)
        ?(endDate = default.endDate)
        ?(filter = default.filter)
        ?(locale = default.locale)
        ?(maxResults = default.maxResults)
        ?(metric = default.metric)
        ?(sort = default.sort)
        ?(startDate = default.startDate)
        ?(startIndex = default.startIndex)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        accountId;
        currency;
        dimension;
        endDate;
        filter;
        locale;
        maxResults;
        metric;
        sort;
        startDate;
        startIndex;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let generate
        ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
        ?parameters
        ?accountId
        ?currency
        ?dimension
        ?filter
        ?locale
        ?maxResults
        ?metric
        ?sort
        ?startIndex
        ~startDate
        ~endDate
        session =
    let full_url = GapiUtils.add_path_to_url ["reports"] base_url in
    let params = ReportsParameters.merge_parameters
      ?standard_parameters:parameters ?accountId ?currency ?dimension
      ~endDate ?filter ?locale ?maxResults ?metric ?sort ~startDate
      ?startIndex () in
    let query_parameters = Option.map ReportsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response AdsenseReportsGenerateResponse.of_data_model)
      session 
    
  
end

module UrlchannelsResource =
struct
  module UrlchannelsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* urlchannels-specific query parameters *)
      maxResults : int;
      pageToken : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 0;
      pageToken = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        pageToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let list
        ?(base_url = "https://www.googleapis.com/adsense/v1.1/")
        ?parameters
        ?maxResults
        ?pageToken
        ~adClientId
        session =
    let full_url = GapiUtils.add_path_to_url ["adclients";
      ((fun x -> x) adClientId); "urlchannels"] base_url in
    let params = UrlchannelsParameters.merge_parameters
      ?standard_parameters:parameters ?maxResults ?pageToken () in
    let query_parameters = Option.map UrlchannelsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response UrlChannels.of_data_model) session 
    
  
end

