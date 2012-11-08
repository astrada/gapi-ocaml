(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiDriveV2Model

module Scope =
struct
  let drive = "https://www.googleapis.com/auth/drive"
  
  let drive_apps_readonly = "https://www.googleapis.com/auth/drive.apps.readonly"
  
  let drive_file = "https://www.googleapis.com/auth/drive.file"
  
  let drive_metadata_readonly = "https://www.googleapis.com/auth/drive.metadata.readonly"
  
  let drive_readonly = "https://www.googleapis.com/auth/drive.readonly"
  
  
end

module AboutResource =
struct
  module AboutParameters =
  struct
    type t = {
      (* Standard query parameters *)
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
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ~appId
        session =
    let full_url = GapiUtils.add_path_to_url ["apps"; ((fun x -> x) appId)]
      base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response App.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        session =
    let full_url = GapiUtils.add_path_to_url ["apps"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response AppList.of_data_model) session 
    
  
end

module ChangesResource =
struct
  module ChangesParameters =
  struct
    type t = {
      (* Standard query parameters *)
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
      startChangeId : int64;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      includeDeleted = true;
      includeSubscribed = true;
      maxResults = 100;
      pageToken = "";
      startChangeId = 0L;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.includeDeleted) string_of_bool "includeDeleted";
      param (fun p -> p.includeSubscribed) string_of_bool "includeSubscribed";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.startChangeId) Int64.to_string "startChangeId";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(includeDeleted = default.includeDeleted)
        ?(includeSubscribed = default.includeSubscribed)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(startChangeId = default.startChangeId)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        includeDeleted;
        includeSubscribed;
        maxResults;
        pageToken;
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
        ?startChangeId
        session =
    let full_url = GapiUtils.add_path_to_url ["changes"] base_url in
    let params = ChangesParameters.merge_parameters
      ?standard_parameters:std_params ~includeDeleted ~includeSubscribed
      ~maxResults ?pageToken ?startChangeId () in
    let query_parameters = Option.map ChangesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response ChangeList.of_data_model) session 
    
  
end

