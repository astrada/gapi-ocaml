(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiDriveV2Model

module Scope =
struct
  let drive = "https://www.googleapis.com/auth/drive"
  
  let drive_appdata = "https://www.googleapis.com/auth/drive.appdata"
  
  let drive_apps_readonly = "https://www.googleapis.com/auth/drive.apps.readonly"
  
  let drive_file = "https://www.googleapis.com/auth/drive.file"
  
  let drive_metadata = "https://www.googleapis.com/auth/drive.metadata"
  
  let drive_metadata_readonly = "https://www.googleapis.com/auth/drive.metadata.readonly"
  
  let drive_photos_readonly = "https://www.googleapis.com/auth/drive.photos.readonly"
  
  let drive_readonly = "https://www.googleapis.com/auth/drive.readonly"
  
  let drive_scripts = "https://www.googleapis.com/auth/drive.scripts"
  
  
end

module AboutResource =
struct
  module AboutParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* about-specific query parameters *)
      includeSubscribed : bool;
      maxChangeIdCount : int64;
      startChangeId : int64;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      includeSubscribed = true;
      maxChangeIdCount = 1L;
      startChangeId = 0L;
      
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
      param (fun p -> p.includeSubscribed) string_of_bool "includeSubscribed";
      param (fun p -> p.maxChangeIdCount) Int64.to_string "maxChangeIdCount";
      param (fun p -> p.startChangeId) Int64.to_string "startChangeId";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(includeSubscribed = default.includeSubscribed)
        ?(maxChangeIdCount = default.maxChangeIdCount)
        ?(startChangeId = default.startChangeId)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        includeSubscribed;
        maxChangeIdCount;
        startChangeId;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ?(includeSubscribed = true)
        ?(maxChangeIdCount = 1L)
        ?startChangeId
        session =
    let full_url = GapiUtils.add_path_to_url ["about"] base_url in
    let params = AboutParameters.merge_parameters
      ?standard_parameters:std_params ~includeSubscribed ~maxChangeIdCount
      ?startChangeId () in
    let query_parameters = Option.map AboutParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response About.of_data_model) session 
    
  
end

module AppsResource =
struct
  module AppsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* apps-specific query parameters *)
      appFilterExtensions : string;
      appFilterMimeTypes : string;
      languageCode : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      appFilterExtensions = "";
      appFilterMimeTypes = "";
      languageCode = "";
      
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
      param (fun p -> p.appFilterExtensions) (fun x -> x) "appFilterExtensions";
      param (fun p -> p.appFilterMimeTypes) (fun x -> x) "appFilterMimeTypes";
      param (fun p -> p.languageCode) (fun x -> x) "languageCode";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(appFilterExtensions = default.appFilterExtensions)
        ?(appFilterMimeTypes = default.appFilterMimeTypes)
        ?(languageCode = default.languageCode)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        appFilterExtensions;
        appFilterMimeTypes;
        languageCode;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ~appId
        session =
    let full_url = GapiUtils.add_path_to_url ["apps"; ((fun x -> x) appId)]
      base_url in
    let params = AppsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map AppsParameters.to_key_value_list params
      in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response App.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?appFilterExtensions
        ?appFilterMimeTypes
        ?languageCode
        session =
    let full_url = GapiUtils.add_path_to_url ["apps"] base_url in
    let params = AppsParameters.merge_parameters
      ?standard_parameters:std_params ?appFilterExtensions
      ?appFilterMimeTypes ?languageCode () in
    let query_parameters = Option.map AppsParameters.to_key_value_list params
      in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response AppList.of_data_model) session 
    
  
end

