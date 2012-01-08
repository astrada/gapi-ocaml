(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiPlusV1Model

let scope_me = "https://www.googleapis.com/auth/plus.me"

let scope_email = "https://www.googleapis.com/auth/userinfo.email"

module ActivitiesResource =
struct
  module Alt =
  struct
    type t =
      | Default
      | Json
      
    let to_string = function
      | Default -> ""
      | Json -> "json"
      
    let of_string = function
      | "" -> Default
      | "json" -> Json
      | s -> failwith ("Unexpected value for Alt:" ^ s)
  
  end
  
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
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* activities-specific query parameters *)
      alt : Alt.t;
      language : string;
      maxResults : int;
      orderBy : OrderBy.t;
      pageToken : string;
      query : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      alt = Alt.Default;
      language = "";
      maxResults = 20;
      orderBy = OrderBy.Default;
      pageToken = "";
      query = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.alt) Alt.to_string "alt";
      param (fun p -> p.language) (fun x -> x) "language";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.orderBy) OrderBy.to_string "orderBy";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.query) (fun x -> x) "query";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(alt = default.alt)
        ?(language = default.language)
        ?(maxResults = default.maxResults)
        ?(orderBy = default.orderBy)
        ?(pageToken = default.pageToken)
        ?(query = default.query)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        alt;
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
        ?parameters
        ?(alt = Alt.Default)
        ~activityId
        session =
    let full_url = GapiUtils.add_path_to_url ["activities";
      ((fun x -> x) activityId)] base_url in
    let params = ActivitiesParameters.merge_parameters
      ?standard_parameters:parameters ~alt () in
    let query_parameters = Option.map ActivitiesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Activity.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?parameters
        ?(alt = Alt.Default)
        ?(maxResults = 20)
        ?pageToken
        ~userId
        ~collection
        session =
    let full_url = GapiUtils.add_path_to_url ["people";
      ((fun x -> x) userId); "activities"; (Collection.to_string collection)]
      base_url in
    let params = ActivitiesParameters.merge_parameters
      ?standard_parameters:parameters ~alt ~maxResults ?pageToken () in
    let query_parameters = Option.map ActivitiesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response ActivityFeed.of_data_model) session 
    
  let search
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?parameters
        ?(maxResults = 10)
        ?(orderBy = OrderBy.Default)
        ?language
        ?pageToken
        ~query
        session =
    let full_url = GapiUtils.add_path_to_url ["activities"] base_url in
    let params = ActivitiesParameters.merge_parameters
      ?standard_parameters:parameters ?language ~maxResults ~orderBy
      ?pageToken ~query () in
    let query_parameters = Option.map ActivitiesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response ActivityFeed.of_data_model) session 
    
  
end

module CommentsResource =
struct
  module Alt =
  struct
    type t =
      | Default
      | Json
      
    let to_string = function
      | Default -> ""
      | Json -> "json"
      
    let of_string = function
      | "" -> Default
      | "json" -> Json
      | s -> failwith ("Unexpected value for Alt:" ^ s)
  
  end
  
  module CommentsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* comments-specific query parameters *)
      alt : Alt.t;
      maxResults : int;
      pageToken : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      alt = Alt.Default;
      maxResults = 20;
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
      param (fun p -> p.alt) Alt.to_string "alt";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(alt = default.alt)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        alt;
        maxResults;
        pageToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?parameters
        ~commentId
        session =
    let full_url = GapiUtils.add_path_to_url ["comments";
      ((fun x -> x) commentId)] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:parameters () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Comment.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?parameters
        ?(alt = Alt.Default)
        ?(maxResults = 20)
        ?pageToken
        ~activityId
        session =
    let full_url = GapiUtils.add_path_to_url ["activities";
      ((fun x -> x) activityId); "comments"] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:parameters ~alt ~maxResults ?pageToken () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response CommentFeed.of_data_model) session 
    
  
end

module PeopleResource =
struct
  module Collection =
  struct
    type t =
      | Default
      | Plusoners
      | Resharers
      
    let to_string = function
      | Default -> ""
      | Plusoners -> "plusoners"
      | Resharers -> "resharers"
      
    let of_string = function
      | "" -> Default
      | "plusoners" -> Plusoners
      | "resharers" -> Resharers
      | s -> failwith ("Unexpected value for Collection:" ^ s)
  
  end
  
  module PeopleParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* people-specific query parameters *)
      language : string;
      maxResults : int;
      pageToken : string;
      query : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      language = "";
      maxResults = 20;
      pageToken = "";
      query = "";
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.language) (fun x -> x) "language";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.query) (fun x -> x) "query";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(language = default.language)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(query = default.query)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        language;
        maxResults;
        pageToken;
        query;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?parameters
        ~userId
        session =
    let full_url = GapiUtils.add_path_to_url ["people";
      ((fun x -> x) userId)] base_url in
    let params = PeopleParameters.merge_parameters
      ?standard_parameters:parameters () in
    let query_parameters = Option.map PeopleParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Person.of_data_model) session 
    
  let listByActivity
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?parameters
        ?(maxResults = 20)
        ?pageToken
        ~activityId
        ~collection
        session =
    let full_url = GapiUtils.add_path_to_url ["activities";
      ((fun x -> x) activityId); "people"; (Collection.to_string collection)]
      base_url in
    let params = PeopleParameters.merge_parameters
      ?standard_parameters:parameters ~maxResults ?pageToken () in
    let query_parameters = Option.map PeopleParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response PeopleFeed.of_data_model) session 
    
  let search
        ?(base_url = "https://www.googleapis.com/plus/v1/")
        ?parameters
        ?(maxResults = 10)
        ?language
        ?pageToken
        ~query
        session =
    let full_url = GapiUtils.add_path_to_url ["people"] base_url in
    let params = PeopleParameters.merge_parameters
      ?standard_parameters:parameters ?language ~maxResults ?pageToken ~query
      () in
    let query_parameters = Option.map PeopleParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response PeopleFeed.of_data_model) session 
    
  
end

