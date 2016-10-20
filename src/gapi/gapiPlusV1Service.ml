(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiPlusV1Model

module Scope =
struct
  let plus_login = "https://www.googleapis.com/auth/plus.login"
  
  let plus_me = "https://www.googleapis.com/auth/plus.me"
  
  let userinfo_email = "https://www.googleapis.com/auth/userinfo.email"
  
  let userinfo_profile = "https://www.googleapis.com/auth/userinfo.profile"
  
  
end

module ActivitiesResource =
struct
  module Collection =
  struct
    type t =
      | Default
      | Public
      
    let to_string = function
      | Default -> ""
      | Public -> "public"
      
    let of_string = function
      | "" -> Default
      | "public" -> Public
      | s -> failwith ("Unexpected value for Collection:" ^ s)
  
  end
  
  module OrderBy =
  struct
    type t =
      | Default
      | Best
      | Recent
      
    let to_string = function
      | Default -> ""
      | Best -> "best"
      | Recent -> "recent"
      
    let of_string = function
      | "" -> Default
      | "best" -> Best
      | "recent" -> Recent
      | s -> failwith ("Unexpected value for OrderBy:" ^ s)
  
  end
  
  module ActivitiesParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* activities-specific query parameters *)
      language : string;
      maxResults : int;
      orderBy : OrderBy.t;
      pageToken : string;
      query : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      language = "en-US";
      maxResults = 20;
      orderBy = OrderBy.Default;
      pageToken = "";
      query = "";
      
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
      param (fun p -> p.language) (fun x -> x) "language";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.orderBy) OrderBy.to_string "orderBy";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.query) (fun x -> x) "query";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(language = default.language)
        ?(maxResults = default.maxResults)
        ?(orderBy = default.orderBy)
        ?(pageToken = default.pageToken)
        ?(query = default.query)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        language;
        maxResults;
        orderBy;
        pageToken;
        query;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?etag
        ?std_params
        ~activityId
        session =
    let full_url = GapiUtils.add_path_to_url ["activities";
      ((fun x -> x) activityId)] base_url in
    let params = ActivitiesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map ActivitiesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Activity.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?std_params
        ?(maxResults = 20)
        ?pageToken
        ~userId
        ~collection
        session =
    let full_url = GapiUtils.add_path_to_url ["people";
      ((fun x -> x) userId); "activities"; (Collection.to_string collection)]
      base_url in
    let params = ActivitiesParameters.merge_parameters
      ?standard_parameters:std_params ~maxResults ?pageToken () in
    let query_parameters = Option.map ActivitiesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response ActivityFeed.of_data_model) session 
    
  let search
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?std_params
        ?(language = "en-US")
        ?(maxResults = 10)
        ?(orderBy = OrderBy.Default)
        ?pageToken
        ~query
        session =
    let full_url = GapiUtils.add_path_to_url ["activities"] base_url in
    let params = ActivitiesParameters.merge_parameters
      ?standard_parameters:std_params ~language ~maxResults ~orderBy
      ?pageToken ~query () in
    let query_parameters = Option.map ActivitiesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response ActivityFeed.of_data_model) session 
    
  
end

module CommentsResource =
struct
  module SortOrder =
  struct
    type t =
      | Default
      | Ascending
      | Descending
      
    let to_string = function
      | Default -> ""
      | Ascending -> "ascending"
      | Descending -> "descending"
      
    let of_string = function
      | "" -> Default
      | "ascending" -> Ascending
      | "descending" -> Descending
      | s -> failwith ("Unexpected value for SortOrder:" ^ s)
  
  end
  
  module CommentsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* comments-specific query parameters *)
      maxResults : int;
      pageToken : string;
      sortOrder : SortOrder.t;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 20;
      pageToken = "";
      sortOrder = SortOrder.Default;
      
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
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.sortOrder) SortOrder.to_string "sortOrder";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(sortOrder = default.sortOrder)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        pageToken;
        sortOrder;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?etag
        ?std_params
        ~commentId
        session =
    let full_url = GapiUtils.add_path_to_url ["comments";
      ((fun x -> x) commentId)] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Comment.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?std_params
        ?(maxResults = 20)
        ?(sortOrder = SortOrder.Default)
        ?pageToken
        ~activityId
        session =
    let full_url = GapiUtils.add_path_to_url ["activities";
      ((fun x -> x) activityId); "comments"] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params ~maxResults ?pageToken ~sortOrder () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response CommentFeed.of_data_model) session 
    
  
end

