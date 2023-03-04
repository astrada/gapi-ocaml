(* Warning! This file is generated. Modify at your own risk.
        *)

open GapiUtils.Infix
open GapiDriveV3Model

module Scope =
struct
  let drive = "https://www.googleapis.com/auth/drive"
  
  let drive_appdata = "https://www.googleapis.com/auth/drive.appdata"
  
  let drive_file = "https://www.googleapis.com/auth/drive.file"
  
  let drive_metadata = "https://www.googleapis.com/auth/drive.metadata"
  
  let drive_metadata_readonly = "https://www.googleapis.com/auth/drive.metadata.readonly"
  
  let drive_photos_readonly = "https://www.googleapis.com/auth/drive.photos.readonly"
  
  let drive_readonly = "https://www.googleapis.com/auth/drive.readonly"
  
  let drive_scripts = "https://www.googleapis.com/auth/drive.scripts"
  
  
end

module AboutResource =
struct
  let get
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?etag
        ?std_params
        ?custom_headers
        session =
    let full_url = GapiUtils.add_path_to_url ["about"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response About.of_data_model) session 
    
  
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
      driveId : string;
      includeCorpusRemovals : bool;
      includeItemsFromAllDrives : bool;
      includeLabels : string;
      includePermissionsForView : string;
      includeRemoved : bool;
      includeTeamDriveItems : bool;
      pageSize : int;
      pageToken : string;
      restrictToMyDrive : bool;
      spaces : string;
      supportsAllDrives : bool;
      supportsTeamDrives : bool;
      teamDriveId : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      driveId = "";
      includeCorpusRemovals = false;
      includeItemsFromAllDrives = false;
      includeLabels = "";
      includePermissionsForView = "";
      includeRemoved = true;
      includeTeamDriveItems = false;
      pageSize = 100;
      pageToken = "";
      restrictToMyDrive = false;
      spaces = "drive";
      supportsAllDrives = false;
      supportsTeamDrives = false;
      teamDriveId = "";
      
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
      param (fun p -> p.driveId) (fun x -> x) "driveId";
      param (fun p -> p.includeCorpusRemovals) string_of_bool "includeCorpusRemovals";
      param (fun p -> p.includeItemsFromAllDrives) string_of_bool "includeItemsFromAllDrives";
      param (fun p -> p.includeLabels) (fun x -> x) "includeLabels";
      param (fun p -> p.includePermissionsForView) (fun x -> x) "includePermissionsForView";
      param (fun p -> p.includeRemoved) string_of_bool "includeRemoved";
      param (fun p -> p.includeTeamDriveItems) string_of_bool "includeTeamDriveItems";
      param (fun p -> p.pageSize) string_of_int "pageSize";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.restrictToMyDrive) string_of_bool "restrictToMyDrive";
      param (fun p -> p.spaces) (fun x -> x) "spaces";
      param (fun p -> p.supportsAllDrives) string_of_bool "supportsAllDrives";
      param (fun p -> p.supportsTeamDrives) string_of_bool "supportsTeamDrives";
      param (fun p -> p.teamDriveId) (fun x -> x) "teamDriveId";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(driveId = default.driveId)
        ?(includeCorpusRemovals = default.includeCorpusRemovals)
        ?(includeItemsFromAllDrives = default.includeItemsFromAllDrives)
        ?(includeLabels = default.includeLabels)
        ?(includePermissionsForView = default.includePermissionsForView)
        ?(includeRemoved = default.includeRemoved)
        ?(includeTeamDriveItems = default.includeTeamDriveItems)
        ?(pageSize = default.pageSize)
        ?(pageToken = default.pageToken)
        ?(restrictToMyDrive = default.restrictToMyDrive)
        ?(spaces = default.spaces)
        ?(supportsAllDrives = default.supportsAllDrives)
        ?(supportsTeamDrives = default.supportsTeamDrives)
        ?(teamDriveId = default.teamDriveId)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        driveId;
        includeCorpusRemovals;
        includeItemsFromAllDrives;
        includeLabels;
        includePermissionsForView;
        includeRemoved;
        includeTeamDriveItems;
        pageSize;
        pageToken;
        restrictToMyDrive;
        spaces;
        supportsAllDrives;
        supportsTeamDrives;
        teamDriveId;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let getStartPageToken
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?driveId
        ?teamDriveId
        session =
    let full_url = GapiUtils.add_path_to_url ["changes"; "startPageToken"]
      base_url in
    let params = ChangesParameters.merge_parameters
      ?standard_parameters:std_params ?driveId ~supportsAllDrives
      ~supportsTeamDrives ?teamDriveId () in
    let query_parameters = GapiOption.map ChangesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response StartPageToken.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(includeCorpusRemovals = false)
        ?(includeItemsFromAllDrives = false)
        ?(includeRemoved = true)
        ?(includeTeamDriveItems = false)
        ?(pageSize = 100)
        ?(restrictToMyDrive = false)
        ?(spaces = "drive")
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?driveId
        ?includeLabels
        ?includePermissionsForView
        ?teamDriveId
        ~pageToken
        session =
    let full_url = GapiUtils.add_path_to_url ["changes"] base_url in
    let params = ChangesParameters.merge_parameters
      ?standard_parameters:std_params ?driveId ~includeCorpusRemovals
      ~includeItemsFromAllDrives ?includeLabels ?includePermissionsForView
      ~includeRemoved ~includeTeamDriveItems ~pageSize ~pageToken
      ~restrictToMyDrive ~spaces ~supportsAllDrives ~supportsTeamDrives
      ?teamDriveId () in
    let query_parameters = GapiOption.map ChangesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response ChangeList.of_data_model) session 
    
  let watch
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(includeCorpusRemovals = false)
        ?(includeItemsFromAllDrives = false)
        ?(includeRemoved = true)
        ?(includeTeamDriveItems = false)
        ?(pageSize = 100)
        ?(restrictToMyDrive = false)
        ?(spaces = "drive")
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?driveId
        ?includeLabels
        ?includePermissionsForView
        ?teamDriveId
        ~pageToken
        channel
        session =
    let full_url = GapiUtils.add_path_to_url ["changes"; "watch"] base_url in
    let params = ChangesParameters.merge_parameters
      ?standard_parameters:std_params ?driveId ~includeCorpusRemovals
      ~includeItemsFromAllDrives ?includeLabels ?includePermissionsForView
      ~includeRemoved ~includeTeamDriveItems ~pageSize ~pageToken
      ~restrictToMyDrive ~spaces ~supportsAllDrives ~supportsTeamDrives
      ?teamDriveId () in
    let query_parameters = GapiOption.map ChangesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Channel.to_data_model)
      ~data:channel full_url
      (GapiJson.parse_json_response Channel.of_data_model) session 
    
  
