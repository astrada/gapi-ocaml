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

module File :
sig
  module LabelsData :
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
  
  module IndexableTextData :
  sig
    type t = {
      text : string;
      (** The text to be indexed for this file *)
      
    }
    
    val text : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    alternateLink : string;
    (** A link for opening the file in a browser. *)
    createdDate : GapiDate.t;
    (** Create time for this file (formatted ISO8601 timestamp). *)
    description : string;
    (** A short description of the file. *)
    downloadUrl : string;
    (** Short term download URL for the file. This will only be populated on files with content stored in Drive. *)
    editable : bool;
    (** Whether the file can be edited by the current user. *)
    embedLink : string;
    (** A link for embedding the file. *)
    etag : string;
    (** ETag of the file. *)
    exportLinks : (string * string) list;
    (** Links for exporting Google Docs to specific formats. *)
    fileExtension : string;
    (** The file extension used when downloading this file. This field is read only. To set the extension, include it on title when creating the file. This will only be populated on files with content stored in Drive. *)
    fileSize : string;
    (** The size of the file in bytes. This will only be populated on files with content stored in Drive. *)
    id : string;
    (** The id of the file. *)
    indexableText : IndexableTextData.t;
    (** Indexable text attributes for the file (can only be written) *)
    kind : string;
    (** The type of file. This is always drive#file. *)
    labels : LabelsData.t;
    (** A group of labels for the file. *)
    lastModifyingUserName : string;
    (** Name of the last user to modify this file. This will only be populated if a user has edited this file. *)
    lastViewedByMeDate : GapiDate.t;
    (** Last time this file was viewed by the user (formatted RFC 3339 timestamp). *)
    md5Checksum : string;
    (** An MD5 checksum for the content of this file. This will only be populated on files with content stored in Drive. *)
    mimeType : string;
    (** The MIME type of the file. *)
    modifiedByMeDate : GapiDate.t;
    (** Last time this file was modified by the user (formatted RFC 3339 timestamp). *)
    modifiedDate : GapiDate.t;
    (** Last time this file was modified by anyone (formatted RFC 3339 timestamp). *)
    originalFilename : string;
    (** The filename when uploading this file. This will only be populated on files with content stored in Drive. *)
    ownerNames : string list;
    (** Name(s) of the owner(s) of this file. *)
    parents : ParentReference.t list;
    (** Collection of parent folders which contain this file.
On insert, setting this field will put the file in all of the provided folders. If no folders are provided, the file will be placed in the default root folder. On update, this field is ignored. *)
    permissionsLink : string;
    (** A link to the permissions collection. *)
    quotaBytesUsed : string;
    (** The number of quota bytes used by this file. *)
    selfLink : string;
    (** A link back to this file. *)
    sharedWithMeDate : GapiDate.t;
    (** Time at which this file was shared with the user (formatted RFC 3339 timestamp). *)
    thumbnailLink : string;
    (** A link to the file's thumbnail. *)
    title : string;
    (** The title of this file. *)
    userPermission : Permission.t;
    (** The permissions for the authenticated user on this file. *)
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
  val exportLinks : (t, (string * string) list) GapiLens.t
  val fileExtension : (t, string) GapiLens.t
  val fileSize : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val indexableText : (t, IndexableTextData.t) GapiLens.t
  val kind : (t, string) GapiLens.t
  val labels : (t, LabelsData.t) GapiLens.t
  val lastModifyingUserName : (t, string) GapiLens.t
  val lastViewedByMeDate : (t, GapiDate.t) GapiLens.t
  val md5Checksum : (t, string) GapiLens.t
  val mimeType : (t, string) GapiLens.t
  val modifiedByMeDate : (t, GapiDate.t) GapiLens.t
  val modifiedDate : (t, GapiDate.t) GapiLens.t
  val originalFilename : (t, string) GapiLens.t
  val ownerNames : (t, string list) GapiLens.t
  val parents : (t, ParentReference.t list) GapiLens.t
  val permissionsLink : (t, string) GapiLens.t
  val quotaBytesUsed : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val sharedWithMeDate : (t, GapiDate.t) GapiLens.t
  val thumbnailLink : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val userPermission : (t, Permission.t) GapiLens.t
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
  module MaxUploadSizesData :
  sig
    type t = {
      size : string;
      (** The max upload size for this type. *)
      _type : string;
      (** The file type. *)
      
    }
    
    val size : (t, string) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ImportFormatsData :
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
  
  module FeaturesData :
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
  
  module ExportFormatsData :
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
  
  module AdditionalRoleInfoData :
  sig
    module RoleSetsData :
    sig
      type t = {
        additionalRoles : string list;
        (** The list of additional roles for this role set. *)
        primaryRole : string;
        (** The primary role for this role set. *)
        
      }
      
      val additionalRoles : (t, string list) GapiLens.t
      val primaryRole : (t, string) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      roleSets : RoleSetsData.t list;
      (** The role sets for this role info item. *)
      _type : string;
      (** The content type for this ACL role info item. *)
      
    }
    
    val roleSets : (t, RoleSetsData.t list) GapiLens.t
    val _type : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    additionalRoleInfo : AdditionalRoleInfoData.t list;
    (** Additional ACL role info. *)
    domainSharingPolicy : string;
    (** The domain sharing policy for the current user. *)
    etag : string;
    (** The ETag of the item. *)
    exportFormats : ExportFormatsData.t list;
    (** The allowable export formats. *)
    features : FeaturesData.t list;
    (** List of additional features enabled on this account. *)
    importFormats : ImportFormatsData.t list;
    (** The allowable import formats. *)
    isCurrentAppInstalled : bool;
    (** A boolean indicating whether the authenticated app is installed by the authenticated user. *)
    kind : string;
    (** This is always drive#about. *)
    largestChangeId : string;
    (** The largest change id. *)
    maxUploadSizes : MaxUploadSizesData.t list;
    (** List of max upload sizes for each file type. *)
    name : string;
    (** The name of the current user. *)
    permissionId : string;
    (** The current user's ID as visible in the permissions collection. *)
    quotaBytesTotal : string;
    (** The total number of quota bytes. *)
    quotaBytesUsed : string;
    (** The number of quota bytes used. *)
    quotaBytesUsedInTrash : string;
    (** The number of quota bytes used by trashed items. *)
    remainingChangeIds : string;
    (** The number of remaining change ids. *)
    rootFolderId : string;
    (** The id of the root folder. *)
    selfLink : string;
    (** A link back to this item. *)
    
  }
  
  val additionalRoleInfo : (t, AdditionalRoleInfoData.t list) GapiLens.t
  val domainSharingPolicy : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val exportFormats : (t, ExportFormatsData.t list) GapiLens.t
  val features : (t, FeaturesData.t list) GapiLens.t
  val importFormats : (t, ImportFormatsData.t list) GapiLens.t
  val isCurrentAppInstalled : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val largestChangeId : (t, string) GapiLens.t
  val maxUploadSizes : (t, MaxUploadSizesData.t list) GapiLens.t
  val name : (t, string) GapiLens.t
  val permissionId : (t, string) GapiLens.t
  val quotaBytesTotal : (t, string) GapiLens.t
  val quotaBytesUsed : (t, string) GapiLens.t
  val quotaBytesUsedInTrash : (t, string) GapiLens.t
  val remainingChangeIds : (t, string) GapiLens.t
  val rootFolderId : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  
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
    fileSize : string;
    (** The size of the revision in bytes. This will only be populated on files with content stored in Drive. *)
    id : string;
    (** The ID of the revision. *)
    kind : string;
    (** This is always drive#revision. *)
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
    (** Whether this revision is pinned to prevent automatic purging. This will only be populated on files with content stored in Drive. *)
    publishAuto : bool;
    (** Whether subsequent revisions will be automatically republished. *)
    published : bool;
    (** Whether this revision is published. This is only populated for Google Docs. *)
    publishedLink : string;
    (** A link to the published revision. *)
    publishedOutsideDomain : bool;
    (** Whether this revision is published outside the domain. *)
    selfLink : string;
    (** A link back to this revision. *)
    
  }
  
  val downloadUrl : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val exportLinks : (t, (string * string) list) GapiLens.t
  val fileSize : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
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
  module IconsData :
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
    icons : IconsData.t list;
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
    (** The name of the type of object this app creates. *)
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
    
  }
  
  val authorized : (t, bool) GapiLens.t
  val icons : (t, IconsData.t list) GapiLens.t
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
    id : string;
    (** The ID of the change. *)
    kind : string;
    (** This is always drive#change. *)
    selfLink : string;
    (** A link back to this change. *)
    
  }
  
  val deleted : (t, bool) GapiLens.t
  val file : (t, File.t) GapiLens.t
  val fileId : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
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
    largestChangeId : string;
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
  val largestChangeId : (t, string) GapiLens.t
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

