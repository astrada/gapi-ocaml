(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiBloggerV2Model

module Scope =
struct
  let blogger = "https://www.googleapis.com/auth/blogger"
  
  
end

module BlogsResource =
struct
  let get
        ?(base_url = "https://www.googleapis.com/blogger/v2/")
        ?etag
        ?std_params
        ~blogId
        session =
    let full_url = GapiUtils.add_path_to_url ["blogs"; ((fun x -> x) blogId)]
      base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Blog.of_data_model) session 
    
  
end

module CommentsResource =
struct
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
      fetchBodies : bool;
      maxResults : int;
      pageToken : string;
      startDate : GapiDate.t;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      fetchBodies = false;
      maxResults = 0;
      pageToken = "";
      startDate = GapiDate.epoch;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.fetchBodies) string_of_bool "fetchBodies";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.startDate) GapiDate.to_string "startDate";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(fetchBodies = default.fetchBodies)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(startDate = default.startDate)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        fetchBodies;
        maxResults;
        pageToken;
        startDate;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/blogger/v2/")
        ?etag
        ?std_params
        ~blogId
        ~postId
        ~commentId
        session =
    let full_url = GapiUtils.add_path_to_url ["blogs"; ((fun x -> x) blogId);
      "posts"; ((fun x -> x) postId); "comments"; ((fun x -> x) commentId)]
      base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Comment.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/blogger/v2/")
        ?std_params
        ?fetchBodies
        ?maxResults
        ?pageToken
        ?startDate
        ~blogId
        ~postId
        session =
    let full_url = GapiUtils.add_path_to_url ["blogs"; ((fun x -> x) blogId);
      "posts"; ((fun x -> x) postId); "comments"] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params ?fetchBodies ?maxResults ?pageToken
      ?startDate () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response CommentList.of_data_model) session 
    
  
end

module PagesResource =
struct
  module PagesParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* pages-specific query parameters *)
      fetchBodies : bool;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      fetchBodies = false;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.fetchBodies) string_of_bool "fetchBodies";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(fetchBodies = default.fetchBodies)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        fetchBodies;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/blogger/v2/")
        ?etag
        ?std_params
        ~blogId
        ~pageId
        session =
    let full_url = GapiUtils.add_path_to_url ["blogs"; ((fun x -> x) blogId);
      "pages"; ((fun x -> x) pageId)] base_url in
    let params = PagesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map PagesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Page.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/blogger/v2/")
        ?std_params
        ?fetchBodies
        ~blogId
        session =
    let full_url = GapiUtils.add_path_to_url ["blogs"; ((fun x -> x) blogId);
      "pages"] base_url in
    let params = PagesParameters.merge_parameters
      ?standard_parameters:std_params ?fetchBodies () in
    let query_parameters = Option.map PagesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response PageList.of_data_model) session 
    
  
end

module PostsResource =
struct
  module PostsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* posts-specific query parameters *)
      fetchBodies : bool;
      maxResults : int;
      pageToken : string;
      startDate : GapiDate.t;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      fetchBodies = false;
      maxResults = 0;
      pageToken = "";
      startDate = GapiDate.epoch;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.fetchBodies) string_of_bool "fetchBodies";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.startDate) GapiDate.to_string "startDate";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(fetchBodies = default.fetchBodies)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(startDate = default.startDate)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        fetchBodies;
        maxResults;
        pageToken;
        startDate;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/blogger/v2/")
        ?etag
        ?std_params
        ~blogId
        ~postId
        session =
    let full_url = GapiUtils.add_path_to_url ["blogs"; ((fun x -> x) blogId);
      "posts"; ((fun x -> x) postId)] base_url in
    let params = PostsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map PostsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Post.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/blogger/v2/")
        ?std_params
        ?fetchBodies
        ?maxResults
        ?pageToken
        ?startDate
        ~blogId
        session =
    let full_url = GapiUtils.add_path_to_url ["blogs"; ((fun x -> x) blogId);
      "posts"] base_url in
    let params = PostsParameters.merge_parameters
      ?standard_parameters:std_params ?fetchBodies ?maxResults ?pageToken
      ?startDate () in
    let query_parameters = Option.map PostsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response PostList.of_data_model) session 
    
  
end

module UsersResource =
struct
  module Blogs =
  struct
    let list
          ?(base_url = "https://www.googleapis.com/blogger/v2/")
          ?std_params
          ~userId
          session =
      let full_url = GapiUtils.add_path_to_url ["users";
        ((fun x -> x) userId); "blogs"] base_url in
      let params = GapiService.StandardParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        GapiService.StandardParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response BlogList.of_data_model) session 
      
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/blogger/v2/")
        ?etag
        ?std_params
        ~userId
        session =
    let full_url = GapiUtils.add_path_to_url ["users"; ((fun x -> x) userId)]
      base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response User.of_data_model) session 
    
  
end