end

module ChannelsResource =
struct
  let stop
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        channel
        session =
    let full_url = GapiUtils.add_path_to_url ["channels"; "stop"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Channel.to_data_model)
      ~data:channel full_url GapiRequest.parse_empty_response session 
    
  
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
      pageSize : int;
      pageToken : string;
      startModifiedTime : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      includeDeleted = false;
      pageSize = 20;
      pageToken = "";
      startModifiedTime = "";
      
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
      param (fun p -> p.pageSize) string_of_int "pageSize";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.startModifiedTime) (fun x -> x) "startModifiedTime";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(includeDeleted = default.includeDeleted)
        ?(pageSize = default.pageSize)
        ?(pageToken = default.pageToken)
        ?(startModifiedTime = default.startModifiedTime)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        includeDeleted;
        pageSize;
        pageToken;
        startModifiedTime;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let create
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~fileId
        comment
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      CommentsParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Comment.to_data_model)
      ~data:comment full_url
      (GapiJson.parse_json_response Comment.of_data_model) session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~fileId
        ~commentId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId)] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      CommentsParameters.to_key_value_list params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?etag
        ?std_params
        ?custom_headers
        ?(includeDeleted = false)
        ~fileId
        ~commentId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId)] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params ~includeDeleted () in
    let query_parameters = GapiOption.map
      CommentsParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response Comment.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(includeDeleted = false)
        ?(pageSize = 20)
        ?pageToken
        ?startModifiedTime
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params ~includeDeleted ~pageSize ?pageToken
      ?startModifiedTime () in
    let query_parameters = GapiOption.map
      CommentsParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response CommentList.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~fileId
        ~commentId
        comment
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId)] base_url in
    let params = CommentsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      CommentsParameters.to_key_value_list params in
    GapiService.patch ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Comment.to_data_model)
      ~data:comment full_url
      (GapiJson.parse_json_response Comment.of_data_model) session 
    
  
end