module ChangesResource =
struct
  module ChangesParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* changes-specific query parameters *)
      includeDeleted : bool;
      includeSubscribed : bool;
      maxResults : int;
      pageToken : string;
      spaces : string;
      startChangeId : int64;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      includeDeleted = true;
      includeSubscribed = true;
      maxResults = 100;
      pageToken = "";
      spaces = "";
      startChangeId = 0L;
      
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
      param (fun p -> p.includeDeleted) string_of_bool "includeDeleted";
      param (fun p -> p.includeSubscribed) string_of_bool "includeSubscribed";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.spaces) (fun x -> x) "spaces";
      param (fun p -> p.startChangeId) Int64.to_string "startChangeId";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(includeDeleted = default.includeDeleted)
        ?(includeSubscribed = default.includeSubscribed)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(spaces = default.spaces)
        ?(startChangeId = default.startChangeId)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        includeDeleted;
        includeSubscribed;
        maxResults;
        pageToken;
        spaces;
        startChangeId;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ~changeId
        session =
    let full_url = GapiUtils.add_path_to_url ["changes";
      ((fun x -> x) changeId)] base_url in
    let params = ChangesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map ChangesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Change.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(includeDeleted = true)
        ?(includeSubscribed = true)
        ?(maxResults = 100)
        ?pageToken
        ?spaces
        ?startChangeId
        session =
    let full_url = GapiUtils.add_path_to_url ["changes"] base_url in
    let params = ChangesParameters.merge_parameters
      ?standard_parameters:std_params ~includeDeleted ~includeSubscribed
      ~maxResults ?pageToken ?spaces ?startChangeId () in
    let query_parameters = Option.map ChangesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response ChangeList.of_data_model) session 
    
  let watch
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(includeDeleted = true)
        ?(includeSubscribed = true)
        ?(maxResults = 100)
        ?pageToken
        ?spaces
        ?startChangeId
        channel
        session =
    let full_url = GapiUtils.add_path_to_url ["changes"; "watch"] base_url in
    let params = ChangesParameters.merge_parameters
      ?standard_parameters:std_params ~includeDeleted ~includeSubscribed
      ~maxResults ?pageToken ?spaces ?startChangeId () in
    let query_parameters = Option.map ChangesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json Channel.to_data_model)
      ~data:channel full_url
      (GapiJson.parse_json_response Channel.of_data_model) session 
    
  
end

module ChannelsResource =
struct
  let stop
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        channel
        session =
    let full_url = GapiUtils.add_path_to_url ["channels"; "stop"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json Channel.to_data_model)
      ~data:channel full_url GapiRequest.parse_empty_response session 
    
  
end

module ChildrenResource =
struct
  module ChildrenParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* children-specific query parameters *)
      maxResults : int;
      orderBy : string;
      pageToken : string;
      q : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 100;
      orderBy = "";
      pageToken = "";
      q = "";
      
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
      param (fun p -> p.orderBy) (fun x -> x) "orderBy";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.q) (fun x -> x) "q";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(orderBy = default.orderBy)
        ?(pageToken = default.pageToken)
        ?(q = default.q)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
        orderBy;
        pageToken;
        q;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~folderId
        ~childId
        session =
    let full_url = GapiUtils.add_path_to_url ["files";
      ((fun x -> x) folderId); "children"; ((fun x -> x) childId)] base_url
      in
    let params = ChildrenParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map ChildrenParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ~folderId
        ~childId
        session =
    let full_url = GapiUtils.add_path_to_url ["files";
      ((fun x -> x) folderId); "children"; ((fun x -> x) childId)] base_url
      in
    let params = ChildrenParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map ChildrenParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response ChildReference.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~folderId
        childReference
        session =
    let full_url = GapiUtils.add_path_to_url ["files";
      ((fun x -> x) folderId); "children"] base_url in
    let params = ChildrenParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map ChildrenParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json ChildReference.to_data_model)
      ~data:childReference full_url
      (GapiJson.parse_json_response ChildReference.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(maxResults = 100)
        ?orderBy
        ?pageToken
        ?q
        ~folderId
        session =
    let full_url = GapiUtils.add_path_to_url ["files";
      ((fun x -> x) folderId); "children"] base_url in
    let params = ChildrenParameters.merge_parameters
      ?standard_parameters:std_params ~maxResults ?orderBy ?pageToken ?q ()
      in
    let query_parameters = Option.map ChildrenParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response ChildList.of_data_model) session 
    
  
end

