(* Warning! This file is generated. Modify at your own risk.
        *)

(** Data definition for Google Drive API (v3).
  
  For more information about this data model, see the
  {{:https://developers.google.com/workspace/drive/}API Documentation}.
  *)

module LabelFieldModification :
sig
  type t = {
    fieldId : string;
    (** The ID of the field to be modified. *)
    kind : string;
    (** This is always drive#labelFieldModification. *)
    setDateValues : GapiDate.t list;
    (** Replaces the value of a dateString Field with these new values. The string must be in the RFC 3339 full-date format: YYYY-MM-DD. *)
    setTextValues : string list;
    (** Sets the value of a `text` field. *)
    setSelectionValues : string list;
    (** Replaces a `selection` field with these new values. *)
    setIntegerValues : int64 list;
    (** Replaces the value of an `integer` field with these new values. *)
    setUserValues : string list;
    (** Replaces a `user` field with these new values. The values must be valid email addresses. *)
    unsetValues : bool;
    (** Unsets the values for this field. *)
    
  }
  
  val fieldId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val setDateValues : (t, GapiDate.t list) GapiLens.t
  val setTextValues : (t, string list) GapiLens.t
  val setSelectionValues : (t, string list) GapiLens.t
  val setIntegerValues : (t, int64 list) GapiLens.t
  val setUserValues : (t, string list) GapiLens.t
  val unsetValues : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DownloadRestriction :
sig
  type t = {
    restrictedForReaders : bool;
    (** Whether download and copy is restricted for readers. *)
    restrictedForWriters : bool;
    (** Whether download and copy is restricted for writers. If true, download is also restricted for readers. *)
    
  }
  
  val restrictedForReaders : (t, bool) GapiLens.t
  val restrictedForWriters : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TeamDrive :
sig
  module Restrictions :
  sig
    type t = {
      copyRequiresWriterPermission : bool;
      (** Whether the options to copy, print, or download files inside this Team Drive, should be disabled for readers and commenters. When this restriction is set to `true`, it will override the similarly named field to `true` for any file inside this Team Drive. *)
      domainUsersOnly : bool;
      (** Whether access to this Team Drive and items inside this Team Drive is restricted to users of the domain to which this Team Drive belongs. This restriction may be overridden by other sharing policies controlled outside of this Team Drive. *)
      teamMembersOnly : bool;
      (** Whether access to items inside this Team Drive is restricted to members of this Team Drive. *)
      adminManagedRestrictions : bool;
      (** Whether administrative privileges on this Team Drive are required to modify restrictions. *)
      sharingFoldersRequiresOrganizerPermission : bool;
      (** If true, only users with the organizer role can share folders. If false, users with either the organizer role or the file organizer role can share folders. *)
      downloadRestriction : DownloadRestriction.t;
      (** Download restrictions applied by shared drive managers. *)
      
    }
    
    val copyRequiresWriterPermission : (t, bool) GapiLens.t
    val domainUsersOnly : (t, bool) GapiLens.t
    val teamMembersOnly : (t, bool) GapiLens.t
    val adminManagedRestrictions : (t, bool) GapiLens.t
    val sharingFoldersRequiresOrganizerPermission : (t, bool) GapiLens.t
    val downloadRestriction : (t, DownloadRestriction.t) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module BackgroundImageFile :
  sig
    type t = {
      id : string;
      (** The ID of an image file in Drive to use for the background image. *)
      xCoordinate : float;
      (** The X coordinate of the upper left corner of the cropping area in the background image. This is a value in the closed range of 0 to 1. This value represents the horizontal distance from the left side of the entire image to the left side of the cropping area divided by the width of the entire image. *)
      yCoordinate : float;
      (** The Y coordinate of the upper left corner of the cropping area in the background image. This is a value in the closed range of 0 to 1. This value represents the vertical distance from the top side of the entire image to the top side of the cropping area divided by the height of the entire image. *)
      width : float;
      (** The width of the cropped image in the closed range of 0 to 1. This value represents the width of the cropped image divided by the width of the entire image. The height is computed by applying a width to height aspect ratio of 80 to 9. The resulting image must be at least 1280 pixels wide and 144 pixels high. *)
      
    }
    
    val id : (t, string) GapiLens.t
    val xCoordinate : (t, float) GapiLens.t
    val yCoordinate : (t, float) GapiLens.t
    val width : (t, float) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Capabilities :
  sig
    type t = {
      canAddChildren : bool;
      (** Whether the current user can add children to folders in this Team Drive. *)
      canComment : bool;
      (** Whether the current user can comment on files in this Team Drive. *)
      canCopy : bool;
      (** Whether the current user can copy files in this Team Drive. *)
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
      (** Deprecated: Use `canDeleteChildren` or `canTrashChildren` instead. *)
      canRename : bool;
      (** Whether the current user can rename files or folders in this Team Drive. *)
      canRenameTeamDrive : bool;
      (** Whether the current user can rename this Team Drive. *)
      canChangeTeamDriveBackground : bool;
      (** Whether the current user can change the background of this Team Drive. *)
      canShare : bool;
      (** Whether the current user can share files or folders in this Team Drive. *)
      canChangeCopyRequiresWriterPermissionRestriction : bool;
      (** Whether the current user can change the `copyRequiresWriterPermission` restriction of this Team Drive. *)
      canChangeDomainUsersOnlyRestriction : bool;
      (** Whether the current user can change the `domainUsersOnly` restriction of this Team Drive. *)
      canChangeSharingFoldersRequiresOrganizerPermissionRestriction : bool;
      (** Whether the current user can change the `sharingFoldersRequiresOrganizerPermission` restriction of this Team Drive. *)
      canChangeTeamMembersOnlyRestriction : bool;
      (** Whether the current user can change the `teamMembersOnly` restriction of this Team Drive. *)
      canDeleteChildren : bool;
      (** Whether the current user can delete children from folders in this Team Drive. *)
      canTrashChildren : bool;
      (** Whether the current user can trash children from folders in this Team Drive. *)
      canResetTeamDriveRestrictions : bool;
      (** Whether the current user can reset the Team Drive restrictions to defaults. *)
      
    }
    
    val canAddChildren : (t, bool) GapiLens.t
    val canComment : (t, bool) GapiLens.t
    val canCopy : (t, bool) GapiLens.t
    val canDeleteTeamDrive : (t, bool) GapiLens.t
    val canDownload : (t, bool) GapiLens.t
    val canEdit : (t, bool) GapiLens.t
    val canListChildren : (t, bool) GapiLens.t
    val canManageMembers : (t, bool) GapiLens.t
    val canReadRevisions : (t, bool) GapiLens.t
    val canRemoveChildren : (t, bool) GapiLens.t
    val canRename : (t, bool) GapiLens.t
    val canRenameTeamDrive : (t, bool) GapiLens.t
    val canChangeTeamDriveBackground : (t, bool) GapiLens.t
    val canShare : (t, bool) GapiLens.t
    val canChangeCopyRequiresWriterPermissionRestriction : (t, bool) GapiLens.t
    val canChangeDomainUsersOnlyRestriction : (t, bool) GapiLens.t
    val canChangeSharingFoldersRequiresOrganizerPermissionRestriction : (t, bool) GapiLens.t
    val canChangeTeamMembersOnlyRestriction : (t, bool) GapiLens.t
    val canDeleteChildren : (t, bool) GapiLens.t
    val canTrashChildren : (t, bool) GapiLens.t
    val canResetTeamDriveRestrictions : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    id : string;
    (** The ID of this Team Drive which is also the ID of the top level folder of this Team Drive. *)
    name : string;
    (** The name of this Team Drive. *)
    colorRgb : string;
    (** The color of this Team Drive as an RGB hex string. It can only be set on a `drive.teamdrives.update` request that does not set `themeId`. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#teamDrive"`. *)
    backgroundImageLink : string;
    (** A short-lived link to this Team Drive's background image. *)
    capabilities : Capabilities.t;
    (** Capabilities the current user has on this Team Drive. *)
    themeId : string;
    (** The ID of the theme from which the background image and color will be set. The set of possible `teamDriveThemes` can be retrieved from a `drive.about.get` response. When not specified on a `drive.teamdrives.create` request, a random theme is chosen from which the background image and color are set. This is a write-only field; it can only be set on requests that don't set `colorRgb` or `backgroundImageFile`. *)
    backgroundImageFile : BackgroundImageFile.t;
    (** An image file and cropping parameters from which a background image for this Team Drive is set. This is a write only field; it can only be set on `drive.teamdrives.update` requests that don't set `themeId`. When specified, all fields of the `backgroundImageFile` must be set. *)
    createdTime : GapiDate.t;
    (** The time at which the Team Drive was created (RFC 3339 date-time). *)
    restrictions : Restrictions.t;
    (** A set of restrictions that apply to this Team Drive or items inside this Team Drive. *)
    orgUnitId : string;
    (** The organizational unit of this shared drive. This field is only populated on `drives.list` responses when the `useDomainAdminAccess` parameter is set to `true`. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val colorRgb : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val backgroundImageLink : (t, string) GapiLens.t
  val capabilities : (t, Capabilities.t) GapiLens.t
  val themeId : (t, string) GapiLens.t
  val backgroundImageFile : (t, BackgroundImageFile.t) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val restrictions : (t, Restrictions.t) GapiLens.t
  val orgUnitId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module TeamDriveList :
sig
  type t = {
    nextPageToken : string;
    (** The page token for the next page of Team Drives. This will be absent if the end of the Team Drives list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. The page token is typically valid for several hours. However, if new items are added or removed, your expected results might differ. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#teamDriveList"`. *)
    teamDrives : TeamDrive.t list;
    (** The list of Team Drives. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    
  }
  
  val nextPageToken : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
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
    (** Output only. A plain text displayable name for this user. *)
    kind : string;
    (** Output only. Identifies what kind of resource this is. Value: the fixed string `drive#user`. *)
    me : bool;
    (** Output only. Whether this user is the requesting user. *)
    permissionId : string;
    (** Output only. The user's ID as visible in Permission resources. *)
    emailAddress : string;
    (** Output only. The email address of the user. This may not be present in certain contexts if the user has not made their email address visible to the requester. *)
    photoLink : string;
    (** Output only. A link to the user's profile photo, if available. *)
    
  }
  
  val displayName : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val me : (t, bool) GapiLens.t
  val permissionId : (t, string) GapiLens.t
  val emailAddress : (t, string) GapiLens.t
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
      id : string;
      (** Deprecated: Use `driveThemes/id` instead. *)
      backgroundImageLink : string;
      (** Deprecated: Use `driveThemes/backgroundImageLink` instead. *)
      colorRgb : string;
      (** Deprecated: Use `driveThemes/colorRgb` instead. *)
      
    }
    
    val id : (t, string) GapiLens.t
    val backgroundImageLink : (t, string) GapiLens.t
    val colorRgb : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module DriveThemes :
  sig
    type t = {
      id : string;
      (** The ID of the theme. *)
      backgroundImageLink : string;
      (** A link to this theme's background image. *)
      colorRgb : string;
      (** The color of this theme as an RGB hex string. *)
      
    }
    
    val id : (t, string) GapiLens.t
    val backgroundImageLink : (t, string) GapiLens.t
    val colorRgb : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module StorageQuota :
  sig
    type t = {
      limit : int64;
      (** The usage limit, if applicable. This will not be present if the user has unlimited storage. For users that are part of an organization with pooled storage, this is the limit for the organization, rather than the individual user. *)
      usageInDrive : int64;
      (** The usage by all files in Google Drive. *)
      usageInDriveTrash : int64;
      (** The usage by trashed files in Google Drive. *)
      usage : int64;
      (** The total usage across all services. For users that are part of an organization with pooled storage, this is the usage across all services for the organization, rather than the individual user. *)
      
    }
    
    val limit : (t, int64) GapiLens.t
    val usageInDrive : (t, int64) GapiLens.t
    val usageInDriveTrash : (t, int64) GapiLens.t
    val usage : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#about"`. *)
    storageQuota : StorageQuota.t;
    (** The user's storage quota limits and usage. For users that are part of an organization with pooled storage, information about the limit and usage across all services is for the organization, rather than the individual user. All fields are measured in bytes. *)
    driveThemes : DriveThemes.t list;
    (** A list of themes that are supported for shared drives. *)
    canCreateDrives : bool;
    (** Whether the user can create shared drives. *)
    importFormats : (string * string list) list;
    (** A map of source MIME type to possible targets for all supported imports. *)
    exportFormats : (string * string list) list;
    (** A map of source MIME type to possible targets for all supported exports. *)
    appInstalled : bool;
    (** Whether the user has installed the requesting app. *)
    user : User.t;
    (** The authenticated user. *)
    folderColorPalette : string list;
    (** The currently supported folder colors as RGB hex strings. *)
    maxImportSizes : (string * int64) list;
    (** A map of maximum import sizes by MIME type, in bytes. *)
    maxUploadSize : int64;
    (** The maximum upload size in bytes. *)
    teamDriveThemes : TeamDriveThemes.t list;
    (** Deprecated: Use `driveThemes` instead. *)
    canCreateTeamDrives : bool;
    (** Deprecated: Use `canCreateDrives` instead. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val storageQuota : (t, StorageQuota.t) GapiLens.t
  val driveThemes : (t, DriveThemes.t list) GapiLens.t
  val canCreateDrives : (t, bool) GapiLens.t
  val importFormats : (t, (string * string list) list) GapiLens.t
  val exportFormats : (t, (string * string list) list) GapiLens.t
  val appInstalled : (t, bool) GapiLens.t
  val user : (t, User.t) GapiLens.t
  val folderColorPalette : (t, string list) GapiLens.t
  val maxImportSizes : (t, (string * int64) list) GapiLens.t
  val maxUploadSize : (t, int64) GapiLens.t
  val teamDriveThemes : (t, TeamDriveThemes.t list) GapiLens.t
  val canCreateTeamDrives : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AppIcons :
sig
  type t = {
    size : int;
    (** Size of the icon. Represented as the maximum of the width and height. *)
    category : string;
    (** Category of the icon. Allowed values are: * `application` - The icon for the application. * `document` - The icon for a file associated with the app. * `documentShared` - The icon for a shared file associated with the app. *)
    iconUrl : string;
    (** URL for the icon. *)
    
  }
  
  val size : (t, int) GapiLens.t
  val category : (t, string) GapiLens.t
  val iconUrl : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module App :
sig
  type t = {
    name : string;
    (** The name of the app. *)
    objectType : string;
    (** The type of object this app creates such as a Chart. If empty, the app name should be used instead. *)
    supportsCreate : bool;
    (** Whether this app supports creating objects. *)
    productUrl : string;
    (** A link to the product listing for this app. *)
    primaryMimeTypes : string list;
    (** The list of primary MIME types. *)
    secondaryMimeTypes : string list;
    (** The list of secondary MIME types. *)
    primaryFileExtensions : string list;
    (** The list of primary file extensions. *)
    secondaryFileExtensions : string list;
    (** The list of secondary file extensions. *)
    id : string;
    (** The ID of the app. *)
    supportsImport : bool;
    (** Whether this app supports importing from Google Docs. *)
    installed : bool;
    (** Whether the app is installed. *)
    authorized : bool;
    (** Whether the app is authorized to access data on the user's Drive. *)
    icons : AppIcons.t list;
    (** The various icons for the app. *)
    useByDefault : bool;
    (** Whether the app is selected as the default handler for the types it supports. *)
    kind : string;
    (** Output only. Identifies what kind of resource this is. Value: the fixed string "drive#app". *)
    shortDescription : string;
    (** A short description of the app. *)
    longDescription : string;
    (** A long description of the app. *)
    supportsMultiOpen : bool;
    (** Whether this app supports opening more than one file. *)
    productId : string;
    (** The ID of the product listing for this app. *)
    openUrlTemplate : string;
    (** The template URL for opening files with this app. The template contains \{ids\} or \{exportIds\} to be replaced by the actual file IDs. For more information, see Open Files for the full documentation. *)
    createUrl : string;
    (** The URL to create a file with this app. *)
    createInFolderTemplate : string;
    (** The template URL to create a file with this app in a given folder. The template contains the \{folderId\} to be replaced by the folder ID house the new file. *)
    supportsOfflineCreate : bool;
    (** Whether this app supports creating files when offline. *)
    hasDriveWideScope : bool;
    (** Whether the app has Drive-wide scope. An app with Drive-wide scope can access all files in the user's Drive. *)
    
  }
  
  val name : (t, string) GapiLens.t
  val objectType : (t, string) GapiLens.t
  val supportsCreate : (t, bool) GapiLens.t
  val productUrl : (t, string) GapiLens.t
  val primaryMimeTypes : (t, string list) GapiLens.t
  val secondaryMimeTypes : (t, string list) GapiLens.t
  val primaryFileExtensions : (t, string list) GapiLens.t
  val secondaryFileExtensions : (t, string list) GapiLens.t
  val id : (t, string) GapiLens.t
  val supportsImport : (t, bool) GapiLens.t
  val installed : (t, bool) GapiLens.t
  val authorized : (t, bool) GapiLens.t
  val icons : (t, AppIcons.t list) GapiLens.t
  val useByDefault : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  val shortDescription : (t, string) GapiLens.t
  val longDescription : (t, string) GapiLens.t
  val supportsMultiOpen : (t, bool) GapiLens.t
  val productId : (t, string) GapiLens.t
  val openUrlTemplate : (t, string) GapiLens.t
  val createUrl : (t, string) GapiLens.t
  val createInFolderTemplate : (t, string) GapiLens.t
  val supportsOfflineCreate : (t, bool) GapiLens.t
  val hasDriveWideScope : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AppList :
sig
  type t = {
    defaultAppIds : string list;
    (** The list of app IDs that the user has specified to use by default. The list is in reverse-priority order (lowest to highest). *)
    kind : string;
    (** Output only. Identifies what kind of resource this is. Value: the fixed string "drive#appList". *)
    selfLink : string;
    (** A link back to this list. *)
    items : App.t list;
    (** The list of apps. *)
    
  }
  
  val defaultAppIds : (t, string list) GapiLens.t
  val kind : (t, string) GapiLens.t
  val selfLink : (t, string) GapiLens.t
  val items : (t, App.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module LabelField :
sig
  type t = {
    kind : string;
    (** This is always drive#labelField. *)
    id : string;
    (** The identifier of this label field. *)
    valueType : string;
    (** The field type. While new values may be supported in the future, the following are currently allowed: * `dateString` * `integer` * `selection` * `text` * `user` *)
    dateString : GapiDate.t list;
    (** Only present if valueType is dateString. RFC 3339 formatted date: YYYY-MM-DD. *)
    integer : int64 list;
    (** Only present if `valueType` is `integer`. *)
    selection : string list;
    (** Only present if `valueType` is `selection` *)
    text : string list;
    (** Only present if `valueType` is `text`. *)
    user : User.t list;
    (** Only present if `valueType` is `user`. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val valueType : (t, string) GapiLens.t
  val dateString : (t, GapiDate.t list) GapiLens.t
  val integer : (t, int64 list) GapiLens.t
  val selection : (t, string list) GapiLens.t
  val text : (t, string list) GapiLens.t
  val user : (t, User.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Label :
sig
  type t = {
    id : string;
    (** The ID of the label. *)
    revisionId : string;
    (** The revision ID of the label. *)
    kind : string;
    (** This is always drive#label *)
    fields : (string * LabelField.t) list;
    (** A map of the fields on the label, keyed by the field's ID. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val revisionId : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val fields : (t, (string * LabelField.t) list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module LabelList :
sig
  type t = {
    labels : Label.t list;
    (** The list of labels. *)
    nextPageToken : string;
    (** The page token for the next page of labels. This field will be absent if the end of the list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. The page token is typically valid for several hours. However, if new items are added or removed, your expected results might differ. *)
    kind : string;
    (** This is always drive#labelList *)
    
  }
  
  val labels : (t, Label.t list) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  
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
    (** Output only. The ID of the revision. *)
    mimeType : string;
    (** Output only. The MIME type of the revision. *)
    kind : string;
    (** Output only. Identifies what kind of resource this is. Value: the fixed string `"drive#revision"`. *)
    published : bool;
    (** Whether this revision is published. This is only applicable to Docs Editors files. *)
    exportLinks : (string * string) list;
    (** Output only. Links for exporting Docs Editors files to specific formats. *)
    keepForever : bool;
    (** Whether to keep this revision forever, even if it is no longer the head revision. If not set, the revision will be automatically purged 30 days after newer content is uploaded. This can be set on a maximum of 200 revisions for a file. This field is only applicable to files with binary content in Drive. *)
    md5Checksum : string;
    (** Output only. The MD5 checksum of the revision's content. This is only applicable to files with binary content in Drive. *)
    modifiedTime : GapiDate.t;
    (** The last time the revision was modified (RFC 3339 date-time). *)
    publishAuto : bool;
    (** Whether subsequent revisions will be automatically republished. This is only applicable to Docs Editors files. *)
    publishedOutsideDomain : bool;
    (** Whether this revision is published outside the domain. This is only applicable to Docs Editors files. *)
    publishedLink : string;
    (** Output only. A link to the published revision. This is only populated for Docs Editors files. *)
    size : int64;
    (** Output only. The size of the revision's content in bytes. This is only applicable to files with binary content in Drive. *)
    originalFilename : string;
    (** Output only. The original filename used to create this revision. This is only applicable to files with binary content in Drive. *)
    lastModifyingUser : User.t;
    (** Output only. The last user to modify this revision. This field is only populated when the last modification was performed by a signed-in user. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val mimeType : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val published : (t, bool) GapiLens.t
  val exportLinks : (t, (string * string) list) GapiLens.t
  val keepForever : (t, bool) GapiLens.t
  val md5Checksum : (t, string) GapiLens.t
  val modifiedTime : (t, GapiDate.t) GapiLens.t
  val publishAuto : (t, bool) GapiLens.t
  val publishedOutsideDomain : (t, bool) GapiLens.t
  val publishedLink : (t, string) GapiLens.t
  val size : (t, int64) GapiLens.t
  val originalFilename : (t, string) GapiLens.t
  val lastModifyingUser : (t, User.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Reply :
sig
  type t = {
    id : string;
    (** Output only. The ID of the reply. *)
    kind : string;
    (** Output only. Identifies what kind of resource this is. Value: the fixed string `"drive#reply"`. *)
    createdTime : GapiDate.t;
    (** The time at which the reply was created (RFC 3339 date-time). *)
    modifiedTime : GapiDate.t;
    (** The last time the reply was modified (RFC 3339 date-time). *)
    action : string;
    (** The action the reply performed to the parent comment. Valid values are: * `resolve` * `reopen` *)
    author : User.t;
    (** Output only. The author of the reply. The author's email address and permission ID will not be populated. *)
    deleted : bool;
    (** Output only. Whether the reply has been deleted. A deleted reply has no content. *)
    htmlContent : string;
    (** Output only. The content of the reply with HTML formatting. *)
    content : string;
    (** The plain text content of the reply. This field is used for setting the content, while `htmlContent` should be displayed. This is required on creates if no `action` is specified. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val modifiedTime : (t, GapiDate.t) GapiLens.t
  val action : (t, string) GapiLens.t
  val author : (t, User.t) GapiLens.t
  val deleted : (t, bool) GapiLens.t
  val htmlContent : (t, string) GapiLens.t
  val content : (t, string) GapiLens.t
  
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
    id : string;
    (** Output only. The ID of the comment. *)
    kind : string;
    (** Output only. Identifies what kind of resource this is. Value: the fixed string `"drive#comment"`. *)
    createdTime : GapiDate.t;
    (** The time at which the comment was created (RFC 3339 date-time). *)
    modifiedTime : GapiDate.t;
    (** The last time the comment or any of its replies was modified (RFC 3339 date-time). *)
    resolved : bool;
    (** Output only. Whether the comment has been resolved by one of its replies. *)
    anchor : string;
    (** A region of the document represented as a JSON string. For details on defining anchor properties, refer to \[Manage comments and replies\](https://developers.google.com/workspace/drive/api/v3/manage-comments). *)
    replies : Reply.t list;
    (** Output only. The full list of replies to the comment in chronological order. *)
    author : User.t;
    (** Output only. The author of the comment. The author's email address and permission ID will not be populated. *)
    deleted : bool;
    (** Output only. Whether the comment has been deleted. A deleted comment has no content. *)
    htmlContent : string;
    (** Output only. The content of the comment with HTML formatting. *)
    content : string;
    (** The plain text content of the comment. This field is used for setting the content, while `htmlContent` should be displayed. *)
    quotedFileContent : QuotedFileContent.t;
    (** The file content to which the comment refers, typically within the anchor region. For a text file, for example, this would be the text at the location of the comment. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val modifiedTime : (t, GapiDate.t) GapiLens.t
  val resolved : (t, bool) GapiLens.t
  val anchor : (t, string) GapiLens.t
  val replies : (t, Reply.t list) GapiLens.t
  val author : (t, User.t) GapiLens.t
  val deleted : (t, bool) GapiLens.t
  val htmlContent : (t, string) GapiLens.t
  val content : (t, string) GapiLens.t
  val quotedFileContent : (t, QuotedFileContent.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module CommentList :
sig
  type t = {
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#commentList"`. *)
    comments : Comment.t list;
    (** The list of comments. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    nextPageToken : string;
    (** The page token for the next page of comments. This will be absent if the end of the comments list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. The page token is typically valid for several hours. However, if new items are added or removed, your expected results might differ. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val comments : (t, Comment.t list) GapiLens.t
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
    space : string;
    (** The type of file that can be created with these IDs. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#generatedIds"`. *)
    
  }
  
  val ids : (t, string list) GapiLens.t
  val space : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  
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
      teamDrivePermissionType : string;
      (** Deprecated: Output only. Use `permissionDetails/permissionType` instead. *)
      inheritedFrom : string;
      (** Deprecated: Output only. Use `permissionDetails/inheritedFrom` instead. *)
      role : string;
      (** Deprecated: Output only. Use `permissionDetails/role` instead. *)
      inherited : bool;
      (** Deprecated: Output only. Use `permissionDetails/inherited` instead. *)
      
    }
    
    val teamDrivePermissionType : (t, string) GapiLens.t
    val inheritedFrom : (t, string) GapiLens.t
    val role : (t, string) GapiLens.t
    val inherited : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module PermissionDetails :
  sig
    type t = {
      permissionType : string;
      (** Output only. The permission type for this user. While new values may be added in future, the following are currently possible: * `file` * `member` *)
      inheritedFrom : string;
      (** Output only. The ID of the item from which this permission is inherited. This is only populated for items in shared drives. *)
      role : string;
      (** Output only. The primary role for this user. While new values may be added in the future, the following are currently possible: * `owner` * `organizer` * `fileOrganizer` * `writer` * `commenter` * `reader` *)
      inherited : bool;
      (** Output only. Whether this permission is inherited. This field is always populated. This is an output-only field. *)
      
    }
    
    val permissionType : (t, string) GapiLens.t
    val inheritedFrom : (t, string) GapiLens.t
    val role : (t, string) GapiLens.t
    val inherited : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    id : string;
    (** Output only. The ID of this permission. This is a unique identifier for the grantee, and is published in User resources as `permissionId`. IDs should be treated as opaque values. *)
    displayName : string;
    (** Output only. The "pretty" name of the value of the permission. The following is a list of examples for each type of permission: * `user` - User's full name, as defined for their Google account, such as "Joe Smith." * `group` - Name of the Google Group, such as "The Company Administrators." * `domain` - String domain name, such as "thecompany.com." * `anyone` - No `displayName` is present. *)
    _type : string;
    (** The type of the grantee. Valid values are: * `user` * `group` * `domain` * `anyone` When creating a permission, if `type` is `user` or `group`, you must provide an `emailAddress` for the user or group. When `type` is `domain`, you must provide a `domain`. There isn't extra information required for an `anyone` type. *)
    kind : string;
    (** Output only. Identifies what kind of resource this is. Value: the fixed string `"drive#permission"`. *)
    permissionDetails : PermissionDetails.t list;
    (** Output only. Details of whether the permissions on this item are inherited or directly on this item. *)
    photoLink : string;
    (** Output only. A link to the user's profile photo, if available. *)
    emailAddress : string;
    (** The email address of the user or group to which this permission refers. *)
    role : string;
    (** The role granted by this permission. While new values may be supported in the future, the following are currently allowed: * `owner` * `organizer` * `fileOrganizer` * `writer` * `commenter` * `reader` *)
    allowFileDiscovery : bool;
    (** Whether the permission allows the file to be discovered through search. This is only applicable for permissions of type `domain` or `anyone`. *)
    domain : string;
    (** The domain to which this permission refers. *)
    expirationTime : GapiDate.t;
    (** The time at which this permission will expire (RFC 3339 date-time). Expiration times have the following restrictions: - They can only be set on user and group permissions - The time must be in the future - The time cannot be more than a year in the future *)
    teamDrivePermissionDetails : TeamDrivePermissionDetails.t list;
    (** Output only. Deprecated: Output only. Use `permissionDetails` instead. *)
    deleted : bool;
    (** Output only. Whether the account associated with this permission has been deleted. This field only pertains to user and group permissions. *)
    view : string;
    (** Indicates the view for this permission. Only populated for permissions that belong to a view. published and metadata are the only supported values. - published: The permission's role is published_reader. - metadata: The item is only visible to the metadata view because the item has limited access and the scope has at least read access to the parent. Note: The metadata view is currently only supported on folders.  *)
    pendingOwner : bool;
    (** Whether the account associated with this permission is a pending owner. Only populated for `user` type permissions for files that are not in a shared drive. *)
    inheritedPermissionsDisabled : bool;
    (** When true, only organizers, owners, and users with permissions added directly on the item can access it. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val displayName : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val permissionDetails : (t, PermissionDetails.t list) GapiLens.t
  val photoLink : (t, string) GapiLens.t
  val emailAddress : (t, string) GapiLens.t
  val role : (t, string) GapiLens.t
  val allowFileDiscovery : (t, bool) GapiLens.t
  val domain : (t, string) GapiLens.t
  val expirationTime : (t, GapiDate.t) GapiLens.t
  val teamDrivePermissionDetails : (t, TeamDrivePermissionDetails.t list) GapiLens.t
  val deleted : (t, bool) GapiLens.t
  val view : (t, string) GapiLens.t
  val pendingOwner : (t, bool) GapiLens.t
  val inheritedPermissionsDisabled : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ContentRestriction :
sig
  type t = {
    readOnly : bool;
    (** Whether the content of the file is read-only. If a file is read-only, a new revision of the file may not be added, comments may not be added or modified, and the title of the file may not be modified. *)
    reason : string;
    (** Reason for why the content of the file is restricted. This is only mutable on requests that also set `readOnly=true`. *)
    _type : string;
    (** Output only. The type of the content restriction. Currently the only possible value is `globalContentRestriction`. *)
    restrictingUser : User.t;
    (** Output only. The user who set the content restriction. Only populated if `readOnly` is true. *)
    restrictionTime : GapiDate.t;
    (** The time at which the content restriction was set (formatted RFC 3339 timestamp). Only populated if readOnly is true. *)
    ownerRestricted : bool;
    (** Whether the content restriction can only be modified or removed by a user who owns the file. For files in shared drives, any user with `organizer` capabilities can modify or remove this content restriction. *)
    systemRestricted : bool;
    (** Output only. Whether the content restriction was applied by the system, for example due to an esignature. Users cannot modify or remove system restricted content restrictions. *)
    
  }
  
  val readOnly : (t, bool) GapiLens.t
  val reason : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val restrictingUser : (t, User.t) GapiLens.t
  val restrictionTime : (t, GapiDate.t) GapiLens.t
  val ownerRestricted : (t, bool) GapiLens.t
  val systemRestricted : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module File :
sig
  module LabelInfo :
  sig
    type t = {
      labels : Label.t list;
      (** Output only. The set of labels on the file as requested by the label IDs in the `includeLabels` parameter. By default, no labels are returned. *)
      
    }
    
    val labels : (t, Label.t list) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module LinkShareMetadata :
  sig
    type t = {
      securityUpdateEligible : bool;
      (** Output only. Whether the file is eligible for security update. *)
      securityUpdateEnabled : bool;
      (** Output only. Whether the security update is enabled for this file. *)
      
    }
    
    val securityUpdateEligible : (t, bool) GapiLens.t
    val securityUpdateEnabled : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ShortcutDetails :
  sig
    type t = {
      targetId : string;
      (** The ID of the file that this shortcut points to. Can only be set on `files.create` requests. *)
      targetMimeType : string;
      (** Output only. The MIME type of the file that this shortcut points to. The value of this field is a snapshot of the target's MIME type, captured when the shortcut is created. *)
      targetResourceKey : string;
      (** Output only. The ResourceKey for the target file. *)
      
    }
    
    val targetId : (t, string) GapiLens.t
    val targetMimeType : (t, string) GapiLens.t
    val targetResourceKey : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module VideoMediaMetadata :
  sig
    type t = {
      width : int;
      (** Output only. The width of the video in pixels. *)
      height : int;
      (** Output only. The height of the video in pixels. *)
      durationMillis : int64;
      (** Output only. The duration of the video in milliseconds. *)
      
    }
    
    val width : (t, int) GapiLens.t
    val height : (t, int) GapiLens.t
    val durationMillis : (t, int64) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module ImageMediaMetadata :
  sig
    module Location :
    sig
      type t = {
        latitude : float;
        (** Output only. The latitude stored in the image. *)
        longitude : float;
        (** Output only. The longitude stored in the image. *)
        altitude : float;
        (** Output only. The altitude stored in the image. *)
        
      }
      
      val latitude : (t, float) GapiLens.t
      val longitude : (t, float) GapiLens.t
      val altitude : (t, float) GapiLens.t
      
      val empty : t
      
      val render : t -> GapiJson.json_data_model list
      
      val parse : t -> GapiJson.json_data_model -> t
      
    end
    
    type t = {
      flashUsed : bool;
      (** Output only. Whether a flash was used to create the photo. *)
      meteringMode : string;
      (** Output only. The metering mode used to create the photo. *)
      sensor : string;
      (** Output only. The type of sensor used to create the photo. *)
      exposureMode : string;
      (** Output only. The exposure mode used to create the photo. *)
      colorSpace : string;
      (** Output only. The color space of the photo. *)
      whiteBalance : string;
      (** Output only. The white balance mode used to create the photo. *)
      width : int;
      (** Output only. The width of the image in pixels. *)
      height : int;
      (** Output only. The height of the image in pixels. *)
      location : Location.t;
      (** Output only. Geographic location information stored in the image. *)
      rotation : int;
      (** Output only. The number of clockwise 90 degree rotations applied from the image's original orientation. *)
      time : string;
      (** Output only. The date and time the photo was taken (EXIF DateTime). *)
      cameraMake : string;
      (** Output only. The make of the camera used to create the photo. *)
      cameraModel : string;
      (** Output only. The model of the camera used to create the photo. *)
      exposureTime : float;
      (** Output only. The length of the exposure, in seconds. *)
      aperture : float;
      (** Output only. The aperture used to create the photo (f-number). *)
      focalLength : float;
      (** Output only. The focal length used to create the photo, in millimeters. *)
      isoSpeed : int;
      (** Output only. The ISO speed used to create the photo. *)
      exposureBias : float;
      (** Output only. The exposure bias of the photo (APEX value). *)
      maxApertureValue : float;
      (** Output only. The smallest f-number of the lens at the focal length used to create the photo (APEX value). *)
      subjectDistance : int;
      (** Output only. The distance to the subject of the photo, in meters. *)
      lens : string;
      (** Output only. The lens used to create the photo. *)
      
    }
    
    val flashUsed : (t, bool) GapiLens.t
    val meteringMode : (t, string) GapiLens.t
    val sensor : (t, string) GapiLens.t
    val exposureMode : (t, string) GapiLens.t
    val colorSpace : (t, string) GapiLens.t
    val whiteBalance : (t, string) GapiLens.t
    val width : (t, int) GapiLens.t
    val height : (t, int) GapiLens.t
    val location : (t, Location.t) GapiLens.t
    val rotation : (t, int) GapiLens.t
    val time : (t, string) GapiLens.t
    val cameraMake : (t, string) GapiLens.t
    val cameraModel : (t, string) GapiLens.t
    val exposureTime : (t, float) GapiLens.t
    val aperture : (t, float) GapiLens.t
    val focalLength : (t, float) GapiLens.t
    val isoSpeed : (t, int) GapiLens.t
    val exposureBias : (t, float) GapiLens.t
    val maxApertureValue : (t, float) GapiLens.t
    val subjectDistance : (t, int) GapiLens.t
    val lens : (t, string) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Capabilities :
  sig
    type t = {
      canChangeViewersCanCopyContent : bool;
      (** Deprecated: Output only. *)
      canMoveChildrenOutOfDrive : bool;
      (** Output only. Whether the current user can move children of this folder outside of the shared drive. This is false when the item is not a folder. Only populated for items in shared drives. *)
      canReadDrive : bool;
      (** Output only. Whether the current user can read the shared drive to which this file belongs. Only populated for items in shared drives. *)
      canEdit : bool;
      (** Output only. Whether the current user can edit this file. Other factors may limit the type of changes a user can make to a file. For example, see `canChangeCopyRequiresWriterPermission` or `canModifyContent`. *)
      canCopy : bool;
      (** Output only. Whether the current user can copy this file. For an item in a shared drive, whether the current user can copy non-folder descendants of this item, or this item itself if it is not a folder. *)
      canComment : bool;
      (** Output only. Whether the current user can comment on this file. *)
      canAddChildren : bool;
      (** Output only. Whether the current user can add children to this folder. This is always false when the item is not a folder. *)
      canDelete : bool;
      (** Output only. Whether the current user can delete this file. *)
      canDownload : bool;
      (** Output only. Whether the current user can download this file. *)
      canListChildren : bool;
      (** Output only. Whether the current user can list the children of this folder. This is always false when the item is not a folder. *)
      canRemoveChildren : bool;
      (** Output only. Whether the current user can remove children from this folder. This is always false when the item is not a folder. For a folder in a shared drive, use `canDeleteChildren` or `canTrashChildren` instead. *)
      canRename : bool;
      (** Output only. Whether the current user can rename this file. *)
      canTrash : bool;
      (** Output only. Whether the current user can move this file to trash. *)
      canReadRevisions : bool;
      (** Output only. Whether the current user can read the revisions resource of this file. For a shared drive item, whether revisions of non-folder descendants of this item, or this item itself if it is not a folder, can be read. *)
      canReadTeamDrive : bool;
      (** Deprecated: Output only. Use `canReadDrive` instead. *)
      canMoveTeamDriveItem : bool;
      (** Deprecated: Output only. Use `canMoveItemWithinDrive` or `canMoveItemOutOfDrive` instead. *)
      canChangeCopyRequiresWriterPermission : bool;
      (** Output only. Whether the current user can change the `copyRequiresWriterPermission` restriction of this file. *)
      canMoveItemIntoTeamDrive : bool;
      (** Deprecated: Output only. Use `canMoveItemOutOfDrive` instead. *)
      canUntrash : bool;
      (** Output only. Whether the current user can restore this file from trash. *)
      canModifyContent : bool;
      (** Output only. Whether the current user can modify the content of this file. *)
      canMoveItemWithinTeamDrive : bool;
      (** Deprecated: Output only. Use `canMoveItemWithinDrive` instead. *)
      canMoveItemOutOfTeamDrive : bool;
      (** Deprecated: Output only. Use `canMoveItemOutOfDrive` instead. *)
      canDeleteChildren : bool;
      (** Output only. Whether the current user can delete children of this folder. This is false when the item is not a folder. Only populated for items in shared drives. *)
      canMoveChildrenOutOfTeamDrive : bool;
      (** Deprecated: Output only. Use `canMoveChildrenOutOfDrive` instead. *)
      canMoveChildrenWithinTeamDrive : bool;
      (** Deprecated: Output only. Use `canMoveChildrenWithinDrive` instead. *)
      canTrashChildren : bool;
      (** Output only. Whether the current user can trash children of this folder. This is false when the item is not a folder. Only populated for items in shared drives. *)
      canMoveItemOutOfDrive : bool;
      (** Output only. Whether the current user can move this item outside of this drive by changing its parent. Note that a request to change the parent of the item may still fail depending on the new parent that is being added. *)
      canAddMyDriveParent : bool;
      (** Output only. Whether the current user can add a parent for the item without removing an existing parent in the same request. Not populated for shared drive files. *)
      canRemoveMyDriveParent : bool;
      (** Output only. Whether the current user can remove a parent from the item without adding another parent in the same request. Not populated for shared drive files. *)
      canMoveItemWithinDrive : bool;
      (** Output only. Whether the current user can move this item within this drive. Note that a request to change the parent of the item may still fail depending on the new parent that is being added and the parent that is being removed. *)
      canShare : bool;
      (** Output only. Whether the current user can modify the sharing settings for this file. *)
      canMoveChildrenWithinDrive : bool;
      (** Output only. Whether the current user can move children of this folder within this drive. This is false when the item is not a folder. Note that a request to move the child may still fail depending on the current user's access to the child and to the destination folder. *)
      canModifyContentRestriction : bool;
      (** Deprecated: Output only. Use one of `canModifyEditorContentRestriction`, `canModifyOwnerContentRestriction` or `canRemoveContentRestriction`. *)
      canAddFolderFromAnotherDrive : bool;
      (** Output only. Whether the current user can add a folder from another drive (different shared drive or My Drive) to this folder. This is false when the item is not a folder. Only populated for items in shared drives. *)
      canChangeSecurityUpdateEnabled : bool;
      (** Output only. Whether the current user can change the securityUpdateEnabled field on link share metadata. *)
      canAcceptOwnership : bool;
      (** Output only. Whether the current user is the pending owner of the file. Not populated for shared drive files. *)
      canReadLabels : bool;
      (** Output only. Whether the current user can read the labels on the file. *)
      canModifyLabels : bool;
      (** Output only. Whether the current user can modify the labels on the file. *)
      canModifyEditorContentRestriction : bool;
      (** Output only. Whether the current user can add or modify content restrictions on the file which are editor restricted. *)
      canModifyOwnerContentRestriction : bool;
      (** Output only. Whether the current user can add or modify content restrictions which are owner restricted. *)
      canRemoveContentRestriction : bool;
      (** Output only. Whether there is a content restriction on the file that can be removed by the current user. *)
      canDisableInheritedPermissions : bool;
      (** Whether a user can disable inherited permissions. *)
      canEnableInheritedPermissions : bool;
      (** Whether a user can re-enable inherited permissions. *)
      
    }
    
    val canChangeViewersCanCopyContent : (t, bool) GapiLens.t
    val canMoveChildrenOutOfDrive : (t, bool) GapiLens.t
    val canReadDrive : (t, bool) GapiLens.t
    val canEdit : (t, bool) GapiLens.t
    val canCopy : (t, bool) GapiLens.t
    val canComment : (t, bool) GapiLens.t
    val canAddChildren : (t, bool) GapiLens.t
    val canDelete : (t, bool) GapiLens.t
    val canDownload : (t, bool) GapiLens.t
    val canListChildren : (t, bool) GapiLens.t
    val canRemoveChildren : (t, bool) GapiLens.t
    val canRename : (t, bool) GapiLens.t
    val canTrash : (t, bool) GapiLens.t
    val canReadRevisions : (t, bool) GapiLens.t
    val canReadTeamDrive : (t, bool) GapiLens.t
    val canMoveTeamDriveItem : (t, bool) GapiLens.t
    val canChangeCopyRequiresWriterPermission : (t, bool) GapiLens.t
    val canMoveItemIntoTeamDrive : (t, bool) GapiLens.t
    val canUntrash : (t, bool) GapiLens.t
    val canModifyContent : (t, bool) GapiLens.t
    val canMoveItemWithinTeamDrive : (t, bool) GapiLens.t
    val canMoveItemOutOfTeamDrive : (t, bool) GapiLens.t
    val canDeleteChildren : (t, bool) GapiLens.t
    val canMoveChildrenOutOfTeamDrive : (t, bool) GapiLens.t
    val canMoveChildrenWithinTeamDrive : (t, bool) GapiLens.t
    val canTrashChildren : (t, bool) GapiLens.t
    val canMoveItemOutOfDrive : (t, bool) GapiLens.t
    val canAddMyDriveParent : (t, bool) GapiLens.t
    val canRemoveMyDriveParent : (t, bool) GapiLens.t
    val canMoveItemWithinDrive : (t, bool) GapiLens.t
    val canShare : (t, bool) GapiLens.t
    val canMoveChildrenWithinDrive : (t, bool) GapiLens.t
    val canModifyContentRestriction : (t, bool) GapiLens.t
    val canAddFolderFromAnotherDrive : (t, bool) GapiLens.t
    val canChangeSecurityUpdateEnabled : (t, bool) GapiLens.t
    val canAcceptOwnership : (t, bool) GapiLens.t
    val canReadLabels : (t, bool) GapiLens.t
    val canModifyLabels : (t, bool) GapiLens.t
    val canModifyEditorContentRestriction : (t, bool) GapiLens.t
    val canModifyOwnerContentRestriction : (t, bool) GapiLens.t
    val canRemoveContentRestriction : (t, bool) GapiLens.t
    val canDisableInheritedPermissions : (t, bool) GapiLens.t
    val canEnableInheritedPermissions : (t, bool) GapiLens.t
    
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
  
  type t = {
    kind : string;
    (** Output only. Identifies what kind of resource this is. Value: the fixed string `"drive#file"`. *)
    driveId : string;
    (** Output only. ID of the shared drive the file resides in. Only populated for items in shared drives. *)
    fileExtension : string;
    (** Output only. The final component of `fullFileExtension`. This is only available for files with binary content in Google Drive. *)
    copyRequiresWriterPermission : bool;
    (** Whether the options to copy, print, or download this file, should be disabled for readers and commenters. *)
    md5Checksum : string;
    (** Output only. The MD5 checksum for the content of the file. This is only applicable to files with binary content in Google Drive. *)
    contentHints : ContentHints.t;
    (** Additional information about the content of the file. These fields are never populated in responses. *)
    writersCanShare : bool;
    (** Whether users with only `writer` permission can modify the file's permissions. Not populated for items in shared drives. *)
    viewedByMe : bool;
    (** Output only. Whether the file has been viewed by this user. *)
    mimeType : string;
    (** The MIME type of the file. Google Drive attempts to automatically detect an appropriate value from uploaded content, if no value is provided. The value cannot be changed unless a new revision is uploaded. If a file is created with a Google Doc MIME type, the uploaded content is imported, if possible. The supported import formats are published in the About resource. *)
    exportLinks : (string * string) list;
    (** Output only. Links for exporting Docs Editors files to specific formats. *)
    parents : string list;
    (** The ID of the parent folder containing the file. A file can only have one parent folder; specifying multiple parents isn't supported. If not specified as part of a create request, the file is placed directly in the user's My Drive folder. If not specified as part of a copy request, the file inherits any discoverable parent of the source file. Update requests must use the `addParents` and `removeParents` parameters to modify the parents list. *)
    thumbnailLink : string;
    (** Output only. A short-lived link to the file's thumbnail, if available. Typically lasts on the order of hours. Not intended for direct usage on web applications due to \[Cross-Origin Resource Sharing (CORS)\](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) policies, consider using a proxy server. Only populated when the requesting app can access the file's content. If the file isn't shared publicly, the URL returned in `Files.thumbnailLink` must be fetched using a credentialed request. *)
    iconLink : string;
    (** Output only. A static, unauthenticated link to the file's icon. *)
    shared : bool;
    (** Output only. Whether the file has been shared. Not populated for items in shared drives. *)
    lastModifyingUser : User.t;
    (** Output only. The last user to modify the file. This field is only populated when the last modification was performed by a signed-in user. *)
    owners : User.t list;
    (** Output only. The owner of this file. Only certain legacy files may have more than one owner. This field isn't populated for items in shared drives. *)
    headRevisionId : string;
    (** Output only. The ID of the file's head revision. This is currently only available for files with binary content in Google Drive. *)
    sharingUser : User.t;
    (** Output only. The user who shared the file with the requesting user, if applicable. *)
    webViewLink : string;
    (** Output only. A link for opening the file in a relevant Google editor or viewer in a browser. *)
    webContentLink : string;
    (** Output only. A link for downloading the content of the file in a browser. This is only available for files with binary content in Google Drive. *)
    size : int64;
    (** Output only. Size in bytes of blobs and first party editor files. Won't be populated for files that have no size, like shortcuts and folders. *)
    viewersCanCopyContent : bool;
    (** Deprecated: Use `copyRequiresWriterPermission` instead. *)
    permissions : Permission.t list;
    (** Output only. The full list of permissions for the file. This is only available if the requesting user can share the file. Not populated for items in shared drives. *)
    hasThumbnail : bool;
    (** Output only. Whether this file has a thumbnail. This does not indicate whether the requesting app has access to the thumbnail. To check access, look for the presence of the thumbnailLink field. *)
    spaces : string list;
    (** Output only. The list of spaces which contain the file. The currently supported values are 'drive', 'appDataFolder' and 'photos'. *)
    folderColorRgb : string;
    (** The color for a folder or a shortcut to a folder as an RGB hex string. The supported colors are published in the `folderColorPalette` field of the About resource. If an unsupported color is specified, the closest color in the palette is used instead. *)
    id : string;
    (** The ID of the file. *)
    name : string;
    (** The name of the file. This is not necessarily unique within a folder. Note that for immutable items such as the top level folders of shared drives, My Drive root folder, and Application Data folder the name is constant. *)
    description : string;
    (** A short description of the file. *)
    starred : bool;
    (** Whether the user has starred the file. *)
    trashed : bool;
    (** Whether the file has been trashed, either explicitly or from a trashed parent folder. Only the owner may trash a file, and other users cannot see files in the owner's trash. *)
    explicitlyTrashed : bool;
    (** Output only. Whether the file has been explicitly trashed, as opposed to recursively trashed from a parent folder. *)
    createdTime : GapiDate.t;
    (** The time at which the file was created (RFC 3339 date-time). *)
    modifiedTime : GapiDate.t;
    (** he last time the file was modified by anyone (RFC 3339 date-time). Note that setting modifiedTime will also update modifiedByMeTime for the user. *)
    modifiedByMeTime : GapiDate.t;
    (** The last time the file was modified by the user (RFC 3339 date-time). *)
    viewedByMeTime : GapiDate.t;
    (** The last time the file was viewed by the user (RFC 3339 date-time). *)
    sharedWithMeTime : GapiDate.t;
    (** The time at which the file was shared with the user, if applicable (RFC 3339 date-time). *)
    quotaBytesUsed : int64;
    (** Output only. The number of storage quota bytes used by the file. This includes the head revision as well as previous revisions with `keepForever` enabled. *)
    version : int64;
    (** Output only. A monotonically increasing version number for the file. This reflects every change made to the file on the server, even those not visible to the user. *)
    originalFilename : string;
    (** The original filename of the uploaded content if available, or else the original value of the `name` field. This is only available for files with binary content in Google Drive. *)
    ownedByMe : bool;
    (** Output only. Whether the user owns the file. Not populated for items in shared drives. *)
    fullFileExtension : string;
    (** Output only. The full file extension extracted from the `name` field. May contain multiple concatenated extensions, such as "tar.gz". This is only available for files with binary content in Google Drive. This is automatically updated when the `name` field changes, however it is not cleared if the new name does not contain a valid extension. *)
    properties : (string * string) list;
    (** A collection of arbitrary key-value pairs which are visible to all apps.
Entries with null values are cleared in update and copy requests. *)
    appProperties : (string * string) list;
    (** A collection of arbitrary key-value pairs which are private to the requesting app.
Entries with null values are cleared in update and copy requests. These properties can only be retrieved using an authenticated request. An authenticated request uses an access token obtained with a OAuth 2 client ID. You cannot use an API key to retrieve private properties. *)
    isAppAuthorized : bool;
    (** Output only. Whether the file was created or opened by the requesting app. *)
    teamDriveId : string;
    (** Deprecated: Output only. Use `driveId` instead. *)
    capabilities : Capabilities.t;
    (** Output only. Capabilities the current user has on this file. Each capability corresponds to a fine-grained action that a user may take. *)
    hasAugmentedPermissions : bool;
    (** Output only. Whether there are permissions directly on this file. This field is only populated for items in shared drives. *)
    trashingUser : User.t;
    (** Output only. If the file has been explicitly trashed, the user who trashed it. Only populated for items in shared drives. *)
    thumbnailVersion : int64;
    (** Output only. The thumbnail version for use in thumbnail cache invalidation. *)
    trashedTime : GapiDate.t;
    (** The time that the item was trashed (RFC 3339 date-time). Only populated for items in shared drives. *)
    modifiedByMe : bool;
    (** Output only. Whether the file has been modified by this user. *)
    permissionIds : string list;
    (** Output only. List of permission IDs for users with access to this file. *)
    imageMediaMetadata : ImageMediaMetadata.t;
    (** Output only. Additional metadata about image media, if available. *)
    videoMediaMetadata : VideoMediaMetadata.t;
    (** Output only. Additional metadata about video media. This may not be available immediately upon upload. *)
    shortcutDetails : ShortcutDetails.t;
    (** Shortcut file details. Only populated for shortcut files, which have the mimeType field set to `application/vnd.google-apps.shortcut`. Can only be set on `files.create` requests. *)
    contentRestrictions : ContentRestriction.t list;
    (** Restrictions for accessing the content of the file. Only populated if such a restriction exists. *)
    resourceKey : string;
    (** Output only. A key needed to access the item via a shared link. *)
    linkShareMetadata : LinkShareMetadata.t;
    (** Contains details about the link URLs that clients are using to refer to this item. *)
    labelInfo : LabelInfo.t;
    (** Output only. An overview of the labels on the file. *)
    sha1Checksum : string;
    (** Output only. The SHA1 checksum associated with this file, if available. This field is only populated for files with content stored in Google Drive; it is not populated for Docs Editors or shortcut files. *)
    sha256Checksum : string;
    (** Output only. The SHA256 checksum associated with this file, if available. This field is only populated for files with content stored in Google Drive; it is not populated for Docs Editors or shortcut files. *)
    inheritedPermissionsDisabled : bool;
    (** Whether this file has inherited permissions disabled. Inherited permissions are enabled by default. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val driveId : (t, string) GapiLens.t
  val fileExtension : (t, string) GapiLens.t
  val copyRequiresWriterPermission : (t, bool) GapiLens.t
  val md5Checksum : (t, string) GapiLens.t
  val contentHints : (t, ContentHints.t) GapiLens.t
  val writersCanShare : (t, bool) GapiLens.t
  val viewedByMe : (t, bool) GapiLens.t
  val mimeType : (t, string) GapiLens.t
  val exportLinks : (t, (string * string) list) GapiLens.t
  val parents : (t, string list) GapiLens.t
  val thumbnailLink : (t, string) GapiLens.t
  val iconLink : (t, string) GapiLens.t
  val shared : (t, bool) GapiLens.t
  val lastModifyingUser : (t, User.t) GapiLens.t
  val owners : (t, User.t list) GapiLens.t
  val headRevisionId : (t, string) GapiLens.t
  val sharingUser : (t, User.t) GapiLens.t
  val webViewLink : (t, string) GapiLens.t
  val webContentLink : (t, string) GapiLens.t
  val size : (t, int64) GapiLens.t
  val viewersCanCopyContent : (t, bool) GapiLens.t
  val permissions : (t, Permission.t list) GapiLens.t
  val hasThumbnail : (t, bool) GapiLens.t
  val spaces : (t, string list) GapiLens.t
  val folderColorRgb : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val starred : (t, bool) GapiLens.t
  val trashed : (t, bool) GapiLens.t
  val explicitlyTrashed : (t, bool) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val modifiedTime : (t, GapiDate.t) GapiLens.t
  val modifiedByMeTime : (t, GapiDate.t) GapiLens.t
  val viewedByMeTime : (t, GapiDate.t) GapiLens.t
  val sharedWithMeTime : (t, GapiDate.t) GapiLens.t
  val quotaBytesUsed : (t, int64) GapiLens.t
  val version : (t, int64) GapiLens.t
  val originalFilename : (t, string) GapiLens.t
  val ownedByMe : (t, bool) GapiLens.t
  val fullFileExtension : (t, string) GapiLens.t
  val properties : (t, (string * string) list) GapiLens.t
  val appProperties : (t, (string * string) list) GapiLens.t
  val isAppAuthorized : (t, bool) GapiLens.t
  val teamDriveId : (t, string) GapiLens.t
  val capabilities : (t, Capabilities.t) GapiLens.t
  val hasAugmentedPermissions : (t, bool) GapiLens.t
  val trashingUser : (t, User.t) GapiLens.t
  val thumbnailVersion : (t, int64) GapiLens.t
  val trashedTime : (t, GapiDate.t) GapiLens.t
  val modifiedByMe : (t, bool) GapiLens.t
  val permissionIds : (t, string list) GapiLens.t
  val imageMediaMetadata : (t, ImageMediaMetadata.t) GapiLens.t
  val videoMediaMetadata : (t, VideoMediaMetadata.t) GapiLens.t
  val shortcutDetails : (t, ShortcutDetails.t) GapiLens.t
  val contentRestrictions : (t, ContentRestriction.t list) GapiLens.t
  val resourceKey : (t, string) GapiLens.t
  val linkShareMetadata : (t, LinkShareMetadata.t) GapiLens.t
  val labelInfo : (t, LabelInfo.t) GapiLens.t
  val sha1Checksum : (t, string) GapiLens.t
  val sha256Checksum : (t, string) GapiLens.t
  val inheritedPermissionsDisabled : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Status :
sig
  type t = {
    code : int;
    (** The status code, which should be an enum value of google.rpc.Code. *)
    message : string;
    (** A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client. *)
    details : (string * string) list list;
    (** A list of messages that carry the error details. There is a common set of message types for APIs to use. *)
    
  }
  
  val code : (t, int) GapiLens.t
  val message : (t, string) GapiLens.t
  val details : (t, (string * string) list list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Operation :
sig
  type t = {
    name : string;
    (** The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/\{unique_id\}`. *)
    metadata : (string * string) list;
    (** Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any. *)
    _done : bool;
    (** If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available. *)
    error : Status.t;
    (** The error result of the operation in case of failure or cancellation. *)
    response : (string * string) list;
    (** The normal, successful response of the operation. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type `XxxResponse`, where `Xxx` is the original method name. For example, if the original method name is `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`. *)
    
  }
  
  val name : (t, string) GapiLens.t
  val metadata : (t, (string * string) list) GapiLens.t
  val _done : (t, bool) GapiLens.t
  val error : (t, Status.t) GapiLens.t
  val response : (t, (string * string) list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ListOperationsResponse :
sig
  type t = {
    operations : Operation.t list;
    (** A list of operations that matches the specified filter in the request. *)
    nextPageToken : string;
    (** The standard List next-page token. *)
    
  }
  
  val operations : (t, Operation.t list) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
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
      copyRequiresWriterPermission : bool;
      (** Whether the options to copy, print, or download files inside this shared drive, should be disabled for readers and commenters. When this restriction is set to `true`, it will override the similarly named field to `true` for any file inside this shared drive. *)
      domainUsersOnly : bool;
      (** Whether access to this shared drive and items inside this shared drive is restricted to users of the domain to which this shared drive belongs. This restriction may be overridden by other sharing policies controlled outside of this shared drive. *)
      driveMembersOnly : bool;
      (** Whether access to items inside this shared drive is restricted to its members. *)
      adminManagedRestrictions : bool;
      (** Whether administrative privileges on this shared drive are required to modify restrictions. *)
      sharingFoldersRequiresOrganizerPermission : bool;
      (** If true, only users with the organizer role can share folders. If false, users with either the organizer role or the file organizer role can share folders. *)
      downloadRestriction : DownloadRestriction.t;
      (** Download restrictions applied by shared drive managers. *)
      
    }
    
    val copyRequiresWriterPermission : (t, bool) GapiLens.t
    val domainUsersOnly : (t, bool) GapiLens.t
    val driveMembersOnly : (t, bool) GapiLens.t
    val adminManagedRestrictions : (t, bool) GapiLens.t
    val sharingFoldersRequiresOrganizerPermission : (t, bool) GapiLens.t
    val downloadRestriction : (t, DownloadRestriction.t) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module BackgroundImageFile :
  sig
    type t = {
      id : string;
      (** The ID of an image file in Google Drive to use for the background image. *)
      xCoordinate : float;
      (** The X coordinate of the upper left corner of the cropping area in the background image. This is a value in the closed range of 0 to 1. This value represents the horizontal distance from the left side of the entire image to the left side of the cropping area divided by the width of the entire image. *)
      yCoordinate : float;
      (** The Y coordinate of the upper left corner of the cropping area in the background image. This is a value in the closed range of 0 to 1. This value represents the vertical distance from the top side of the entire image to the top side of the cropping area divided by the height of the entire image. *)
      width : float;
      (** The width of the cropped image in the closed range of 0 to 1. This value represents the width of the cropped image divided by the width of the entire image. The height is computed by applying a width to height aspect ratio of 80 to 9. The resulting image must be at least 1280 pixels wide and 144 pixels high. *)
      
    }
    
    val id : (t, string) GapiLens.t
    val xCoordinate : (t, float) GapiLens.t
    val yCoordinate : (t, float) GapiLens.t
    val width : (t, float) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  module Capabilities :
  sig
    type t = {
      canAddChildren : bool;
      (** Output only. Whether the current user can add children to folders in this shared drive. *)
      canComment : bool;
      (** Output only. Whether the current user can comment on files in this shared drive. *)
      canCopy : bool;
      (** Output only. Whether the current user can copy files in this shared drive. *)
      canDeleteDrive : bool;
      (** Output only. Whether the current user can delete this shared drive. Attempting to delete the shared drive may still fail if there are untrashed items inside the shared drive. *)
      canDownload : bool;
      (** Output only. Whether the current user can download files in this shared drive. *)
      canEdit : bool;
      (** Output only. Whether the current user can edit files in this shared drive *)
      canListChildren : bool;
      (** Output only. Whether the current user can list the children of folders in this shared drive. *)
      canManageMembers : bool;
      (** Output only. Whether the current user can add members to this shared drive or remove them or change their role. *)
      canReadRevisions : bool;
      (** Output only. Whether the current user can read the revisions resource of files in this shared drive. *)
      canRename : bool;
      (** Output only. Whether the current user can rename files or folders in this shared drive. *)
      canRenameDrive : bool;
      (** Output only. Whether the current user can rename this shared drive. *)
      canChangeDriveBackground : bool;
      (** Output only. Whether the current user can change the background of this shared drive. *)
      canShare : bool;
      (** Output only. Whether the current user can share files or folders in this shared drive. *)
      canChangeCopyRequiresWriterPermissionRestriction : bool;
      (** Output only. Whether the current user can change the `copyRequiresWriterPermission` restriction of this shared drive. *)
      canChangeDomainUsersOnlyRestriction : bool;
      (** Output only. Whether the current user can change the `domainUsersOnly` restriction of this shared drive. *)
      canChangeDriveMembersOnlyRestriction : bool;
      (** Output only. Whether the current user can change the `driveMembersOnly` restriction of this shared drive. *)
      canChangeSharingFoldersRequiresOrganizerPermissionRestriction : bool;
      (** Output only. Whether the current user can change the `sharingFoldersRequiresOrganizerPermission` restriction of this shared drive. *)
      canResetDriveRestrictions : bool;
      (** Output only. Whether the current user can reset the shared drive restrictions to defaults. *)
      canDeleteChildren : bool;
      (** Output only. Whether the current user can delete children from folders in this shared drive. *)
      canTrashChildren : bool;
      (** Output only. Whether the current user can trash children from folders in this shared drive. *)
      
    }
    
    val canAddChildren : (t, bool) GapiLens.t
    val canComment : (t, bool) GapiLens.t
    val canCopy : (t, bool) GapiLens.t
    val canDeleteDrive : (t, bool) GapiLens.t
    val canDownload : (t, bool) GapiLens.t
    val canEdit : (t, bool) GapiLens.t
    val canListChildren : (t, bool) GapiLens.t
    val canManageMembers : (t, bool) GapiLens.t
    val canReadRevisions : (t, bool) GapiLens.t
    val canRename : (t, bool) GapiLens.t
    val canRenameDrive : (t, bool) GapiLens.t
    val canChangeDriveBackground : (t, bool) GapiLens.t
    val canShare : (t, bool) GapiLens.t
    val canChangeCopyRequiresWriterPermissionRestriction : (t, bool) GapiLens.t
    val canChangeDomainUsersOnlyRestriction : (t, bool) GapiLens.t
    val canChangeDriveMembersOnlyRestriction : (t, bool) GapiLens.t
    val canChangeSharingFoldersRequiresOrganizerPermissionRestriction : (t, bool) GapiLens.t
    val canResetDriveRestrictions : (t, bool) GapiLens.t
    val canDeleteChildren : (t, bool) GapiLens.t
    val canTrashChildren : (t, bool) GapiLens.t
    
    val empty : t
    
    val render : t -> GapiJson.json_data_model list
    
    val parse : t -> GapiJson.json_data_model -> t
    
  end
  
  type t = {
    id : string;
    (** Output only. The ID of this shared drive which is also the ID of the top level folder of this shared drive. *)
    name : string;
    (** The name of this shared drive. *)
    colorRgb : string;
    (** The color of this shared drive as an RGB hex string. It can only be set on a `drive.drives.update` request that does not set `themeId`. *)
    kind : string;
    (** Output only. Identifies what kind of resource this is. Value: the fixed string `"drive#drive"`. *)
    backgroundImageLink : string;
    (** Output only. A short-lived link to this shared drive's background image. *)
    capabilities : Capabilities.t;
    (** Output only. Capabilities the current user has on this shared drive. *)
    themeId : string;
    (** The ID of the theme from which the background image and color will be set. The set of possible `driveThemes` can be retrieved from a `drive.about.get` response. When not specified on a `drive.drives.create` request, a random theme is chosen from which the background image and color are set. This is a write-only field; it can only be set on requests that don't set `colorRgb` or `backgroundImageFile`. *)
    backgroundImageFile : BackgroundImageFile.t;
    (** An image file and cropping parameters from which a background image for this shared drive is set. This is a write only field; it can only be set on `drive.drives.update` requests that don't set `themeId`. When specified, all fields of the `backgroundImageFile` must be set. *)
    createdTime : GapiDate.t;
    (** The time at which the shared drive was created (RFC 3339 date-time). *)
    hidden : bool;
    (** Whether the shared drive is hidden from default view. *)
    restrictions : Restrictions.t;
    (** A set of restrictions that apply to this shared drive or items inside this shared drive. Note that restrictions can't be set when creating a shared drive. To add a restriction, first create a shared drive and then use `drives.update` to add restrictions. *)
    orgUnitId : string;
    (** Output only. The organizational unit of this shared drive. This field is only populated on `drives.list` responses when the `useDomainAdminAccess` parameter is set to `true`. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val colorRgb : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val backgroundImageLink : (t, string) GapiLens.t
  val capabilities : (t, Capabilities.t) GapiLens.t
  val themeId : (t, string) GapiLens.t
  val backgroundImageFile : (t, BackgroundImageFile.t) GapiLens.t
  val createdTime : (t, GapiDate.t) GapiLens.t
  val hidden : (t, bool) GapiLens.t
  val restrictions : (t, Restrictions.t) GapiLens.t
  val orgUnitId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Change :
sig
  type t = {
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#change"`. *)
    removed : bool;
    (** Whether the file or shared drive has been removed from this list of changes, for example by deletion or loss of access. *)
    file : File.t;
    (** The updated state of the file. Present if the type is file and the file has not been removed from this list of changes. *)
    fileId : string;
    (** The ID of the file which has changed. *)
    time : GapiDate.t;
    (** The time of this change (RFC 3339 date-time). *)
    driveId : string;
    (** The ID of the shared drive associated with this change. *)
    _type : string;
    (** Deprecated: Use `changeType` instead. *)
    teamDriveId : string;
    (** Deprecated: Use `driveId` instead. *)
    teamDrive : TeamDrive.t;
    (** Deprecated: Use `drive` instead. *)
    changeType : string;
    (** The type of the change. Possible values are `file` and `drive`. *)
    drive : Drive.t;
    (** The updated state of the shared drive. Present if the changeType is drive, the user is still a member of the shared drive, and the shared drive has not been deleted. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val removed : (t, bool) GapiLens.t
  val file : (t, File.t) GapiLens.t
  val fileId : (t, string) GapiLens.t
  val time : (t, GapiDate.t) GapiLens.t
  val driveId : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val teamDriveId : (t, string) GapiLens.t
  val teamDrive : (t, TeamDrive.t) GapiLens.t
  val changeType : (t, string) GapiLens.t
  val drive : (t, Drive.t) GapiLens.t
  
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
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#replyList"`. *)
    replies : Reply.t list;
    (** The list of replies. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    nextPageToken : string;
    (** The page token for the next page of replies. This will be absent if the end of the replies list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. The page token is typically valid for several hours. However, if new items are added or removed, your expected results might differ. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val replies : (t, Reply.t list) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ResolveAccessProposalRequest :
sig
  type t = {
    role : string list;
    (** Optional. The roles the approver has allowed, if any. Note: This field is required for the `ACCEPT` action. *)
    view : string;
    (** Optional. Indicates the view for this access proposal. This should only be set when the proposal belongs to a view. `published` is the only supported value. *)
    action : string;
    (** Required. The action to take on the AccessProposal. *)
    sendNotification : bool;
    (** Optional. Whether to send an email to the requester when the AccessProposal is denied or accepted. *)
    
  }
  
  val role : (t, string list) GapiLens.t
  val view : (t, string) GapiLens.t
  val action : (t, string) GapiLens.t
  val sendNotification : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module LabelModification :
sig
  type t = {
    labelId : string;
    (** The ID of the label to modify. *)
    fieldModifications : LabelFieldModification.t list;
    (** The list of modifications to this label's fields. *)
    removeLabel : bool;
    (** If true, the label will be removed from the file. *)
    kind : string;
    (** This is always drive#labelModification. *)
    
  }
  
  val labelId : (t, string) GapiLens.t
  val fieldModifications : (t, LabelFieldModification.t list) GapiLens.t
  val removeLabel : (t, bool) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ModifyLabelsRequest :
sig
  type t = {
    labelModifications : LabelModification.t list;
    (** The list of modifications to apply to the labels on the file. *)
    kind : string;
    (** This is always drive#modifyLabelsRequest. *)
    
  }
  
  val labelModifications : (t, LabelModification.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PermissionList :
sig
  type t = {
    nextPageToken : string;
    (** The page token for the next page of permissions. This field will be absent if the end of the permissions list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. The page token is typically valid for several hours. However, if new items are added or removed, your expected results might differ. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#permissionList"`. *)
    permissions : Permission.t list;
    (** The list of permissions. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    
  }
  
  val nextPageToken : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val permissions : (t, Permission.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ModifyLabelsResponse :
sig
  type t = {
    modifiedLabels : Label.t list;
    (** The list of labels which were added or updated by the request. *)
    kind : string;
    (** This is always drive#modifyLabelsResponse *)
    
  }
  
  val modifiedLabels : (t, Label.t list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ChangeList :
sig
  type t = {
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#changeList"`. *)
    nextPageToken : string;
    (** The page token for the next page of changes. This will be absent if the end of the changes list has been reached. The page token doesn't expire. *)
    newStartPageToken : string;
    (** The starting page token for future changes. This will be present only if the end of the current changes list has been reached. The page token doesn't expire. *)
    changes : Change.t list;
    (** The list of changes. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    
  }
  
  val kind : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val newStartPageToken : (t, string) GapiLens.t
  val changes : (t, Change.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AccessProposalRoleAndView :
sig
  type t = {
    role : string;
    (** The role that was proposed by the requester New values may be added in the future, but the following are currently possible: * `writer` * `commenter` * `reader` *)
    view : string;
    (** Indicates the view for this access proposal. Only populated for proposals that belong to a view. `published` is the only supported value. *)
    
  }
  
  val role : (t, string) GapiLens.t
  val view : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module StartPageToken :
sig
  type t = {
    startPageToken : string;
    (** The starting page token for listing future changes. The page token doesn't expire. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#startPageToken"`. *)
    
  }
  
  val startPageToken : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AccessProposal :
sig
  type t = {
    fileId : string;
    (** The file id that the proposal for access is on *)
    proposalId : string;
    (** The id of the access proposal *)
    requesterEmailAddress : string;
    (** The email address of the requesting user *)
    recipientEmailAddress : string;
    (** The email address of the user that will receive permissions if accepted *)
    rolesAndViews : AccessProposalRoleAndView.t list;
    (** A wrapper for the role and view of an access proposal. *)
    requestMessage : string;
    (** The message that the requester added to the proposal *)
    createTime : string;
    (** The creation time *)
    
  }
  
  val fileId : (t, string) GapiLens.t
  val proposalId : (t, string) GapiLens.t
  val requesterEmailAddress : (t, string) GapiLens.t
  val recipientEmailAddress : (t, string) GapiLens.t
  val rolesAndViews : (t, AccessProposalRoleAndView.t list) GapiLens.t
  val requestMessage : (t, string) GapiLens.t
  val createTime : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ListAccessProposalsResponse :
sig
  type t = {
    accessProposals : AccessProposal.t list;
    (** The list of Access Proposals. This field is only populated in v3 and v3beta. *)
    nextPageToken : string;
    (** The continuation token for the next page of results. This will be absent if the end of the results list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. *)
    
  }
  
  val accessProposals : (t, AccessProposal.t list) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module RevisionList :
sig
  type t = {
    nextPageToken : string;
    (** The page token for the next page of revisions. This will be absent if the end of the revisions list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. The page token is typically valid for several hours. However, if new items are added or removed, your expected results might differ. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#revisionList"`. *)
    revisions : Revision.t list;
    (** The list of revisions. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    
  }
  
  val nextPageToken : (t, string) GapiLens.t
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
    payload : bool;
    (** A Boolean value to indicate whether payload is wanted. Optional. *)
    id : string;
    (** A UUID or similar unique string that identifies this channel. *)
    resourceId : string;
    (** An opaque ID that identifies the resource being watched on this channel. Stable across different API versions. *)
    resourceUri : string;
    (** A version-specific identifier for the watched resource. *)
    token : string;
    (** An arbitrary string delivered to the target address with each notification delivered over this channel. Optional. *)
    expiration : int64;
    (** Date and time of notification channel expiration, expressed as a Unix timestamp, in milliseconds. Optional. *)
    _type : string;
    (** The type of delivery mechanism used for this channel. Valid values are "web_hook" or "webhook". *)
    address : string;
    (** The address where notifications are delivered for this channel. *)
    params : (string * string) list;
    (** Additional parameters controlling delivery channel behavior. Optional. *)
    kind : string;
    (** Identifies this as a notification channel used to watch for changes to a resource, which is `api#channel`. *)
    
  }
  
  val payload : (t, bool) GapiLens.t
  val id : (t, string) GapiLens.t
  val resourceId : (t, string) GapiLens.t
  val resourceUri : (t, string) GapiLens.t
  val token : (t, string) GapiLens.t
  val expiration : (t, int64) GapiLens.t
  val _type : (t, string) GapiLens.t
  val address : (t, string) GapiLens.t
  val params : (t, (string * string) list) GapiLens.t
  val kind : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FileList :
sig
  type t = {
    nextPageToken : string;
    (** The page token for the next page of files. This will be absent if the end of the files list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. The page token is typically valid for several hours. However, if new items are added or removed, your expected results might differ. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#fileList"`. *)
    incompleteSearch : bool;
    (** Whether the search process was incomplete. If true, then some search results might be missing, since all documents were not searched. This can occur when searching multiple drives with the 'allDrives' corpora, but all corpora couldn't be searched. When this happens, it's suggested that clients narrow their query by choosing a different corpus such as 'user' or 'drive'. *)
    files : File.t list;
    (** The list of files. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    
  }
  
  val nextPageToken : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val incompleteSearch : (t, bool) GapiLens.t
  val files : (t, File.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module DriveList :
sig
  type t = {
    nextPageToken : string;
    (** The page token for the next page of shared drives. This will be absent if the end of the list has been reached. If the token is rejected for any reason, it should be discarded, and pagination should be restarted from the first page of results. The page token is typically valid for several hours. However, if new items are added or removed, your expected results might differ. *)
    kind : string;
    (** Identifies what kind of resource this is. Value: the fixed string `"drive#driveList"`. *)
    drives : Drive.t list;
    (** The list of shared drives. If nextPageToken is populated, then this list may be incomplete and an additional page of results should be fetched. *)
    
  }
  
  val nextPageToken : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val drives : (t, Drive.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

