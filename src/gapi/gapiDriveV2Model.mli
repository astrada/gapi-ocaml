(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Drive API (v2).
  
  For more information about this data model, see the
  {{:https://developers.google.com/drive/}API Documentation}.
  *)

module Permission :
sig
  type t = {
    additionalRoles : string list;
    (** Additional roles for this user. Only commenter is currently allowed. *)
    authKey : string;
    (** The authkey parameter required for this permission. *)
    etag : string;
    (** The ETag of the permission. *)
    id : string;
    (** The ID of the permission. *)
    kind : string;
    (** This is always drive#permission. *)
    name : string;
    (** The name for this permission. *)
    photoLink : string;
    (** A link to the profile photo, if available. *)
    role : string;
    (** The primary role for this user. Allowed values are:  
- owner 
- reader 
- writer *)
    selfLink : string;
    (** A link back to this permission. *)
    _type : string;
    (** The account type. Allowed values are:  
- user 
- group 
- domain 
- anyone *)
    value : string;
    (** The email address or domain name for the entity. This is not populated in responses. *)
    withLink : bool;
    (** Whether the link is required for this permission. *)
    
  }
  
  val additionalRoles : (t, string list) GapiLens.t
  val authKey : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val photoLink : (t, string) GapiLens.t
  val role : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val value : (t, string) GapiLens.t
  val withLink : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ParentReference :
sig
  type t = {
    id : string;
    (** The ID of the parent. *)
    isRoot : bool;
    (** Whether or not the parent is the root folder. *)
    kind : string;
    (** This is always drive#parentReference. *)
    parentLink : string;
    (** A link to the parent. *)
    selfLink : string;
    (** A link back to this reference. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val isRoot : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val parentLink : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module User :
sig
  module Picture :
  sig
    type t = {
      url : string;
      (** A URL that points to a profile picture of this user. *)
      
    }
    
    val url : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    displayName : string;
    (** A plain text displayable name for this user. *)
    isAuthenticatedUser : bool;
    (** Whether this user is the same as the authenticated user for whom the request was made. *)
    kind : string;
    (** This is always drive#user. *)
    permissionId : string;
    (** The user's ID as visible in the permissions collection. *)
    picture : Picture.t;
    (** The user's profile picture. *)
    
  }
  
  val displayName : (t, string) GapiLens.t
  val isAuthenticatedUser : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val permissionId : (t, string) GapiLens.t
  val picture : (t, Picture.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module File :
sig
  module Thumbnail :
  sig
    type t = {
      image : string;
      (** The URL-safe Base64 encoded bytes of the thumbnail image. *)
      mimeType : string;
      (** The MIME type of the thumbnail. *)
      
    }
    
    val image : (t, string) GapiLens.t
    val mimeType : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Labels :
  sig
    type t = {
      hidden : bool;
      (** Whether this file is hidden from the user. *)
      restricted : bool;
      (** Whether viewers are prevented from downloading this file. *)
      starred : bool;
      (** Whether this file is starred by the user. *)
      trashed : bool;
      (** Whether this file has been trashed. *)
      viewed : bool;
      (** Whether this file has been viewed by this user. *)
      
    }
    
    val hidden : (t, bool) GapiLens.t
    val restricted : (t, bool) GapiLens.t
    val starred : (t, bool) GapiLens.t
    val trashed : (t, bool) GapiLens.t
    val viewed : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module IndexableText :
  sig
    type t = {
      text : string;
      (** The text to be indexed for this file. *)
      
    }
    
    val text : (t, string) GapiLens.t
    
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
      date : string;
      (** The date and time the photo was taken (EXIF format timestamp). *)
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
      whiteBalance : string;
      (** The white balance mode used to create the photo. *)
      width : int;
      (** The width of the image in pixels. *)
      
    }
    
    val aperture : (t, float) GapiLens.t
    val cameraMake : (t, string) GapiLens.t
    val cameraModel : (t, string) GapiLens.t
    val colorSpace : (t, string) GapiLens.t
    val date : (t, string) GapiLens.t
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
    val whiteBalance : (t, string) GapiLens.t
    val width : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    alternateLink : string;
    (** A link for opening the file in using a relevant Google editor or viewer. *)
    createdDate : GapiDate.t;
    (** Create time for this file (formatted ISO8601 timestamp). *)
    description : string;
    (** A short description of the file. *)
    downloadUrl : string;
    (** Short lived download URL for the file. This is only populated for files with content stored in Drive. *)
    editable : bool;
    (** Whether the file can be edited by the current user. *)
    embedLink : string;
    (** A link for embedding the file. *)
    etag : string;
    (** ETag of the file. *)
    explicitlyTrashed : bool;
    (** Whether this file has been explicitly trashed, as opposed to recursively trashed. This will only be populated if the file is trashed. *)
    exportLinks : (string * string) list;
    (** Links for exporting Google Docs to specific formats. *)
    fileExtension : string;
    (** The file extension used when downloading this file. This field is read only. To set the extension, include it in the title when creating the file. This is only populated for files with content stored in Drive. *)
    fileSize : int64;
    (** The size of the file in bytes. This is only populated for files with content stored in Drive. *)
    iconLink : string;
    (** A link to the file's icon. *)
    id : string;
    (** The ID of the file. *)
    imageMediaMetadata : ImageMediaMetadata.t;
    (** Metadata about image media. This will only be present for image types, and its contents will depend on what can be parsed from the image content. *)
    indexableText : IndexableText.t;
    (** Indexable text attributes for the file (can only be written) *)
    kind : string;
    (** The type of file. This is always drive#file. *)
    labels : Labels.t;
    (** A group of labels for the file. *)
    lastModifyingUser : User.t;
    (** The last user to modify this file. *)
    lastModifyingUserName : string;
    (** Name of the last user to modify this file. *)
    lastViewedByMeDate : GapiDate.t;
    (** Last time this file was viewed by the user (formatted RFC 3339 timestamp). *)
    md5Checksum : string;
    (** An MD5 checksum for the content of this file. This is populated only for files with content stored in Drive. *)
    mimeType : string;
    (** The MIME type of the file. This is only mutable on update when uploading new content. This field can be left blank, and the mimetype will be determined from the uploaded content's MIME type. *)
    modifiedByMeDate : GapiDate.t;
    (** Last time this file was modified by the user (formatted RFC 3339 timestamp). Note that setting modifiedDate will also update the modifiedByMe date for the user which set the date. *)
    modifiedDate : GapiDate.t;
    (** Last time this file was modified by anyone (formatted RFC 3339 timestamp). This is only mutable on update when the setModifiedDate parameter is set. *)
    originalFilename : string;
    (** The original filename if the file was uploaded manually, or the original title if the file was inserted through the API. Note that renames of the title will not change the original filename. This will only be populated on files with content stored in Drive. *)
    ownerNames : string list;
    (** Name(s) of the owner(s) of this file. *)
    owners : User.t list;
    (** The owner(s) of this file. *)
    parents : ParentReference.t list;
    (** Collection of parent folders which contain this file.
Setting this field will put the file in all of the provided folders. On insert, if no folders are provided, the file will be placed in the default root folder. *)
    quotaBytesUsed : int64;
    (** The number of quota bytes used by this file. *)
    selfLink : string;
    (** A link back to this file. *)
    shared : bool;
    (** Whether the file has been shared. *)
    sharedWithMeDate : GapiDate.t;
    (** Time at which this file was shared with the user (formatted RFC 3339 timestamp). *)
    thumbnail : Thumbnail.t;
    (** Thumbnail for the file. Only accepted on upload and for files that are not already thumbnailed by Google. *)
    thumbnailLink : string;
    (** A link to the file's thumbnail. *)
    title : string;
    (** The title of this file. *)
    userPermission : Permission.t;
    (** The permissions for the authenticated user on this file. *)
    webContentLink : string;
    (** A link for downloading the content of the file in a browser using cookie based authentication. In cases where the content is shared publicly, the content can be downloaded without any credentials. *)
    webViewLink : string;
    (** A link only available on public folders for viewing their static web assets (HTML, CSS, JS, etc) via Google Drive's Website Hosting. *)
    writersCanShare : bool;
    (** Whether writers can share the document with other users. *)
    
  }
  
  val alternateLink : (t, string) GapiLens.t
  val createdDate : (t, GapiDate.t) GapiLens.t
  val description : (t, string) GapiLens.t
  val downloadUrl : (t, string) GapiLens.t
  val editable : (t, bool) GapiLens.t
  val embedLink : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val explicitlyTrashed : (t, bool) GapiLens.t
  val exportLinks : (t, (string * string) list) GapiLens.t
  val fileExtension : (t, string) GapiLens.t
  val fileSize : (t, int64) GapiLens.t
  val iconLink : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val imageMediaMetadata : (t, ImageMediaMetadata.t) GapiLens.t
  val indexableText : (t, IndexableText.t) GapiLens.t
  val kind : (t, string) GapiLens.t
  val labels : (t, Labels.t) GapiLens.t
  val lastModifyingUser : (t, User.t) GapiLens.t
  val lastModifyingUserName : (t, string) GapiLens.t
  val lastViewedByMeDate : (t, GapiDate.t) GapiLens.t
  val md5Checksum : (t, string) GapiLens.t
  val mimeType : (t, string) GapiLens.t
  val modifiedByMeDate : (t, GapiDate.t) GapiLens.t
  val modifiedDate : (t, GapiDate.t) GapiLens.t
  val originalFilename : (t, string) GapiLens.t
  val ownerNames : (t, string list) GapiLens.t
  val owners : (t, User.t list) GapiLens.t
  val parents : (t, ParentReference.t list) GapiLens.t
  val quotaBytesUsed : (t, int64) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val shared : (t, bool) GapiLens.t
  val sharedWithMeDate : (t, GapiDate.t) GapiLens.t
  val thumbnail : (t, Thumbnail.t) GapiLens.t
  val thumbnailLink : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val userPermission : (t, Permission.t) GapiLens.t
  val webContentLink : (t, string) GapiLens.t
  val webViewLink : (t, string) GapiLens.t
  val writersCanShare : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChildReference :
sig
  type t = {
    childLink : string;
    (** A link to the child. *)
    id : string;
    (** The ID of the child. *)
    kind : string;
    (** This is always drive#childReference. *)
    selfLink : string;
    (** A link back to this reference. *)
    
  }
  
  val childLink : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChildList :
sig
  type t = {
    etag : string;
    (** The ETag of the list. *)
    items : ChildReference.t list;
    (** The actual list of children. *)
    kind : string;
    (** This is always drive#childList. *)
    nextLink : string;
    (** A link to the next page of children. *)
    nextPageToken : string;
    (** The page token for the next page of children. *)
    selfLink : string;
    (** A link back to this list. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, ChildReference.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module About :
sig
  module MaxUploadSizes :
  sig
    type t = {
      size : int64;
      (** The max upload size for this type. *)
      _type : string;
      (** The file type. *)
      
    }
    
    val size : (t, int64) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ImportFormats :
  sig
    type t = {
      source : string;
      (** The imported file's content type to convert from. *)
      targets : string list;
      (** The possible content types to convert to. *)
      
    }
    
    val source : (t, string) GapiLens.t
    val targets : (t, string list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Features :
  sig
    type t = {
      featureName : string;
      (** The name of the feature. *)
      featureRate : float;
      (** The request limit rate for this feature, in queries per second. *)
      
    }
    
    val featureName : (t, string) GapiLens.t
    val featureRate : (t, float) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ExportFormats :
  sig
    type t = {
      source : string;
      (** The content type to convert from. *)
      targets : string list;
      (** The possible content types to convert to. *)
      
    }
    
    val source : (t, string) GapiLens.t
    val targets : (t, string list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module AdditionalRoleInfo :
  sig
    module RoleSets :
    sig
      type t = {
        additionalRoles : string list;
        (** The supported additional roles with the primary role. *)
        primaryRole : string;
        (** A primary permission role. *)
        
      }
      
      val additionalRoles : (t, string list) GapiLens.t
      val primaryRole : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      roleSets : RoleSets.t list;
      (** The supported additional roles per primary role. *)
      _type : string;
      (** The content type that this additional role info applies to. *)
      
    }
    
    val roleSets : (t, RoleSets.t list) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    additionalRoleInfo : AdditionalRoleInfo.t list;
    (** Information about supported additional roles per file type. The most specific type takes precedence. *)
    domainSharingPolicy : string;
    (** The domain sharing policy for the current user. *)
    etag : string;
    (** The ETag of the item. *)
    exportFormats : ExportFormats.t list;
    (** The allowable export formats. *)
    features : Features.t list;
    (** List of additional features enabled on this account. *)
    importFormats : ImportFormats.t list;
    (** The allowable import formats. *)
    isCurrentAppInstalled : bool;
    (** A boolean indicating whether the authenticated app is installed by the authenticated user. *)
    kind : string;
    (** This is always drive#about. *)
    largestChangeId : int64;
    (** The largest change id. *)
    maxUploadSizes : MaxUploadSizes.t list;
    (** List of max upload sizes for each file type. The most specific type takes precedence. *)
    name : string;
    (** The name of the current user. *)
    permissionId : string;
    (** The current user's ID as visible in the permissions collection. *)
    quotaBytesTotal : int64;
    (** The total number of quota bytes. *)
    quotaBytesUsed : int64;
    (** The number of quota bytes used by Google Drive. *)
    quotaBytesUsedAggregate : int64;
    (** The number of quota bytes used by all Google apps (Drive, Picasa, etc.). *)
    quotaBytesUsedInTrash : int64;
    (** The number of quota bytes used by trashed items. *)
    remainingChangeIds : int64;
    (** The number of remaining change ids. *)
    rootFolderId : string;
    (** The id of the root folder. *)
    selfLink : string;
    (** A link back to this item. *)
    user : User.t;
    (** The authenticated user. *)
    
  }
  
  val additionalRoleInfo : (t, AdditionalRoleInfo.t list) GapiLens.t
  val domainSharingPolicy : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val exportFormats : (t, ExportFormats.t list) GapiLens.t
  val features : (t, Features.t list) GapiLens.t
  val importFormats : (t, ImportFormats.t list) GapiLens.t
  val isCurrentAppInstalled : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val largestChangeId : (t, int64) GapiLens.t
  val maxUploadSizes : (t, MaxUploadSizes.t list) GapiLens.t
  val name : (t, string) GapiLens.t
  val permissionId : (t, string) GapiLens.t
  val quotaBytesTotal : (t, int64) GapiLens.t
  val quotaBytesUsed : (t, int64) GapiLens.t
  val quotaBytesUsedAggregate : (t, int64) GapiLens.t
  val quotaBytesUsedInTrash : (t, int64) GapiLens.t
  val remainingChangeIds : (t, int64) GapiLens.t
  val rootFolderId : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val user : (t, User.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CommentReply :
sig
  type t = {
    author : User.t;
    (** The user who wrote this reply. *)
    content : string;
    (** The plain text content used to create this reply. This is not HTML safe and should only be used as a starting point to make edits to a reply's content. This field is required on inserts if no verb is specified (resolve/reopen). *)
    createdDate : GapiDate.t;
    (** The date when this reply was first created. *)
    deleted : bool;
    (** Whether this reply has been deleted. If a reply has been deleted the content will be cleared and this will only represent a reply that once existed. *)
    htmlContent : string;
    (** HTML formatted content for this reply. *)
    kind : string;
    (** This is always drive#commentReply. *)
    modifiedDate : GapiDate.t;
    (** The date when this reply was last modified. *)
    replyId : string;
    (** The ID of the reply. *)
    verb : string;
    (** The action this reply performed to the parent comment. When creating a new reply this is the action to be perform to the parent comment. Possible values are:  
- "resolve" - To resolve a comment. 
- "reopen" - To reopen (un-resolve) a comment. *)
    
  }
  
  val author : (t, User.t) GapiLens.t
  val content : (t, string) GapiLens.t
  val createdDate : (t, GapiDate.t) GapiLens.t
  val deleted : (t, bool) GapiLens.t
  val htmlContent : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val modifiedDate : (t, GapiDate.t) GapiLens.t
  val replyId : (t, string) GapiLens.t
  val verb : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Comment :
sig
  module Context :
  sig
    type t = {
      _type : string;
      (** The MIME type of the context snippet. *)
      value : string;
      (** Data representation of the segment of the file being commented on. In the case of a text file for example, this would be the actual text that the comment is about. *)
      
    }
    
    val _type : (t, string) GapiLens.t
    val value : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    anchor : string;
    (** A region of the document represented as a JSON string. See anchor documentation for details on how to define and interpret anchor properties. *)
    author : User.t;
    (** The user who wrote this comment. *)
    commentId : string;
    (** The ID of the comment. *)
    content : string;
    (** The plain text content used to create this comment. This is not HTML safe and should only be used as a starting point to make edits to a comment's content. *)
    context : Context.t;
    (** The context of the file which is being commented on. *)
    createdDate : GapiDate.t;
    (** The date when this comment was first created. *)
    deleted : bool;
    (** Whether this comment has been deleted. If a comment has been deleted the content will be cleared and this will only represent a comment that once existed. *)
    fileId : string;
    (** The file which this comment is addressing. *)
    fileTitle : string;
    (** The title of the file which this comment is addressing. *)
    htmlContent : string;
    (** HTML formatted content for this comment. *)
    kind : string;
    (** This is always drive#comment. *)
    modifiedDate : GapiDate.t;
    (** The date when this comment or any of its replies were last modified. *)
    replies : CommentReply.t list;
    (** Replies to this post. *)
    selfLink : string;
    (** A link back to this comment. *)
    status : string;
    (** The status of this comment. Status can be changed by posting a reply to a comment with the desired status.  
- "open" - The comment is still open. 
- "resolved" - The comment has been resolved by one of its replies. *)
    
  }
  
  val anchor : (t, string) GapiLens.t
  val author : (t, User.t) GapiLens.t
  val commentId : (t, string) GapiLens.t
  val content : (t, string) GapiLens.t
  val context : (t, Context.t) GapiLens.t
  val createdDate : (t, GapiDate.t) GapiLens.t
  val deleted : (t, bool) GapiLens.t
  val fileId : (t, string) GapiLens.t
  val fileTitle : (t, string) GapiLens.t
  val htmlContent : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val modifiedDate : (t, GapiDate.t) GapiLens.t
  val replies : (t, CommentReply.t list) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val status : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CommentList :
sig
  type t = {
    items : Comment.t list;
    (** List of comments. *)
    kind : string;
    (** This is always drive#commentList. *)
    nextPageToken : string;
    (** The token to use to request the next page of results. *)
    
  }
  
  val items : (t, Comment.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Revision :
sig
  type t = {
    downloadUrl : string;
    (** Short term download URL for the file. This will only be populated on files with content stored in Drive. *)
    etag : string;
    (** The ETag of the revision. *)
    exportLinks : (string * string) list;
    (** Links for exporting Google Docs to specific formats. *)
    fileSize : int64;
    (** The size of the revision in bytes. This will only be populated on files with content stored in Drive. *)
    id : string;
    (** The ID of the revision. *)
    kind : string;
    (** This is always drive#revision. *)
    lastModifyingUser : User.t;
    (** The last user to modify this revision. *)
    lastModifyingUserName : string;
    (** Name of the last user to modify this revision. *)
    md5Checksum : string;
    (** An MD5 checksum for the content of this revision. This will only be populated on files with content stored in Drive. *)
    mimeType : string;
    (** The MIME type of the revision. *)
    modifiedDate : GapiDate.t;
    (** Last time this revision was modified (formatted RFC 3339 timestamp). *)
    originalFilename : string;
    (** The original filename when this revision was created. This will only be populated on files with content stored in Drive. *)
    pinned : bool;
    (** Whether this revision is pinned to prevent automatic purging. This will only be populated and can only be modified on files with content stored in Drive which are not Google Docs. Revisions can also be pinned when they are created through the drive.files.insert/update/copy by using the pinned query parameter. *)
    publishAuto : bool;
    (** Whether subsequent revisions will be automatically republished. This is only populated and can only be modified for Google Docs. *)
    published : bool;
    (** Whether this revision is published. This is only populated and can only be modified for Google Docs. *)
    publishedLink : string;
    (** A link to the published revision. *)
    publishedOutsideDomain : bool;
    (** Whether this revision is published outside the domain. This is only populated and can only be modified for Google Docs. *)
    selfLink : string;
    (** A link back to this revision. *)
    
  }
  
  val downloadUrl : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val exportLinks : (t, (string * string) list) GapiLens.t
  val fileSize : (t, int64) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val lastModifyingUser : (t, User.t) GapiLens.t
  val lastModifyingUserName : (t, string) GapiLens.t
  val md5Checksum : (t, string) GapiLens.t
  val mimeType : (t, string) GapiLens.t
  val modifiedDate : (t, GapiDate.t) GapiLens.t
  val originalFilename : (t, string) GapiLens.t
  val pinned : (t, bool) GapiLens.t
  val publishAuto : (t, bool) GapiLens.t
  val published : (t, bool) GapiLens.t
  val publishedLink : (t, string) GapiLens.t
  val publishedOutsideDomain : (t, bool) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RevisionList :
sig
  type t = {
    etag : string;
    (** The ETag of the list. *)
    items : Revision.t list;
    (** The actual list of revisions. *)
    kind : string;
    (** This is always drive#revisionList. *)
    selfLink : string;
    (** A link back to this list. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, Revision.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module App :
sig
  module Icons :
  sig
    type t = {
      category : string;
      (** Category of the icon. Allowed values are:  
- application - icon for the application 
- document - icon for a file associated with the app 
- documentShared - icon for a shared file associated with the app *)
      iconUrl : string;
      (** URL for the icon. *)
      size : int;
      (** Size of the icon. Represented as the maximum of the width and height. *)
      
    }
    
    val category : (t, string) GapiLens.t
    val iconUrl : (t, string) GapiLens.t
    val size : (t, int) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    authorized : bool;
    (** Whether the app is authorized to access data on the user's Drive. *)
    icons : Icons.t list;
    (** The various icons for the app. *)
    id : string;
    (** The ID of the app. *)
    installed : bool;
    (** Whether the app is installed. *)
    kind : string;
    (** This is always drive#app. *)
    name : string;
    (** The name of the app. *)
    objectType : string;
    (** The type of object this app creates (e.g. Chart). If empty, the app name should be used instead. *)
    primaryFileExtensions : string list;
    (** The list of primary file extensions. *)
    primaryMimeTypes : string list;
    (** The list of primary mime types. *)
    productUrl : string;
    (** The product URL. *)
    secondaryFileExtensions : string list;
    (** The list of secondary file extensions. *)
    secondaryMimeTypes : string list;
    (** The list of secondary mime types. *)
    supportsCreate : bool;
    (** Whether this app supports creating new objects. *)
    supportsImport : bool;
    (** Whether this app supports importing Google Docs. *)
    useByDefault : bool;
    (** Whether the app is selected as the default handler for the types it supports. *)
    
  }
  
  val authorized : (t, bool) GapiLens.t
  val icons : (t, Icons.t list) GapiLens.t
  val id : (t, string) GapiLens.t
  val installed : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val objectType : (t, string) GapiLens.t
  val primaryFileExtensions : (t, string list) GapiLens.t
  val primaryMimeTypes : (t, string list) GapiLens.t
  val productUrl : (t, string) GapiLens.t
  val secondaryFileExtensions : (t, string list) GapiLens.t
  val secondaryMimeTypes : (t, string list) GapiLens.t
  val supportsCreate : (t, bool) GapiLens.t
  val supportsImport : (t, bool) GapiLens.t
  val useByDefault : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Change :
sig
  type t = {
    deleted : bool;
    (** Whether the file has been deleted. *)
    file : File.t;
    (** The updated state of the file. Present if the file has not been deleted. *)
    fileId : string;
    (** The ID of the file associated with this change. *)
    id : int64;
    (** The ID of the change. *)
    kind : string;
    (** This is always drive#change. *)
    selfLink : string;
    (** A link back to this change. *)
    
  }
  
  val deleted : (t, bool) GapiLens.t
  val file : (t, File.t) GapiLens.t
  val fileId : (t, string) GapiLens.t
  val id : (t, int64) GapiLens.t
  val kind : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChangeList :
sig
  type t = {
    etag : string;
    (** The ETag of the list. *)
    items : Change.t list;
    (** The actual list of changes. *)
    kind : string;
    (** This is always drive#changeList. *)
    largestChangeId : int64;
    (** The current largest change ID. *)
    nextLink : string;
    (** A link to the next page of changes. *)
    nextPageToken : string;
    (** The page token for the next page of changes. *)
    selfLink : string;
    (** A link back to this list. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, Change.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val largestChangeId : (t, int64) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FileList :
sig
  type t = {
    etag : string;
    (** The ETag of the list. *)
    items : File.t list;
    (** The actual list of files. *)
    kind : string;
    (** This is always drive#fileList. *)
    nextLink : string;
    (** A link to the next page of files. *)
    nextPageToken : string;
    (** The page token for the next page of files. *)
    selfLink : string;
    (** A link back to this list. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, File.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextLink : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PermissionList :
sig
  type t = {
    etag : string;
    (** The ETag of the list. *)
    items : Permission.t list;
    (** The actual list of permissions. *)
    kind : string;
    (** This is always drive#permissionList. *)
    selfLink : string;
    (** A link back to this list. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, Permission.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AppList :
sig
  type t = {
    etag : string;
    (** The ETag of the list. *)
    items : App.t list;
    (** The actual list of apps. *)
    kind : string;
    (** This is always drive#appList. *)
    selfLink : string;
    (** A link back to this list. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, App.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CommentReplyList :
sig
  type t = {
    items : CommentReply.t list;
    (** List of reply. *)
    kind : string;
    (** This is always drive#commentReplyList. *)
    nextPageToken : string;
    (** The token to use to request the next page of results. *)
    
  }
  
  val items : (t, CommentReply.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ParentList :
sig
  type t = {
    etag : string;
    (** The ETag of the list. *)
    items : ParentReference.t list;
    (** The actual list of parents. *)
    kind : string;
    (** This is always drive#parentList. *)
    selfLink : string;
    (** A link back to this list. *)
    
  }
  
  val etag : (t, string) GapiLens.t
  val items : (t, ParentReference.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