module CommentsResource =
struct
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
      includeDeleted : bool;
      maxResults : int;
      pageToken : string;
      updatedMin : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      includeDeleted = false;
      maxResults = 20;
      pageToken = "";
      updatedMin = "";
      
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
      param (fun p -> p.includeDeleted) string_of_bool "includeDeleted";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.updatedMin) (fun x -> x) "updatedMin";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(includeDeleted = default.includeDeleted)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(updatedMin = default.updatedMin)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        includeDeleted;
        maxResults;
        pageToken;
        updatedMin;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~commentId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId)] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ?(includeDeleted = false)
        ~fileId
        ~commentId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId)] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params ~includeDeleted () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Comment.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        comment
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json Comment.to_data_model)
      ~data:comment full_url
      (GapiJson.parse_json_response Comment.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(includeDeleted = false)
        ?(maxResults = 20)
        ?pageToken
        ?updatedMin
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params ~includeDeleted ~maxResults ?pageToken
      ?updatedMin () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response CommentList.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~commentId
        comment
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId)] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters
      ~data_to_post:(GapiJson.render_json Comment.to_data_model)
      ~data:comment full_url
      (GapiJson.parse_json_response Comment.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~commentId
        comment
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId)] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map CommentsParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters
      ~data_to_post:(GapiJson.render_json Comment.to_data_model)
      ~data:comment full_url
      (GapiJson.parse_json_response Comment.of_data_model) session 
    
  
end