module DrivesResource =
struct
  module DrivesParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* drives-specific query parameters *)
      allowItemDeletion : bool;
      pageSize : int;
      pageToken : string;
      q : string;
      requestId : string;
      useDomainAdminAccess : bool;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      allowItemDeletion = false;
      pageSize = 10;
      pageToken = "";
      q = "";
      requestId = "";
      useDomainAdminAccess = false;
      
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
      param (fun p -> p.allowItemDeletion) string_of_bool "allowItemDeletion";
      param (fun p -> p.pageSize) string_of_int "pageSize";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.q) (fun x -> x) "q";
      param (fun p -> p.requestId) (fun x -> x) "requestId";
      param (fun p -> p.useDomainAdminAccess) string_of_bool "useDomainAdminAccess";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(allowItemDeletion = default.allowItemDeletion)
        ?(pageSize = default.pageSize)
        ?(pageToken = default.pageToken)
        ?(q = default.q)
        ?(requestId = default.requestId)
        ?(useDomainAdminAccess = default.useDomainAdminAccess)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        allowItemDeletion;
        pageSize;
        pageToken;
        q;
        requestId;
        useDomainAdminAccess;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let create
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~requestId
        drive
        session =
    let full_url = GapiUtils.add_path_to_url ["drives"] base_url in
    let params = DrivesParameters.merge_parameters
      ?standard_parameters:std_params ~requestId () in
    let query_parameters = GapiOption.map DrivesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Drive.to_data_model) ~data:drive
      full_url (GapiJson.parse_json_response Drive.of_data_model) session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(allowItemDeletion = false)
        ?(useDomainAdminAccess = false)
        ~driveId
        session =
    let full_url = GapiUtils.add_path_to_url ["drives";
      ((fun x -> x) driveId)] base_url in
    let params = DrivesParameters.merge_parameters
      ?standard_parameters:std_params ~allowItemDeletion
      ~useDomainAdminAccess () in
    let query_parameters = GapiOption.map DrivesParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?etag
        ?std_params
        ?custom_headers
        ?(useDomainAdminAccess = false)
        ~driveId
        session =
    let full_url = GapiUtils.add_path_to_url ["drives";
      ((fun x -> x) driveId)] base_url in
    let params = DrivesParameters.merge_parameters
      ?standard_parameters:std_params ~useDomainAdminAccess () in
    let query_parameters = GapiOption.map DrivesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response Drive.of_data_model) session 
    
  let hide
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~driveId
        session =
    let full_url = GapiUtils.add_path_to_url ["drives";
      ((fun x -> x) driveId); "hide"] base_url in
    let params = DrivesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map DrivesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?custom_headers ~data:Drive.empty
      full_url (GapiJson.parse_json_response Drive.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(pageSize = 10)
        ?(useDomainAdminAccess = false)
        ?pageToken
        ?q
        session =
    let full_url = GapiUtils.add_path_to_url ["drives"] base_url in
    let params = DrivesParameters.merge_parameters
      ?standard_parameters:std_params ~pageSize ?pageToken ?q
      ~useDomainAdminAccess () in
    let query_parameters = GapiOption.map DrivesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response DriveList.of_data_model) session 
    
  let unhide
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~driveId
        session =
    let full_url = GapiUtils.add_path_to_url ["drives";
      ((fun x -> x) driveId); "unhide"] base_url in
    let params = DrivesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map DrivesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?custom_headers ~data:Drive.empty
      full_url (GapiJson.parse_json_response Drive.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(useDomainAdminAccess = false)
        ~driveId
        drive
        session =
    let full_url = GapiUtils.add_path_to_url ["drives";
      ((fun x -> x) driveId)] base_url in
    let params = DrivesParameters.merge_parameters
      ?standard_parameters:std_params ~useDomainAdminAccess () in
    let query_parameters = GapiOption.map DrivesParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Drive.to_data_model) ~data:drive
      full_url (GapiJson.parse_json_response Drive.of_data_model) session 
    
  
end