module MomentsResource =
struct
  module Collection =
  struct
    type t =
      | Default
      | Vault
      
    let to_string = function
      | Default -> ""
      | Vault -> "vault"
      
    let of_string = function
      | "" -> Default
      | "vault" -> Vault
      | s -> failwith ("Unexpected value for Collection:" ^ s)
  
  end
  
  module MomentsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* moments-specific query parameters *)
      debug : bool;
      maxResults : int;
      pageToken : string;
      targetUrl : string;
      _type : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      debug = false;
      maxResults = 20;
      pageToken = "";
      targetUrl = "";
      _type = "";
      
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
      param (fun p -> p.debug) string_of_bool "debug";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.targetUrl) (fun x -> x) "targetUrl";
      param (fun p -> p._type) (fun x -> x) "type";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(debug = default.debug)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(targetUrl = default.targetUrl)
        ?(_type = default._type)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        debug;
        maxResults;
        pageToken;
        targetUrl;
        _type;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let insert
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?std_params
        ?debug
        ~userId
        ~collection
        moment
        session =
    let full_url = GapiUtils.add_path_to_url ["people";
      ((fun x -> x) userId); "moments"; (Collection.to_string collection)]
      base_url in
    let params = MomentsParameters.merge_parameters
      ?standard_parameters:std_params ?debug () in
    let query_parameters = Option.map MomentsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json Moment.to_data_model) ~data:moment
      full_url (GapiJson.parse_json_response Moment.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?std_params
        ?(maxResults = 20)
        ?pageToken
        ?targetUrl
        ?_type
        ~userId
        ~collection
        session =
    let full_url = GapiUtils.add_path_to_url ["people";
      ((fun x -> x) userId); "moments"; (Collection.to_string collection)]
      base_url in
    let params = MomentsParameters.merge_parameters
      ?standard_parameters:std_params ~maxResults ?pageToken ?targetUrl
      ?_type () in
    let query_parameters = Option.map MomentsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response MomentsFeed.of_data_model) session 
    
  
end

module PeopleResource =
struct
  module Collection =
  struct
    type t =
      | Default
      | Connected
      | Visible
      | Plusoners
      | Resharers
      
    let to_string = function
      | Default -> ""
      | Connected -> "connected"
      | Visible -> "visible"
      | Plusoners -> "plusoners"
      | Resharers -> "resharers"
      
    let of_string = function
      | "" -> Default
      | "connected" -> Connected
      | "visible" -> Visible
      | "plusoners" -> Plusoners
      | "resharers" -> Resharers
      | s -> failwith ("Unexpected value for Collection:" ^ s)
  
  end
  
  module OrderBy =
  struct
    type t =
      | Default
      | Alphabetical
      | Best
      
    let to_string = function
      | Default -> ""
      | Alphabetical -> "alphabetical"
      | Best -> "best"
      
    let of_string = function
      | "" -> Default
      | "alphabetical" -> Alphabetical
      | "best" -> Best
      | s -> failwith ("Unexpected value for OrderBy:" ^ s)
  
  end
  
  module PeopleParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* people-specific query parameters *)
      language : string;
      maxResults : int;
      orderBy : OrderBy.t;
      pageToken : string;
      query : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      language = "en-US";
      maxResults = 100;
      orderBy = OrderBy.Default;
      pageToken = "";
      query = "";
      
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
      param (fun p -> p.language) (fun x -> x) "language";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.orderBy) OrderBy.to_string "orderBy";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.query) (fun x -> x) "query";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(language = default.language)
        ?(maxResults = default.maxResults)
        ?(orderBy = default.orderBy)
        ?(pageToken = default.pageToken)
        ?(query = default.query)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        language;
        maxResults;
        orderBy;
        pageToken;
        query;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?etag
        ?std_params
        ~userId
        session =
    let full_url = GapiUtils.add_path_to_url ["people";
      ((fun x -> x) userId)] base_url in
    let params = PeopleParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map PeopleParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Person.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?std_params
        ?(maxResults = 100)
        ?orderBy
        ?pageToken
        ~userId
        ~collection
        session =
    let full_url = GapiUtils.add_path_to_url ["people";
      ((fun x -> x) userId); "people"; (Collection.to_string collection)]
      base_url in
    let params = PeopleParameters.merge_parameters
      ?standard_parameters:std_params ~maxResults ?orderBy ?pageToken () in
    let query_parameters = Option.map PeopleParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response PeopleFeed.of_data_model) session 
    
  let listByActivity
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?std_params
        ?(maxResults = 20)
        ?pageToken
        ~activityId
        ~collection
        session =
    let full_url = GapiUtils.add_path_to_url ["activities";
      ((fun x -> x) activityId); "people"; (Collection.to_string collection)]
      base_url in
    let params = PeopleParameters.merge_parameters
      ?standard_parameters:std_params ~maxResults ?pageToken () in
    let query_parameters = Option.map PeopleParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response PeopleFeed.of_data_model) session 
    
  let search
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?std_params
        ?(language = "en-US")
        ?(maxResults = 25)
        ?pageToken
        ~query
        session =
    let full_url = GapiUtils.add_path_to_url ["people"] base_url in
    let params = PeopleParameters.merge_parameters
      ?standard_parameters:std_params ~language ~maxResults ?pageToken ~query
      () in
    let query_parameters = Option.map PeopleParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response PeopleFeed.of_data_model) session 
    
  
end