module FilesResource =
struct
  module Corpus =
  struct
    type t =
      | Default
      | DEFAULT
      | DOMAIN
      
    let to_string = function
      | Default -> ""
      | DEFAULT -> "DEFAULT"
      | DOMAIN -> "DOMAIN"
      
    let of_string = function
      | "" -> Default
      | "DEFAULT" -> DEFAULT
      | "DOMAIN" -> DOMAIN
      | s -> failwith ("Unexpected value for Corpus:" ^ s)
  
  end
  
  module ModifiedDateBehavior =
  struct
    type t =
      | Default
      | FromBody
      | FromBodyIfNeeded
      | FromBodyOrNow
      | NoChange
      | Now
      | NowIfNeeded
      
    let to_string = function
      | Default -> ""
      | FromBody -> "fromBody"
      | FromBodyIfNeeded -> "fromBodyIfNeeded"
      | FromBodyOrNow -> "fromBodyOrNow"
      | NoChange -> "noChange"
      | Now -> "now"
      | NowIfNeeded -> "nowIfNeeded"
      
    let of_string = function
      | "" -> Default
      | "fromBody" -> FromBody
      | "fromBodyIfNeeded" -> FromBodyIfNeeded
      | "fromBodyOrNow" -> FromBodyOrNow
      | "noChange" -> NoChange
      | "now" -> Now
      | "nowIfNeeded" -> NowIfNeeded
      | s -> failwith ("Unexpected value for ModifiedDateBehavior:" ^ s)
  
  end
  
  module Projection =
  struct
    type t =
      | Default
      | BASIC
      | FULL
      
    let to_string = function
      | Default -> ""
      | BASIC -> "BASIC"
      | FULL -> "FULL"
      
    let of_string = function
      | "" -> Default
      | "BASIC" -> BASIC
      | "FULL" -> FULL
      | s -> failwith ("Unexpected value for Projection:" ^ s)
  
  end
  
  module Visibility =
  struct
    type t =
      | Default
      | DEFAULT
      | PRIVATE
      
    let to_string = function
      | Default -> ""
      | DEFAULT -> "DEFAULT"
      | PRIVATE -> "PRIVATE"
      
    let of_string = function
      | "" -> Default
      | "DEFAULT" -> DEFAULT
      | "PRIVATE" -> PRIVATE
      | s -> failwith ("Unexpected value for Visibility:" ^ s)
  
  end
  
  module FilesParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* files-specific query parameters *)
      acknowledgeAbuse : bool;
      addParents : string;
      convert : bool;
      corpus : Corpus.t;
      maxResults : int;
      mimeType : string;
      modifiedDateBehavior : ModifiedDateBehavior.t;
      newRevision : bool;
      ocr : bool;
      ocrLanguage : string;
      orderBy : string;
      pageToken : string;
      pinned : bool;
      projection : Projection.t;
      q : string;
      removeParents : string;
      revisionId : string;
      setModifiedDate : bool;
      space : string;
      spaces : string;
      timedTextLanguage : string;
      timedTextTrackName : string;
      updateViewedDate : bool;
      useContentAsIndexableText : bool;
      visibility : Visibility.t;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      acknowledgeAbuse = false;
      addParents = "";
      convert = false;
      corpus = Corpus.Default;
      maxResults = 10;
      mimeType = "";
      modifiedDateBehavior = ModifiedDateBehavior.Default;
      newRevision = true;
      ocr = false;
      ocrLanguage = "";
      orderBy = "";
      pageToken = "";
      pinned = false;
      projection = Projection.Default;
      q = "";
      removeParents = "";
      revisionId = "";
      setModifiedDate = false;
      space = "drive";
      spaces = "";
      timedTextLanguage = "";
      timedTextTrackName = "";
      updateViewedDate = false;
      useContentAsIndexableText = false;
      visibility = Visibility.Default;
      
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
      param (fun p -> p.acknowledgeAbuse) string_of_bool "acknowledgeAbuse";
      param (fun p -> p.addParents) (fun x -> x) "addParents";
      param (fun p -> p.convert) string_of_bool "convert";
      param (fun p -> p.corpus) Corpus.to_string "corpus";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.mimeType) (fun x -> x) "mimeType";
      param (fun p -> p.modifiedDateBehavior) ModifiedDateBehavior.to_string "modifiedDateBehavior";
      param (fun p -> p.newRevision) string_of_bool "newRevision";
      param (fun p -> p.ocr) string_of_bool "ocr";
      param (fun p -> p.ocrLanguage) (fun x -> x) "ocrLanguage";
      param (fun p -> p.orderBy) (fun x -> x) "orderBy";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.pinned) string_of_bool "pinned";
      param (fun p -> p.projection) Projection.to_string "projection";
      param (fun p -> p.q) (fun x -> x) "q";
      param (fun p -> p.removeParents) (fun x -> x) "removeParents";
      param (fun p -> p.revisionId) (fun x -> x) "revisionId";
      param (fun p -> p.setModifiedDate) string_of_bool "setModifiedDate";
      param (fun p -> p.space) (fun x -> x) "space";
      param (fun p -> p.spaces) (fun x -> x) "spaces";
      param (fun p -> p.timedTextLanguage) (fun x -> x) "timedTextLanguage";
      param (fun p -> p.timedTextTrackName) (fun x -> x) "timedTextTrackName";
      param (fun p -> p.updateViewedDate) string_of_bool "updateViewedDate";
      param (fun p -> p.useContentAsIndexableText) string_of_bool "useContentAsIndexableText";
      param (fun p -> p.visibility) Visibility.to_string "visibility";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(acknowledgeAbuse = default.acknowledgeAbuse)
        ?(addParents = default.addParents)
        ?(convert = default.convert)
        ?(corpus = default.corpus)
        ?(maxResults = default.maxResults)
        ?(mimeType = default.mimeType)
        ?(modifiedDateBehavior = default.modifiedDateBehavior)
        ?(newRevision = default.newRevision)
        ?(ocr = default.ocr)
        ?(ocrLanguage = default.ocrLanguage)
        ?(orderBy = default.orderBy)
        ?(pageToken = default.pageToken)
        ?(pinned = default.pinned)
        ?(projection = default.projection)
        ?(q = default.q)
        ?(removeParents = default.removeParents)
        ?(revisionId = default.revisionId)
        ?(setModifiedDate = default.setModifiedDate)
        ?(space = default.space)
        ?(spaces = default.spaces)
        ?(timedTextLanguage = default.timedTextLanguage)
        ?(timedTextTrackName = default.timedTextTrackName)
        ?(updateViewedDate = default.updateViewedDate)
        ?(useContentAsIndexableText = default.useContentAsIndexableText)
        ?(visibility = default.visibility)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        acknowledgeAbuse;
        addParents;
        convert;
        corpus;
        maxResults;
        mimeType;
        modifiedDateBehavior;
        newRevision;
        ocr;
        ocrLanguage;
        orderBy;
        pageToken;
        pinned;
        projection;
        q;
        removeParents;
        revisionId;
        setModifiedDate;
        space;
        spaces;
        timedTextLanguage;
        timedTextTrackName;
        updateViewedDate;
        useContentAsIndexableText;
        visibility;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let copy
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(convert = false)
        ?(ocr = false)
        ?(pinned = false)
        ?(visibility = Visibility.Default)
        ?ocrLanguage
        ?timedTextLanguage
        ?timedTextTrackName
        ~fileId
        file
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "copy"] base_url in
    let etag = GapiUtils.etag_option file.File.etag in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~convert ~ocr ?ocrLanguage ~pinned
      ?timedTextLanguage ?timedTextTrackName ~visibility () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json File.to_data_model) ~data:file
      full_url (GapiJson.parse_json_response File.of_data_model) session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId)]
      base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let emptyTrash
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; "trash"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let export
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?media_download
        ~fileId
        ~mimeType
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "export"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~mimeType () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?media_download full_url
      GapiRequest.parse_empty_response session 
    
  let generateIds
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(maxResults = 10)
        ?(space = "drive")
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; "generateIds"]
      base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~maxResults ~space () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response GeneratedIds.of_data_model) session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ?media_download
        ?(acknowledgeAbuse = false)
        ?(updateViewedDate = false)
        ?projection
        ?revisionId
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId)]
      base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~acknowledgeAbuse ?projection
      ?revisionId ~updateViewedDate () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag ?media_download full_url
      (GapiJson.parse_json_response File.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?media_source
        ?(convert = false)
        ?(ocr = false)
        ?(pinned = false)
        ?(useContentAsIndexableText = false)
        ?(visibility = Visibility.Default)
        ?ocrLanguage
        ?timedTextLanguage
        ?timedTextTrackName
        file
        session =
    let base_path = ["files"] in
    let media_path = [""; "resumable"; "upload"; "drive"; "v2"; "files"] in
    let path_to_add = if Option.is_some media_source then media_path
      else base_path in
    let full_url = GapiUtils.add_path_to_url path_to_add base_url in
    let etag = GapiUtils.etag_option file.File.etag in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~convert ~ocr ?ocrLanguage ~pinned
      ?timedTextLanguage ?timedTextTrackName ~useContentAsIndexableText
      ~visibility () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag ?media_source
      ~data_to_post:(GapiJson.render_json File.to_data_model) ~data:file
      full_url (GapiJson.parse_json_response File.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(maxResults = 100)
        ?corpus
        ?orderBy
        ?pageToken
        ?projection
        ?q
        ?spaces
        session =
    let full_url = GapiUtils.add_path_to_url ["files"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ?corpus ~maxResults ?orderBy ?pageToken
      ?projection ?q ?spaces () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response FileList.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(convert = false)
        ?(newRevision = true)
        ?(ocr = false)
        ?(pinned = false)
        ?(setModifiedDate = false)
        ?(updateViewedDate = true)
        ?(useContentAsIndexableText = false)
        ?addParents
        ?modifiedDateBehavior
        ?ocrLanguage
        ?removeParents
        ?timedTextLanguage
        ?timedTextTrackName
        ~fileId
        file
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId)]
      base_url in
    let etag = GapiUtils.etag_option file.File.etag in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ?addParents ~convert
      ?modifiedDateBehavior ~newRevision ~ocr ?ocrLanguage ~pinned
      ?removeParents ~setModifiedDate ?timedTextLanguage ?timedTextTrackName
      ~updateViewedDate ~useContentAsIndexableText () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json File.to_data_model) ~data:file
      full_url (GapiJson.parse_json_response File.of_data_model) session 
    
  let touch
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "touch"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ~data:File.empty full_url
      (GapiJson.parse_json_response File.of_data_model) session 
    
  let trash
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "trash"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ~data:File.empty full_url
      (GapiJson.parse_json_response File.of_data_model) session 
    
  let untrash
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "untrash"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ~data:File.empty full_url
      (GapiJson.parse_json_response File.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?media_source
        ?(convert = false)
        ?(newRevision = true)
        ?(ocr = false)
        ?(pinned = false)
        ?(setModifiedDate = false)
        ?(updateViewedDate = true)
        ?(useContentAsIndexableText = false)
        ?addParents
        ?modifiedDateBehavior
        ?ocrLanguage
        ?removeParents
        ?timedTextLanguage
        ?timedTextTrackName
        ~fileId
        file
        session =
    let base_path = ["files"; ((fun x -> x) fileId)] in
    let media_path = [""; "resumable"; "upload"; "drive"; "v2"; "files";
      ((fun x -> x) fileId)] in
    let path_to_add = if Option.is_some media_source then media_path
      else base_path in
    let full_url = GapiUtils.add_path_to_url path_to_add base_url in
    let etag = GapiUtils.etag_option file.File.etag in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ?addParents ~convert
      ?modifiedDateBehavior ~newRevision ~ocr ?ocrLanguage ~pinned
      ?removeParents ~setModifiedDate ?timedTextLanguage ?timedTextTrackName
      ~updateViewedDate ~useContentAsIndexableText () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag ?media_source
      ~data_to_post:(GapiJson.render_json File.to_data_model) ~data:file
      full_url (GapiJson.parse_json_response File.of_data_model) session 
    
  let watch
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?media_download
        ?(acknowledgeAbuse = false)
        ?(updateViewedDate = false)
        ?projection
        ?revisionId
        ~fileId
        channel
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "watch"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~acknowledgeAbuse ?projection
      ?revisionId ~updateViewedDate () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?media_download
      ~data_to_post:(GapiJson.render_json Channel.to_data_model)
      ~data:channel full_url
      (GapiJson.parse_json_response Channel.of_data_model) session 
    
  
end

module ParentsResource =
struct
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~parentId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "parents"; ((fun x -> x) parentId)] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ~fileId
        ~parentId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "parents"; ((fun x -> x) parentId)] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response ParentReference.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        parentReference
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "parents"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json ParentReference.to_data_model)
      ~data:parentReference full_url
      (GapiJson.parse_json_response ParentReference.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "parents"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response ParentList.of_data_model) session 
    
  