module FilesResource =
struct
  module Corpus =
  struct
    type t =
      | Default
      | Domain
      | User
      
    let to_string = function
      | Default -> ""
      | Domain -> "domain"
      | User -> "user"
      
    let of_string = function
      | "" -> Default
      | "domain" -> Domain
      | "user" -> User
      | s -> failwith ("Unexpected value for Corpus:" ^ s)
  
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
      corpora : string;
      corpus : Corpus.t;
      count : int;
      driveId : string;
      enforceSingleParent : bool;
      ignoreDefaultVisibility : bool;
      includeItemsFromAllDrives : bool;
      includeLabels : string;
      includePermissionsForView : string;
      includeTeamDriveItems : bool;
      keepRevisionForever : bool;
      maxResults : int;
      mimeType : string;
      ocrLanguage : string;
      orderBy : string;
      pageSize : int;
      pageToken : string;
      q : string;
      removeParents : string;
      space : string;
      spaces : string;
      supportsAllDrives : bool;
      supportsTeamDrives : bool;
      teamDriveId : string;
      _type : string;
      useContentAsIndexableText : bool;
      
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
      corpora = "";
      corpus = Corpus.Default;
      count = 10;
      driveId = "";
      enforceSingleParent = false;
      ignoreDefaultVisibility = false;
      includeItemsFromAllDrives = false;
      includeLabels = "";
      includePermissionsForView = "";
      includeTeamDriveItems = false;
      keepRevisionForever = false;
      maxResults = 100;
      mimeType = "";
      ocrLanguage = "";
      orderBy = "";
      pageSize = 100;
      pageToken = "";
      q = "";
      removeParents = "";
      space = "drive";
      spaces = "drive";
      supportsAllDrives = false;
      supportsTeamDrives = false;
      teamDriveId = "";
      _type = "files";
      useContentAsIndexableText = false;
      
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
      param (fun p -> p.corpora) (fun x -> x) "corpora";
      param (fun p -> p.corpus) Corpus.to_string "corpus";
      param (fun p -> p.count) string_of_int "count";
      param (fun p -> p.driveId) (fun x -> x) "driveId";
      param (fun p -> p.enforceSingleParent) string_of_bool "enforceSingleParent";
      param (fun p -> p.ignoreDefaultVisibility) string_of_bool "ignoreDefaultVisibility";
      param (fun p -> p.includeItemsFromAllDrives) string_of_bool "includeItemsFromAllDrives";
      param (fun p -> p.includeLabels) (fun x -> x) "includeLabels";
      param (fun p -> p.includePermissionsForView) (fun x -> x) "includePermissionsForView";
      param (fun p -> p.includeTeamDriveItems) string_of_bool "includeTeamDriveItems";
      param (fun p -> p.keepRevisionForever) string_of_bool "keepRevisionForever";
      param (fun p -> p.maxResults) string_of_int "maxResults";
      param (fun p -> p.mimeType) (fun x -> x) "mimeType";
      param (fun p -> p.ocrLanguage) (fun x -> x) "ocrLanguage";
      param (fun p -> p.orderBy) (fun x -> x) "orderBy";
      param (fun p -> p.pageSize) string_of_int "pageSize";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.q) (fun x -> x) "q";
      param (fun p -> p.removeParents) (fun x -> x) "removeParents";
      param (fun p -> p.space) (fun x -> x) "space";
      param (fun p -> p.spaces) (fun x -> x) "spaces";
      param (fun p -> p.supportsAllDrives) string_of_bool "supportsAllDrives";
      param (fun p -> p.supportsTeamDrives) string_of_bool "supportsTeamDrives";
      param (fun p -> p.teamDriveId) (fun x -> x) "teamDriveId";
      param (fun p -> p._type) (fun x -> x) "type";
      param (fun p -> p.useContentAsIndexableText) string_of_bool "useContentAsIndexableText";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(acknowledgeAbuse = default.acknowledgeAbuse)
        ?(addParents = default.addParents)
        ?(corpora = default.corpora)
        ?(corpus = default.corpus)
        ?(count = default.count)
        ?(driveId = default.driveId)
        ?(enforceSingleParent = default.enforceSingleParent)
        ?(ignoreDefaultVisibility = default.ignoreDefaultVisibility)
        ?(includeItemsFromAllDrives = default.includeItemsFromAllDrives)
        ?(includeLabels = default.includeLabels)
        ?(includePermissionsForView = default.includePermissionsForView)
        ?(includeTeamDriveItems = default.includeTeamDriveItems)
        ?(keepRevisionForever = default.keepRevisionForever)
        ?(maxResults = default.maxResults)
        ?(mimeType = default.mimeType)
        ?(ocrLanguage = default.ocrLanguage)
        ?(orderBy = default.orderBy)
        ?(pageSize = default.pageSize)
        ?(pageToken = default.pageToken)
        ?(q = default.q)
        ?(removeParents = default.removeParents)
        ?(space = default.space)
        ?(spaces = default.spaces)
        ?(supportsAllDrives = default.supportsAllDrives)
        ?(supportsTeamDrives = default.supportsTeamDrives)
        ?(teamDriveId = default.teamDriveId)
        ?(_type = default._type)
        ?(useContentAsIndexableText = default.useContentAsIndexableText)
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
        corpora;
        corpus;
        count;
        driveId;
        enforceSingleParent;
        ignoreDefaultVisibility;
        includeItemsFromAllDrives;
        includeLabels;
        includePermissionsForView;
        includeTeamDriveItems;
        keepRevisionForever;
        maxResults;
        mimeType;
        ocrLanguage;
        orderBy;
        pageSize;
        pageToken;
        q;
        removeParents;
        space;
        spaces;
        supportsAllDrives;
        supportsTeamDrives;
        teamDriveId;
        _type;
        useContentAsIndexableText;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let copy
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(enforceSingleParent = false)
        ?(ignoreDefaultVisibility = false)
        ?(keepRevisionForever = false)
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?includeLabels
        ?includePermissionsForView
        ?ocrLanguage
        ~fileId
        file
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "copy"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~enforceSingleParent
      ~ignoreDefaultVisibility ?includeLabels ?includePermissionsForView
      ~keepRevisionForever ?ocrLanguage ~supportsAllDrives
      ~supportsTeamDrives () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json File.to_data_model) ~data:file
      full_url (GapiJson.parse_json_response File.of_data_model) session 
    
  let create
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?media_source
        ?custom_headers
        ?(enforceSingleParent = false)
        ?(ignoreDefaultVisibility = false)
        ?(keepRevisionForever = false)
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?(useContentAsIndexableText = false)
        ?includeLabels
        ?includePermissionsForView
        ?ocrLanguage
        file
        session =
    let base_path = ["files"] in
    let media_path = [""; "upload"; "drive"; "v3"; "files"] in
    let path_to_add = if GapiOption.is_some media_source then media_path
      else base_path in
    let full_url = GapiUtils.add_path_to_url path_to_add base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~enforceSingleParent
      ~ignoreDefaultVisibility ?includeLabels ?includePermissionsForView
      ~keepRevisionForever ?ocrLanguage ~supportsAllDrives
      ~supportsTeamDrives ~useContentAsIndexableText () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    let query_parameters = GapiOption.map (fun xs ->
      if GapiOption.is_some media_source then ("uploadType", "resumable")
      :: xs else xs) query_parameters in
    GapiService.post ?query_parameters ?media_source ?custom_headers
      ~data_to_post:(GapiJson.render_json File.to_data_model) ~data:file
      full_url (GapiJson.parse_json_response File.of_data_model) session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(enforceSingleParent = false)
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId)]
      base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~enforceSingleParent ~supportsAllDrives
      ~supportsTeamDrives () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let emptyTrash
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(enforceSingleParent = false)
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; "trash"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~enforceSingleParent () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let export
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?media_download
        ?custom_headers
        ~fileId
        ~mimeType
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "export"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~mimeType () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?media_download ?custom_headers
      full_url GapiRequest.parse_empty_response session 
    
  let generateIds
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(count = 10)
        ?(space = "drive")
        ?(_type = "files")
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; "generateIds"]
      base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~count ~space ~_type () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response GeneratedIds.of_data_model) session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?etag
        ?std_params
        ?media_download
        ?custom_headers
        ?(acknowledgeAbuse = false)
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?includeLabels
        ?includePermissionsForView
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId)]
      base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~acknowledgeAbuse ?includeLabels
      ?includePermissionsForView ~supportsAllDrives ~supportsTeamDrives () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag ?media_download ?custom_headers
      full_url (GapiJson.parse_json_response File.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(includeItemsFromAllDrives = false)
        ?(includeTeamDriveItems = false)
        ?(pageSize = 100)
        ?(spaces = "drive")
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?corpora
        ?corpus
        ?driveId
        ?includeLabels
        ?includePermissionsForView
        ?orderBy
        ?pageToken
        ?q
        ?teamDriveId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ?corpora ?corpus ?driveId
      ~includeItemsFromAllDrives ?includeLabels ?includePermissionsForView
      ~includeTeamDriveItems ?orderBy ~pageSize ?pageToken ?q ~spaces
      ~supportsAllDrives ~supportsTeamDrives ?teamDriveId () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response FileList.of_data_model) session 
    
  let listLabels
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(maxResults = 100)
        ?pageToken
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "listLabels"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~maxResults ?pageToken () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response LabelList.of_data_model) session 
    
  let modifyLabels
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~fileId
        modifyLabelsRequest
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "modifyLabels"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json ModifyLabelsRequest.to_data_model)
      ~data:modifyLabelsRequest full_url
      (GapiJson.parse_json_response ModifyLabelsResponse.of_data_model)
      session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?media_source
        ?custom_headers
        ?(enforceSingleParent = false)
        ?(keepRevisionForever = false)
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?(useContentAsIndexableText = false)
        ?addParents
        ?includeLabels
        ?includePermissionsForView
        ?ocrLanguage
        ?removeParents
        ~fileId
        file
        session =
    let base_path = ["files"; ((fun x -> x) fileId)] in
    let media_path = [""; "upload"; "drive"; "v3"; "files";
      ((fun x -> x) fileId)] in
    let path_to_add = if GapiOption.is_some media_source then media_path
      else base_path in
    let full_url = GapiUtils.add_path_to_url path_to_add base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ?addParents ~enforceSingleParent
      ?includeLabels ?includePermissionsForView ~keepRevisionForever
      ?ocrLanguage ?removeParents ~supportsAllDrives ~supportsTeamDrives
      ~useContentAsIndexableText () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    let query_parameters = GapiOption.map (fun xs ->
      if GapiOption.is_some media_source then ("uploadType", "resumable")
      :: xs else xs) query_parameters in
    GapiService.patch ?query_parameters ?media_source ?custom_headers
      ~data_to_post:(GapiJson.render_json File.to_data_model) ~data:file
      full_url (GapiJson.parse_json_response File.of_data_model) session 
    
  let watch
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?media_download
        ?custom_headers
        ?(acknowledgeAbuse = false)
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?includeLabels
        ?includePermissionsForView
        ~fileId
        channel
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "watch"] base_url in
    let params = FilesParameters.merge_parameters
      ?standard_parameters:std_params ~acknowledgeAbuse ?includeLabels
      ?includePermissionsForView ~supportsAllDrives ~supportsTeamDrives () in
    let query_parameters = GapiOption.map FilesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?media_download ?custom_headers
      ~data_to_post:(GapiJson.render_json Channel.to_data_model)
      ~data:channel full_url
      (GapiJson.parse_json_response Channel.of_data_model) session 
    
  
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
      enforceSingleParent : bool;
      includePermissionsForView : string;
      moveToNewOwnersRoot : bool;
      pageSize : int;
      pageToken : string;
      removeExpiration : bool;
      sendNotificationEmail : bool;
      supportsAllDrives : bool;
      supportsTeamDrives : bool;
      transferOwnership : bool;
      useDomainAdminAccess : bool;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      emailMessage = "";
      enforceSingleParent = false;
      includePermissionsForView = "";
      moveToNewOwnersRoot = false;
      pageSize = 0;
      pageToken = "";
      removeExpiration = false;
      sendNotificationEmail = false;
      supportsAllDrives = false;
      supportsTeamDrives = false;
      transferOwnership = false;
      useDomainAdminAccess = false;
      
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
      param (fun p -> p.enforceSingleParent) string_of_bool "enforceSingleParent";
      param (fun p -> p.includePermissionsForView) (fun x -> x) "includePermissionsForView";
      param (fun p -> p.moveToNewOwnersRoot) string_of_bool "moveToNewOwnersRoot";
      param (fun p -> p.pageSize) string_of_int "pageSize";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.removeExpiration) string_of_bool "removeExpiration";
      param (fun p -> p.sendNotificationEmail) string_of_bool "sendNotificationEmail";
      param (fun p -> p.supportsAllDrives) string_of_bool "supportsAllDrives";
      param (fun p -> p.supportsTeamDrives) string_of_bool "supportsTeamDrives";
      param (fun p -> p.transferOwnership) string_of_bool "transferOwnership";
      param (fun p -> p.useDomainAdminAccess) string_of_bool "useDomainAdminAccess";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(emailMessage = default.emailMessage)
        ?(enforceSingleParent = default.enforceSingleParent)
        ?(includePermissionsForView = default.includePermissionsForView)
        ?(moveToNewOwnersRoot = default.moveToNewOwnersRoot)
        ?(pageSize = default.pageSize)
        ?(pageToken = default.pageToken)
        ?(removeExpiration = default.removeExpiration)
        ?(sendNotificationEmail = default.sendNotificationEmail)
        ?(supportsAllDrives = default.supportsAllDrives)
        ?(supportsTeamDrives = default.supportsTeamDrives)
        ?(transferOwnership = default.transferOwnership)
        ?(useDomainAdminAccess = default.useDomainAdminAccess)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        emailMessage;
        enforceSingleParent;
        includePermissionsForView;
        moveToNewOwnersRoot;
        pageSize;
        pageToken;
        removeExpiration;
        sendNotificationEmail;
        supportsAllDrives;
        supportsTeamDrives;
        transferOwnership;
        useDomainAdminAccess;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let create
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(enforceSingleParent = false)
        ?(moveToNewOwnersRoot = false)
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?(transferOwnership = false)
        ?(useDomainAdminAccess = false)
        ?emailMessage
        ?sendNotificationEmail
        ~fileId
        permission
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"] base_url in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params ?emailMessage ~enforceSingleParent
      ~moveToNewOwnersRoot ?sendNotificationEmail ~supportsAllDrives
      ~supportsTeamDrives ~transferOwnership ~useDomainAdminAccess () in
    let query_parameters = GapiOption.map
      PermissionsParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Permission.to_data_model)
      ~data:permission full_url
      (GapiJson.parse_json_response Permission.of_data_model) session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?(useDomainAdminAccess = false)
        ~fileId
        ~permissionId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"; ((fun x -> x) permissionId)] base_url in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params ~supportsAllDrives ~supportsTeamDrives
      ~useDomainAdminAccess () in
    let query_parameters = GapiOption.map
      PermissionsParameters.to_key_value_list params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?etag
        ?std_params
        ?custom_headers
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?(useDomainAdminAccess = false)
        ~fileId
        ~permissionId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"; ((fun x -> x) permissionId)] base_url in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params ~supportsAllDrives ~supportsTeamDrives
      ~useDomainAdminAccess () in
    let query_parameters = GapiOption.map
      PermissionsParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response Permission.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?(useDomainAdminAccess = false)
        ?includePermissionsForView
        ?pageSize
        ?pageToken
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"] base_url in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params ?includePermissionsForView ?pageSize
      ?pageToken ~supportsAllDrives ~supportsTeamDrives ~useDomainAdminAccess
      () in
    let query_parameters = GapiOption.map
      PermissionsParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response PermissionList.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(removeExpiration = false)
        ?(supportsAllDrives = false)
        ?(supportsTeamDrives = false)
        ?(transferOwnership = false)
        ?(useDomainAdminAccess = false)
        ~fileId
        ~permissionId
        permission
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "permissions"; ((fun x -> x) permissionId)] base_url in
    let params = PermissionsParameters.merge_parameters
      ?standard_parameters:std_params ~removeExpiration ~supportsAllDrives
      ~supportsTeamDrives ~transferOwnership ~useDomainAdminAccess () in
    let query_parameters = GapiOption.map
      PermissionsParameters.to_key_value_list params in
    GapiService.patch ?query_parameters ?custom_headers
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
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* replies-specific query parameters *)
      includeDeleted : bool;
      pageSize : int;
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
      pageSize = 20;
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
      param (fun p -> p.pageSize) string_of_int "pageSize";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(includeDeleted = default.includeDeleted)
        ?(pageSize = default.pageSize)
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
        pageSize;
        pageToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let create
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~fileId
        ~commentId
        reply
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId); "replies"] base_url in
    let params = RepliesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map RepliesParameters.to_key_value_list
      params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Reply.to_data_model) ~data:reply
      full_url (GapiJson.parse_json_response Reply.of_data_model) session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~fileId
        ~commentId
        ~replyId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId); "replies";
      ((fun x -> x) replyId)] base_url in
    let params = RepliesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map RepliesParameters.to_key_value_list
      params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?etag
        ?std_params
        ?custom_headers
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
    let query_parameters = GapiOption.map RepliesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response Reply.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(includeDeleted = false)
        ?(pageSize = 20)
        ?pageToken
        ~fileId
        ~commentId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId); "replies"] base_url in
    let params = RepliesParameters.merge_parameters
      ?standard_parameters:std_params ~includeDeleted ~pageSize ?pageToken ()
      in
    let query_parameters = GapiOption.map RepliesParameters.to_key_value_list
      params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response ReplyList.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~fileId
        ~commentId
        ~replyId
        reply
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "comments"; ((fun x -> x) commentId); "replies";
      ((fun x -> x) replyId)] base_url in
    let params = RepliesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map RepliesParameters.to_key_value_list
      params in
    GapiService.patch ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Reply.to_data_model) ~data:reply
      full_url (GapiJson.parse_json_response Reply.of_data_model) session 
    
  
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
      acknowledgeAbuse : bool;
      pageSize : int;
      pageToken : string;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      acknowledgeAbuse = false;
      pageSize = 200;
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
      param (fun p -> p.acknowledgeAbuse) string_of_bool "acknowledgeAbuse";
      param (fun p -> p.pageSize) string_of_int "pageSize";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(acknowledgeAbuse = default.acknowledgeAbuse)
        ?(pageSize = default.pageSize)
        ?(pageToken = default.pageToken)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        acknowledgeAbuse;
        pageSize;
        pageToken;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~fileId
        ~revisionId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"; ((fun x -> x) revisionId)] base_url in
    let params = RevisionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      RevisionsParameters.to_key_value_list params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?etag
        ?std_params
        ?media_download
        ?custom_headers
        ?(acknowledgeAbuse = false)
        ~fileId
        ~revisionId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"; ((fun x -> x) revisionId)] base_url in
    let params = RevisionsParameters.merge_parameters
      ?standard_parameters:std_params ~acknowledgeAbuse () in
    let query_parameters = GapiOption.map
      RevisionsParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag ?media_download ?custom_headers
      full_url (GapiJson.parse_json_response Revision.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(pageSize = 200)
        ?pageToken
        ~fileId
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"] base_url in
    let params = RevisionsParameters.merge_parameters
      ?standard_parameters:std_params ~pageSize ?pageToken () in
    let query_parameters = GapiOption.map
      RevisionsParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response RevisionList.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~fileId
        ~revisionId
        revision
        session =
    let full_url = GapiUtils.add_path_to_url ["files"; ((fun x -> x) fileId);
      "revisions"; ((fun x -> x) revisionId)] base_url in
    let params = RevisionsParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      RevisionsParameters.to_key_value_list params in
    GapiService.patch ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json Revision.to_data_model)
      ~data:revision full_url
      (GapiJson.parse_json_response Revision.of_data_model) session 
    
  
