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
  (** See, create, and delete its own configuration data in your Google Drive *)
  
  val drive_file : string
  (** See, edit, create, and delete only the specific Google Drive files you use with this app *)
  
  val drive_metadata : string
  (** View and manage metadata of files in your Google Drive *)
  
  val drive_metadata_readonly : string
  (** See information about your Google Drive files *)
  
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
    @param custom_headers Optional HTTP custom headers.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.About.t * GapiConversation.Session.t
  
  
end

module ChangesResource :
sig
  
  (** Gets the starting pageToken for listing future changes.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param driveId The ID of the shared drive for which the starting pageToken for listing future changes from that shared drive is returned.
    @param teamDriveId Deprecated use driveId instead.
    *)
  val getStartPageToken :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?driveId:string ->
    ?teamDriveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.StartPageToken.t * GapiConversation.Session.t
  
  (** Lists the changes for a user or shared drive.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param includeCorpusRemovals Whether changes should include the file resource if the file is still accessible by the user at the time of the request, even when a file was removed from the list of changes and there will be no further change entries for this file.
    @param includeItemsFromAllDrives Whether both My Drive and shared drive items should be included in results.
    @param includeRemoved Whether to include changes indicating that items have been removed from the list of changes, for example by deletion or loss of access.
    @param includeTeamDriveItems Deprecated use includeItemsFromAllDrives instead.
    @param pageSize The maximum number of changes to return per page.
    @param restrictToMyDrive Whether to restrict the results to changes inside the My Drive hierarchy. This omits changes to files such as those in the Application Data folder or shared files which have not been added to My Drive.
    @param spaces A comma-separated list of spaces to query within the corpora. Supported values are 'drive' and 'appDataFolder'.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param driveId The shared drive from which changes are returned. If specified the change IDs will be reflective of the shared drive; use the combined drive ID and change ID as an identifier.
    @param includeLabels A comma-separated list of IDs of labels to include in the labelInfo part of the response.
    @param includePermissionsForView Specifies which additional view's permissions to include in the response. Only 'published' is supported.
    @param teamDriveId Deprecated use driveId instead.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response or to the response from the getStartPageToken method.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
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
    ?includeLabels:string ->
    ?includePermissionsForView:string ->
    ?teamDriveId:string ->
    pageToken:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.ChangeList.t * GapiConversation.Session.t
  
  (** Subscribes to changes for a user. To use this method, you must include the pageToken query parameter.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param includeCorpusRemovals Whether changes should include the file resource if the file is still accessible by the user at the time of the request, even when a file was removed from the list of changes and there will be no further change entries for this file.
    @param includeItemsFromAllDrives Whether both My Drive and shared drive items should be included in results.
    @param includeRemoved Whether to include changes indicating that items have been removed from the list of changes, for example by deletion or loss of access.
    @param includeTeamDriveItems Deprecated use includeItemsFromAllDrives instead.
    @param pageSize The maximum number of changes to return per page.
    @param restrictToMyDrive Whether to restrict the results to changes inside the My Drive hierarchy. This omits changes to files such as those in the Application Data folder or shared files which have not been added to My Drive.
    @param spaces A comma-separated list of spaces to query within the corpora. Supported values are 'drive' and 'appDataFolder'.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param driveId The shared drive from which changes are returned. If specified the change IDs will be reflective of the shared drive; use the combined drive ID and change ID as an identifier.
    @param includeLabels A comma-separated list of IDs of labels to include in the labelInfo part of the response.
    @param includePermissionsForView Specifies which additional view's permissions to include in the response. Only 'published' is supported.
    @param teamDriveId Deprecated use driveId instead.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response or to the response from the getStartPageToken method.
    *)
  val watch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
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
    ?includeLabels:string ->
    ?includePermissionsForView:string ->
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
    @param custom_headers Optional HTTP custom headers.
    *)
  val stop :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    GapiDriveV3Model.Channel.t ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  
end