end

module PermissionsResource =
struct
  module PermissionsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* permissions-specific query parameters *)
      emailMessage : string;
      removeExpiration : bool;
      sendNotificationEmails : bool;
      transferOwnership : bool;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      emailMessage = "";
      removeExpiration = false;
      sendNotificationEmails = true;
      transferOwnership = false;
      
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
      param (fun p -> p.emailMessage) (fun x -> x) "emailMessage";
      param (fun p -> p.removeExpiration) string_of_bool "removeExpiration";
      param (fun p -> p.sendNotificationEmails) string_of_bool "sendNotificationEmails";
      param (fun p -> p.transferOwnership) string_of_bool "transferOwnership";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(emailMessage = default.emailMessage)
        ?(removeExpiration = default.removeExpiration)
        ?(sendNotificationEmails = default.sendNotificationEmails)
        ?(transferOwnership = default.transferOwnership)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        emailMessage;
        removeExpiration;
        sendNotificationEmails;
        transferOwnership;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~permissionId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"; ((fun x -> x) permissionId)] base_url in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map PermissionsParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ~fileId
        ~permissionId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"; ((fun x -> x) permissionId)] base_url in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map PermissionsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Permission.of_data_model) session 
    
  let getIdForEmail
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~email
        session =
    let full_url = GapiUtils.add_path_to_url ["permissionIds";
      ((fun x -> x) email)] base_url in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map PermissionsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response PermissionId.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(sendNotificationEmails = true)
        ?emailMessage
        ~fileId
        permission
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"] base_url in
    let etag = GapiUtils.etag_option permission.Permission.etag in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params ?emailMessage ~sendNotificationEmails
      () in
    let query_parameters = Option.map PermissionsParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Permission.to_data_model)
      ~data:permission full_url
      (GapiJson.parse_json_response Permission.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"] base_url in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map PermissionsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response PermissionList.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(removeExpiration = false)
        ?(transferOwnership = false)
        ~fileId
        ~permissionId
        permission
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"; ((fun x -> x) permissionId)] base_url in
    let etag = GapiUtils.etag_option permission.Permission.etag in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params ~removeExpiration ~transferOwnership ()
      in
    let query_parameters = Option.map PermissionsParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Permission.to_data_model)
      ~data:permission full_url
      (GapiJson.parse_json_response Permission.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(removeExpiration = false)
        ?(transferOwnership = false)
        ~fileId
        ~permissionId
        permission
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"; ((fun x -> x) permissionId)] base_url in
    let etag = GapiUtils.etag_option permission.Permission.etag in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params ~removeExpiration ~transferOwnership ()
      in
    let query_parameters = Option.map PermissionsParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Permission.to_data_model)
      ~data:permission full_url
      (GapiJson.parse_json_response Permission.of_data_model) session 
    
  