end

module TeamdrivesResource =
struct
  module TeamdrivesParameters =
  struct
    type t = {
      (* Standard query parameters *)
      alt : string;
      fields : string;
      prettyPrint : bool;
      quotaUser : string;
      userIp : string;
      key : string;
      (* teamdrives-specific query parameters *)
      pageSize : int;
      pageToken : string;
      q : string;
      requestId : string;
      useDomainAdminAccess : bool;
      
    }
    
    let default = {
      alt = "";
      fields = "";
      prettyPrint = true;
      quotaUser = "";
      userIp = "";
      key = "";
      pageSize = 10;
      pageToken = "";
      q = "";
      requestId = "";
      useDomainAdminAccess = false;
      
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
      param (fun p -> p.pageSize) string_of_int "pageSize";
      param (fun p -> p.pageToken) (fun x -> x) "pageToken";
      param (fun p -> p.q) (fun x -> x) "q";
      param (fun p -> p.requestId) (fun x -> x) "requestId";
      param (fun p -> p.useDomainAdminAccess) string_of_bool "useDomainAdminAccess";
      
    ] |> List.concat
    
    let merge_parameters
        ?(standard_parameters = GapiService.StandardParameters.default)
        ?(pageSize = default.pageSize)
        ?(pageToken = default.pageToken)
        ?(q = default.q)
        ?(requestId = default.requestId)
        ?(useDomainAdminAccess = default.useDomainAdminAccess)
        () =
      let parameters = {
        alt = standard_parameters.GapiService.StandardParameters.alt;
        fields = standard_parameters.GapiService.StandardParameters.fields;
        prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
        quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
        userIp = standard_parameters.GapiService.StandardParameters.userIp;
        key = standard_parameters.GapiService.StandardParameters.key;
        pageSize;
        pageToken;
        q;
        requestId;
        useDomainAdminAccess;
        
      } in
      if parameters = default then None else Some parameters
    
  end
  
  let create
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~requestId
        teamDrive
        session =
    let full_url = GapiUtils.add_path_to_url ["teamdrives"] base_url in
    let params = TeamdrivesParameters.merge_parameters
      ?standard_parameters:std_params ~requestId () in
    let query_parameters = GapiOption.map
      TeamdrivesParameters.to_key_value_list params in
    GapiService.post ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json TeamDrive.to_data_model)
      ~data:teamDrive full_url
      (GapiJson.parse_json_response TeamDrive.of_data_model) session 
    
  let delete
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ~teamDriveId
        session =
    let full_url = GapiUtils.add_path_to_url ["teamdrives";
      ((fun x -> x) teamDriveId)] base_url in
    let params = TeamdrivesParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = GapiOption.map
      TeamdrivesParameters.to_key_value_list params in
    GapiService.delete ?query_parameters ?custom_headers full_url
      GapiRequest.parse_empty_response session 
    
  let get
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?etag
        ?std_params
        ?custom_headers
        ?(useDomainAdminAccess = false)
        ~teamDriveId
        session =
    let full_url = GapiUtils.add_path_to_url ["teamdrives";
      ((fun x -> x) teamDriveId)] base_url in
    let params = TeamdrivesParameters.merge_parameters
      ?standard_parameters:std_params ~useDomainAdminAccess () in
    let query_parameters = GapiOption.map
      TeamdrivesParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?etag ?custom_headers full_url
      (GapiJson.parse_json_response TeamDrive.of_data_model) session 
    
  let list
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(pageSize = 10)
        ?(useDomainAdminAccess = false)
        ?pageToken
        ?q
        session =
    let full_url = GapiUtils.add_path_to_url ["teamdrives"] base_url in
    let params = TeamdrivesParameters.merge_parameters
      ?standard_parameters:std_params ~pageSize ?pageToken ?q
      ~useDomainAdminAccess () in
    let query_parameters = GapiOption.map
      TeamdrivesParameters.to_key_value_list params in
    GapiService.get ?query_parameters ?custom_headers full_url
      (GapiJson.parse_json_response TeamDriveList.of_data_model) session 
    
  let update
        ?(base_url = "https://www.googleapis.com/drive/v3/")
        ?std_params
        ?custom_headers
        ?(useDomainAdminAccess = false)
        ~teamDriveId
        teamDrive
        session =
    let full_url = GapiUtils.add_path_to_url ["teamdrives";
      ((fun x -> x) teamDriveId)] base_url in
    let params = TeamdrivesParameters.merge_parameters
      ?standard_parameters:std_params ~useDomainAdminAccess () in
    let query_parameters = GapiOption.map
      TeamdrivesParameters.to_key_value_list params in
    GapiService.patch ?query_parameters ?custom_headers
      ~data_to_post:(GapiJson.render_json TeamDrive.to_data_model)
      ~data:teamDrive full_url
      (GapiJson.parse_json_response TeamDrive.of_data_model) session 
    
  
end