module CommentsResource :
sig
  
  (** Creates a comment on a file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param fileId The ID of the file.
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    fileId:string ->
    GapiDriveV3Model.Comment.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Comment.t * GapiConversation.Session.t
  
  (** Deletes a comment.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    fileId:string ->
    commentId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a comment by ID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param includeDeleted Whether to return deleted comments. Deleted comments will not include their original content.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?includeDeleted:bool ->
    fileId:string ->
    commentId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Comment.t * GapiConversation.Session.t
  
  (** Lists a file's comments.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param includeDeleted Whether to include deleted comments. Deleted comments will not include their original content.
    @param pageSize The maximum number of comments to return per page.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response.
    @param startModifiedTime The minimum value of 'modifiedTime' for the result comments (RFC 3339 date-time).
    @param fileId The ID of the file.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
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
    @param custom_headers Optional HTTP custom headers.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    fileId:string ->
    commentId:string ->
    GapiDriveV3Model.Comment.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Comment.t * GapiConversation.Session.t
  
  
end

module DrivesResource :
sig
  
  (** Creates a shared drive.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param requestId An ID, such as a random UUID, which uniquely identifies this user's request for idempotent creation of a shared drive. A repeated request by the same user and with the same request ID will avoid creating duplicates by attempting to create the same shared drive. If the shared drive already exists a 409 error will be returned.
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    requestId:string ->
    GapiDriveV3Model.Drive.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Drive.t * GapiConversation.Session.t
  
  (** Permanently deletes a shared drive for which the user is an organizer. The shared drive cannot contain any untrashed items.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param allowItemDeletion Whether any items inside the shared drive should also be deleted. This option is only supported when useDomainAdminAccess is also set to true.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if they are an administrator of the domain to which the shared drive belongs.
    @param driveId The ID of the shared drive.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?allowItemDeletion:bool ->
    ?useDomainAdminAccess:bool ->
    driveId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a shared drive's metadata by ID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if they are an administrator of the domain to which the shared drive belongs.
    @param driveId The ID of the shared drive.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?useDomainAdminAccess:bool ->
    driveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Drive.t * GapiConversation.Session.t
  
  (** Hides a shared drive from the default view.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param driveId The ID of the shared drive.
    *)
  val hide :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    driveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Drive.t * GapiConversation.Session.t
  
  (** Lists the user's shared drives.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param pageSize Maximum number of shared drives to return per page.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then all shared drives of the domain in which the requester is an administrator are returned.
    @param pageToken Page token for shared drives.
    @param q Query string for searching shared drives.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?pageSize:int ->
    ?useDomainAdminAccess:bool ->
    ?pageToken:string ->
    ?q:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.DriveList.t * GapiConversation.Session.t
  
  (** Restores a shared drive to the default view.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param driveId The ID of the shared drive.
    *)
  val unhide :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    driveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Drive.t * GapiConversation.Session.t
  
  (** Updates the metadate for a shared drive.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if they are an administrator of the domain to which the shared drive belongs.
    @param driveId The ID of the shared drive.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
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
      | User (** Files owned by or shared to the user. If a user has permissions on a Shared Drive, the files inside it won't be retrieved unless the user has created, opened, or shared the file. *)
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Creates a copy of a file and applies any requested updates with patch semantics. Folders cannot be copied.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param enforceSingleParent Deprecated. Copying files into multiple folders is no longer supported. Use shortcuts instead.
    @param ignoreDefaultVisibility Whether to ignore the domain's default visibility settings for the created file. Domain administrators can choose to make all uploaded files visible to the domain by default; this parameter bypasses that behavior for the request. Permissions are still inherited from parent folders.
    @param keepRevisionForever Whether to set the 'keepForever' field in the new head revision. This is only applicable to files with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the limit is reached, try deleting pinned revisions.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param includeLabels A comma-separated list of IDs of labels to include in the labelInfo part of the response.
    @param includePermissionsForView Specifies which additional view's permissions to include in the response. Only 'published' is supported.
    @param ocrLanguage A language hint for OCR processing during image import (ISO 639-1 code).
    @param fileId The ID of the file.
    *)
  val copy :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?enforceSingleParent:bool ->
    ?ignoreDefaultVisibility:bool ->
    ?keepRevisionForever:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?includeLabels:string ->
    ?includePermissionsForView:string ->
    ?ocrLanguage:string ->
    fileId:string ->
    GapiDriveV3Model.File.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.File.t * GapiConversation.Session.t
  
  (** Creates a file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param enforceSingleParent Deprecated. Creating files in multiple folders is no longer supported.
    @param ignoreDefaultVisibility Whether to ignore the domain's default visibility settings for the created file. Domain administrators can choose to make all uploaded files visible to the domain by default; this parameter bypasses that behavior for the request. Permissions are still inherited from parent folders.
    @param keepRevisionForever Whether to set the 'keepForever' field in the new head revision. This is only applicable to files with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the limit is reached, try deleting pinned revisions.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param useContentAsIndexableText Whether to use the uploaded content as indexable text.
    @param includeLabels A comma-separated list of IDs of labels to include in the labelInfo part of the response.
    @param includePermissionsForView Specifies which additional view's permissions to include in the response. Only 'published' is supported.
    @param ocrLanguage A language hint for OCR processing during image import (ISO 639-1 code).
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_source:GapiMediaResource.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?enforceSingleParent:bool ->
    ?ignoreDefaultVisibility:bool ->
    ?keepRevisionForever:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?useContentAsIndexableText:bool ->
    ?includeLabels:string ->
    ?includePermissionsForView:string ->
    ?ocrLanguage:string ->
    GapiDriveV3Model.File.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.File.t * GapiConversation.Session.t
  
  (** Permanently deletes a file owned by the user without moving it to the trash. If the file belongs to a shared drive the user must be an organizer on the parent. If the target is a folder, all descendants owned by the user are also deleted.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param enforceSingleParent Deprecated. If an item is not in a shared drive and its last parent is deleted but the item itself is not, the item will be placed under its owner's root.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param fileId The ID of the file.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?enforceSingleParent:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    fileId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Permanently deletes all of the user's trashed files.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param enforceSingleParent Deprecated. If an item is not in a shared drive and its last parent is deleted but the item itself is not, the item will be placed under its owner's root.
    *)
  val emptyTrash :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?enforceSingleParent:bool ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Exports a Google Workspace document to the requested MIME type and returns exported byte content. Note that the exported content is limited to 10MB.
    
    If [std_params] includes setting [alt="media"], the file content is
    downloaded as per [media_download].
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param media_download Location where the content will be saved.
    @param custom_headers Optional HTTP custom headers.
    @param fileId The ID of the file.
    @param mimeType The MIME type of the format requested for this export.
    *)
  val export :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_download:GapiMediaResource.download ->
    ?custom_headers:GapiCore.Header.t list ->
    fileId:string ->
    mimeType:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Generates a set of file IDs which can be provided in create or copy requests.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param count The number of IDs to return.
    @param space The space in which the IDs can be used to create new files. Supported values are 'drive' and 'appDataFolder'. (Default: 'drive')
    @param _type The type of items which the IDs can be used for. Supported values are 'files' and 'shortcuts'. Note that 'shortcuts' are only supported in the drive 'space'. (Default: 'files')
    *)
  val generateIds :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?count:int ->
    ?space:string ->
    ?_type:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.GeneratedIds.t * GapiConversation.Session.t
  
  (** Gets a file's metadata or content by ID.
    
    If [std_params] includes setting [alt="media"], the file content is
    downloaded as per [media_download].
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param media_download Location where the content will be saved.
    @param custom_headers Optional HTTP custom headers.
    @param acknowledgeAbuse Whether the user is acknowledging the risk of downloading known malware or other abusive files. This is only applicable when alt=media.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param includeLabels A comma-separated list of IDs of labels to include in the labelInfo part of the response.
    @param includePermissionsForView Specifies which additional view's permissions to include in the response. Only 'published' is supported.
    @param fileId The ID of the file.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_download:GapiMediaResource.download ->
    ?custom_headers:GapiCore.Header.t list ->
    ?acknowledgeAbuse:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?includeLabels:string ->
    ?includePermissionsForView:string ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.File.t * GapiConversation.Session.t
  
  (** Lists or searches files.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param includeItemsFromAllDrives Whether both My Drive and shared drive items should be included in results.
    @param includeTeamDriveItems Deprecated use includeItemsFromAllDrives instead.
    @param pageSize The maximum number of files to return per page. Partial or empty result pages are possible even before the end of the files list has been reached.
    @param spaces A comma-separated list of spaces to query within the corpora. Supported values are 'drive' and 'appDataFolder'.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param corpora Groupings of files to which the query applies. Supported groupings are: 'user' (files created by, opened by, or shared directly with the user), 'drive' (files in the specified shared drive as indicated by the 'driveId'), 'domain' (files shared to the user's domain), and 'allDrives' (A combination of 'user' and 'drive' for all drives where the user is a member). When able, use 'user' or 'drive', instead of 'allDrives', for efficiency.
    @param corpus The source of files to list. Deprecated: use 'corpora' instead.
    @param driveId ID of the shared drive to search.
    @param includeLabels A comma-separated list of IDs of labels to include in the labelInfo part of the response.
    @param includePermissionsForView Specifies which additional view's permissions to include in the response. Only 'published' is supported.
    @param orderBy A comma-separated list of sort keys. Valid keys are 'createdTime', 'folder', 'modifiedByMeTime', 'modifiedTime', 'name', 'name_natural', 'quotaBytesUsed', 'recency', 'sharedWithMeTime', 'starred', and 'viewedByMeTime'. Each key sorts ascending by default, but may be reversed with the 'desc' modifier. Example usage: ?orderBy=folder,modifiedTime desc,name. Please note that there is a current limitation for users with approximately one million files in which the requested sort order is ignored.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response.
    @param q A query for filtering the file results. See the "Search for Files" guide for supported syntax.
    @param teamDriveId Deprecated use driveId instead.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?includeItemsFromAllDrives:bool ->
    ?includeTeamDriveItems:bool ->
    ?pageSize:int ->
    ?spaces:string ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?corpora:string ->
    ?corpus:Corpus.t ->
    ?driveId:string ->
    ?includeLabels:string ->
    ?includePermissionsForView:string ->
    ?orderBy:string ->
    ?pageToken:string ->
    ?q:string ->
    ?teamDriveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.FileList.t * GapiConversation.Session.t
  
  (** Lists the labels on a file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param maxResults The maximum number of labels to return per page. When not set, this defaults to 100.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response.
    @param fileId The ID of the file.
    *)
  val listLabels :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?maxResults:int ->
    ?pageToken:string ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.LabelList.t * GapiConversation.Session.t
  
  (** Modifies the set of labels on a file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param fileId The ID of the file for which the labels are modified.
    *)
  val modifyLabels :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    fileId:string ->
    GapiDriveV3Model.ModifyLabelsRequest.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.ModifyLabelsResponse.t * GapiConversation.Session.t
  
  (** Updates a file's metadata and/or content. When calling this method, only populate fields in the request that you want to modify. When updating fields, some fields might change automatically, such as modifiedDate. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param enforceSingleParent Deprecated. Adding files to multiple folders is no longer supported. Use shortcuts instead.
    @param keepRevisionForever Whether to set the 'keepForever' field in the new head revision. This is only applicable to files with binary content in Google Drive. Only 200 revisions for the file can be kept forever. If the limit is reached, try deleting pinned revisions.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param useContentAsIndexableText Whether to use the uploaded content as indexable text.
    @param addParents A comma-separated list of parent IDs to add.
    @param includeLabels A comma-separated list of IDs of labels to include in the labelInfo part of the response.
    @param includePermissionsForView Specifies which additional view's permissions to include in the response. Only 'published' is supported.
    @param ocrLanguage A language hint for OCR processing during image import (ISO 639-1 code).
    @param removeParents A comma-separated list of parent IDs to remove.
    @param fileId The ID of the file.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_source:GapiMediaResource.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?enforceSingleParent:bool ->
    ?keepRevisionForever:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?useContentAsIndexableText:bool ->
    ?addParents:string ->
    ?includeLabels:string ->
    ?includePermissionsForView:string ->
    ?ocrLanguage:string ->
    ?removeParents:string ->
    fileId:string ->
    GapiDriveV3Model.File.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.File.t * GapiConversation.Session.t
  
  (** Subscribes to changes to a file. While you can establish a channel for changes to a file on a shared drive, a change to a shared drive file won't create a notification.
    
    If [std_params] includes setting [alt="media"], the file content is
    downloaded as per [media_download].
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param media_download Location where the content will be saved.
    @param custom_headers Optional HTTP custom headers.
    @param acknowledgeAbuse Whether the user is acknowledging the risk of downloading known malware or other abusive files. This is only applicable when alt=media.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param includeLabels A comma-separated list of IDs of labels to include in the labelInfo part of the response.
    @param includePermissionsForView Specifies which additional view's permissions to include in the response. Only 'published' is supported.
    @param fileId The ID of the file.
    *)
  val watch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_download:GapiMediaResource.download ->
    ?custom_headers:GapiCore.Header.t list ->
    ?acknowledgeAbuse:bool ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?includeLabels:string ->
    ?includePermissionsForView:string ->
    fileId:string ->
    GapiDriveV3Model.Channel.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Channel.t * GapiConversation.Session.t
  
  
end

module PermissionsResource :
sig
  
  (** Creates a permission for a file or shared drive. For more information on creating permissions, see Share files, folders & drives.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param enforceSingleParent Deprecated. See moveToNewOwnersRoot for details.
    @param moveToNewOwnersRoot This parameter will only take effect if the item is not in a shared drive and the request is attempting to transfer the ownership of the item. If set to true, the item will be moved to the new owner's My Drive root folder and all prior parents removed. If set to false, parents are not changed.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param transferOwnership Whether to transfer ownership to the specified user and downgrade the current owner to a writer. This parameter is required as an acknowledgement of the side effect. File owners can only transfer ownership of files existing on My Drive. Files existing in a shared drive are owned by the organization that owns that shared drive. Ownership transfers are not supported for files and folders in shared drives. Organizers of a shared drive can move items from that shared drive into their My Drive which transfers the ownership to them.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if the file ID parameter refers to a shared drive and the requester is an administrator of the domain to which the shared drive belongs.
    @param emailMessage A plain text custom message to include in the notification email.
    @param sendNotificationEmail Whether to send a notification email when sharing to users or groups. This defaults to true for users and groups, and is not allowed for other requests. It must not be disabled for ownership transfers.
    @param fileId The ID of the file or shared drive.
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
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
    @param custom_headers Optional HTTP custom headers.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if the file ID parameter refers to a shared drive and the requester is an administrator of the domain to which the shared drive belongs.
    @param fileId The ID of the file or shared drive.
    @param permissionId The ID of the permission.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
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
    @param custom_headers Optional HTTP custom headers.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if the file ID parameter refers to a shared drive and the requester is an administrator of the domain to which the shared drive belongs.
    @param fileId The ID of the file.
    @param permissionId The ID of the permission.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
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
    @param custom_headers Optional HTTP custom headers.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if the file ID parameter refers to a shared drive and the requester is an administrator of the domain to which the shared drive belongs.
    @param includePermissionsForView Specifies which additional view's permissions to include in the response. Only 'published' is supported.
    @param pageSize The maximum number of permissions to return per page. When not set for files in a shared drive, at most 100 results will be returned. When not set for files that are not in a shared drive, the entire list will be returned.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response.
    @param fileId The ID of the file or shared drive.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?supportsAllDrives:bool ->
    ?supportsTeamDrives:bool ->
    ?useDomainAdminAccess:bool ->
    ?includePermissionsForView:string ->
    ?pageSize:int ->
    ?pageToken:string ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.PermissionList.t * GapiConversation.Session.t
  
  (** Updates a permission with patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param removeExpiration Whether to remove the expiration date.
    @param supportsAllDrives Whether the requesting application supports both My Drives and shared drives.
    @param supportsTeamDrives Deprecated use supportsAllDrives instead.
    @param transferOwnership Whether to transfer ownership to the specified user and downgrade the current owner to a writer. This parameter is required as an acknowledgement of the side effect. File owners can only transfer ownership of files existing on My Drive. Files existing in a shared drive are owned by the organization that owns that shared drive. Ownership transfers are not supported for files and folders in shared drives. Organizers of a shared drive can move items from that shared drive into their My Drive which transfers the ownership to them.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if the file ID parameter refers to a shared drive and the requester is an administrator of the domain to which the shared drive belongs.
    @param fileId The ID of the file or shared drive.
    @param permissionId The ID of the permission.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
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
  
  (** Creates a reply to a comment.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    fileId:string ->
    commentId:string ->
    GapiDriveV3Model.Reply.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Reply.t * GapiConversation.Session.t
  
  (** Deletes a reply.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    @param replyId The ID of the reply.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    fileId:string ->
    commentId:string ->
    replyId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a reply by ID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param includeDeleted Whether to return deleted replies. Deleted replies will not include their original content.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    @param replyId The ID of the reply.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?includeDeleted:bool ->
    fileId:string ->
    commentId:string ->
    replyId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Reply.t * GapiConversation.Session.t
  
  (** Lists a comment's replies.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param includeDeleted Whether to include deleted replies. Deleted replies will not include their original content.
    @param pageSize The maximum number of replies to return per page.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
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
    @param custom_headers Optional HTTP custom headers.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    @param replyId The ID of the reply.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
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
    @param custom_headers Optional HTTP custom headers.
    @param fileId The ID of the file.
    @param revisionId The ID of the revision.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    fileId:string ->
    revisionId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a revision's metadata or content by ID.
    
    If [std_params] includes setting [alt="media"], the file content is
    downloaded as per [media_download].
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param media_download Location where the content will be saved.
    @param custom_headers Optional HTTP custom headers.
    @param acknowledgeAbuse Whether the user is acknowledging the risk of downloading known malware or other abusive files. This is only applicable when alt=media.
    @param fileId The ID of the file.
    @param revisionId The ID of the revision.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_download:GapiMediaResource.download ->
    ?custom_headers:GapiCore.Header.t list ->
    ?acknowledgeAbuse:bool ->
    fileId:string ->
    revisionId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.Revision.t * GapiConversation.Session.t
  
  (** Lists a file's revisions.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param pageSize The maximum number of revisions to return per page.
    @param pageToken The token for continuing a previous list request on the next page. This should be set to the value of 'nextPageToken' from the previous response.
    @param fileId The ID of the file.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?pageSize:int ->
    ?pageToken:string ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.RevisionList.t * GapiConversation.Session.t
  
  (** Updates a revision with patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param fileId The ID of the file.
    @param revisionId The ID of the revision.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
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
    @param custom_headers Optional HTTP custom headers.
    @param requestId An ID, such as a random UUID, which uniquely identifies this user's request for idempotent creation of a Team Drive. A repeated request by the same user and with the same request ID will avoid creating duplicates by attempting to create the same Team Drive. If the Team Drive already exists a 409 error will be returned.
    *)
  val create :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    requestId:string ->
    GapiDriveV3Model.TeamDrive.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.TeamDrive.t * GapiConversation.Session.t
  
  (** Deprecated use drives.delete instead.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param teamDriveId The ID of the Team Drive
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    teamDriveId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Deprecated use drives.get instead.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if they are an administrator of the domain to which the Team Drive belongs.
    @param teamDriveId The ID of the Team Drive
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?useDomainAdminAccess:bool ->
    teamDriveId:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.TeamDrive.t * GapiConversation.Session.t
  
  (** Deprecated use drives.list instead.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param pageSize Maximum number of Team Drives to return.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then all Team Drives of the domain in which the requester is an administrator are returned.
    @param pageToken Page token for Team Drives.
    @param q Query string for searching Team Drives.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?pageSize:int ->
    ?useDomainAdminAccess:bool ->
    ?pageToken:string ->
    ?q:string ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.TeamDriveList.t * GapiConversation.Session.t
  
  (** Deprecated use drives.update instead
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v3/"]).
    @param std_params Optional standard parameters.
    @param custom_headers Optional HTTP custom headers.
    @param useDomainAdminAccess Issue the request as a domain administrator; if set to true, then the requester will be granted access if they are an administrator of the domain to which the Team Drive belongs.
    @param teamDriveId The ID of the Team Drive
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?custom_headers:GapiCore.Header.t list ->
    ?useDomainAdminAccess:bool ->
    teamDriveId:string ->
    GapiDriveV3Model.TeamDrive.t ->
    GapiConversation.Session.t ->
    GapiDriveV3Model.TeamDrive.t * GapiConversation.Session.t
  
  
end