end

module PropertiesResource =
struct
  module PropertiesParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* properties-specific query parameters *)
      visibility : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      visibility = "private";
      
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
      param (fun p -> p.visibility) (fun x -> x) "visibility";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(visibility = default.visibility)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        visibility;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(visibility = "private")
        ~fileId
        ~propertyKey
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "properties"; ((fun x -> x) propertyKey)] base_url in
    let params = PropertiesParameters.merge_parameters
      ?standard_parameters:std_params ~visibility () in
    let query_parameters = Option.map PropertiesParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ?(visibility = "private")
        ~fileId
        ~propertyKey
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "properties"; ((fun x -> x) propertyKey)] base_url in
    let params = PropertiesParameters.merge_parameters
      ?standard_parameters:std_params ~visibility () in
    let query_parameters = Option.map PropertiesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Property.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        property
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "properties"] base_url in
    let etag = GapiUtils.etag_option property.Property.etag in
    let params = PropertiesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map PropertiesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Property.to_data_model)
      ~data:property full_url
      (GapiJson.parse_json_response Property.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "properties"] base_url in
    let params = PropertiesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map PropertiesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response PropertyList.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(visibility = "private")
        ~fileId
        ~propertyKey
        property
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "properties"; ((fun x -> x) propertyKey)] base_url in
    let etag = GapiUtils.etag_option property.Property.etag in
    let params = PropertiesParameters.merge_parameters
      ?standard_parameters:std_params ~visibility () in
    let query_parameters = Option.map PropertiesParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Property.to_data_model)
      ~data:property full_url
      (GapiJson.parse_json_response Property.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(visibility = "private")
        ~fileId
        ~propertyKey
        property
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "properties"; ((fun x -> x) propertyKey)] base_url in
    let etag = GapiUtils.etag_option property.Property.etag in
    let params = PropertiesParameters.merge_parameters
      ?standard_parameters:std_params ~visibility () in
    let query_parameters = Option.map PropertiesParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Property.to_data_model)
      ~data:property full_url
      (GapiJson.parse_json_response Property.of_data_model) session 
    
  
