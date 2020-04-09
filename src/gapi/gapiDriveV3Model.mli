(* Warning! This file is generated. Modify at your own risk.
        *)

(** Data definition for Drive API (v3).
  
  For more information about this data model, see the
  {{:https://developers.google.com/drive/}API Documentation}.
  *)

module TeamDrive :
sig
  module Restrictions :
  sig
    type t = {
      adminManagedRestrictions : bool;
      (** Whether administrative privileges on this Team Drive are required to modify restrictions. *)
      copyRequiresWriterPermission : bool;
      (** Whether the options to copy, print, or download files inside this Team Drive, should be disabled for readers and commenters. When this restriction is set to true, it will override the similarly named field to true for any file inside this Team Drive. *)
      domainUsersOnly : bool;
      (** Whether access to this Team Drive and items inside this Team Drive is restricted to users of the domain to which this Team Drive belongs. This restriction may be overridden by other sharing policies controlled outside of this Team Drive. *)
      teamMembersOnly : bool;
      (** Whether access to items inside this Team Drive is restricted to members of this Team Drive. *)
      
    }
    
    val adminManagedRestrictions : (t, bool) GapiLens.t
    val copyRequiresWriterPermission : (t, bool) GapiLens.t
    val domainUsersOnly : (t, bool) GapiLens.t
    val teamMembersOnly : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Capabilities :
  sig
    type t = {
      canAddChildren : bool;
      (** Whether the current user can add children to folders in this Team Drive. *)
      canChangeCopyRequiresWriterPermissionRestriction : bool;
      (** Whether the current user can change the copyRequiresWriterPermission restriction of this Team Drive. *)
      canChangeDomainUsersOnlyRestriction : bool;
      (** Whether the current user can change the domainUsersOnly restriction of this Team Drive. *)
      canChangeTeamDriveBackground : bool;
      (** Whether the current user can change the background of this Team Drive. *)
      canChangeTeamMembersOnlyRestriction : bool;
      (** Whether the current user can change the teamMembersOnly restriction of this Team Drive. *)
      canComment : bool;
      (** Whether the current user can comment on files in this Team Drive. *)
      canCopy : bool;
      (** Whether the current user can copy files in this Team Drive. *)
      canDeleteChildren : bool;
      (** Whether the current user can delete children from folders in this Team Drive. *)
      canDeleteTeamDrive : bool;
      (** Whether the current user can delete this Team Drive. Attempting to delete the Team Drive may still fail if there are untrashed items inside the Team Drive. *)
      canDownload : bool;
      (** Whether the current user can download files in this Team Drive. *)
      canEdit : bool;
      (** Whether the current user can edit files in this Team Drive *)
      canListChildren : bool;
      (** Whether the current user can list the children of folders in this Team Drive. *)
      canManageMembers : bool;
      (** Whether the current user can add members to this Team Drive or remove them or change their role. *)
      canReadRevisions : bool;
      (** Whether the current user can read the revisions resource of files in this Team Drive. *)
      canRemoveChildren : bool;
      (** Deprecated - use canDeleteChildren or canTrashChildren instead. *)
      canRename : bool;
      (** Whether the current user can rename files or folders in this Team Drive. *)
      canRenameTeamDrive : bool;
      (** Whether the current user can rename this Team Drive. *)
      canShare : bool;
      (** Whether the current user can share files or folders in this Team Drive. *)
      canTrashChildren : bool;
      (** Whether the current user can trash children from folders in this Team Drive. *)
      
    }
    
    val canAddChildren : (t, bool) GapiLens.t
    val canChangeCopyRequiresWriterPermissionRestriction : (t, bool) GapiLens.t
    val canChangeDomainUsersOnlyRestriction : (t, bool) GapiLens.t
    val canChangeTeamDriveBackground : (t, bool) GapiLens.t
    val canChangeTeamMembersOnlyRestriction : (t, bool) GapiLens.t
    val canComment : (t, bool) GapiLens.t
    val canCopy : (t, bool) GapiLens.t
    val canDeleteChildren : (t, bool) GapiLens.t
    val canDeleteTeamDrive : (t, bool) GapiLens.t
    val canDownload : (t, bool) GapiLens.t
    val canEdit : (t, bool) GapiLens.t
    val canListChildren : (t, bool) GapiLens.t
    val canManageMembers : (t, bool) GapiLens.t
    val canReadRevisions : (t, bool) GapiLens.t
    val canRemoveChildren : (t, bool) GapiLens.t
    val canRename : (t, bool) GapiLens.t
    val canRenameTeamDrive : (t, bool) GapiLens.t
    val canShare : (t, bool) GapiLens.t
    val canTrashChildren : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module BackgroundImageFile :
  sig
    type t = {
      id : string;
      (** The ID of an image file in Drive to use for the background image. *)
      width : float;
      (** The width of the cropped image in the closed range of 0 to 1. This value represents the width of the cropped image divided by the width of the entire image. The height is computed by applying a width to height aspect ratio of 80 to 9. The resulting image must be at least 1280 pixels wide and 144 pixels high. *)
      xCoordinate : float;
      (** The X coordinate of the upper left corner of the cropping area in the background image. This is a value in the closed range of 0 to 1. This value represents the horizontal distance from the left side of the entire image to the left side of the cropping area divided by the width of the entire image. *)
      yCoordinate : float;
      (** The Y coordinate of the upper left corner of the cropping area in the background image. This is a value in the closed range of 0 to 1. This value represents the vertical distance from the top side of the entire image to the top side of the cropping area divided by the height of the entire image. *)
      
    }
    
    val id : (t, string) GapiLens.t
    val width : (t, float) GapiLens.t
    val xCoordinate : (t, float) GapiLens.t
    val yCoordinate : (t, float) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    backgroundImageFile : BackgroundImageFile.t;
    (** An image file and cropping parameters from which a background image for this Team Drive is set. This is a write only field; it can only be set on drive.teamdrives.update requests that don't set themeId. When specified, all fields of the backgroundImageFile must be set. *)
    backgroundImageLink : string;
    (** A short-lived link to this Team Drive's background image. *)
    capabilities : Capabilities.t;
    (** Capabilities the current user has on this Team Drive. *)
    colorRgb : string;
    (** The color of this Team Drive as an RGB hex string. It can only be set on a drive.teamdrives.update request that does not set themeId. *)
    createdTime : GapiDate.t;
    (** The time at which the Team Drive was created (RFC 3339 date-time). *)
    id : string;
    (** The ID of this Team Drive which is also the ID of the top level folder of this Team Drive. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#teamDrive". *)
    name : string;
    (** The name of this Team Drive. *)
    restrictions : Restrictions.t;
    (** A set of restrictions that apply to this Team Drive or items inside this Team Drive. *)
    themeId : string;
    (** The ID of the theme from which the background image and color will be set. The set of possible teamDriveThemes can be retrieved from a drive.about.get response. When not specified on a drive.teamdrives.create request, a random theme is chosen from which the background image and color are set. This is a write-only field; it can only be set on requests that don't set colorRgb or backgroundImageFile. *)
    
  }
  
  val backgroundImageFile : (t, BackgroundImageFile.t) GapiLens.t
  val backgroundImageLink : (t, string) GapiLens.t
  val capabilities : (t, Capabilities.t) GapiLens.t
  val colorRgb : (t, string) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val restrictions : (t, Restrictions.t) GapiLens.t
  val themeId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TeamDriveList :
sig
  type t = {
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#teamDriveList". *)
    nextPageToken : string;
    (** The page token for the next page of Team Drives. This will be absent if the end of the Team Drives list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. *)
    teamDrives : TeamDrive.t list;
    (** The list of Team Drives. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val teamDrives : (t, TeamDrive.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

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
  module TeamDriveThemes :
  sig
    type t = {
      backgroundImageLink : string;
      (** Deprecated - use driveThemes/backgroundImageLink instead. *)
      colorRgb : string;
      (** Deprecated - use driveThemes/colorRgb instead. *)
      id : string;
      (** Deprecated - use driveThemes/id instead. *)
      
    }
    
    val backgroundImageLink : (t, string) GapiLens.t
    val colorRgb : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
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
  
  module DriveThemes :
  sig
    type t = {
      backgroundImageLink : string;
      (** A link to this theme's background image. *)
      colorRgb : string;
      (** The color of this theme as an RGB hex string. *)
      id : string;
      (** The ID of the theme. *)
      
    }
    
    val backgroundImageLink : (t, string) GapiLens.t
    val colorRgb : (t, string) GapiLens.t
    val id : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    appInstalled : bool;
    (** Whether the user has installed the requesting app. *)
    canCreateDrives : bool;
    (** Whether the user can create shared drives. *)
    canCreateTeamDrives : bool;
    (** Deprecated - use canCreateDrives instead. *)
    driveThemes : DriveThemes.t list;
    (** A list of themes that are supported for shared drives. *)
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
    teamDriveThemes : TeamDriveThemes.t list;
    (** Deprecated - use driveThemes instead. *)
    user : User.t;
    (** The authenticated user. *)
    
  }
  
  val appInstalled : (t, bool) GapiLens.t
  val canCreateDrives : (t, bool) GapiLens.t
  val canCreateTeamDrives : (t, bool) GapiLens.t
  val driveThemes : (t, DriveThemes.t list) GapiLens.t
  val exportFormats : (t, (string * string list) list) GapiLens.t
  val folderColorPalette : (t, string list) GapiLens.t
  val importFormats : (t, (string * string list) list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val maxImportSizes : (t, (string * int64) list) GapiLens.t
  val maxUploadSize : (t, int64) GapiLens.t
  val storageQuota : (t, StorageQuota.t) GapiLens.t
  val teamDriveThemes : (t, TeamDriveThemes.t list) GapiLens.t
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
    exportLinks : (string * string) list;
    (** Links for exporting Google Docs to specific formats. *)
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
  
  val exportLinks : (t, (string * string) list) GapiLens.t
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
    (** The author of the reply. The author's email address and permission ID will not be populated. *)
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
    (** The author of the comment. The author's email address and permission ID will not be populated. *)
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
    (** The list of comments. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#commentList". *)
    nextPageToken : string;
    (** The page token for the next page of comments. This will be absent if the end of the comments list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. *)
    
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
  module TeamDrivePermissionDetails :
  sig
    type t = {
      inherited : bool;
      (** Deprecated - use permissionDetails/inherited instead. *)
      inheritedFrom : string;
      (** Deprecated - use permissionDetails/inheritedFrom instead. *)
      role : string;
      (** Deprecated - use permissionDetails/role instead. *)
      teamDrivePermissionType : string;
      (** Deprecated - use permissionDetails/permissionType instead. *)
      
    }
    
    val inherited : (t, bool) GapiLens.t
    val inheritedFrom : (t, string) GapiLens.t
    val role : (t, string) GapiLens.t
    val teamDrivePermissionType : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module PermissionDetails :
  sig
    type t = {
      inherited : bool;
      (** Whether this permission is inherited. This field is always populated. This is an output-only field. *)
      inheritedFrom : string;
      (** The ID of the item from which this permission is inherited. This is an output-only field. *)
      permissionType : string;
      (** The permission type for this user. While new values may be added in future, the following are currently possible:  
- file 
- member *)
      role : string;
      (** The primary role for this user. While new values may be added in the future, the following are currently possible:  
- organizer 
- fileOrganizer 
- writer 
- commenter 
- reader *)
      
    }
    
    val inherited : (t, bool) GapiLens.t
    val inheritedFrom : (t, string) GapiLens.t
    val permissionType : (t, string) GapiLens.t
    val role : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    allowFileDiscovery : bool;
    (** Whether the permission allows the file to be discovered through search. This is only applicable for permissions of type domain or anyone. *)
    deleted : bool;
    (** Whether the account associated with this permission has been deleted. This field only pertains to user and group permissions. *)
    displayName : string;
    (** The "pretty" name of the value of the permission. The following is a list of examples for each type of permission:  
- user - User's full name, as defined for their Google account, such as "Joe Smith." 
- group - Name of the Google Group, such as "The Company Administrators." 
- domain - String domain name, such as "thecompany.com." 
- anyone - No displayName is present. *)
    domain : string;
    (** The domain to which this permission refers. *)
    emailAddress : string;
    (** The email address of the user or group to which this permission refers. *)
    expirationTime : GapiDate.t;
    (** The time at which this permission will expire (RFC 3339 date-time). Expiration times have the following restrictions:  
- They can only be set on user and group permissions 
- The time must be in the future 
- The time cannot be more than a year in the future *)
    id : string;
    (** The ID of this permission. This is a unique identifier for the grantee, and is published in User resources as permissionId. IDs should be treated as opaque values. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#permission". *)
    permissionDetails : PermissionDetails.t list;
    (** Details of whether the permissions on this shared drive item are inherited or directly on this item. This is an output-only field which is present only for shared drive items. *)
    photoLink : string;
    (** A link to the user's profile photo, if available. *)
    role : string;
    (** The role granted by this permission. While new values may be supported in the future, the following are currently allowed:  
- owner 
- organizer 
- fileOrganizer 
- writer 
- commenter 
- reader *)
    teamDrivePermissionDetails : TeamDrivePermissionDetails.t list;
    (** Deprecated - use permissionDetails instead. *)
    _type : string;
    (** The type of the grantee. Valid values are:  
- user 
- group 
- domain 
- anyone  When creating a permission, if type is user or group, you must provide an emailAddress for the user or group. When type is domain, you must provide a domain. There isn't extra information required for a anyone type. *)
    
  }
  
  val allowFileDiscovery : (t, bool) GapiLens.t
  val deleted : (t, bool) GapiLens.t
  val displayName : (t, string) GapiLens.t
  val domain : (t, string) GapiLens.t
  val emailAddress : (t, string) GapiLens.t
  val expirationTime : (t, GapiDate.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val permissionDetails : (t, PermissionDetails.t list) GapiLens.t
  val photoLink : (t, string) GapiLens.t
  val role : (t, string) GapiLens.t
  val teamDrivePermissionDetails : (t, TeamDrivePermissionDetails.t list) GapiLens.t
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
  
  module ShortcutDetails :
  sig
    type t = {
      targetId : string;
      (** The ID of the file that this shortcut points to. *)
      targetMimeType : string;
      (** The MIME type of the file that this shortcut points to. The value of this field is a snapshot of the target's MIME type, captured when the shortcut is created. *)
      
    }
    
    val targetId : (t, string) GapiLens.t
    val targetMimeType : (t, string) GapiLens.t
    
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
      (** A thumbnail for the file. This will only be used if Google Drive cannot generate a standard thumbnail. *)
      
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
      canAddChildren : bool;
      (** Whether the current user can add children to this folder. This is always false when the item is not a folder. *)
      canAddMyDriveParent : bool;
      (** Whether the current user can add a parent for the item without removing an existing parent in the same request. Not populated for shared drive files. *)
      canChangeCopyRequiresWriterPermission : bool;
      (** Whether the current user can change the copyRequiresWriterPermission restriction of this file. *)
      canChangeViewersCanCopyContent : bool;
      (** Deprecated *)
      canComment : bool;
      (** Whether the current user can comment on this file. *)
      canCopy : bool;
      (** Whether the current user can copy this file. For an item in a shared drive, whether the current user can copy non-folder descendants of this item, or this item itself if it is not a folder. *)
      canDelete : bool;
      (** Whether the current user can delete this file. *)
      canDeleteChildren : bool;
      (** Whether the current user can delete children of this folder. This is false when the item is not a folder. Only populated for items in shared drives. *)
      canDownload : bool;
      (** Whether the current user can download this file. *)
      canEdit : bool;
      (** Whether the current user can edit this file. Other factors may limit the type of changes a user can make to a file. For example, see canChangeCopyRequiresWriterPermission or canModifyContent. *)
      canListChildren : bool;
      (** Whether the current user can list the children of this folder. This is always false when the item is not a folder. *)
      canModifyContent : bool;
      (** Whether the current user can modify the content of this file. *)
      canMoveChildrenOutOfDrive : bool;
      (** Whether the current user can move children of this folder outside of the shared drive. This is false when the item is not a folder. Only populated for items in shared drives. *)
      canMoveChildrenOutOfTeamDrive : bool;
      (** Deprecated - use canMoveChildrenOutOfDrive instead. *)
      canMoveChildrenWithinDrive : bool;
      (** Whether the current user can move children of this folder within the shared drive. This is false when the item is not a folder. Only populated for items in shared drives. *)
      canMoveChildrenWithinTeamDrive : bool;
      (** Deprecated - use canMoveChildrenWithinDrive instead. *)
      canMoveItemIntoTeamDrive : bool;
      (** Deprecated - use canMoveItemOutOfDrive instead. *)
      canMoveItemOutOfDrive : bool;
      (** Whether the current user can move this item outside of this drive by changing its parent. Note that a request to change the parent of the item may still fail depending on the new parent that is being added. *)
      canMoveItemOutOfTeamDrive : bool;
      (** Deprecated - use canMoveItemOutOfDrive instead. *)
      canMoveItemWithinDrive : bool;
      (** Whether the current user can move this item within this shared drive. Note that a request to change the parent of the item may still fail depending on the new parent that is being added. Only populated for items in shared drives. *)
      canMoveItemWithinTeamDrive : bool;
      (** Deprecated - use canMoveItemWithinDrive instead. *)
      canMoveTeamDriveItem : bool;
      (** Deprecated - use canMoveItemWithinDrive or canMoveItemOutOfDrive instead. *)
      canReadDrive : bool;
      (** Whether the current user can read the shared drive to which this file belongs. Only populated for items in shared drives. *)
      canReadRevisions : bool;
      (** Whether the current user can read the revisions resource of this file. For a shared drive item, whether revisions of non-folder descendants of this item, or this item itself if it is not a folder, can be read. *)
      canReadTeamDrive : bool;
      (** Deprecated - use canReadDrive instead. *)
      canRemoveChildren : bool;
      (** Whether the current user can remove children from this folder. This is always false when the item is not a folder. For a folder in a shared drive, use canDeleteChildren or canTrashChildren instead. *)
      canRemoveMyDriveParent : bool;
      (** Whether the current user can remove a parent from the item without adding another parent in the same request. Not populated for shared drive files. *)
      canRename : bool;
      (** Whether the current user can rename this file. *)
      canShare : bool;
      (** Whether the current user can modify the sharing settings for this file. *)
      canTrash : bool;
      (** Whether the current user can move this file to trash. *)
      canTrashChildren : bool;
      (** Whether the current user can trash children of this folder. This is false when the item is not a folder. Only populated for items in shared drives. *)
      canUntrash : bool;
      (** Whether the current user can restore this file from trash. *)
      
    }
    
    val canAddChildren : (t, bool) GapiLens.t
    val canAddMyDriveParent : (t, bool) GapiLens.t
    val canChangeCopyRequiresWriterPermission : (t, bool) GapiLens.t
    val canChangeViewersCanCopyContent : (t, bool) GapiLens.t
    val canComment : (t, bool) GapiLens.t
    val canCopy : (t, bool) GapiLens.t
    val canDelete : (t, bool) GapiLens.t
    val canDeleteChildren : (t, bool) GapiLens.t
    val canDownload : (t, bool) GapiLens.t
    val canEdit : (t, bool) GapiLens.t
    val canListChildren : (t, bool) GapiLens.t
    val canModifyContent : (t, bool) GapiLens.t
    val canMoveChildrenOutOfDrive : (t, bool) GapiLens.t
    val canMoveChildrenOutOfTeamDrive : (t, bool) GapiLens.t
    val canMoveChildrenWithinDrive : (t, bool) GapiLens.t
    val canMoveChildrenWithinTeamDrive : (t, bool) GapiLens.t
    val canMoveItemIntoTeamDrive : (t, bool) GapiLens.t
    val canMoveItemOutOfDrive : (t, bool) GapiLens.t
    val canMoveItemOutOfTeamDrive : (t, bool) GapiLens.t
    val canMoveItemWithinDrive : (t, bool) GapiLens.t
    val canMoveItemWithinTeamDrive : (t, bool) GapiLens.t
    val canMoveTeamDriveItem : (t, bool) GapiLens.t
    val canReadDrive : (t, bool) GapiLens.t
    val canReadRevisions : (t, bool) GapiLens.t
    val canReadTeamDrive : (t, bool) GapiLens.t
    val canRemoveChildren : (t, bool) GapiLens.t
    val canRemoveMyDriveParent : (t, bool) GapiLens.t
    val canRename : (t, bool) GapiLens.t
    val canShare : (t, bool) GapiLens.t
    val canTrash : (t, bool) GapiLens.t
    val canTrashChildren : (t, bool) GapiLens.t
    val canUntrash : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    appProperties : (string * string) list;
    (** A collection of arbitrary key-value pairs which are private to the requesting app.
Entries with null values are cleared in update and copy requests. *)
    capabilities : Capabilities.t;
    (** Capabilities the current user has on this file. Each capability corresponds to a fine-grained action that a user may take. *)
    contentHints : ContentHints.t;
    (** Additional information about the content of the file. These fields are never populated in responses. *)
    copyRequiresWriterPermission : bool;
    (** Whether the options to copy, print, or download this file, should be disabled for readers and commenters. *)
    createdTime : GapiDate.t;
    (** The time at which the file was created (RFC 3339 date-time). *)
    description : string;
    (** A short description of the file. *)
    driveId : string;
    (** ID of the shared drive the file resides in. Only populated for items in shared drives. *)
    explicitlyTrashed : bool;
    (** Whether the file has been explicitly trashed, as opposed to recursively trashed from a parent folder. *)
    exportLinks : (string * string) list;
    (** Links for exporting Google Docs to specific formats. *)
    fileExtension : string;
    (** The final component of fullFileExtension. This is only available for files with binary content in Google Drive. *)
    folderColorRgb : string;
    (** The color for a folder as an RGB hex string. The supported colors are published in the folderColorPalette field of the About resource.
If an unsupported color is specified, the closest color in the palette will be used instead. *)
    fullFileExtension : string;
    (** The full file extension extracted from the name field. May contain multiple concatenated extensions, such as "tar.gz". This is only available for files with binary content in Google Drive.
This is automatically updated when the name field changes, however it is not cleared if the new name does not contain a valid extension. *)
    hasAugmentedPermissions : bool;
    (** Whether there are permissions directly on this file. This field is only populated for items in shared drives. *)
    hasThumbnail : bool;
    (** Whether this file has a thumbnail. This does not indicate whether the requesting app has access to the thumbnail. To check access, look for the presence of the thumbnailLink field. *)
    headRevisionId : string;
    (** The ID of the file's head revision. This is currently only available for files with binary content in Google Drive. *)
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
    (** The MD5 checksum for the content of the file. This is only applicable to files with binary content in Google Drive. *)
    mimeType : string;
    (** The MIME type of the file.
Google Drive will attempt to automatically detect an appropriate value from uploaded content if no value is provided. The value cannot be changed unless a new revision is uploaded.
If a file is created with a Google Doc MIME type, the uploaded content will be imported if possible. The supported import formats are published in the About resource. *)
    modifiedByMe : bool;
    (** Whether the file has been modified by this user. *)
    modifiedByMeTime : GapiDate.t;
    (** The last time the file was modified by the user (RFC 3339 date-time). *)
    modifiedTime : GapiDate.t;
    (** The last time the file was modified by anyone (RFC 3339 date-time).
Note that setting modifiedTime will also update modifiedByMeTime for the user. *)
    name : string;
    (** The name of the file. This is not necessarily unique within a folder. Note that for immutable items such as the top level folders of shared drives, My Drive root folder, and Application Data folder the name is constant. *)
    originalFilename : string;
    (** The original filename of the uploaded content if available, or else the original value of the name field. This is only available for files with binary content in Google Drive. *)
    ownedByMe : bool;
    (** Whether the user owns the file. Not populated for items in shared drives. *)
    owners : User.t list;
    (** The owners of the file. Currently, only certain legacy files may have more than one owner. Not populated for items in shared drives. *)
    parents : string list;
    (** The IDs of the parent folders which contain the file.
If not specified as part of a create request, the file will be placed directly in the user's My Drive folder. If not specified as part of a copy request, the file will inherit any discoverable parents of the source file. Update requests must use the addParents and removeParents parameters to modify the parents list. *)
    permissionIds : string list;
    (** List of permission IDs for users with access to this file. *)
    permissions : Permission.t list;
    (** The full list of permissions for the file. This is only available if the requesting user can share the file. Not populated for items in shared drives. *)
    properties : (string * string) list;
    (** A collection of arbitrary key-value pairs which are visible to all apps.
Entries with null values are cleared in update and copy requests. *)
    quotaBytesUsed : int64;
    (** The number of storage quota bytes used by the file. This includes the head revision as well as previous revisions with keepForever enabled. *)
    shared : bool;
    (** Whether the file has been shared. Not populated for items in shared drives. *)
    sharedWithMeTime : GapiDate.t;
    (** The time at which the file was shared with the user, if applicable (RFC 3339 date-time). *)
    sharingUser : User.t;
    (** The user who shared the file with the requesting user, if applicable. *)
    shortcutDetails : ShortcutDetails.t;
    (** Shortcut file details. Only populated for shortcut files, which have the mimeType field set to application/vnd.google-apps.shortcut. *)
    size : int64;
    (** The size of the file's content in bytes. This is only applicable to files with binary content in Google Drive. *)
    spaces : string list;
    (** The list of spaces which contain the file. The currently supported values are 'drive', 'appDataFolder' and 'photos'. *)
    starred : bool;
    (** Whether the user has starred the file. *)
    teamDriveId : string;
    (** Deprecated - use driveId instead. *)
    thumbnailLink : string;
    (** A short-lived link to the file's thumbnail, if available. Typically lasts on the order of hours. Only populated when the requesting app can access the file's content. *)
    thumbnailVersion : int64;
    (** The thumbnail version for use in thumbnail cache invalidation. *)
    trashed : bool;
    (** Whether the file has been trashed, either explicitly or from a trashed parent folder. Only the owner may trash a file, and other users cannot see files in the owner's trash. *)
    trashedTime : GapiDate.t;
    (** The time that the item was trashed (RFC 3339 date-time). Only populated for items in shared drives. *)
    trashingUser : User.t;
    (** If the file has been explicitly trashed, the user who trashed it. Only populated for items in shared drives. *)
    version : int64;
    (** A monotonically increasing version number for the file. This reflects every change made to the file on the server, even those not visible to the user. *)
    videoMediaMetadata : VideoMediaMetadata.t;
    (** Additional metadata about video media. This may not be available immediately upon upload. *)
    viewedByMe : bool;
    (** Whether the file has been viewed by this user. *)
    viewedByMeTime : GapiDate.t;
    (** The last time the file was viewed by the user (RFC 3339 date-time). *)
    viewersCanCopyContent : bool;
    (** Deprecated - use copyRequiresWriterPermission instead. *)
    webContentLink : string;
    (** A link for downloading the content of the file in a browser. This is only available for files with binary content in Google Drive. *)
    webViewLink : string;
    (** A link for opening the file in a relevant Google editor or viewer in a browser. *)
    writersCanShare : bool;
    (** Whether users with only writer permission can modify the file's permissions. Not populated for items in shared drives. *)
    
  }
  
  val appProperties : (t, (string * string) list) GapiLens.t
  val capabilities : (t, Capabilities.t) GapiLens.t
  val contentHints : (t, ContentHints.t) GapiLens.t
  val copyRequiresWriterPermission : (t, bool) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val description : (t, string) GapiLens.t
  val driveId : (t, string) GapiLens.t
  val explicitlyTrashed : (t, bool) GapiLens.t
  val exportLinks : (t, (string * string) list) GapiLens.t
  val fileExtension : (t, string) GapiLens.t
  val folderColorRgb : (t, string) GapiLens.t
  val fullFileExtension : (t, string) GapiLens.t
  val hasAugmentedPermissions : (t, bool) GapiLens.t
  val hasThumbnail : (t, bool) GapiLens.t
  val headRevisionId : (t, string) GapiLens.t
  val iconLink : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val imageMediaMetadata : (t, ImageMediaMetadata.t) GapiLens.t
  val isAppAuthorized : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val lastModifyingUser : (t, User.t) GapiLens.t
  val md5Checksum : (t, string) GapiLens.t
  val mimeType : (t, string) GapiLens.t
  val modifiedByMe : (t, bool) GapiLens.t
  val modifiedByMeTime : (t, GapiDate.t) GapiLens.t
  val modifiedTime : (t, GapiDate.t) GapiLens.t
  val name : (t, string) GapiLens.t
  val originalFilename : (t, string) GapiLens.t
  val ownedByMe : (t, bool) GapiLens.t
  val owners : (t, User.t list) GapiLens.t
  val parents : (t, string list) GapiLens.t
  val permissionIds : (t, string list) GapiLens.t
  val permissions : (t, Permission.t list) GapiLens.t
  val properties : (t, (string * string) list) GapiLens.t
  val quotaBytesUsed : (t, int64) GapiLens.t
  val shared : (t, bool) GapiLens.t
  val sharedWithMeTime : (t, GapiDate.t) GapiLens.t
  val sharingUser : (t, User.t) GapiLens.t
  val shortcutDetails : (t, ShortcutDetails.t) GapiLens.t
  val size : (t, int64) GapiLens.t
  val spaces : (t, string list) GapiLens.t
  val starred : (t, bool) GapiLens.t
  val teamDriveId : (t, string) GapiLens.t
  val thumbnailLink : (t, string) GapiLens.t
  val thumbnailVersion : (t, int64) GapiLens.t
  val trashed : (t, bool) GapiLens.t
  val trashedTime : (t, GapiDate.t) GapiLens.t
  val trashingUser : (t, User.t) GapiLens.t
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

module Drive :
sig
  module Restrictions :
  sig
    type t = {
      adminManagedRestrictions : bool;
      (** Whether administrative privileges on this shared drive are required to modify restrictions. *)
      copyRequiresWriterPermission : bool;
      (** Whether the options to copy, print, or download files inside this shared drive, should be disabled for readers and commenters. When this restriction is set to true, it will override the similarly named field to true for any file inside this shared drive. *)
      domainUsersOnly : bool;
      (** Whether access to this shared drive and items inside this shared drive is restricted to users of the domain to which this shared drive belongs. This restriction may be overridden by other sharing policies controlled outside of this shared drive. *)
      driveMembersOnly : bool;
      (** Whether access to items inside this shared drive is restricted to its members. *)
      
    }
    
    val adminManagedRestrictions : (t, bool) GapiLens.t
    val copyRequiresWriterPermission : (t, bool) GapiLens.t
    val domainUsersOnly : (t, bool) GapiLens.t
    val driveMembersOnly : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Capabilities :
  sig
    type t = {
      canAddChildren : bool;
      (** Whether the current user can add children to folders in this shared drive. *)
      canChangeCopyRequiresWriterPermissionRestriction : bool;
      (** Whether the current user can change the copyRequiresWriterPermission restriction of this shared drive. *)
      canChangeDomainUsersOnlyRestriction : bool;
      (** Whether the current user can change the domainUsersOnly restriction of this shared drive. *)
      canChangeDriveBackground : bool;
      (** Whether the current user can change the background of this shared drive. *)
      canChangeDriveMembersOnlyRestriction : bool;
      (** Whether the current user can change the driveMembersOnly restriction of this shared drive. *)
      canComment : bool;
      (** Whether the current user can comment on files in this shared drive. *)
      canCopy : bool;
      (** Whether the current user can copy files in this shared drive. *)
      canDeleteChildren : bool;
      (** Whether the current user can delete children from folders in this shared drive. *)
      canDeleteDrive : bool;
      (** Whether the current user can delete this shared drive. Attempting to delete the shared drive may still fail if there are untrashed items inside the shared drive. *)
      canDownload : bool;
      (** Whether the current user can download files in this shared drive. *)
      canEdit : bool;
      (** Whether the current user can edit files in this shared drive *)
      canListChildren : bool;
      (** Whether the current user can list the children of folders in this shared drive. *)
      canManageMembers : bool;
      (** Whether the current user can add members to this shared drive or remove them or change their role. *)
      canReadRevisions : bool;
      (** Whether the current user can read the revisions resource of files in this shared drive. *)
      canRename : bool;
      (** Whether the current user can rename files or folders in this shared drive. *)
      canRenameDrive : bool;
      (** Whether the current user can rename this shared drive. *)
      canShare : bool;
      (** Whether the current user can share files or folders in this shared drive. *)
      canTrashChildren : bool;
      (** Whether the current user can trash children from folders in this shared drive. *)
      
    }
    
    val canAddChildren : (t, bool) GapiLens.t
    val canChangeCopyRequiresWriterPermissionRestriction : (t, bool) GapiLens.t
    val canChangeDomainUsersOnlyRestriction : (t, bool) GapiLens.t
    val canChangeDriveBackground : (t, bool) GapiLens.t
    val canChangeDriveMembersOnlyRestriction : (t, bool) GapiLens.t
    val canComment : (t, bool) GapiLens.t
    val canCopy : (t, bool) GapiLens.t
    val canDeleteChildren : (t, bool) GapiLens.t
    val canDeleteDrive : (t, bool) GapiLens.t
    val canDownload : (t, bool) GapiLens.t
    val canEdit : (t, bool) GapiLens.t
    val canListChildren : (t, bool) GapiLens.t
    val canManageMembers : (t, bool) GapiLens.t
    val canReadRevisions : (t, bool) GapiLens.t
    val canRename : (t, bool) GapiLens.t
    val canRenameDrive : (t, bool) GapiLens.t
    val canShare : (t, bool) GapiLens.t
    val canTrashChildren : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module BackgroundImageFile :
  sig
    type t = {
      id : string;
      (** The ID of an image file in Google Drive to use for the background image. *)
      width : float;
      (** The width of the cropped image in the closed range of 0 to 1. This value represents the width of the cropped image divided by the width of the entire image. The height is computed by applying a width to height aspect ratio of 80 to 9. The resulting image must be at least 1280 pixels wide and 144 pixels high. *)
      xCoordinate : float;
      (** The X coordinate of the upper left corner of the cropping area in the background image. This is a value in the closed range of 0 to 1. This value represents the horizontal distance from the left side of the entire image to the left side of the cropping area divided by the width of the entire image. *)
      yCoordinate : float;
      (** The Y coordinate of the upper left corner of the cropping area in the background image. This is a value in the closed range of 0 to 1. This value represents the vertical distance from the top side of the entire image to the top side of the cropping area divided by the height of the entire image. *)
      
    }
    
    val id : (t, string) GapiLens.t
    val width : (t, float) GapiLens.t
    val xCoordinate : (t, float) GapiLens.t
    val yCoordinate : (t, float) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    backgroundImageFile : BackgroundImageFile.t;
    (** An image file and cropping parameters from which a background image for this shared drive is set. This is a write only field; it can only be set on drive.drives.update requests that don't set themeId. When specified, all fields of the backgroundImageFile must be set. *)
    backgroundImageLink : string;
    (** A short-lived link to this shared drive's background image. *)
    capabilities : Capabilities.t;
    (** Capabilities the current user has on this shared drive. *)
    colorRgb : string;
    (** The color of this shared drive as an RGB hex string. It can only be set on a drive.drives.update request that does not set themeId. *)
    createdTime : GapiDate.t;
    (** The time at which the shared drive was created (RFC 3339 date-time). *)
    hidden : bool;
    (** Whether the shared drive is hidden from default view. *)
    id : string;
    (** The ID of this shared drive which is also the ID of the top level folder of this shared drive. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#drive". *)
    name : string;
    (** The name of this shared drive. *)
    restrictions : Restrictions.t;
    (** A set of restrictions that apply to this shared drive or items inside this shared drive. *)
    themeId : string;
    (** The ID of the theme from which the background image and color will be set. The set of possible driveThemes can be retrieved from a drive.about.get response. When not specified on a drive.drives.create request, a random theme is chosen from which the background image and color are set. This is a write-only field; it can only be set on requests that don't set colorRgb or backgroundImageFile. *)
    
  }
  
  val backgroundImageFile : (t, BackgroundImageFile.t) GapiLens.t
  val backgroundImageLink : (t, string) GapiLens.t
  val capabilities : (t, Capabilities.t) GapiLens.t
  val colorRgb : (t, string) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val hidden : (t, bool) GapiLens.t
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val restrictions : (t, Restrictions.t) GapiLens.t
  val themeId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Change :
sig
  type t = {
    changeType : string;
    (** The type of the change. Possible values are file and drive. *)
    drive : Drive.t;
    (** The updated state of the shared drive. Present if the changeType is drive, the user is still a member of the shared drive, and the shared drive has not been deleted. *)
    driveId : string;
    (** The ID of the shared drive associated with this change. *)
    file : File.t;
    (** The updated state of the file. Present if the type is file and the file has not been removed from this list of changes. *)
    fileId : string;
    (** The ID of the file which has changed. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#change". *)
    removed : bool;
    (** Whether the file or shared drive has been removed from this list of changes, for example by deletion or loss of access. *)
    teamDrive : TeamDrive.t;
    (** Deprecated - use drive instead. *)
    teamDriveId : string;
    (** Deprecated - use driveId instead. *)
    time : GapiDate.t;
    (** The time of this change (RFC 3339 date-time). *)
    _type : string;
    (** Deprecated - use changeType instead. *)
    
  }
  
  val changeType : (t, string) GapiLens.t
  val drive : (t, Drive.t) GapiLens.t
  val driveId : (t, string) GapiLens.t
  val file : (t, File.t) GapiLens.t
  val fileId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val removed : (t, bool) GapiLens.t
  val teamDrive : (t, TeamDrive.t) GapiLens.t
  val teamDriveId : (t, string) GapiLens.t
  val time : (t, GapiDate.t) GapiLens.t
  val _type : (t, string) GapiLens.t
  
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
    (** The page token for the next page of replies. This will be absent if the end of the replies list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. *)
    replies : Reply.t list;
    (** The list of replies. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    
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
    nextPageToken : string;
    (** The page token for the next page of permissions. This field will be absent if the end of the permissions list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. *)
    permissions : Permission.t list;
    (** The list of permissions. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
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
    (** The list of changes. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#changeList". *)
    newStartPageToken : string;
    (** The starting page token for future changes. This will be present only if the end of the current changes list has been reached. *)
    nextPageToken : string;
    (** The page token for the next page of changes. This will be absent if the end of the changes list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. *)
    
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
    nextPageToken : string;
    (** The page token for the next page of revisions. This will be absent if the end of the revisions list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. *)
    revisions : Revision.t list;
    (** The list of revisions. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
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
    (** Identifies this as a notification channel used to watch for changes to a resource, which is "api#channel". *)
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
    (** The list of files. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    incompleteSearch : bool;
    (** Whether the search process was incomplete. If true, then some search results may be missing, since all documents were not searched. This may occur when searching multiple drives with the "allDrives" corpora, but all corpora could not be searched. When this happens, it is suggested that clients narrow their query by choosing a different corpus such as "user" or "drive". *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#fileList". *)
    nextPageToken : string;
    (** The page token for the next page of files. This will be absent if the end of the files list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. *)
    
  }
  
  val files : (t, File.t list) GapiLens.t
  val incompleteSearch : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DriveList :
sig
  type t = {
    drives : Drive.t list;
    (** The list of shared drives. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string "drive#driveList". *)
    nextPageToken : string;
    (** The page token for the next page of shared drives. This will be absent if the end of the list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. *)
    
  }
  
  val drives : (t, Drive.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