module ChildrenResource =
struct
  module ChildrenParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* children-specific query parameters *)
      maxResults : int;
      pageToken : string;
      q : string;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      maxResults = 100;
      pageToken = "";
      q = "";
      
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
      param (fun p -> p.q) (fun x -> x) "q";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(maxResults = default.maxResults)
        ?(pageToken = default.pageToken)
        ?(q = default.q)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        maxResults;
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
        ?pageToken
        ?q
        ~folderId
        session =
    let full_url = GapiUtils.add_path_to_url ["files";
      ((fun x -> x) folderId); "children"] base_url in
    let params = ChildrenParameters.merge_parameters
      ?standard_parameters:std_params ~maxResults ?pageToken ?q () in
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
  
  module FilesParameters =
  struct
    type t = {
      (* Standard query parameters *)
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* files-specific query parameters *)
      convert : bool;
      maxResults : int;
      newRevision : bool;
      ocr : bool;
      ocrLanguage : string;
      pageToken : string;
      pinned : bool;
      projection : Projection.t;
      q : string;
      setModifiedDate : bool;
      sourceLanguage : string;
      targetLanguage : string;
      timedTextLanguage : string;
      timedTextTrackName : string;
      updateViewedDate : bool;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      convert = false;
      maxResults = 100;
      newRevision = true;
      ocr = false;
      ocrLanguage = "";
      pageToken = "";
      pinned = false;
      projection = Projection.Default;
      q = "";
      setModifiedDate = false;
      sourceLanguage = "";
      targetLanguage = "";
      timedTextLanguage = "";
      timedTextTrackName = "";
      updateViewedDate = false;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.convert) string_of_bool "convert";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.newRevision) string_of_bool "newRevision";
      param (fun p -> p.ocr) string_of_bool "ocr";
      param (fun p -> p.ocrLanguage) (fun x -> x) "ocrLanguage";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.pinned) string_of_bool "pinned";
      param (fun p -> p.projection) Projection.to_string "projection";
      param (fun p -> p.q) (fun x -> x) "q";
      param (fun p -> p.setModifiedDate) string_of_bool "setModifiedDate";
      param (fun p -> p.sourceLanguage) (fun x -> x) "sourceLanguage";
      param (fun p -> p.targetLanguage) (fun x -> x) "targetLanguage";
      param (fun p -> p.timedTextLanguage) (fun x -> x) "timedTextLanguage";
      param (fun p -> p.timedTextTrackName) (fun x -> x) "timedTextTrackName";
      param (fun p -> p.updateViewedDate) string_of_bool "updateViewedDate";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(convert = default.convert)
        ?(maxResults = default.maxResults)
        ?(newRevision = default.newRevision)
        ?(ocr = default.ocr)
        ?(ocrLanguage = default.ocrLanguage)
        ?(pageToken = default.pageToken)
        ?(pinned = default.pinned)
        ?(projection = default.projection)
        ?(q = default.q)
        ?(setModifiedDate = default.setModifiedDate)
        ?(sourceLanguage = default.sourceLanguage)
        ?(targetLanguage = default.targetLanguage)
        ?(timedTextLanguage = default.timedTextLanguage)
        ?(timedTextTrackName = default.timedTextTrackName)
        ?(updateViewedDate = default.updateViewedDate)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        convert;
        maxResults;
        newRevision;
        ocr;
        ocrLanguage;
        pageToken;
        pinned;
        projection;
        q;
        setModifiedDate;
        sourceLanguage;
        targetLanguage;
        timedTextLanguage;
        timedTextTrackName;
        updateViewedDate;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let copy
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(convert = false)
        ?(ocr = false)
        ?(pinned = false)
        ?ocrLanguage
        ?sourceLanguage
        ?targetLanguage
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
      ?sourceLanguage ?targetLanguage ?timedTextLanguage ?timedTextTrackName
      () in
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
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?etag
        ?std_params
        ?(updateViewedDate = false)
        ?projection
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId)]
      base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ?projection ~updateViewedDate () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response File.of_data_model) session 
    
  let insert
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?media_source
        ?(convert = false)
        ?(ocr = false)
        ?(pinned = false)
        ?ocrLanguage
        ?sourceLanguage
        ?targetLanguage
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
      ?sourceLanguage ?targetLanguage ?timedTextLanguage ?timedTextTrackName
      () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?etag ?media_source
      ~data_to_post:(GapiJson.render_json File.to_data_model) ~data:file
      full_url (GapiJson.parse_json_response File.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(maxResults = 100)
        ?pageToken
        ?projection
        ?q
        session =
    let full_url = GapiUtils.add_path_to_url ["files"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~maxResults ?pageToken ?projection ?q
      () in
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
        ?ocrLanguage
        ?sourceLanguage
        ?targetLanguage
        ?timedTextLanguage
        ?timedTextTrackName
        ~fileId
        file
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId)]
      base_url in
    let etag = GapiUtils.etag_option file.File.etag in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~convert ~newRevision ~ocr ?ocrLanguage
      ~pinned ~setModifiedDate ?sourceLanguage ?targetLanguage
      ?timedTextLanguage ?timedTextTrackName ~updateViewedDate () in
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
        ?ocrLanguage
        ?sourceLanguage
        ?targetLanguage
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
      ?standard_parameters:std_params ~convert ~newRevision ~ocr ?ocrLanguage
      ~pinned ~setModifiedDate ?sourceLanguage ?targetLanguage
      ?timedTextLanguage ?timedTextTrackName ~updateViewedDate () in
    let query_parameters = Option.map FilesParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag ?media_source
      ~data_to_post:(GapiJson.render_json File.to_data_model) ~data:file
      full_url (GapiJson.parse_json_response File.of_data_model) session 
    
  
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
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* permissions-specific query parameters *)
      sendNotificationEmails : bool;
      
    }
    
    let default = {
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      sendNotificationEmails = true;
      
    }
    
    let to_key_value_list qp =
      let param get_value to_string name =
        GapiService.build_param default qp get_value to_string name in [
      param (fun p -> p.fields) (fun x -> x) "fields";
      param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
      param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
      param (fun p -> p.userIp) (fun x -> x) "userIp";
      param (fun p -> p.key) (fun x -> x) "key";
      param (fun p -> p.sendNotificationEmails) string_of_bool "sendNotificationEmails";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(sendNotificationEmails = default.sendNotificationEmails)
        () =
      let parameters = {
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        sendNotificationEmails;
        
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
    
  let insert
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ?(sendNotificationEmails = true)
        ~fileId
        permission
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"] base_url in
    let etag = GapiUtils.etag_option permission.Permission.etag in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params ~sendNotificationEmails () in
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
        ~fileId
        ~permissionId
        permission
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"; ((fun x -> x) permissionId)] base_url in
    let etag = GapiUtils.etag_option permission.Permission.etag in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map PermissionsParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Permission.to_data_model)
      ~data:permission full_url
      (GapiJson.parse_json_response Permission.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~permissionId
        permission
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"; ((fun x -> x) permissionId)] base_url in
    let etag = GapiUtils.etag_option permission.Permission.etag in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map PermissionsParameters.to_key_value_list
      params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Permission.to_data_model)
      ~data:permission full_url
      (GapiJson.parse_json_response Permission.of_data_model) session 
    
  
end

module RepliesResource =
struct
  module RepliesParameters =
  struct
    type t = {
      (* Standard query parameters *)
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
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        ~revisionId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"; ((fun x -> x) revisionId)] base_url in
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
        ~revisionId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"; ((fun x -> x) revisionId)] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag full_url
      (GapiJson.parse_json_response Revision.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v2/")
        ?std_params
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
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
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
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
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.put ?query_parameters ?etag
      ~data_to_post:(GapiJson.render_json Revision.to_data_model)
      ~data:revision full_url
      (GapiJson.parse_json_response Revision.of_data_model) session 
    
  
end