end

module RealtimeResource =
struct
  module RealtimeParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* realtime-specific query parameters *)
      baseRevision : string;
      revision : int;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      baseRevision = "";
      revision = 0;
      
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
      param (fun p -> p.baseRevision) (fun x -> x) "baseRevision";
      param (fun p -> p.revision) string_of_int "revision";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(baseRevision = default.baseRevision)
        ?(revision = default.revision)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        baseRevision;
        revision;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ?media_download
        ?revision
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "realtime"] base_url in
    let params = RealtimeParameters.merge_parameters
      ?standard_parameters:std_params ?revision () in
    let query_parameters = Option.map RealtimeParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag ?media_download full_url
      GapiRequest.parse_empty_response session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?media_source
        ?baseRevision
        ~fileId
        session =
    let base_path = ["files"; ((fun x -> x) fileId); "realtime"] in
    let media_path = [""; "resumable"; "upload"; "drive"; "v2"; "files";
      ((fun x -> x) fileId); "realtime"] in
    let path_to_add = if Option.is_some media_source then media_path
      else base_path in
    let full_url = GapiUtils.add_path_to_url path_to_add base_url in
    let params = RealtimeParameters.merge_parameters
      ?standard_parameters:std_params ?baseRevision () in
    let query_parameters = Option.map RealtimeParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?media_source
      ~data_to_post:(fun _ -> GapiCore.PostData.empty) ~data:() full_url
      GapiRequest.parse_empty_response session 
    
  
