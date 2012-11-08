(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Drive API (v2).
  
  The API to interact with Drive..
  
  For more information about this service, see the
  {{:https://developers.google.com/drive/}API Documentation}.
  *)

module Scope :
sig
  val drive : string
  (** View and manage the files and documents in your Google Drive *)
  
  val drive_apps_readonly : string
  (** View your Google Drive apps *)
  
  val drive_file : string
  (** View and manage Google Drive files that you have opened or created with this app *)
  
  val drive_metadata_readonly : string
  (** View metadata for files and documents in your Google Drive *)
  
  val drive_readonly : string
  (** View the files and documents in your Google Drive *)
  
  
end
(** Service Auth Scopes *)

module AboutResource :
sig
  
  (** Gets the information about the current user along with Drive API settings
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param includeSubscribed When calculating the number of remaining change IDs, whether to include shared files and public files the user has opened. When set to false, this counts only change IDs for owned files and any shared or public files that the user has explictly added to a folder in Drive.
    @param maxChangeIdCount Maximum number of remaining change IDs to count
    @param startChangeId Change ID to start counting from when calculating number of remaining change IDs
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeSubscribed:bool ->
    ?maxChangeIdCount:int64 ->
    ?startChangeId:int64 ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.About.t * GapiConversation.Session.t
  
  
end

module AppsResource :
sig
  
  (** Gets a specific app.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param appId The ID of the app.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    appId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.App.t * GapiConversation.Session.t
  
  (** Lists a user's apps.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.AppList.t * GapiConversation.Session.t
  
  
end

module ChangesResource :
sig
  
  (** Gets a specific change.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param changeId The ID of the change.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    changeId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.Change.t * GapiConversation.Session.t
  
  (** Lists the changes for a user.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param includeDeleted Whether to include deleted items.
    @param includeSubscribed Whether to include shared files and public files the user has opened. When set to false, the list will include owned files plus any shared or public files the user has explictly added to a folder in Drive.
    @param maxResults Maximum number of changes to return.
    @param pageToken Page token for changes.
    @param startChangeId Change ID to start listing changes from.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeDeleted:bool ->
    ?includeSubscribed:bool ->
    ?maxResults:int ->
    ?pageToken:string ->
    ?startChangeId:int64 ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.ChangeList.t * GapiConversation.Session.t
  
  
end

module ChildrenResource :
sig
  
  (** Removes a child from a folder.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param folderId The ID of the folder.
    @param childId The ID of the child.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    folderId:string ->
    childId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a specific child reference.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param folderId The ID of the folder.
    @param childId The ID of the child.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    folderId:string ->
    childId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.ChildReference.t * GapiConversation.Session.t
  
  (** Inserts a file into a folder.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param folderId The ID of the folder.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    folderId:string ->
    GapiDriveV2Model.ChildReference.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.ChildReference.t * GapiConversation.Session.t
  
  (** Lists a folder's children.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param maxResults Maximum number of children to return.
    @param pageToken Page token for children.
    @param q Query string for searching children.
    @param folderId The ID of the folder.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    ?q:string ->
    folderId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.ChildList.t * GapiConversation.Session.t
  
  
end

module CommentsResource :
sig
  
  (** Deletes a comment.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
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
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param includeDeleted If set, this will succeed when retrieving a deleted comment, and will include any deleted replies.
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
    GapiDriveV2Model.Comment.t * GapiConversation.Session.t
  
  (** Creates a new comment on the given file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    GapiDriveV2Model.Comment.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.Comment.t * GapiConversation.Session.t
  
  (** Lists a file's comments.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param includeDeleted If set, all comments and replies, including deleted comments and replies (with content stripped) will be returned.
    @param maxResults The maximum number of discussions to include in the response, used for paging.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    @param updatedMin Only discussions that were updated after this timestamp will be returned. Formatted as an RFC 3339 timestamp.
    @param fileId The ID of the file.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeDeleted:bool ->
    ?maxResults:int ->
    ?pageToken:string ->
    ?updatedMin:string ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.CommentList.t * GapiConversation.Session.t
  
  (** Updates an existing comment. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    commentId:string ->
    GapiDriveV2Model.Comment.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.Comment.t * GapiConversation.Session.t
  
  (** Updates an existing comment.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    commentId:string ->
    GapiDriveV2Model.Comment.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.Comment.t * GapiConversation.Session.t
  
  
end

module FilesResource :
sig
  
  module Projection :
  sig
    type t =
      | Default
      | BASIC
      | FULL
      
    val to_string : t -> string
    
    val of_string : string -> t
    
  end
  
  (** Creates a copy of the specified file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param convert Whether to convert this file to the corresponding Google Docs format.
    @param ocr Whether to attempt OCR on .jpg, .png, .gif, or .pdf uploads.
    @param pinned Whether to pin the head revision of the new copy.
    @param ocrLanguage If ocr is true, hints at the language to use. Valid values are ISO 639-1 codes.
    @param sourceLanguage The language of the original file to be translated.
    @param targetLanguage Target language to translate the file to. If no sourceLanguage is provided, the API will attempt to detect the language.
    @param timedTextLanguage The language of the timed text.
    @param timedTextTrackName The timed text track name.
    @param fileId The ID of the file to copy.
    *)
  val copy :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?convert:bool ->
    ?ocr:bool ->
    ?pinned:bool ->
    ?ocrLanguage:string ->
    ?sourceLanguage:string ->
    ?targetLanguage:string ->
    ?timedTextLanguage:string ->
    ?timedTextTrackName:string ->
    fileId:string ->
    GapiDriveV2Model.File.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.File.t * GapiConversation.Session.t
  
  (** Permanently deletes a file by ID. Skips the trash.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file to delete.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a file's metadata by ID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param updateViewedDate Whether to update the view date after successfully retrieving the file.
    @param projection This parameter is deprecated and has no function.
    @param fileId The ID for the file in question.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?updateViewedDate:bool ->
    ?projection:Projection.t ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.File.t * GapiConversation.Session.t
  
  (** Insert a new file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param convert Whether to convert this file to the corresponding Google Docs format.
    @param ocr Whether to attempt OCR on .jpg, .png, .gif, or .pdf uploads.
    @param pinned Whether to pin the head revision of the uploaded file.
    @param ocrLanguage If ocr is true, hints at the language to use. Valid values are ISO 639-1 codes.
    @param sourceLanguage The language of the original file to be translated.
    @param targetLanguage Target language to translate the file to. If no sourceLanguage is provided, the API will attempt to detect the language.
    @param timedTextLanguage The language of the timed text.
    @param timedTextTrackName The timed text track name.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_source:GapiMediaResource.t ->
    ?convert:bool ->
    ?ocr:bool ->
    ?pinned:bool ->
    ?ocrLanguage:string ->
    ?sourceLanguage:string ->
    ?targetLanguage:string ->
    ?timedTextLanguage:string ->
    ?timedTextTrackName:string ->
    GapiDriveV2Model.File.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.File.t * GapiConversation.Session.t
  
  (** Lists the user's files.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param maxResults Maximum number of files to return.
    @param pageToken Page token for files.
    @param projection This parameter is deprecated and has no function.
    @param q Query string for searching files.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?maxResults:int ->
    ?pageToken:string ->
    ?projection:Projection.t ->
    ?q:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.FileList.t * GapiConversation.Session.t
  
  (** Updates file metadata and/or content. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param convert Whether to convert this file to the corresponding Google Docs format.
    @param newRevision Whether a blob upload should create a new revision. If false, the blob data in the current head revision will be replaced.
    @param ocr Whether to attempt OCR on .jpg, .png, .gif, or .pdf uploads.
    @param pinned Whether to pin the new revision.
    @param setModifiedDate Whether to set the modified date with the supplied modified date.
    @param updateViewedDate Whether to update the view date after successfully updating the file.
    @param ocrLanguage If ocr is true, hints at the language to use. Valid values are ISO 639-1 codes.
    @param sourceLanguage The language of the original file to be translated.
    @param targetLanguage Target language to translate the file to. If no sourceLanguage is provided, the API will attempt to detect the language.
    @param timedTextLanguage The language of the timed text.
    @param timedTextTrackName The timed text track name.
    @param fileId The ID of the file to update.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?convert:bool ->
    ?newRevision:bool ->
    ?ocr:bool ->
    ?pinned:bool ->
    ?setModifiedDate:bool ->
    ?updateViewedDate:bool ->
    ?ocrLanguage:string ->
    ?sourceLanguage:string ->
    ?targetLanguage:string ->
    ?timedTextLanguage:string ->
    ?timedTextTrackName:string ->
    fileId:string ->
    GapiDriveV2Model.File.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.File.t * GapiConversation.Session.t
  
  (** Set the file's updated time to the current server time.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file to update.
    *)
  val touch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.File.t * GapiConversation.Session.t
  
  (** Moves a file to the trash.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file to trash.
    *)
  val trash :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.File.t * GapiConversation.Session.t
  
  (** Restores a file from the trash.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file to untrash.
    *)
  val untrash :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.File.t * GapiConversation.Session.t
  
  (** Updates file metadata and/or content
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param convert Whether to convert this file to the corresponding Google Docs format.
    @param newRevision Whether a blob upload should create a new revision. If false, the blob data in the current head revision will be replaced.
    @param ocr Whether to attempt OCR on .jpg, .png, .gif, or .pdf uploads.
    @param pinned Whether to pin the new revision.
    @param setModifiedDate Whether to set the modified date with the supplied modified date.
    @param updateViewedDate Whether to update the view date after successfully updating the file.
    @param ocrLanguage If ocr is true, hints at the language to use. Valid values are ISO 639-1 codes.
    @param sourceLanguage The language of the original file to be translated.
    @param targetLanguage Target language to translate the file to. If no sourceLanguage is provided, the API will attempt to detect the language.
    @param timedTextLanguage The language of the timed text.
    @param timedTextTrackName The timed text track name.
    @param fileId The ID of the file to update.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?media_source:GapiMediaResource.t ->
    ?convert:bool ->
    ?newRevision:bool ->
    ?ocr:bool ->
    ?pinned:bool ->
    ?setModifiedDate:bool ->
    ?updateViewedDate:bool ->
    ?ocrLanguage:string ->
    ?sourceLanguage:string ->
    ?targetLanguage:string ->
    ?timedTextLanguage:string ->
    ?timedTextTrackName:string ->
    fileId:string ->
    GapiDriveV2Model.File.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.File.t * GapiConversation.Session.t
  
  
end

module ParentsResource :
sig
  
  (** Removes a parent from a file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param parentId The ID of the parent.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    parentId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a specific parent reference.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param parentId The ID of the parent.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    parentId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.ParentReference.t * GapiConversation.Session.t
  
  (** Adds a parent folder for a file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    GapiDriveV2Model.ParentReference.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.ParentReference.t * GapiConversation.Session.t
  
  (** Lists a file's parents.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.ParentList.t * GapiConversation.Session.t
  
  
end

module PermissionsResource :
sig
  
  (** Deletes a permission from a file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID for the file.
    @param permissionId The ID for the permission.
    *)
  val delete :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    permissionId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Gets a permission by ID.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param fileId The ID for the file.
    @param permissionId The ID for the permission.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    permissionId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.Permission.t * GapiConversation.Session.t
  
  (** Inserts a permission for a file.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param sendNotificationEmails Whether to send notification emails.
    @param fileId The ID for the file.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?sendNotificationEmails:bool ->
    fileId:string ->
    GapiDriveV2Model.Permission.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.Permission.t * GapiConversation.Session.t
  
  (** Lists a file's permissions.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID for the file.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.PermissionList.t * GapiConversation.Session.t
  
  (** Updates a permission. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID for the file.
    @param permissionId The ID for the permission.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    permissionId:string ->
    GapiDriveV2Model.Permission.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.Permission.t * GapiConversation.Session.t
  
  (** Updates a permission.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID for the file.
    @param permissionId The ID for the permission.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    permissionId:string ->
    GapiDriveV2Model.Permission.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.Permission.t * GapiConversation.Session.t
  
  
end

module RepliesResource :
sig
  
  (** Deletes a reply.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
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
  
  (** Gets a reply.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param includeDeleted If set, this will succeed when retrieving a deleted reply.
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
    GapiDriveV2Model.CommentReply.t * GapiConversation.Session.t
  
  (** Creates a new reply to the given comment.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val insert :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    commentId:string ->
    GapiDriveV2Model.CommentReply.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.CommentReply.t * GapiConversation.Session.t
  
  (** Lists all of the replies to a comment.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param includeDeleted If set, all replies, including deleted replies (with content stripped) will be returned.
    @param maxResults The maximum number of replies to include in the response, used for paging.
    @param pageToken The continuation token, used to page through large result sets. To get the next page of results, set this parameter to the value of "nextPageToken" from the previous response.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    ?includeDeleted:bool ->
    ?maxResults:int ->
    ?pageToken:string ->
    fileId:string ->
    commentId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.CommentReplyList.t * GapiConversation.Session.t
  
  (** Updates an existing reply. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param commentId The ID of the comment.
    @param replyId The ID of the reply.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    commentId:string ->
    replyId:string ->
    GapiDriveV2Model.CommentReply.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.CommentReply.t * GapiConversation.Session.t
  
  (** Updates an existing reply.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
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
    GapiDriveV2Model.CommentReply.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.CommentReply.t * GapiConversation.Session.t
  
  
end

module RevisionsResource :
sig
  
  (** Removes a revision.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
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
  
  (** Gets a specific revision.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param etag Optional ETag.
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    @param revisionId The ID of the revision.
    *)
  val get :
    ?base_url:string ->
    ?etag:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    revisionId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.Revision.t * GapiConversation.Session.t
  
  (** Lists a file's revisions.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID of the file.
    *)
  val list :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.RevisionList.t * GapiConversation.Session.t
  
  (** Updates a revision. This method supports patch semantics.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID for the file.
    @param revisionId The ID for the revision.
    *)
  val patch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    revisionId:string ->
    GapiDriveV2Model.Revision.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.Revision.t * GapiConversation.Session.t
  
  (** Updates a revision.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/drive/v2/"]).
    @param std_params Optional standard parameters.
    @param fileId The ID for the file.
    @param revisionId The ID for the revision.
    *)
  val update :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    fileId:string ->
    revisionId:string ->
    GapiDriveV2Model.Revision.t ->
    GapiConversation.Session.t ->
    GapiDriveV2Model.Revision.t * GapiConversation.Session.t
  
  
end


