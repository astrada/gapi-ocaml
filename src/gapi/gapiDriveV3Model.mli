(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Drive API (v3).
  
  For more information about this data model, see the
  {{:https://developers.google.com/drive/}API Documentation}.
  *)

module User :
sig
  type t = {
    displayName : string;
    (** A plain text displayable name for this user. *)
    emailAddress : string;
    (** The email address of the user. This may not be present in certain contexts if the user has not made their email address visible to the requester. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#user". *)
    me : bool;
    (** Whether this user is the requesting user. *)
    permissionId : string;
    (** The user's ID as visible in Permission resources. *)
    photoLink : string;
    (** A link to the user's profile photo, if available. *)
    
  }
  
  val displayName : (t, string) GapiLens.t
  val emailAddress : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val me : (t, bool) GapiLens.t
  val permissionId : (t, string) GapiLens.t
  val photoLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module About :
sig
  module StorageQuota :
  sig
    type t = {
      limit : int64;
      (** The usage limit, if applicable. This will not be present if the user has unlimited storage. *)
      usage : int64;
      (** The total usage across all services. *)
      usageInDrive : int64;
      (** The usage by all files in Google Drive. *)
      usageInDriveTrash : int64;
      (** The usage by trashed files in Google Drive. *)
      
    }
    
    val limit : (t, int64) GapiLens.t
    val usage : (t, int64) GapiLens.t
    val usageInDrive : (t, int64) GapiLens.t
    val usageInDriveTrash : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    appInstalled : bool;
    (** Whether the user has installed the requesting app. *)
    exportFormats : (string * string list) list;
    (** A map of source MIME type to possible targets for all supported exports. *)
    folderColorPalette : string list;
    (** The currently supported folder colors as RGB hex strings. *)
    importFormats : (string * string list) list;
    (** A map of source MIME type to possible targets for all supported imports. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#about". *)
    maxImportSizes : (string * int64) list;
    (** A map of maximum import sizes by MIME type, in bytes. *)
    maxUploadSize : int64;
    (** The maximum upload size in bytes. *)
    storageQuota : StorageQuota.t;
    (** The user's storage quota limits and usage. All fields are measured in bytes. *)
    user : User.t;
    (** The authenticated user. *)
    
  }
  
  val appInstalled : (t, bool) GapiLens.t
  val exportFormats : (t, (string * string list) list) GapiLens.t
  val folderColorPalette : (t, string list) GapiLens.t
  val importFormats : (t, (string * string list) list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val maxImportSizes : (t, (string * int64) list) GapiLens.t
  val maxUploadSize : (t, int64) GapiLens.t
  val storageQuota : (t, StorageQuota.t) GapiLens.t
  val user : (t, User.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Revision :
sig
  type t = {
    id : string;
    (** The ID of the revision. *)
    keepForever : bool;
    (** Whether to keep this revision forever, even if it is no longer the head revision. If not set, the revision will be automatically purged 30 days after newer content is uploaded. This can be set on a maximum of 200 revisions for a file.
This field is only applicable to files with binary content in Drive. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#revision". *)
    lastModifyingUser : User.t;
    (** The last user to modify this revision. *)
    md5Checksum : string;
    (** The MD5 checksum of the revision's content. This is only applicable to files with binary content in Drive. *)
    mimeType : string;
    (** The MIME type of the revision. *)
    modifiedTime : GapiDate.t;
    (** The last time the revision was modified (RFC 3339 date-time). *)
    originalFilename : string;
    (** The original filename used to create this revision. This is only applicable to files with binary content in Drive. *)
    publishAuto : bool;
    (** Whether subsequent revisions will be automatically republished. This is only applicable to Google Docs. *)
    published : bool;
    (** Whether this revision is published. This is only applicable to Google Docs. *)
    publishedOutsideDomain : bool;
    (** Whether this revision is published outside the domain. This is only applicable to Google Docs. *)
    size : int64;
    (** The size of the revision's content in bytes. This is only applicable to files with binary content in Drive. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val keepForever : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val lastModifyingUser : (t, User.t) GapiLens.t
  val md5Checksum : (t, string) GapiLens.t
  val mimeType : (t, string) GapiLens.t
  val modifiedTime : (t, GapiDate.t) GapiLens.t
  val originalFilename : (t, string) GapiLens.t
  val publishAuto : (t, bool) GapiLens.t
  val published : (t, bool) GapiLens.t
  val publishedOutsideDomain : (t, bool) GapiLens.t
  val size : (t, int64) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Reply :
sig
  type t = {
    action : string;
    (** The action the reply performed to the parent comment. Valid values are:  
- resolve 
- reopen *)
    author : User.t;
    (** The user who created the reply. *)
    content : string;
    (** The plain text content of the reply. This field is used for setting the content, while htmlContent should be displayed. This is required on creates if no action is specified. *)
    createdTime : GapiDate.t;
    (** The time at which the reply was created (RFC 3339 date-time). *)
    deleted : bool;
    (** Whether the reply has been deleted. A deleted reply has no content. *)
    htmlContent : string;
    (** The content of the reply with HTML formatting. *)
    id : string;
    (** The ID of the reply. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#reply". *)
    modifiedTime : GapiDate.t;
    (** The last time the reply was modified (RFC 3339 date-time). *)
    
  }
  
  val action : (t, string) GapiLens.t
  val author : (t, User.t) GapiLens.t
  val content : (t, string) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val deleted : (t, bool) GapiLens.t
  val htmlContent : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val modifiedTime : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Comment :
sig
  module QuotedFileContent :
  sig
    type t = {
      mimeType : string;
      (** The MIME type of the quoted content. *)
      value : string;
      (** The quoted content itself. This is interpreted as plain text if set through the API. *)
      
    }
    
    val mimeType : (t, string) GapiLens.t
    val value : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    anchor : string;
    (** A region of the document represented as a JSON string. See anchor documentation for details on how to define and interpret anchor properties. *)
    author : User.t;
    (** The user who created the comment. *)
    content : string;
    (** The plain text content of the comment. This field is used for setting the content, while htmlContent should be displayed. *)
    createdTime : GapiDate.t;
    (** The time at which the comment was created (RFC 3339 date-time). *)
    deleted : bool;
    (** Whether the comment has been deleted. A deleted comment has no content. *)
    htmlContent : string;
    (** The content of the comment with HTML formatting. *)
    id : string;
    (** The ID of the comment. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#comment". *)
    modifiedTime : GapiDate.t;
    (** The last time the comment or any of its replies was modified (RFC 3339 date-time). *)
    quotedFileContent : QuotedFileContent.t;
    (** The file content to which the comment refers, typically within the anchor region. For a text file, for example, this would be the text at the location of the comment. *)
    replies : Reply.t list;
    (** The full list of replies to the comment in chronological order. *)
    resolved : bool;
    (** Whether the comment has been resolved by one of its replies. *)
    
  }
  
  val anchor : (t, string) GapiLens.t
  val author : (t, User.t) GapiLens.t
  val content : (t, string) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val deleted : (t, bool) GapiLens.t
  val htmlContent : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val modifiedTime : (t, GapiDate.t) GapiLens.t
  val quotedFileContent : (t, QuotedFileContent.t) GapiLens.t
  val replies : (t, Reply.t list) GapiLens.t
  val resolved : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CommentList :
sig
  type t = {
    comments : Comment.t list;
    (** The page of comments. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#commentList". *)
    nextPageToken : string;
    (** The page token for the next page of comments. This will be absent if the end of the comments list has been reached. *)
    
  }
  
  val comments : (t, Comment.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module GeneratedIds :
sig
  type t = {
    ids : string list;
    (** The IDs generated for the requesting user in the specified space. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#generatedIds". *)
    space : string;
    (** The type of file that can be created with these IDs. *)
    
  }
  
  val ids : (t, string list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val space : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Permission :
sig
  type t = {
    allowFileDiscovery : bool;
    (** Whether the permission allows the file to be discovered through search. This is only applicable for permissions of type domain or anyone. *)
    displayName : string;
    (** A displayable name for users, groups or domains. *)
    domain : string;
    (** The domain to which this permission refers. *)
    emailAddress : string;
    (** The email address of the user or group to which this permission refers. *)
    expirationTime : GapiDate.t;
    (** The time at which this permission will expire (RFC 3339 date-time). *)
    id : string;
    (** The ID of this permission. This is a unique identifier for the grantee, and is published in User resources as permissionId. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#permission". *)
    photoLink : string;
    (** A link to the user's profile photo, if available. *)
    role : string;
    (** The role granted by this permission. Valid values are:  
- owner 
- writer 
- commenter 
- reader *)
    _type : string;
    (** The type of the grantee. Valid values are:  
- user 
- group 
- domain 
- anyone *)
    
  }
  
  val allowFileDiscovery : (t, bool) GapiLens.t
  val displayName : (t, string) GapiLens.t
  val domain : (t, string) GapiLens.t
  val emailAddress : (t, string) GapiLens.t
  val expirationTime : (t, GapiDate.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val photoLink : (t, string) GapiLens.t
  val role : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module File :
sig
  module VideoMediaMetadata :
  sig
    type t = {
      durationMillis : int64;
      (** The duration of the video in milliseconds. *)
      height : int;
      (** The height of the video in pixels. *)
      width : int;
      (** The width of the video in pixels. *)
      
    }
    
    val durationMillis : (t, int64) GapiLens.t
    val height : (t, int) GapiLens.t
    val width : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ImageMediaMetadata :
  sig
    module Location :
    sig
      type t = {
        altitude : float;
        (** The altitude stored in the image. *)
        latitude : float;
        (** The latitude stored in the image. *)
        longitude : float;
        (** The longitude stored in the image. *)
        
      }
      
      val altitude : (t, float) GapiLens.t
      val latitude : (t, float) GapiLens.t
      val longitude : (t, float) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      aperture : float;
      (** The aperture used to create the photo (f-number). *)
      cameraMake : string;
      (** The make of the camera used to create the photo. *)
      cameraModel : string;
      (** The model of the camera used to create the photo. *)
      colorSpace : string;
      (** The color space of the photo. *)
      exposureBias : float;
      (** The exposure bias of the photo (APEX value). *)
      exposureMode : string;
      (** The exposure mode used to create the photo. *)
      exposureTime : float;
      (** The length of the exposure, in seconds. *)
      flashUsed : bool;
      (** Whether a flash was used to create the photo. *)
      focalLength : float;
      (** The focal length used to create the photo, in millimeters. *)
      height : int;
      (** The height of the image in pixels. *)
      isoSpeed : int;
      (** The ISO speed used to create the photo. *)
      lens : string;
      (** The lens used to create the photo. *)
      location : Location.t;
      (** Geographic location information stored in the image. *)
      maxApertureValue : float;
      (** The smallest f-number of the lens at the focal length used to create the photo (APEX value). *)
      meteringMode : string;
      (** The metering mode used to create the photo. *)
      rotation : int;
      (** The rotation in clockwise degrees from the image's original orientation. *)
      sensor : string;
      (** The type of sensor used to create the photo. *)
      subjectDistance : int;
      (** The distance to the subject of the photo, in meters. *)
      time : string;
      (** The date and time the photo was taken (EXIF DateTime). *)
      whiteBalance : string;
      (** The white balance mode used to create the photo. *)
      width : int;
      (** The width of the image in pixels. *)
      
    }
    
    val aperture : (t, float) GapiLens.t
    val cameraMake : (t, string) GapiLens.t
    val cameraModel : (t, string) GapiLens.t
    val colorSpace : (t, string) GapiLens.t
    val exposureBias : (t, float) GapiLens.t
    val exposureMode : (t, string) GapiLens.t
    val exposureTime : (t, float) GapiLens.t
    val flashUsed : (t, bool) GapiLens.t
    val focalLength : (t, float) GapiLens.t
    val height : (t, int) GapiLens.t
    val isoSpeed : (t, int) GapiLens.t
    val lens : (t, string) GapiLens.t
    val location : (t, Location.t) GapiLens.t
    val maxApertureValue : (t, float) GapiLens.t
    val meteringMode : (t, string) GapiLens.t
    val rotation : (t, int) GapiLens.t
    val sensor : (t, string) GapiLens.t
    val subjectDistance : (t, int) GapiLens.t
    val time : (t, string) GapiLens.t
    val whiteBalance : (t, string) GapiLens.t
    val width : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ContentHints :
  sig
    module Thumbnail :
    sig
      type t = {
        image : string;
        (** The thumbnail data encoded with URL-safe Base64 (RFC 4648 section 5). *)
        mimeType : string;
        (** The MIME type of the thumbnail. *)
        
      }
      
      val image : (t, string) GapiLens.t
      val mimeType : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      indexableText : string;
      (** Text to be indexed for the file to improve fullText queries. This is limited to 128KB in length and may contain HTML elements. *)
      thumbnail : Thumbnail.t;
      (** A thumbnail for the file. This will only be used if Drive cannot generate a standard thumbnail. *)
      
    }
    
    val indexableText : (t, string) GapiLens.t
    val thumbnail : (t, Thumbnail.t) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Capabilities :
  sig
    type t = {
      canComment : bool;
      (** Whether the user can comment on the file. *)
      canCopy : bool;
      (** Whether the user can copy the file. *)
      canEdit : bool;
      (** Whether the user can edit the file's content. *)
      canReadRevisions : bool;
      (** Whether the current user has read access to the Revisions resource of the file. *)
      canShare : bool;
      (** Whether the user can modify the file's permissions and sharing settings. *)
      
    }
    
    val canComment : (t, bool) GapiLens.t
    val canCopy : (t, bool) GapiLens.t
    val canEdit : (t, bool) GapiLens.t
    val canReadRevisions : (t, bool) GapiLens.t
    val canShare : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    appProperties : (string * string) list;
    (** A collection of arbitrary key-value pairs which are private to the requesting app.
Entries with null values are cleared in update and copy requests. *)
    capabilities : Capabilities.t;
    (** Capabilities the current user has on the file. *)
    contentHints : ContentHints.t;
    (** Additional information about the content of the file. These fields are never populated in responses. *)
    createdTime : GapiDate.t;
    (** The time at which the file was created (RFC 3339 date-time). *)
    description : string;
    (** A short description of the file. *)
    explicitlyTrashed : bool;
    (** Whether the file has been explicitly trashed, as opposed to recursively trashed from a parent folder. *)
    fileExtension : string;
    (** The final component of fullFileExtension. This is only available for files with binary content in Drive. *)
    folderColorRgb : string;
    (** The color for a folder as an RGB hex string. The supported colors are published in the folderColorPalette field of the About resource.
If an unsupported color is specified, the closest color in the palette will be used instead. *)
    fullFileExtension : string;
    (** The full file extension extracted from the name field. May contain multiple concatenated extensions, such as "tar.gz". This is only available for files with binary content in Drive.
This is automatically updated when the name field changes, however it is not cleared if the new name does not contain a valid extension. *)
    headRevisionId : string;
    (** The ID of the file's head revision. This is currently only available for files with binary content in Drive. *)
    iconLink : string;
    (** A static, unauthenticated link to the file's icon. *)
    id : string;
    (** The ID of the file. *)
    imageMediaMetadata : ImageMediaMetadata.t;
    (** Additional metadata about image media, if available. *)
    isAppAuthorized : bool;
    (** Whether the file was created or opened by the requesting app. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#file". *)
    lastModifyingUser : User.t;
    (** The last user to modify the file. *)
    md5Checksum : string;
    (** The MD5 checksum for the content of the file. This is only applicable to files with binary content in Drive. *)
    mimeType : string;
    (** The MIME type of the file.
Drive will attempt to automatically detect an appropriate value from uploaded content if no value is provided. The value cannot be changed unless a new revision is uploaded.
If a file is created with a Google Doc MIME type, the uploaded content will be imported if possible. The supported import formats are published in the About resource. *)
    modifiedByMeTime : GapiDate.t;
    (** The last time the file was modified by the user (RFC 3339 date-time). *)
    modifiedTime : GapiDate.t;
    (** The last time the file was modified by anyone (RFC 3339 date-time).
Note that setting modifiedTime will also update modifiedByMeTime for the user. *)
    name : string;
    (** The name of the file. This is not necessarily unique within a folder. *)
    originalFilename : string;
    (** The original filename of the uploaded content if available, or else the original value of the name field. This is only available for files with binary content in Drive. *)
    ownedByMe : bool;
    (** Whether the user owns the file. *)
    owners : User.t list;
    (** The owners of the file. Currently, only certain legacy files may have more than one owner. *)
    parents : string list;
    (** The IDs of the parent folders which contain the file.
If not specified as part of a create request, the file will be placed directly in the My Drive folder. Update requests must use the addParents and removeParents parameters to modify the values. *)
    permissions : Permission.t list;
    (** The full list of permissions for the file. This is only available if the requesting user can share the file. *)
    properties : (string * string) list;
    (** A collection of arbitrary key-value pairs which are visible to all apps.
Entries with null values are cleared in update and copy requests. *)
    quotaBytesUsed : int64;
    (** The number of storage quota bytes used by the file. This includes the head revision as well as previous revisions with keepForever enabled. *)
    shared : bool;
    (** Whether the file has been shared. *)
    sharedWithMeTime : GapiDate.t;
    (** The time at which the file was shared with the user, if applicable (RFC 3339 date-time). *)
    sharingUser : User.t;
    (** The user who shared the file with the requesting user, if applicable. *)
    size : int64;
    (** The size of the file's content in bytes. This is only applicable to files with binary content in Drive. *)
    spaces : string list;
    (** The list of spaces which contain the file. The currently supported values are 'drive', 'appDataFolder' and 'photos'. *)
    starred : bool;
    (** Whether the user has starred the file. *)
    thumbnailLink : string;
    (** A short-lived link to the file's thumbnail, if available. Typically lasts on the order of hours. *)
    trashed : bool;
    (** Whether the file has been trashed, either explicitly or from a trashed parent folder. Only the owner may trash a file, and other users cannot see files in the owner's trash. *)
    version : int64;
    (** A monotonically increasing version number for the file. This reflects every change made to the file on the server, even those not visible to the user. *)
    videoMediaMetadata : VideoMediaMetadata.t;
    (** Additional metadata about video media. This may not be available immediately upon upload. *)
    viewedByMe : bool;
    (** Whether the file has been viewed by this user. *)
    viewedByMeTime : GapiDate.t;
    (** The last time the file was viewed by the user (RFC 3339 date-time). *)
    viewersCanCopyContent : bool;
    (** Whether users with only reader or commenter permission can copy the file's content. This affects copy, download, and print operations. *)
    webContentLink : string;
    (** A link for downloading the content of the file in a browser. This is only available for files with binary content in Drive. *)
    webViewLink : string;
    (** A link for opening the file in a relevant Google editor or viewer in a browser. *)
    writersCanShare : bool;
    (** Whether users with only writer permission can modify the file's permissions. *)
    
  }
  
  val appProperties : (t, (string * string) list) GapiLens.t
  val capabilities : (t, Capabilities.t) GapiLens.t
  val contentHints : (t, ContentHints.t) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val description : (t, string) GapiLens.t
  val explicitlyTrashed : (t, bool) GapiLens.t
  val fileExtension : (t, string) GapiLens.t
  val folderColorRgb : (t, string) GapiLens.t
  val fullFileExtension : (t, string) GapiLens.t
  val headRevisionId : (t, string) GapiLens.t
  val iconLink : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val imageMediaMetadata : (t, ImageMediaMetadata.t) GapiLens.t
  val isAppAuthorized : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val lastModifyingUser : (t, User.t) GapiLens.t
  val md5Checksum : (t, string) GapiLens.t
  val mimeType : (t, string) GapiLens.t
  val modifiedByMeTime : (t, GapiDate.t) GapiLens.t
  val modifiedTime : (t, GapiDate.t) GapiLens.t
  val name : (t, string) GapiLens.t
  val originalFilename : (t, string) GapiLens.t
  val ownedByMe : (t, bool) GapiLens.t
  val owners : (t, User.t list) GapiLens.t
  val parents : (t, string list) GapiLens.t
  val permissions : (t, Permission.t list) GapiLens.t
  val properties : (t, (string * string) list) GapiLens.t
  val quotaBytesUsed : (t, int64) GapiLens.t
  val shared : (t, bool) GapiLens.t
  val sharedWithMeTime : (t, GapiDate.t) GapiLens.t
  val sharingUser : (t, User.t) GapiLens.t
  val size : (t, int64) GapiLens.t
  val spaces : (t, string list) GapiLens.t
  val starred : (t, bool) GapiLens.t
  val thumbnailLink : (t, string) GapiLens.t
  val trashed : (t, bool) GapiLens.t
  val version : (t, int64) GapiLens.t
  val videoMediaMetadata : (t, VideoMediaMetadata.t) GapiLens.t
  val viewedByMe : (t, bool) GapiLens.t
  val viewedByMeTime : (t, GapiDate.t) GapiLens.t
  val viewersCanCopyContent : (t, bool) GapiLens.t
  val webContentLink : (t, string) GapiLens.t
  val webViewLink : (t, string) GapiLens.t
  val writersCanShare : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Change :
sig
  type t = {
    file : File.t;
    (** The updated state of the file. Present if the file has not been removed. *)
    fileId : string;
    (** The ID of the file which has changed. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#change". *)
    removed : bool;
    (** Whether the file has been removed from the view of the changes list, for example by deletion or lost access. *)
    time : GapiDate.t;
    (** The time of this change (RFC 3339 date-time). *)
    
  }
  
  val file : (t, File.t) GapiLens.t
  val fileId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val removed : (t, bool) GapiLens.t
  val time : (t, GapiDate.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ReplyList :
sig
  type t = {
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#replyList". *)
    nextPageToken : string;
    (** The page token for the next page of replies. This will be absent if the end of the replies list has been reached. *)
    replies : Reply.t list;
    (** The page of replies. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val replies : (t, Reply.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PermissionList :
sig
  type t = {
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#permissionList". *)
    permissions : Permission.t list;
    (** The full list of permissions. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val permissions : (t, Permission.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChangeList :
sig
  type t = {
    changes : Change.t list;
    (** The page of changes. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#changeList". *)
    newStartPageToken : string;
    (** The starting page token for future changes. This will be present only if the end of the current changes list has been reached. *)
    nextPageToken : string;
    (** The page token for the next page of changes. This will be absent if the end of the current changes list has been reached. *)
    
  }
  
  val changes : (t, Change.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val newStartPageToken : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module StartPageToken :
sig
  type t = {
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#startPageToken". *)
    startPageToken : string;
    (** The starting page token for listing changes. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val startPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RevisionList :
sig
  type t = {
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#revisionList". *)
    revisions : Revision.t list;
    (** The full list of revisions. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val revisions : (t, Revision.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Channel :
sig
  type t = {
    address : string;
    (** The address where notifications are delivered for this channel. *)
    expiration : int64;
    (** Date and time of notification channel expiration, expressed as a Unix timestamp, in milliseconds. Optional. *)
    id : string;
    (** A UUID or similar unique string that identifies this channel. *)
    kind : string;
    (** Identifies this as a notification channel used to watch for changes to a resource. Value: the fixed string "api#channel". *)
    params : (string * string) list;
    (** Additional parameters controlling delivery channel behavior. Optional. *)
    payload : bool;
    (** A Boolean value to indicate whether payload is wanted. Optional. *)
    resourceId : string;
    (** An opaque ID that identifies the resource being watched on this channel. Stable across different API versions. *)
    resourceUri : string;
    (** A version-specific identifier for the watched resource. *)
    token : string;
    (** An arbitrary string delivered to the target address with each notification delivered over this channel. Optional. *)
    _type : string;
    (** The type of delivery mechanism used for this channel. *)
    
  }
  
  val address : (t, string) GapiLens.t
  val expiration : (t, int64) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val params : (t, (string * string) list) GapiLens.t
  val payload : (t, bool) GapiLens.t
  val resourceId : (t, string) GapiLens.t
  val resourceUri : (t, string) GapiLens.t
  val token : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FileList :
sig
  type t = {
    files : File.t list;
    (** The page of files. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#fileList". *)
    nextPageToken : string;
    (** The page token for the next page of files. This will be absent if the end of the files list has been reached. *)
    
  }
  
  val files : (t, File.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