end

module RepliesResource =
struct
  module RepliesParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* replies-specific query parameters *)
      includeDeleted : bool;
      maxResults : int;
      pageToken : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      includeDeleted = false;
      maxResults = 20;
      pageToken = "";
      
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
      param (fun p -> p.includeDeleted) string_of_bool "includeDeleted";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(includeDeleted = default.includeDeleted)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        includeDeleted;
        maxResults;
        pageToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~commentId
        ~replyId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId); "replies";
      ((fun x -> x) replyId)] base_url in
    let params = RepliesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map RepliesParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ?(includeDeleted = false)
        ~fileId
        ~commentId
        ~replyId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId); "replies";
      ((fun x -> x) replyId)] base_url in
    let params = RepliesParameters.merge_parameters
      ?standard_parameters:std_params ~includeDeleted () in
    let query_parameters = Option.map RepliesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response CommentReply.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~commentId
        commentReply
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId); "replies"] base_url in
    let params = RepliesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map RepliesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json CommentReply.to_data_model)
      ~data:commentReply full_url
      (GapiJson.parse_json_response CommentReply.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(includeDeleted = false)
        ?(maxResults = 20)
        ?pageToken
        ~fileId
        ~commentId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId); "replies"] base_url in
    let params = RepliesParameters.merge_parameters
      ?standard_parameters:std_params ~includeDeleted ~maxResults ?pageToken
      () in
    let query_parameters = Option.map RepliesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response CommentReplyList.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~commentId
        ~replyId
        commentReply
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId); "replies";
      ((fun x -> x) replyId)] base_url in
    let params = RepliesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map RepliesParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters
      ~data_to_post:(GapiJson.render_json CommentReply.to_data_model)
      ~data:commentReply full_url
      (GapiJson.parse_json_response CommentReply.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~commentId
        ~replyId
        commentReply
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId); "replies";
      ((fun x -> x) replyId)] base_url in
    let params = RepliesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map RepliesParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters
      ~data_to_post:(GapiJson.render_json CommentReply.to_data_model)
      ~data:commentReply full_url
      (GapiJson.parse_json_response CommentReply.of_data_model) session 
    
  
end

module RevisionsResource =
struct
  module RevisionsParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* revisions-specific query parameters *)
      maxResults : int;
      pageToken : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 200;
      pageToken = "";
      
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
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
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
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~revisionId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"; ((fun x -> x) revisionId)] base_url in
    let params = RevisionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map RevisionsParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ~fileId
        ~revisionId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"; ((fun x -> x) revisionId)] base_url in
    let params = RevisionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map RevisionsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Revision.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(maxResults = 200)
        ?pageToken
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"] base_url in
    let params = RevisionsParameters.merge_parameters
      ?standard_parameters:std_params ~maxResults ?pageToken () in
    let query_parameters = Option.map RevisionsParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response RevisionList.of_data_model) session 
    
  let patch
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~revisionId
        revision
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"; ((fun x -> x) revisionId)] base_url in
    let etag = GapiUtils.etag_option revision.Revision.etag in
    let params = RevisionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map RevisionsParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Revision.to_data_model)
      ~data:revision full_url
      (GapiJson.parse_json_response Revision.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~revisionId
        revision
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"; ((fun x -> x) revisionId)] base_url in
    let etag = GapiUtils.etag_option revision.Revision.etag in
    let params = RevisionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map RevisionsParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Revision.to_data_model)
      ~data:revision full_url
      (GapiJson.parse_json_response Revision.of_data_model) session 
    
  
end

