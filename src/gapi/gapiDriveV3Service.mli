(* Warning! This file is generated. Modify at your own risk.
        *)

(** Service definition for Drive API (v3).
  
  Manages files in Drive including uploading, downloading, searching, detecting changes, and updating sharing permissions..
  
  For more information about this service, see the
  {{:https://developers.google.com/drive/}API Documentation}.
  *)

module Scope :
sig
  val drive : string
  (** See, edit, create, and delete all of your Google Drive files *)
  
  val drive_appdata : string
  (** View and manage its own configuration data in your Google Drive *)
  
  val drive_file : string
  (** View and manage Google Drive files and folders that you have opened or created with this app *)
  
  val drive_metadata : string
  (** View and manage metadata of files in your Google Drive *)
  
  val drive_metadata_readonly : string
  (** View metadata for files in your Google Drive *)
  
  val drive_photos_readonly : string
  (** View the photos, videos and albums in your Google Photos *)
  
  val drive_readonly : string
  (** See and download all your Google Drive files *)
  
  val drive_scripts : string
  (** Modify your Google Apps Script scripts' behavior *)
  
  
end
(** Service Auth Scopes *)

module AboutResource :
sig
  
  (** Gets information about the user, the user's Drive, and system capabilities.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.About.t * GapiConversation.Session.t
  
  
end

module ChangesResource :
sig
  
  (** Gets the starting pageToken for listing future changes.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param driveId The ID of the shared drive for which the starting pageToken for listing future changes from that shared drive will be returned.
    @param teamDriveId Deprecated use driveId instead.
    *)
  val getStartPageToken :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?driveId:string ->
    ?teamDriveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.StartPageToken.t * GapiConversation.Session.t
  
  (** Lists the changes for a user or shared drive.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param includeCorpusRemovals Whether changes should include the file resource if the file is still accessible by the user at the time of the request, even when a file was removed from the list of changes and there will be no further change entries for this file.
    @param includeItemsFromAllDrives Deprecated - Whether both My Drive and shared drive items should be included in results. This parameter will only be effective until June 1, 2020. Afterwards shared drive items will be included in the results.
    @param includeRemoved Whether to include changes indicating that items have been removed from the list of changes, for example by deletion or loss of access.
    @param includeTeamDriveItems Deprecated use includeItemsFromAllDrives instead.
    @param pageSize The maximum number of changes to return per page.
    @param restrictToMyDrive Whether to restrict the results to changes inside the My Drive hierarchy. This omits changes to files such as those in the Application Data folder or shared files which have not been added to My Drive.
    @param spaces A comma-separated list of spaces to query within the user corpus. Supported values are 'drive', 'appDataFolder' and 'photos'.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param driveId The shared drive from which changes will be returned. If specified the change IDs will be reflective of the shared drive; use the combined drive ID and change ID as an identifier.
    @param teamDriveId Deprecated use driveId instead.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response or to the response from the getStartPageToken method.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeCorpusRemovals:bool ->
    ?includeItemsFromAllDrives:bool ->
    ?includeRemoved:bool ->
    ?includeTeamDriveItems:bool ->
    ?pageSize:int ->
    ?restrictToMyDrive:bool ->
    ?spaces:string ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?driveId:string ->
    ?teamDriveId:string ->
    pageToken:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.ChangeList.t * GapiConversation.Session.t
  
  (** Subscribes to changes for a user.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param includeCorpusRemovals Whether changes should include the file resource if the file is still accessible by the user at the time of the request, even when a file was removed from the list of changes and there will be no further change entries for this file.
    @param includeItemsFromAllDrives Deprecated - Whether both My Drive and shared drive items should be included in results. This parameter will only be effective until June 1, 2020. Afterwards shared drive items will be included in the results.
    @param includeRemoved Whether to include changes indicating that items have been removed from the list of changes, for example by deletion or loss of access.
    @param includeTeamDriveItems Deprecated use includeItemsFromAllDrives instead.
    @param pageSize The maximum number of changes to return per page.
    @param restrictToMyDrive Whether to restrict the results to changes inside the My Drive hierarchy. This omits changes to files such as those in the Application Data folder or shared files which have not been added to My Drive.
    @param spaces A comma-separated list of spaces to query within the user corpus. Supported values are 'drive', 'appDataFolder' and 'photos'.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param driveId The shared drive from which changes will be returned. If specified the change IDs will be reflective of the shared drive; use the combined drive ID and change ID as an identifier.
    @param teamDriveId Deprecated use driveId instead.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response or to the response from the getStartPageToken method.
    *)
  val watch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeCorpusRemovals:bool ->
    ?includeItemsFromAllDrives:bool ->
    ?includeRemoved:bool ->
    ?includeTeamDriveItems:bool ->
    ?pageSize:int ->
    ?restrictToMyDrive:bool ->
    ?spaces:string ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?driveId:string ->
    ?teamDriveId:string ->
    pageToken:string ->
    GapiDriveV3Model.Channel.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Channel.t * GapiConversation.Session.t
  
  
end

module ChannelsResource :
sig
  
  (** Stop watching resources through this channel
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    *)
  val stop :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiDriveV3Model.Channel.t ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  
end

module CommentsResource :
sig
  
  (** Creates a new comment on a file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    GapiDriveV3Model.Comment.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Comment.t * GapiConversation.Session.t
  
  (** Deletes a comment.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    commentId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a comment by ID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param includeDeleted Whether to return deleted comments. Deleted comments will not include their original content.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeDeleted:bool ->
    fileId:string ->
    commentId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Comment.t * GapiConversation.Session.t
  
  (** Lists a file's comments.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param includeDeleted Whether to include deleted comments. Deleted comments will not include their original content.
    @param pageSize The maximum number of comments to return per page.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response.
    @param startModifiedTime The minimum value of 'modifiedTime' for the result comments (RFC 3339 date-time).
    @param fileId The ID of the file.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeDeleted:bool ->
    ?pageSize:int ->
    ?pageToken:string ->
    ?startModifiedTime:string ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.CommentList.t * GapiConversation.Session.t
  
  (** Updates a comment with patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    commentId:string ->
    GapiDriveV3Model.Comment.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Comment.t * GapiConversation.Session.t
  
  
end

module DrivesResource :
sig
  
  (** Creates a new shared drive.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param requestId An ID, such as a random UUID, which uniquely identifies this user's request for idempotent creation of a shared drive. A repeated request by the same user and with the same request ID will avoid creating duplicates by attempting to create the same shared drive. If the shared drive already exists a 409 error will be returned.
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    requestId:string ->
    GapiDriveV3Model.Drive.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Drive.t * GapiConversation.Session.t
  
  (** Permanently deletes a shared drive for which the user is an organizer. The shared drive cannot contain any untrashed items.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param driveId The ID of the shared drive.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    driveId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a shared drive's metadata by ID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if they are an administrator of the domain to which the shared drive belongs.
    @param driveId The ID of the shared drive.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?useDomainAdminAccess:bool ->
    driveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Drive.t * GapiConversation.Session.t
  
  (** Hides a shared drive from the default view.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param driveId The ID of the shared drive.
    *)
  val hide :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    driveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Drive.t * GapiConversation.Session.t
  
  (** Lists the user's shared drives.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param pageSize Maximum number of shared drives to return.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then all shared drives of the domain in which the requester is an administrator are returned.
    @param pageToken Page token for shared drives.
    @param q Query string for searching shared drives.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?pageSize:int ->
    ?useDomainAdminAccess:bool ->
    ?pageToken:string ->
    ?q:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.DriveList.t * GapiConversation.Session.t
  
  (** Restores a shared drive to the default view.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param driveId The ID of the shared drive.
    *)
  val unhide :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    driveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Drive.t * GapiConversation.Session.t
  
  (** Updates the metadate for a shared drive.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if they are an administrator of the domain to which the shared drive belongs.
    @param driveId The ID of the shared drive.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?useDomainAdminAccess:bool ->
    driveId:string ->
    GapiDriveV3Model.Drive.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Drive.t * GapiConversation.Session.t
  
  
end

module FilesResource :
sig
  
  module Corpus :
  sig
    type t =
      | Default
      | Domain (** Files shared to the user's domain. *)
      | User (** Files owned by or shared to the user. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Creates a copy of a file and applies any requested updates with patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param enforceSingleParent Set to true to opt in to API behavior that aims for all items to have exactly one parent. This parameter will only take effect if the item is not in a shared drive. Requests that specify more than one parent will fail.
    @param ignoreDefaultVisibility Whether to ignore the domain's default visibility settings for the created file. Domain administrators can choose to make all uploaded files visible to the domain by default; this parameter bypasses that behavior for the request. Permissions are still inherited from parent folders.
    @param keepRevisionForever Whether to set the 'keepForever' field in the new head revision. This is only applicable to files with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the limit is reached, try deleting pinned revisions.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param ocrLanguage A language hint for OCR processing during image import (ISO 639-1 code).
    @param fileId The ID of the file.
    *)
  val copy :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?enforceSingleParent:bool ->
    ?ignoreDefaultVisibility:bool ->
    ?keepRevisionForever:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?ocrLanguage:string ->
    fileId:string ->
    GapiDriveV3Model.File.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.File.t * GapiConversation.Session.t
  
  (** Creates a new file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param enforceSingleParent Set to true to opt in to API behavior that aims for all items to have exactly one parent. This parameter will only take effect if the item is not in a shared drive. Requests that specify more than one parent will fail.
    @param ignoreDefaultVisibility Whether to ignore the domain's default visibility settings for the created file. Domain administrators can choose to make all uploaded files visible to the domain by default; this parameter bypasses that behavior for the request. Permissions are still inherited from parent folders.
    @param keepRevisionForever Whether to set the 'keepForever' field in the new head revision. This is only applicable to files with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the limit is reached, try deleting pinned revisions.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param useContentAsIndexableText Whether to use the uploaded content as indexable text.
    @param ocrLanguage A language hint for OCR processing during image import (ISO 639-1 code).
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_source:GapiMediaResource.t ->
    ?enforceSingleParent:bool ->
    ?ignoreDefaultVisibility:bool ->
    ?keepRevisionForever:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?useContentAsIndexableText:bool ->
    ?ocrLanguage:string ->
    GapiDriveV3Model.File.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.File.t * GapiConversation.Session.t
  
  (** Permanently deletes a file owned by the user without moving it to the trash. If the file belongs to a shared drive the user must be an organizer on the parent. If the target is a folder, all descendants owned by the user are also deleted.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param fileId The ID of the file.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    fileId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Permanently deletes all of the user's trashed files.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    *)
  val emptyTrash :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Exports a Google Doc to the requested MIME type and returns the exported content. Please note that the exported content is limited to 10MB.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param mimeType The MIME type of the format requested for this export.
    *)
  val export :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_download:GapiMediaResource.download ->
    fileId:string ->
    mimeType:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Generates a set of file IDs which can be provided in create or copy requests.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param count The number of IDs to return.
    @param space The space in which the IDs can be used to create new files. Supported values are 'drive' and 'appDataFolder'.
    *)
  val generateIds :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?count:int ->
    ?space:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.GeneratedIds.t * GapiConversation.Session.t
  
  (** Gets a file's metadata or content by ID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param acknowledgeAbuse Whether the user is acknowledging the risk of downloading known malware or other abusive files. This is only applicable when alt=media.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param fileId The ID of the file.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_download:GapiMediaResource.download ->
    ?acknowledgeAbuse:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.File.t * GapiConversation.Session.t
  
  (** Lists or searches files.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param includeItemsFromAllDrives Deprecated - Whether both My Drive and shared drive items should be included in results. This parameter will only be effective until June 1, 2020. Afterwards shared drive items will be included in the results.
    @param includeTeamDriveItems Deprecated use includeItemsFromAllDrives instead.
    @param pageSize The maximum number of files to return per page. Partial or empty result pages are possible even before the end of the files list has been reached.
    @param spaces A comma-separated list of spaces to query within the corpus. Supported values are 'drive', 'appDataFolder' and 'photos'.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param corpora Bodies of items (files/documents) to which the query applies. Supported bodies are 'user', 'domain', 'drive' and 'allDrives'. Prefer 'user' or 'drive' to 'allDrives' for efficiency.
    @param corpus The source of files to list. Deprecated: use 'corpora' instead.
    @param driveId ID of the shared drive to search.
    @param orderBy A comma-separated list of sort keys. Valid keys are 'createdTime', 'folder', 'modifiedByMeTime', 'modifiedTime', 'name', 'name_natural', 'quotaBytesUsed', 'recency', 'sharedWithMeTime', 'starred', and 'viewedByMeTime'. Each key sorts ascending by default, but may be reversed with the 'desc' modifier. Example usage: ?orderBy=folder,modifiedTime desc,name. Please note that there is a current limitation for users with approximately one million files in which the requested sort order is ignored.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response.
    @param q A query for filtering the file results. See the "Search for Files" guide for supported syntax.
    @param teamDriveId Deprecated use driveId instead.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeItemsFromAllDrives:bool ->
    ?includeTeamDriveItems:bool ->
    ?pageSize:int ->
    ?spaces:string ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?corpora:string ->
    ?corpus:Corpus.t ->
    ?driveId:string ->
    ?orderBy:string ->
    ?pageToken:string ->
    ?q:string ->
    ?teamDriveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.FileList.t * GapiConversation.Session.t
  
  (** Updates a file's metadata and/or content with patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param enforceSingleParent Set to true to opt in to API behavior that aims for all items to have exactly one parent. This parameter will only take effect if the item is not in a shared drive. If the item's owner makes a request to add a single parent, the item will be removed from all current folders and placed in the requested folder. Other requests that increase the number of parents will fail, except when the canAddMyDriveParent file capability is true and a single parent is being added.
    @param keepRevisionForever Whether to set the 'keepForever' field in the new head revision. This is only applicable to files with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the limit is reached, try deleting pinned revisions.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param useContentAsIndexableText Whether to use the uploaded content as indexable text.
    @param addParents A comma-separated list of parent IDs to add.
    @param ocrLanguage A language hint for OCR processing during image import (ISO 639-1 code).
    @param removeParents A comma-separated list of parent IDs to remove.
    @param fileId The ID of the file.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_source:GapiMediaResource.t ->
    ?enforceSingleParent:bool ->
    ?keepRevisionForever:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?useContentAsIndexableText:bool ->
    ?addParents:string ->
    ?ocrLanguage:string ->
    ?removeParents:string ->
    fileId:string ->
    GapiDriveV3Model.File.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.File.t * GapiConversation.Session.t
  
  (** Subscribes to changes to a file
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param acknowledgeAbuse Whether the user is acknowledging the risk of downloading known malware or other abusive files. This is only applicable when alt=media.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param fileId The ID of the file.
    *)
  val watch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_download:GapiMediaResource.download ->
    ?acknowledgeAbuse:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    fileId:string ->
    GapiDriveV3Model.Channel.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Channel.t * GapiConversation.Session.t
  
  
end

module PermissionsResource :
sig
  
  (** Creates a permission for a file or shared drive.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param enforceSingleParent Set to true to opt in to API behavior that aims for all items to have exactly one parent. This parameter will only take effect if the item is not in a shared drive. See moveToNewOwnersRoot for details.
    @param moveToNewOwnersRoot This parameter will only take effect if the item is not in a shared drive and the request is attempting to transfer the ownership of the item. When set to true, the item will be moved to the new owner's My Drive root folder and all prior parents removed. If set to false, when enforceSingleParent=true, parents are not changed. If set to false, when enforceSingleParent=false, existing parents are not changed; however, the file will be added to the new owner's My Drive root folder, unless it is already in the new owner's My Drive.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param transferOwnership Whether to transfer ownership to the specified user and downgrade the current owner to a writer. This parameter is required as an acknowledgement of the side effect.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if the file ID parameter refers to a shared drive and the requester is an administrator of the domain to which the shared drive belongs.
    @param emailMessage A plain text custom message to include in the notification email.
    @param sendNotificationEmail Whether to send a notification email when sharing to users or groups. This defaults to true for users and groups, and is not allowed for other requests. It must not be disabled for ownership transfers.
    @param fileId The ID of the file or shared drive.
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?enforceSingleParent:bool ->
    ?moveToNewOwnersRoot:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?transferOwnership:bool ->
    ?useDomainAdminAccess:bool ->
    ?emailMessage:string ->
    ?sendNotificationEmail:bool ->
    fileId:string ->
    GapiDriveV3Model.Permission.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Permission.t * GapiConversation.Session.t
  
  (** Deletes a permission.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if the file ID parameter refers to a shared drive and the requester is an administrator of the domain to which the shared drive belongs.
    @param fileId The ID of the file or shared drive.
    @param permissionId The ID of the permission.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?useDomainAdminAccess:bool ->
    fileId:string ->
    permissionId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a permission by ID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if the file ID parameter refers to a shared drive and the requester is an administrator of the domain to which the shared drive belongs.
    @param fileId The ID of the file.
    @param permissionId The ID of the permission.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?useDomainAdminAccess:bool ->
    fileId:string ->
    permissionId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Permission.t * GapiConversation.Session.t
  
  (** Lists a file's or shared drive's permissions.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if the file ID parameter refers to a shared drive and the requester is an administrator of the domain to which the shared drive belongs.
    @param pageSize The maximum number of permissions to return per page. When not set for files in a shared drive, at most 100 results will be returned. When not set for files that are not in a shared drive, the entire list will be returned.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response.
    @param fileId The ID of the file or shared drive.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?useDomainAdminAccess:bool ->
    ?pageSize:int ->
    ?pageToken:string ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.PermissionList.t * GapiConversation.Session.t
  
  (** Updates a permission with patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param removeExpiration Whether to remove the expiration date.
    @param supportsAllDrives Deprecated - Whether the requesting application supports both My Drives and shared drives. This parameter will only be effective until June 1, 2020. Afterwards all applications are assumed to support shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param transferOwnership Whether to transfer ownership to the specified user and downgrade the current owner to a writer. This parameter is required as an acknowledgement of the side effect.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if the file ID parameter refers to a shared drive and the requester is an administrator of the domain to which the shared drive belongs.
    @param fileId The ID of the file or shared drive.
    @param permissionId The ID of the permission.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?removeExpiration:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?transferOwnership:bool ->
    ?useDomainAdminAccess:bool ->
    fileId:string ->
    permissionId:string ->
    GapiDriveV3Model.Permission.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Permission.t * GapiConversation.Session.t
  
  
end

module RepliesResource :
sig
  
  (** Creates a new reply to a comment.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    commentId:string ->
    GapiDriveV3Model.Reply.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Reply.t * GapiConversation.Session.t
  
  (** Deletes a reply.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    @param replyId The ID of the reply.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    commentId:string ->
    replyId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a reply by ID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param includeDeleted Whether to return deleted replies. Deleted replies will not include their original content.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    @param replyId The ID of the reply.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeDeleted:bool ->
    fileId:string ->
    commentId:string ->
    replyId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Reply.t * GapiConversation.Session.t
  
  (** Lists a comment's replies.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param includeDeleted Whether to include deleted replies. Deleted replies will not include their original content.
    @param pageSize The maximum number of replies to return per page.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeDeleted:bool ->
    ?pageSize:int ->
    ?pageToken:string ->
    fileId:string ->
    commentId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.ReplyList.t * GapiConversation.Session.t
  
  (** Updates a reply with patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    @param replyId The ID of the reply.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    commentId:string ->
    replyId:string ->
    GapiDriveV3Model.Reply.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Reply.t * GapiConversation.Session.t
  
  
end

module RevisionsResource :
sig
  
  (** Permanently deletes a file version. You can only delete revisions for files with binary content in Google Drive, like images or videos. Revisions for other files, like Google Docs or Sheets, and the last remaining file version can't be deleted.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param revisionId The ID of the revision.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    revisionId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a revision's metadata or content by ID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param acknowledgeAbuse Whether the user is acknowledging the risk of downloading known malware or other abusive files. This is only applicable when alt=media.
    @param fileId The ID of the file.
    @param revisionId The ID of the revision.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_download:GapiMediaResource.download ->
    ?acknowledgeAbuse:bool ->
    fileId:string ->
    revisionId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Revision.t * GapiConversation.Session.t
  
  (** Lists a file's revisions.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param pageSize The maximum number of revisions to return per page.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response.
    @param fileId The ID of the file.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?pageSize:int ->
    ?pageToken:string ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.RevisionList.t * GapiConversation.Session.t
  
  (** Updates a revision with patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param revisionId The ID of the revision.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    revisionId:string ->
    GapiDriveV3Model.Revision.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Revision.t * GapiConversation.Session.t
  
  
end

module TeamdrivesResource :
sig
  
  (** Deprecated use drives.create instead.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param requestId An ID, such as a random UUID, which uniquely identifies this user's request for idempotent creation of a Team Drive. A repeated request by the same user and with the same request ID will avoid creating duplicates by attempting to create the same Team Drive. If the Team Drive already exists a 409 error will be returned.
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    requestId:string ->
    GapiDriveV3Model.TeamDrive.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.TeamDrive.t * GapiConversation.Session.t
  
  (** Deprecated use drives.delete instead.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param teamDriveId The ID of the Team Drive
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    teamDriveId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Deprecated use drives.get instead.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if they are an administrator of the domain to which the Team Drive belongs.
    @param teamDriveId The ID of the Team Drive
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?useDomainAdminAccess:bool ->
    teamDriveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.TeamDrive.t * GapiConversation.Session.t
  
  (** Deprecated use drives.list instead.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param pageSize Maximum number of Team Drives to return.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then all Team Drives of the domain in which the requester is an administrator are returned.
    @param pageToken Page token for Team Drives.
    @param q Query string for searching Team Drives.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?pageSize:int ->
    ?useDomainAdminAccess:bool ->
    ?pageToken:string ->
    ?q:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.TeamDriveList.t * GapiConversation.Session.t
  
  (** Deprecated use drives.update instead
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if they are an administrator of the domain to which the Team Drive belongs.
    @param teamDriveId The ID of the Team Drive
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?useDomainAdminAccess:bool ->
    teamDriveId:string ->
    GapiDriveV3Model.TeamDrive.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.TeamDrive.t * GapiConversation.Session.t
  
  
end


