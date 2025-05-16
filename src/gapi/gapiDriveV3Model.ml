(* Warning! This file is generated. Modify at your own risk.
        *)

module LabelFieldModification =
struct
  type t = {
    fieldId : string;
    kind : string;
    setDateValues : GapiDate.t list;
    setTextValues : string list;
    setSelectionValues : string list;
    setIntegerValues : int64 list;
    setUserValues : string list;
    unsetValues : bool;
    
  }
  
  let fieldId = {
    GapiLens.get = (fun x -> x.fieldId);
    GapiLens.set = (fun v x -> { x with fieldId = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let setDateValues = {
    GapiLens.get = (fun x -> x.setDateValues);
    GapiLens.set = (fun v x -> { x with setDateValues = v });
  }
  let setTextValues = {
    GapiLens.get = (fun x -> x.setTextValues);
    GapiLens.set = (fun v x -> { x with setTextValues = v });
  }
  let setSelectionValues = {
    GapiLens.get = (fun x -> x.setSelectionValues);
    GapiLens.set = (fun v x -> { x with setSelectionValues = v });
  }
  let setIntegerValues = {
    GapiLens.get = (fun x -> x.setIntegerValues);
    GapiLens.set = (fun v x -> { x with setIntegerValues = v });
  }
  let setUserValues = {
    GapiLens.get = (fun x -> x.setUserValues);
    GapiLens.set = (fun v x -> { x with setUserValues = v });
  }
  let unsetValues = {
    GapiLens.get = (fun x -> x.unsetValues);
    GapiLens.set = (fun v x -> { x with unsetValues = v });
  }
  
  let empty = {
    fieldId = "";
    kind = "";
    setDateValues = [];
    setTextValues = [];
    setSelectionValues = [];
    setIntegerValues = [];
    setUserValues = [];
    unsetValues = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "fieldId" x.fieldId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "setDateValues" (GapiJson.render_date_value "") x.setDateValues;
      GapiJson.render_array "setTextValues" (GapiJson.render_string_value "") x.setTextValues;
      GapiJson.render_array "setSelectionValues" (GapiJson.render_string_value "") x.setSelectionValues;
      GapiJson.render_array "setIntegerValues" (GapiJson.render_int64_value "") x.setIntegerValues;
      GapiJson.render_array "setUserValues" (GapiJson.render_string_value "") x.setUserValues;
      GapiJson.render_bool_value "unsetValues" x.unsetValues;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fieldId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fieldId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "setDateValues"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            GapiDate.of_string v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelFieldModification.parse.parse_collection" e x')
        GapiDate.epoch
        (fun v -> { x with setDateValues = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "setTextValues"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelFieldModification.parse.parse_collection" e x')
        ""
        (fun v -> { x with setTextValues = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "setSelectionValues"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelFieldModification.parse.parse_collection" e x')
        ""
        (fun v -> { x with setSelectionValues = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "setIntegerValues"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            Int64.of_string v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelFieldModification.parse.parse_collection" e x')
        0L
        (fun v -> { x with setIntegerValues = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "setUserValues"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelFieldModification.parse.parse_collection" e x')
        ""
        (fun v -> { x with setUserValues = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "unsetValues"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with unsetValues = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.LabelFieldModification.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DownloadRestriction =
struct
  type t = {
    restrictedForReaders : bool;
    restrictedForWriters : bool;
    
  }
  
  let restrictedForReaders = {
    GapiLens.get = (fun x -> x.restrictedForReaders);
    GapiLens.set = (fun v x -> { x with restrictedForReaders = v });
  }
  let restrictedForWriters = {
    GapiLens.get = (fun x -> x.restrictedForWriters);
    GapiLens.set = (fun v x -> { x with restrictedForWriters = v });
  }
  
  let empty = {
    restrictedForReaders = false;
    restrictedForWriters = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "restrictedForReaders" x.restrictedForReaders;
      GapiJson.render_bool_value "restrictedForWriters" x.restrictedForWriters;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "restrictedForReaders"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with restrictedForReaders = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "restrictedForWriters"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with restrictedForWriters = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.DownloadRestriction.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TeamDrive =
struct
  module Restrictions =
  struct
    type t = {
      copyRequiresWriterPermission : bool;
      domainUsersOnly : bool;
      teamMembersOnly : bool;
      adminManagedRestrictions : bool;
      sharingFoldersRequiresOrganizerPermission : bool;
      downloadRestriction : DownloadRestriction.t;
      
    }
    
    let copyRequiresWriterPermission = {
      GapiLens.get = (fun x -> x.copyRequiresWriterPermission);
      GapiLens.set = (fun v x -> { x with copyRequiresWriterPermission = v });
    }
    let domainUsersOnly = {
      GapiLens.get = (fun x -> x.domainUsersOnly);
      GapiLens.set = (fun v x -> { x with domainUsersOnly = v });
    }
    let teamMembersOnly = {
      GapiLens.get = (fun x -> x.teamMembersOnly);
      GapiLens.set = (fun v x -> { x with teamMembersOnly = v });
    }
    let adminManagedRestrictions = {
      GapiLens.get = (fun x -> x.adminManagedRestrictions);
      GapiLens.set = (fun v x -> { x with adminManagedRestrictions = v });
    }
    let sharingFoldersRequiresOrganizerPermission = {
      GapiLens.get = (fun x -> x.sharingFoldersRequiresOrganizerPermission);
      GapiLens.set = (fun v x -> { x with sharingFoldersRequiresOrganizerPermission = v });
    }
    let downloadRestriction = {
      GapiLens.get = (fun x -> x.downloadRestriction);
      GapiLens.set = (fun v x -> { x with downloadRestriction = v });
    }
    
    let empty = {
      copyRequiresWriterPermission = false;
      domainUsersOnly = false;
      teamMembersOnly = false;
      adminManagedRestrictions = false;
      sharingFoldersRequiresOrganizerPermission = false;
      downloadRestriction = DownloadRestriction.empty;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "copyRequiresWriterPermission" x.copyRequiresWriterPermission;
        GapiJson.render_bool_value "domainUsersOnly" x.domainUsersOnly;
        GapiJson.render_bool_value "teamMembersOnly" x.teamMembersOnly;
        GapiJson.render_bool_value "adminManagedRestrictions" x.adminManagedRestrictions;
        GapiJson.render_bool_value "sharingFoldersRequiresOrganizerPermission" x.sharingFoldersRequiresOrganizerPermission;
        (fun v -> GapiJson.render_object "downloadRestriction" (DownloadRestriction.render_content v)) x.downloadRestriction;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "copyRequiresWriterPermission"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with copyRequiresWriterPermission = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "domainUsersOnly"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with domainUsersOnly = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "teamMembersOnly"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with teamMembersOnly = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "adminManagedRestrictions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with adminManagedRestrictions = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "sharingFoldersRequiresOrganizerPermission"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with sharingFoldersRequiresOrganizerPermission = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "downloadRestriction"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          DownloadRestriction.parse
          DownloadRestriction.empty
          (fun v -> { x with downloadRestriction = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.Restrictions.parse" e x
    
  end
  
  module BackgroundImageFile =
  struct
    type t = {
      id : string;
      xCoordinate : float;
      yCoordinate : float;
      width : float;
      
    }
    
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    let xCoordinate = {
      GapiLens.get = (fun x -> x.xCoordinate);
      GapiLens.set = (fun v x -> { x with xCoordinate = v });
    }
    let yCoordinate = {
      GapiLens.get = (fun x -> x.yCoordinate);
      GapiLens.set = (fun v x -> { x with yCoordinate = v });
    }
    let width = {
      GapiLens.get = (fun x -> x.width);
      GapiLens.set = (fun v x -> { x with width = v });
    }
    
    let empty = {
      id = "";
      xCoordinate = 0.0;
      yCoordinate = 0.0;
      width = 0.0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "id" x.id;
        GapiJson.render_float_value "xCoordinate" x.xCoordinate;
        GapiJson.render_float_value "yCoordinate" x.yCoordinate;
        GapiJson.render_float_value "width" x.width;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "xCoordinate"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with xCoordinate = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "xCoordinate"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with xCoordinate = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "yCoordinate"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with yCoordinate = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "yCoordinate"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with yCoordinate = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with width = float_of_int v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.BackgroundImageFile.parse" e x
    
  end
  
  module Capabilities =
  struct
    type t = {
      canAddChildren : bool;
      canComment : bool;
      canCopy : bool;
      canDeleteTeamDrive : bool;
      canDownload : bool;
      canEdit : bool;
      canListChildren : bool;
      canManageMembers : bool;
      canReadRevisions : bool;
      canRemoveChildren : bool;
      canRename : bool;
      canRenameTeamDrive : bool;
      canChangeTeamDriveBackground : bool;
      canShare : bool;
      canChangeCopyRequiresWriterPermissionRestriction : bool;
      canChangeDomainUsersOnlyRestriction : bool;
      canChangeSharingFoldersRequiresOrganizerPermissionRestriction : bool;
      canChangeTeamMembersOnlyRestriction : bool;
      canDeleteChildren : bool;
      canTrashChildren : bool;
      canResetTeamDriveRestrictions : bool;
      
    }
    
    let canAddChildren = {
      GapiLens.get = (fun x -> x.canAddChildren);
      GapiLens.set = (fun v x -> { x with canAddChildren = v });
    }
    let canComment = {
      GapiLens.get = (fun x -> x.canComment);
      GapiLens.set = (fun v x -> { x with canComment = v });
    }
    let canCopy = {
      GapiLens.get = (fun x -> x.canCopy);
      GapiLens.set = (fun v x -> { x with canCopy = v });
    }
    let canDeleteTeamDrive = {
      GapiLens.get = (fun x -> x.canDeleteTeamDrive);
      GapiLens.set = (fun v x -> { x with canDeleteTeamDrive = v });
    }
    let canDownload = {
      GapiLens.get = (fun x -> x.canDownload);
      GapiLens.set = (fun v x -> { x with canDownload = v });
    }
    let canEdit = {
      GapiLens.get = (fun x -> x.canEdit);
      GapiLens.set = (fun v x -> { x with canEdit = v });
    }
    let canListChildren = {
      GapiLens.get = (fun x -> x.canListChildren);
      GapiLens.set = (fun v x -> { x with canListChildren = v });
    }
    let canManageMembers = {
      GapiLens.get = (fun x -> x.canManageMembers);
      GapiLens.set = (fun v x -> { x with canManageMembers = v });
    }
    let canReadRevisions = {
      GapiLens.get = (fun x -> x.canReadRevisions);
      GapiLens.set = (fun v x -> { x with canReadRevisions = v });
    }
    let canRemoveChildren = {
      GapiLens.get = (fun x -> x.canRemoveChildren);
      GapiLens.set = (fun v x -> { x with canRemoveChildren = v });
    }
    let canRename = {
      GapiLens.get = (fun x -> x.canRename);
      GapiLens.set = (fun v x -> { x with canRename = v });
    }
    let canRenameTeamDrive = {
      GapiLens.get = (fun x -> x.canRenameTeamDrive);
      GapiLens.set = (fun v x -> { x with canRenameTeamDrive = v });
    }
    let canChangeTeamDriveBackground = {
      GapiLens.get = (fun x -> x.canChangeTeamDriveBackground);
      GapiLens.set = (fun v x -> { x with canChangeTeamDriveBackground = v });
    }
    let canShare = {
      GapiLens.get = (fun x -> x.canShare);
      GapiLens.set = (fun v x -> { x with canShare = v });
    }
    let canChangeCopyRequiresWriterPermissionRestriction = {
      GapiLens.get = (fun x -> x.canChangeCopyRequiresWriterPermissionRestriction);
      GapiLens.set = (fun v x -> { x with canChangeCopyRequiresWriterPermissionRestriction = v });
    }
    let canChangeDomainUsersOnlyRestriction = {
      GapiLens.get = (fun x -> x.canChangeDomainUsersOnlyRestriction);
      GapiLens.set = (fun v x -> { x with canChangeDomainUsersOnlyRestriction = v });
    }
    let canChangeSharingFoldersRequiresOrganizerPermissionRestriction = {
      GapiLens.get = (fun x -> x.canChangeSharingFoldersRequiresOrganizerPermissionRestriction);
      GapiLens.set = (fun v x -> { x with canChangeSharingFoldersRequiresOrganizerPermissionRestriction = v });
    }
    let canChangeTeamMembersOnlyRestriction = {
      GapiLens.get = (fun x -> x.canChangeTeamMembersOnlyRestriction);
      GapiLens.set = (fun v x -> { x with canChangeTeamMembersOnlyRestriction = v });
    }
    let canDeleteChildren = {
      GapiLens.get = (fun x -> x.canDeleteChildren);
      GapiLens.set = (fun v x -> { x with canDeleteChildren = v });
    }
    let canTrashChildren = {
      GapiLens.get = (fun x -> x.canTrashChildren);
      GapiLens.set = (fun v x -> { x with canTrashChildren = v });
    }
    let canResetTeamDriveRestrictions = {
      GapiLens.get = (fun x -> x.canResetTeamDriveRestrictions);
      GapiLens.set = (fun v x -> { x with canResetTeamDriveRestrictions = v });
    }
    
    let empty = {
      canAddChildren = false;
      canComment = false;
      canCopy = false;
      canDeleteTeamDrive = false;
      canDownload = false;
      canEdit = false;
      canListChildren = false;
      canManageMembers = false;
      canReadRevisions = false;
      canRemoveChildren = false;
      canRename = false;
      canRenameTeamDrive = false;
      canChangeTeamDriveBackground = false;
      canShare = false;
      canChangeCopyRequiresWriterPermissionRestriction = false;
      canChangeDomainUsersOnlyRestriction = false;
      canChangeSharingFoldersRequiresOrganizerPermissionRestriction = false;
      canChangeTeamMembersOnlyRestriction = false;
      canDeleteChildren = false;
      canTrashChildren = false;
      canResetTeamDriveRestrictions = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "canAddChildren" x.canAddChildren;
        GapiJson.render_bool_value "canComment" x.canComment;
        GapiJson.render_bool_value "canCopy" x.canCopy;
        GapiJson.render_bool_value "canDeleteTeamDrive" x.canDeleteTeamDrive;
        GapiJson.render_bool_value "canDownload" x.canDownload;
        GapiJson.render_bool_value "canEdit" x.canEdit;
        GapiJson.render_bool_value "canListChildren" x.canListChildren;
        GapiJson.render_bool_value "canManageMembers" x.canManageMembers;
        GapiJson.render_bool_value "canReadRevisions" x.canReadRevisions;
        GapiJson.render_bool_value "canRemoveChildren" x.canRemoveChildren;
        GapiJson.render_bool_value "canRename" x.canRename;
        GapiJson.render_bool_value "canRenameTeamDrive" x.canRenameTeamDrive;
        GapiJson.render_bool_value "canChangeTeamDriveBackground" x.canChangeTeamDriveBackground;
        GapiJson.render_bool_value "canShare" x.canShare;
        GapiJson.render_bool_value "canChangeCopyRequiresWriterPermissionRestriction" x.canChangeCopyRequiresWriterPermissionRestriction;
        GapiJson.render_bool_value "canChangeDomainUsersOnlyRestriction" x.canChangeDomainUsersOnlyRestriction;
        GapiJson.render_bool_value "canChangeSharingFoldersRequiresOrganizerPermissionRestriction" x.canChangeSharingFoldersRequiresOrganizerPermissionRestriction;
        GapiJson.render_bool_value "canChangeTeamMembersOnlyRestriction" x.canChangeTeamMembersOnlyRestriction;
        GapiJson.render_bool_value "canDeleteChildren" x.canDeleteChildren;
        GapiJson.render_bool_value "canTrashChildren" x.canTrashChildren;
        GapiJson.render_bool_value "canResetTeamDriveRestrictions" x.canResetTeamDriveRestrictions;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canAddChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canAddChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canComment"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canComment = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canCopy"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canCopy = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDeleteTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDeleteTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDownload"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDownload = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canEdit"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canEdit = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canListChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canListChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canManageMembers"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canManageMembers = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canReadRevisions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canReadRevisions = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canRemoveChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canRemoveChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canRename"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canRename = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canRenameTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canRenameTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeTeamDriveBackground"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeTeamDriveBackground = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canShare"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canShare = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeCopyRequiresWriterPermissionRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeCopyRequiresWriterPermissionRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeDomainUsersOnlyRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeDomainUsersOnlyRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeSharingFoldersRequiresOrganizerPermissionRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeSharingFoldersRequiresOrganizerPermissionRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeTeamMembersOnlyRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeTeamMembersOnlyRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDeleteChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDeleteChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canTrashChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canTrashChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canResetTeamDriveRestrictions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canResetTeamDriveRestrictions = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.Capabilities.parse" e x
    
  end
  
  type t = {
    id : string;
    name : string;
    colorRgb : string;
    kind : string;
    backgroundImageLink : string;
    capabilities : Capabilities.t;
    themeId : string;
    backgroundImageFile : BackgroundImageFile.t;
    createdTime : GapiDate.t;
    restrictions : Restrictions.t;
    orgUnitId : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let colorRgb = {
    GapiLens.get = (fun x -> x.colorRgb);
    GapiLens.set = (fun v x -> { x with colorRgb = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let backgroundImageLink = {
    GapiLens.get = (fun x -> x.backgroundImageLink);
    GapiLens.set = (fun v x -> { x with backgroundImageLink = v });
  }
  let capabilities = {
    GapiLens.get = (fun x -> x.capabilities);
    GapiLens.set = (fun v x -> { x with capabilities = v });
  }
  let themeId = {
    GapiLens.get = (fun x -> x.themeId);
    GapiLens.set = (fun v x -> { x with themeId = v });
  }
  let backgroundImageFile = {
    GapiLens.get = (fun x -> x.backgroundImageFile);
    GapiLens.set = (fun v x -> { x with backgroundImageFile = v });
  }
  let createdTime = {
    GapiLens.get = (fun x -> x.createdTime);
    GapiLens.set = (fun v x -> { x with createdTime = v });
  }
  let restrictions = {
    GapiLens.get = (fun x -> x.restrictions);
    GapiLens.set = (fun v x -> { x with restrictions = v });
  }
  let orgUnitId = {
    GapiLens.get = (fun x -> x.orgUnitId);
    GapiLens.set = (fun v x -> { x with orgUnitId = v });
  }
  
  let empty = {
    id = "";
    name = "";
    colorRgb = "";
    kind = "";
    backgroundImageLink = "";
    capabilities = Capabilities.empty;
    themeId = "";
    backgroundImageFile = BackgroundImageFile.empty;
    createdTime = GapiDate.epoch;
    restrictions = Restrictions.empty;
    orgUnitId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "colorRgb" x.colorRgb;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "backgroundImageLink" x.backgroundImageLink;
      (fun v -> GapiJson.render_object "capabilities" (Capabilities.render_content v)) x.capabilities;
      GapiJson.render_string_value "themeId" x.themeId;
      (fun v -> GapiJson.render_object "backgroundImageFile" (BackgroundImageFile.render_content v)) x.backgroundImageFile;
      GapiJson.render_date_value "createdTime" x.createdTime;
      (fun v -> GapiJson.render_object "restrictions" (Restrictions.render_content v)) x.restrictions;
      GapiJson.render_string_value "orgUnitId" x.orgUnitId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "colorRgb"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with colorRgb = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "backgroundImageLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with backgroundImageLink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "capabilities"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Capabilities.parse
        Capabilities.empty
        (fun v -> { x with capabilities = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "themeId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with themeId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundImageFile"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BackgroundImageFile.parse
        BackgroundImageFile.empty
        (fun v -> { x with backgroundImageFile = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "restrictions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Restrictions.parse
        Restrictions.empty
        (fun v -> { x with restrictions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "orgUnitId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with orgUnitId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.TeamDrive.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TeamDriveList =
struct
  type t = {
    nextPageToken : string;
    kind : string;
    teamDrives : TeamDrive.t list;
    
  }
  
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let teamDrives = {
    GapiLens.get = (fun x -> x.teamDrives);
    GapiLens.set = (fun v x -> { x with teamDrives = v });
  }
  
  let empty = {
    nextPageToken = "";
    kind = "";
    teamDrives = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "teamDrives" TeamDrive.render x.teamDrives;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "teamDrives"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              TeamDrive.parse
              TeamDrive.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.TeamDriveList.parse.parse_collection" e x')
        TeamDrive.empty
        (fun v -> { x with teamDrives = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.TeamDriveList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module User =
struct
  type t = {
    displayName : string;
    kind : string;
    me : bool;
    permissionId : string;
    emailAddress : string;
    photoLink : string;
    
  }
  
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let me = {
    GapiLens.get = (fun x -> x.me);
    GapiLens.set = (fun v x -> { x with me = v });
  }
  let permissionId = {
    GapiLens.get = (fun x -> x.permissionId);
    GapiLens.set = (fun v x -> { x with permissionId = v });
  }
  let emailAddress = {
    GapiLens.get = (fun x -> x.emailAddress);
    GapiLens.set = (fun v x -> { x with emailAddress = v });
  }
  let photoLink = {
    GapiLens.get = (fun x -> x.photoLink);
    GapiLens.set = (fun v x -> { x with photoLink = v });
  }
  
  let empty = {
    displayName = "";
    kind = "";
    me = false;
    permissionId = "";
    emailAddress = "";
    photoLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_bool_value "me" x.me;
      GapiJson.render_string_value "permissionId" x.permissionId;
      GapiJson.render_string_value "emailAddress" x.emailAddress;
      GapiJson.render_string_value "photoLink" x.photoLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "me"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with me = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "permissionId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with permissionId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "emailAddress"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with emailAddress = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "photoLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with photoLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.User.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module About =
struct
  module TeamDriveThemes =
  struct
    type t = {
      id : string;
      backgroundImageLink : string;
      colorRgb : string;
      
    }
    
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    let backgroundImageLink = {
      GapiLens.get = (fun x -> x.backgroundImageLink);
      GapiLens.set = (fun v x -> { x with backgroundImageLink = v });
    }
    let colorRgb = {
      GapiLens.get = (fun x -> x.colorRgb);
      GapiLens.set = (fun v x -> { x with colorRgb = v });
    }
    
    let empty = {
      id = "";
      backgroundImageLink = "";
      colorRgb = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "id" x.id;
        GapiJson.render_string_value "backgroundImageLink" x.backgroundImageLink;
        GapiJson.render_string_value "colorRgb" x.colorRgb;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "backgroundImageLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with backgroundImageLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "colorRgb"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with colorRgb = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.TeamDriveThemes.parse" e x
    
  end
  
  module DriveThemes =
  struct
    type t = {
      id : string;
      backgroundImageLink : string;
      colorRgb : string;
      
    }
    
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    let backgroundImageLink = {
      GapiLens.get = (fun x -> x.backgroundImageLink);
      GapiLens.set = (fun v x -> { x with backgroundImageLink = v });
    }
    let colorRgb = {
      GapiLens.get = (fun x -> x.colorRgb);
      GapiLens.set = (fun v x -> { x with colorRgb = v });
    }
    
    let empty = {
      id = "";
      backgroundImageLink = "";
      colorRgb = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "id" x.id;
        GapiJson.render_string_value "backgroundImageLink" x.backgroundImageLink;
        GapiJson.render_string_value "colorRgb" x.colorRgb;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "backgroundImageLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with backgroundImageLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "colorRgb"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with colorRgb = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.DriveThemes.parse" e x
    
  end
  
  module StorageQuota =
  struct
    type t = {
      limit : int64;
      usageInDrive : int64;
      usageInDriveTrash : int64;
      usage : int64;
      
    }
    
    let limit = {
      GapiLens.get = (fun x -> x.limit);
      GapiLens.set = (fun v x -> { x with limit = v });
    }
    let usageInDrive = {
      GapiLens.get = (fun x -> x.usageInDrive);
      GapiLens.set = (fun v x -> { x with usageInDrive = v });
    }
    let usageInDriveTrash = {
      GapiLens.get = (fun x -> x.usageInDriveTrash);
      GapiLens.set = (fun v x -> { x with usageInDriveTrash = v });
    }
    let usage = {
      GapiLens.get = (fun x -> x.usage);
      GapiLens.set = (fun v x -> { x with usage = v });
    }
    
    let empty = {
      limit = 0L;
      usageInDrive = 0L;
      usageInDriveTrash = 0L;
      usage = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int64_value "limit" x.limit;
        GapiJson.render_int64_value "usageInDrive" x.usageInDrive;
        GapiJson.render_int64_value "usageInDriveTrash" x.usageInDriveTrash;
        GapiJson.render_int64_value "usage" x.usage;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "limit"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with limit = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "usageInDrive"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with usageInDrive = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "usageInDriveTrash"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with usageInDriveTrash = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "usage"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with usage = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.StorageQuota.parse" e x
    
  end
  
  type t = {
    kind : string;
    storageQuota : StorageQuota.t;
    driveThemes : DriveThemes.t list;
    canCreateDrives : bool;
    importFormats : (string * string list) list;
    exportFormats : (string * string list) list;
    appInstalled : bool;
    user : User.t;
    folderColorPalette : string list;
    maxImportSizes : (string * int64) list;
    maxUploadSize : int64;
    teamDriveThemes : TeamDriveThemes.t list;
    canCreateTeamDrives : bool;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let storageQuota = {
    GapiLens.get = (fun x -> x.storageQuota);
    GapiLens.set = (fun v x -> { x with storageQuota = v });
  }
  let driveThemes = {
    GapiLens.get = (fun x -> x.driveThemes);
    GapiLens.set = (fun v x -> { x with driveThemes = v });
  }
  let canCreateDrives = {
    GapiLens.get = (fun x -> x.canCreateDrives);
    GapiLens.set = (fun v x -> { x with canCreateDrives = v });
  }
  let importFormats = {
    GapiLens.get = (fun x -> x.importFormats);
    GapiLens.set = (fun v x -> { x with importFormats = v });
  }
  let exportFormats = {
    GapiLens.get = (fun x -> x.exportFormats);
    GapiLens.set = (fun v x -> { x with exportFormats = v });
  }
  let appInstalled = {
    GapiLens.get = (fun x -> x.appInstalled);
    GapiLens.set = (fun v x -> { x with appInstalled = v });
  }
  let user = {
    GapiLens.get = (fun x -> x.user);
    GapiLens.set = (fun v x -> { x with user = v });
  }
  let folderColorPalette = {
    GapiLens.get = (fun x -> x.folderColorPalette);
    GapiLens.set = (fun v x -> { x with folderColorPalette = v });
  }
  let maxImportSizes = {
    GapiLens.get = (fun x -> x.maxImportSizes);
    GapiLens.set = (fun v x -> { x with maxImportSizes = v });
  }
  let maxUploadSize = {
    GapiLens.get = (fun x -> x.maxUploadSize);
    GapiLens.set = (fun v x -> { x with maxUploadSize = v });
  }
  let teamDriveThemes = {
    GapiLens.get = (fun x -> x.teamDriveThemes);
    GapiLens.set = (fun v x -> { x with teamDriveThemes = v });
  }
  let canCreateTeamDrives = {
    GapiLens.get = (fun x -> x.canCreateTeamDrives);
    GapiLens.set = (fun v x -> { x with canCreateTeamDrives = v });
  }
  
  let empty = {
    kind = "";
    storageQuota = StorageQuota.empty;
    driveThemes = [];
    canCreateDrives = false;
    importFormats = [];
    exportFormats = [];
    appInstalled = false;
    user = User.empty;
    folderColorPalette = [];
    maxImportSizes = [];
    maxUploadSize = 0L;
    teamDriveThemes = [];
    canCreateTeamDrives = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "storageQuota" (StorageQuota.render_content v)) x.storageQuota;
      GapiJson.render_array "driveThemes" DriveThemes.render x.driveThemes;
      GapiJson.render_bool_value "canCreateDrives" x.canCreateDrives;
      GapiJson.render_collection "importFormats" GapiJson.Object (fun (id, v) -> GapiJson.render_array id (GapiJson.render_string_value "") v) x.importFormats;
      GapiJson.render_collection "exportFormats" GapiJson.Object (fun (id, v) -> GapiJson.render_array id (GapiJson.render_string_value "") v) x.exportFormats;
      GapiJson.render_bool_value "appInstalled" x.appInstalled;
      (fun v -> GapiJson.render_object "user" (User.render_content v)) x.user;
      GapiJson.render_array "folderColorPalette" (GapiJson.render_string_value "") x.folderColorPalette;
      GapiJson.render_collection "maxImportSizes" GapiJson.Object (fun (id, v) -> GapiJson.render_int64_value id v) x.maxImportSizes;
      GapiJson.render_int64_value "maxUploadSize" x.maxUploadSize;
      GapiJson.render_array "teamDriveThemes" TeamDriveThemes.render x.teamDriveThemes;
      GapiJson.render_bool_value "canCreateTeamDrives" x.canCreateTeamDrives;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "storageQuota"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        StorageQuota.parse
        StorageQuota.empty
        (fun v -> { x with storageQuota = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "driveThemes"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              DriveThemes.parse
              DriveThemes.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.About.parse.parse_collection" e x')
        DriveThemes.empty
        (fun v -> { x with driveThemes = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "canCreateDrives"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with canCreateDrives = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "importFormats"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Array },
              cs) ->
            GapiJson.parse_collection
              (fun x' -> function
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                    `String v) ->
                  v
                | e ->
                  GapiJson.unexpected "GapiDriveV3Model.About.parse.parse_collection" e x')
              ""
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.About.parse.parse_dictionary" e x')
        ("", [])
        (fun v -> { x with importFormats = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "exportFormats"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Array },
              cs) ->
            GapiJson.parse_collection
              (fun x' -> function
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                    `String v) ->
                  v
                | e ->
                  GapiJson.unexpected "GapiDriveV3Model.About.parse.parse_collection" e x')
              ""
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.About.parse.parse_dictionary" e x')
        ("", [])
        (fun v -> { x with exportFormats = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "appInstalled"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with appInstalled = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "user"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with user = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "folderColorPalette"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.About.parse.parse_collection" e x')
        ""
        (fun v -> { x with folderColorPalette = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "maxImportSizes"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = n; data_type = GapiJson.Scalar },
              `String v) ->
            (n, Int64.of_string v)
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.About.parse.parse_dictionary" e x')
        ("", 0L)
        (fun v -> { x with maxImportSizes = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "maxUploadSize"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with maxUploadSize = Int64.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "teamDriveThemes"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              TeamDriveThemes.parse
              TeamDriveThemes.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.About.parse.parse_collection" e x')
        TeamDriveThemes.empty
        (fun v -> { x with teamDriveThemes = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "canCreateTeamDrives"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with canCreateTeamDrives = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.About.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AppIcons =
struct
  type t = {
    size : int;
    category : string;
    iconUrl : string;
    
  }
  
  let size = {
    GapiLens.get = (fun x -> x.size);
    GapiLens.set = (fun v x -> { x with size = v });
  }
  let category = {
    GapiLens.get = (fun x -> x.category);
    GapiLens.set = (fun v x -> { x with category = v });
  }
  let iconUrl = {
    GapiLens.get = (fun x -> x.iconUrl);
    GapiLens.set = (fun v x -> { x with iconUrl = v });
  }
  
  let empty = {
    size = 0;
    category = "";
    iconUrl = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "size" x.size;
      GapiJson.render_string_value "category" x.category;
      GapiJson.render_string_value "iconUrl" x.iconUrl;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with size = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "category"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with category = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "iconUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with iconUrl = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.AppIcons.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module App =
struct
  type t = {
    name : string;
    objectType : string;
    supportsCreate : bool;
    productUrl : string;
    primaryMimeTypes : string list;
    secondaryMimeTypes : string list;
    primaryFileExtensions : string list;
    secondaryFileExtensions : string list;
    id : string;
    supportsImport : bool;
    installed : bool;
    authorized : bool;
    icons : AppIcons.t list;
    useByDefault : bool;
    kind : string;
    shortDescription : string;
    longDescription : string;
    supportsMultiOpen : bool;
    productId : string;
    openUrlTemplate : string;
    createUrl : string;
    createInFolderTemplate : string;
    supportsOfflineCreate : bool;
    hasDriveWideScope : bool;
    
  }
  
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let objectType = {
    GapiLens.get = (fun x -> x.objectType);
    GapiLens.set = (fun v x -> { x with objectType = v });
  }
  let supportsCreate = {
    GapiLens.get = (fun x -> x.supportsCreate);
    GapiLens.set = (fun v x -> { x with supportsCreate = v });
  }
  let productUrl = {
    GapiLens.get = (fun x -> x.productUrl);
    GapiLens.set = (fun v x -> { x with productUrl = v });
  }
  let primaryMimeTypes = {
    GapiLens.get = (fun x -> x.primaryMimeTypes);
    GapiLens.set = (fun v x -> { x with primaryMimeTypes = v });
  }
  let secondaryMimeTypes = {
    GapiLens.get = (fun x -> x.secondaryMimeTypes);
    GapiLens.set = (fun v x -> { x with secondaryMimeTypes = v });
  }
  let primaryFileExtensions = {
    GapiLens.get = (fun x -> x.primaryFileExtensions);
    GapiLens.set = (fun v x -> { x with primaryFileExtensions = v });
  }
  let secondaryFileExtensions = {
    GapiLens.get = (fun x -> x.secondaryFileExtensions);
    GapiLens.set = (fun v x -> { x with secondaryFileExtensions = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let supportsImport = {
    GapiLens.get = (fun x -> x.supportsImport);
    GapiLens.set = (fun v x -> { x with supportsImport = v });
  }
  let installed = {
    GapiLens.get = (fun x -> x.installed);
    GapiLens.set = (fun v x -> { x with installed = v });
  }
  let authorized = {
    GapiLens.get = (fun x -> x.authorized);
    GapiLens.set = (fun v x -> { x with authorized = v });
  }
  let icons = {
    GapiLens.get = (fun x -> x.icons);
    GapiLens.set = (fun v x -> { x with icons = v });
  }
  let useByDefault = {
    GapiLens.get = (fun x -> x.useByDefault);
    GapiLens.set = (fun v x -> { x with useByDefault = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let shortDescription = {
    GapiLens.get = (fun x -> x.shortDescription);
    GapiLens.set = (fun v x -> { x with shortDescription = v });
  }
  let longDescription = {
    GapiLens.get = (fun x -> x.longDescription);
    GapiLens.set = (fun v x -> { x with longDescription = v });
  }
  let supportsMultiOpen = {
    GapiLens.get = (fun x -> x.supportsMultiOpen);
    GapiLens.set = (fun v x -> { x with supportsMultiOpen = v });
  }
  let productId = {
    GapiLens.get = (fun x -> x.productId);
    GapiLens.set = (fun v x -> { x with productId = v });
  }
  let openUrlTemplate = {
    GapiLens.get = (fun x -> x.openUrlTemplate);
    GapiLens.set = (fun v x -> { x with openUrlTemplate = v });
  }
  let createUrl = {
    GapiLens.get = (fun x -> x.createUrl);
    GapiLens.set = (fun v x -> { x with createUrl = v });
  }
  let createInFolderTemplate = {
    GapiLens.get = (fun x -> x.createInFolderTemplate);
    GapiLens.set = (fun v x -> { x with createInFolderTemplate = v });
  }
  let supportsOfflineCreate = {
    GapiLens.get = (fun x -> x.supportsOfflineCreate);
    GapiLens.set = (fun v x -> { x with supportsOfflineCreate = v });
  }
  let hasDriveWideScope = {
    GapiLens.get = (fun x -> x.hasDriveWideScope);
    GapiLens.set = (fun v x -> { x with hasDriveWideScope = v });
  }
  
  let empty = {
    name = "";
    objectType = "";
    supportsCreate = false;
    productUrl = "";
    primaryMimeTypes = [];
    secondaryMimeTypes = [];
    primaryFileExtensions = [];
    secondaryFileExtensions = [];
    id = "";
    supportsImport = false;
    installed = false;
    authorized = false;
    icons = [];
    useByDefault = false;
    kind = "";
    shortDescription = "";
    longDescription = "";
    supportsMultiOpen = false;
    productId = "";
    openUrlTemplate = "";
    createUrl = "";
    createInFolderTemplate = "";
    supportsOfflineCreate = false;
    hasDriveWideScope = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "objectType" x.objectType;
      GapiJson.render_bool_value "supportsCreate" x.supportsCreate;
      GapiJson.render_string_value "productUrl" x.productUrl;
      GapiJson.render_array "primaryMimeTypes" (GapiJson.render_string_value "") x.primaryMimeTypes;
      GapiJson.render_array "secondaryMimeTypes" (GapiJson.render_string_value "") x.secondaryMimeTypes;
      GapiJson.render_array "primaryFileExtensions" (GapiJson.render_string_value "") x.primaryFileExtensions;
      GapiJson.render_array "secondaryFileExtensions" (GapiJson.render_string_value "") x.secondaryFileExtensions;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_bool_value "supportsImport" x.supportsImport;
      GapiJson.render_bool_value "installed" x.installed;
      GapiJson.render_bool_value "authorized" x.authorized;
      GapiJson.render_array "icons" AppIcons.render x.icons;
      GapiJson.render_bool_value "useByDefault" x.useByDefault;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "shortDescription" x.shortDescription;
      GapiJson.render_string_value "longDescription" x.longDescription;
      GapiJson.render_bool_value "supportsMultiOpen" x.supportsMultiOpen;
      GapiJson.render_string_value "productId" x.productId;
      GapiJson.render_string_value "openUrlTemplate" x.openUrlTemplate;
      GapiJson.render_string_value "createUrl" x.createUrl;
      GapiJson.render_string_value "createInFolderTemplate" x.createInFolderTemplate;
      GapiJson.render_bool_value "supportsOfflineCreate" x.supportsOfflineCreate;
      GapiJson.render_bool_value "hasDriveWideScope" x.hasDriveWideScope;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "objectType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with objectType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "supportsCreate"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with supportsCreate = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "productUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with productUrl = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "primaryMimeTypes"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.App.parse.parse_collection" e x')
        ""
        (fun v -> { x with primaryMimeTypes = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "secondaryMimeTypes"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.App.parse.parse_collection" e x')
        ""
        (fun v -> { x with secondaryMimeTypes = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "primaryFileExtensions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.App.parse.parse_collection" e x')
        ""
        (fun v -> { x with primaryFileExtensions = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "secondaryFileExtensions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.App.parse.parse_collection" e x')
        ""
        (fun v -> { x with secondaryFileExtensions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "supportsImport"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with supportsImport = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "installed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with installed = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "authorized"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with authorized = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "icons"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              AppIcons.parse
              AppIcons.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.App.parse.parse_collection" e x')
        AppIcons.empty
        (fun v -> { x with icons = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "useByDefault"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with useByDefault = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "shortDescription"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with shortDescription = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "longDescription"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with longDescription = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "supportsMultiOpen"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with supportsMultiOpen = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "productId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with productId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "openUrlTemplate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with openUrlTemplate = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createUrl = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createInFolderTemplate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createInFolderTemplate = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "supportsOfflineCreate"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with supportsOfflineCreate = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hasDriveWideScope"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hasDriveWideScope = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.App.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AppList =
struct
  type t = {
    defaultAppIds : string list;
    kind : string;
    selfLink : string;
    items : App.t list;
    
  }
  
  let defaultAppIds = {
    GapiLens.get = (fun x -> x.defaultAppIds);
    GapiLens.set = (fun v x -> { x with defaultAppIds = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  
  let empty = {
    defaultAppIds = [];
    kind = "";
    selfLink = "";
    items = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "defaultAppIds" (GapiJson.render_string_value "") x.defaultAppIds;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_array "items" App.render x.items;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "defaultAppIds"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.AppList.parse.parse_collection" e x')
        ""
        (fun v -> { x with defaultAppIds = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children App.parse App.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.AppList.parse.parse_collection" e x')
        App.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.AppList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module LabelField =
struct
  type t = {
    kind : string;
    id : string;
    valueType : string;
    dateString : GapiDate.t list;
    integer : int64 list;
    selection : string list;
    text : string list;
    user : User.t list;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let valueType = {
    GapiLens.get = (fun x -> x.valueType);
    GapiLens.set = (fun v x -> { x with valueType = v });
  }
  let dateString = {
    GapiLens.get = (fun x -> x.dateString);
    GapiLens.set = (fun v x -> { x with dateString = v });
  }
  let integer = {
    GapiLens.get = (fun x -> x.integer);
    GapiLens.set = (fun v x -> { x with integer = v });
  }
  let selection = {
    GapiLens.get = (fun x -> x.selection);
    GapiLens.set = (fun v x -> { x with selection = v });
  }
  let text = {
    GapiLens.get = (fun x -> x.text);
    GapiLens.set = (fun v x -> { x with text = v });
  }
  let user = {
    GapiLens.get = (fun x -> x.user);
    GapiLens.set = (fun v x -> { x with user = v });
  }
  
  let empty = {
    kind = "";
    id = "";
    valueType = "";
    dateString = [];
    integer = [];
    selection = [];
    text = [];
    user = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "valueType" x.valueType;
      GapiJson.render_array "dateString" (GapiJson.render_date_value "") x.dateString;
      GapiJson.render_array "integer" (GapiJson.render_int64_value "") x.integer;
      GapiJson.render_array "selection" (GapiJson.render_string_value "") x.selection;
      GapiJson.render_array "text" (GapiJson.render_string_value "") x.text;
      GapiJson.render_array "user" User.render x.user;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "valueType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with valueType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "dateString"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            GapiDate.of_string v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelField.parse.parse_collection" e x')
        GapiDate.epoch
        (fun v -> { x with dateString = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "integer"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            Int64.of_string v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelField.parse.parse_collection" e x')
        0L
        (fun v -> { x with integer = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "selection"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelField.parse.parse_collection" e x')
        ""
        (fun v -> { x with selection = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "text"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelField.parse.parse_collection" e x')
        ""
        (fun v -> { x with text = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "user"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children User.parse User.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelField.parse.parse_collection" e x')
        User.empty
        (fun v -> { x with user = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.LabelField.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Label =
struct
  type t = {
    id : string;
    revisionId : string;
    kind : string;
    fields : (string * LabelField.t) list;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let revisionId = {
    GapiLens.get = (fun x -> x.revisionId);
    GapiLens.set = (fun v x -> { x with revisionId = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let fields = {
    GapiLens.get = (fun x -> x.fields);
    GapiLens.set = (fun v x -> { x with fields = v });
  }
  
  let empty = {
    id = "";
    revisionId = "";
    kind = "";
    fields = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "revisionId" x.revisionId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_collection "fields" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (LabelField.render_content v)) v) x.fields;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "revisionId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with revisionId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "fields"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              LabelField.parse
              LabelField.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.Label.parse.parse_dictionary" e x')
        ("", LabelField.empty)
        (fun v -> { x with fields = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.Label.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module LabelList =
struct
  type t = {
    labels : Label.t list;
    nextPageToken : string;
    kind : string;
    
  }
  
  let labels = {
    GapiLens.get = (fun x -> x.labels);
    GapiLens.set = (fun v x -> { x with labels = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    labels = [];
    nextPageToken = "";
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "labels" Label.render x.labels;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labels"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Label.parse Label.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelList.parse.parse_collection" e x')
        Label.empty
        (fun v -> { x with labels = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.LabelList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Revision =
struct
  type t = {
    id : string;
    mimeType : string;
    kind : string;
    published : bool;
    exportLinks : (string * string) list;
    keepForever : bool;
    md5Checksum : string;
    modifiedTime : GapiDate.t;
    publishAuto : bool;
    publishedOutsideDomain : bool;
    publishedLink : string;
    size : int64;
    originalFilename : string;
    lastModifyingUser : User.t;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let mimeType = {
    GapiLens.get = (fun x -> x.mimeType);
    GapiLens.set = (fun v x -> { x with mimeType = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let published = {
    GapiLens.get = (fun x -> x.published);
    GapiLens.set = (fun v x -> { x with published = v });
  }
  let exportLinks = {
    GapiLens.get = (fun x -> x.exportLinks);
    GapiLens.set = (fun v x -> { x with exportLinks = v });
  }
  let keepForever = {
    GapiLens.get = (fun x -> x.keepForever);
    GapiLens.set = (fun v x -> { x with keepForever = v });
  }
  let md5Checksum = {
    GapiLens.get = (fun x -> x.md5Checksum);
    GapiLens.set = (fun v x -> { x with md5Checksum = v });
  }
  let modifiedTime = {
    GapiLens.get = (fun x -> x.modifiedTime);
    GapiLens.set = (fun v x -> { x with modifiedTime = v });
  }
  let publishAuto = {
    GapiLens.get = (fun x -> x.publishAuto);
    GapiLens.set = (fun v x -> { x with publishAuto = v });
  }
  let publishedOutsideDomain = {
    GapiLens.get = (fun x -> x.publishedOutsideDomain);
    GapiLens.set = (fun v x -> { x with publishedOutsideDomain = v });
  }
  let publishedLink = {
    GapiLens.get = (fun x -> x.publishedLink);
    GapiLens.set = (fun v x -> { x with publishedLink = v });
  }
  let size = {
    GapiLens.get = (fun x -> x.size);
    GapiLens.set = (fun v x -> { x with size = v });
  }
  let originalFilename = {
    GapiLens.get = (fun x -> x.originalFilename);
    GapiLens.set = (fun v x -> { x with originalFilename = v });
  }
  let lastModifyingUser = {
    GapiLens.get = (fun x -> x.lastModifyingUser);
    GapiLens.set = (fun v x -> { x with lastModifyingUser = v });
  }
  
  let empty = {
    id = "";
    mimeType = "";
    kind = "";
    published = false;
    exportLinks = [];
    keepForever = false;
    md5Checksum = "";
    modifiedTime = GapiDate.epoch;
    publishAuto = false;
    publishedOutsideDomain = false;
    publishedLink = "";
    size = 0L;
    originalFilename = "";
    lastModifyingUser = User.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "mimeType" x.mimeType;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_bool_value "published" x.published;
      GapiJson.render_collection "exportLinks" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.exportLinks;
      GapiJson.render_bool_value "keepForever" x.keepForever;
      GapiJson.render_string_value "md5Checksum" x.md5Checksum;
      GapiJson.render_date_value "modifiedTime" x.modifiedTime;
      GapiJson.render_bool_value "publishAuto" x.publishAuto;
      GapiJson.render_bool_value "publishedOutsideDomain" x.publishedOutsideDomain;
      GapiJson.render_string_value "publishedLink" x.publishedLink;
      GapiJson.render_int64_value "size" x.size;
      GapiJson.render_string_value "originalFilename" x.originalFilename;
      (fun v -> GapiJson.render_object "lastModifyingUser" (User.render_content v)) x.lastModifyingUser;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "mimeType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with mimeType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "published"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with published = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "exportLinks"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = n; data_type = GapiJson.Scalar },
              `String v) ->
            (n, v)
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.Revision.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with exportLinks = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "keepForever"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with keepForever = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "md5Checksum"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with md5Checksum = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "publishAuto"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with publishAuto = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "publishedOutsideDomain"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with publishedOutsideDomain = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "publishedLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with publishedLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with size = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "originalFilename"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with originalFilename = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "lastModifyingUser"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with lastModifyingUser = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.Revision.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Reply =
struct
  type t = {
    id : string;
    kind : string;
    createdTime : GapiDate.t;
    modifiedTime : GapiDate.t;
    action : string;
    author : User.t;
    deleted : bool;
    htmlContent : string;
    content : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let createdTime = {
    GapiLens.get = (fun x -> x.createdTime);
    GapiLens.set = (fun v x -> { x with createdTime = v });
  }
  let modifiedTime = {
    GapiLens.get = (fun x -> x.modifiedTime);
    GapiLens.set = (fun v x -> { x with modifiedTime = v });
  }
  let action = {
    GapiLens.get = (fun x -> x.action);
    GapiLens.set = (fun v x -> { x with action = v });
  }
  let author = {
    GapiLens.get = (fun x -> x.author);
    GapiLens.set = (fun v x -> { x with author = v });
  }
  let deleted = {
    GapiLens.get = (fun x -> x.deleted);
    GapiLens.set = (fun v x -> { x with deleted = v });
  }
  let htmlContent = {
    GapiLens.get = (fun x -> x.htmlContent);
    GapiLens.set = (fun v x -> { x with htmlContent = v });
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
  }
  
  let empty = {
    id = "";
    kind = "";
    createdTime = GapiDate.epoch;
    modifiedTime = GapiDate.epoch;
    action = "";
    author = User.empty;
    deleted = false;
    htmlContent = "";
    content = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "createdTime" x.createdTime;
      GapiJson.render_date_value "modifiedTime" x.modifiedTime;
      GapiJson.render_string_value "action" x.action;
      (fun v -> GapiJson.render_object "author" (User.render_content v)) x.author;
      GapiJson.render_bool_value "deleted" x.deleted;
      GapiJson.render_string_value "htmlContent" x.htmlContent;
      GapiJson.render_string_value "content" x.content;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "action"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with action = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "author"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with author = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "deleted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with deleted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlContent"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with htmlContent = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "content"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with content = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.Reply.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Comment =
struct
  module QuotedFileContent =
  struct
    type t = {
      mimeType : string;
      value : string;
      
    }
    
    let mimeType = {
      GapiLens.get = (fun x -> x.mimeType);
      GapiLens.set = (fun v x -> { x with mimeType = v });
    }
    let value = {
      GapiLens.get = (fun x -> x.value);
      GapiLens.set = (fun v x -> { x with value = v });
    }
    
    let empty = {
      mimeType = "";
      value = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "mimeType" x.mimeType;
        GapiJson.render_string_value "value" x.value;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "mimeType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with mimeType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with value = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.QuotedFileContent.parse" e x
    
  end
  
  type t = {
    id : string;
    kind : string;
    createdTime : GapiDate.t;
    modifiedTime : GapiDate.t;
    resolved : bool;
    anchor : string;
    replies : Reply.t list;
    author : User.t;
    deleted : bool;
    htmlContent : string;
    content : string;
    quotedFileContent : QuotedFileContent.t;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let createdTime = {
    GapiLens.get = (fun x -> x.createdTime);
    GapiLens.set = (fun v x -> { x with createdTime = v });
  }
  let modifiedTime = {
    GapiLens.get = (fun x -> x.modifiedTime);
    GapiLens.set = (fun v x -> { x with modifiedTime = v });
  }
  let resolved = {
    GapiLens.get = (fun x -> x.resolved);
    GapiLens.set = (fun v x -> { x with resolved = v });
  }
  let anchor = {
    GapiLens.get = (fun x -> x.anchor);
    GapiLens.set = (fun v x -> { x with anchor = v });
  }
  let replies = {
    GapiLens.get = (fun x -> x.replies);
    GapiLens.set = (fun v x -> { x with replies = v });
  }
  let author = {
    GapiLens.get = (fun x -> x.author);
    GapiLens.set = (fun v x -> { x with author = v });
  }
  let deleted = {
    GapiLens.get = (fun x -> x.deleted);
    GapiLens.set = (fun v x -> { x with deleted = v });
  }
  let htmlContent = {
    GapiLens.get = (fun x -> x.htmlContent);
    GapiLens.set = (fun v x -> { x with htmlContent = v });
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
  }
  let quotedFileContent = {
    GapiLens.get = (fun x -> x.quotedFileContent);
    GapiLens.set = (fun v x -> { x with quotedFileContent = v });
  }
  
  let empty = {
    id = "";
    kind = "";
    createdTime = GapiDate.epoch;
    modifiedTime = GapiDate.epoch;
    resolved = false;
    anchor = "";
    replies = [];
    author = User.empty;
    deleted = false;
    htmlContent = "";
    content = "";
    quotedFileContent = QuotedFileContent.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "createdTime" x.createdTime;
      GapiJson.render_date_value "modifiedTime" x.modifiedTime;
      GapiJson.render_bool_value "resolved" x.resolved;
      GapiJson.render_string_value "anchor" x.anchor;
      GapiJson.render_array "replies" Reply.render x.replies;
      (fun v -> GapiJson.render_object "author" (User.render_content v)) x.author;
      GapiJson.render_bool_value "deleted" x.deleted;
      GapiJson.render_string_value "htmlContent" x.htmlContent;
      GapiJson.render_string_value "content" x.content;
      (fun v -> GapiJson.render_object "quotedFileContent" (QuotedFileContent.render_content v)) x.quotedFileContent;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "resolved"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with resolved = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "anchor"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with anchor = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "replies"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Reply.parse Reply.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.Comment.parse.parse_collection" e x')
        Reply.empty
        (fun v -> { x with replies = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "author"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with author = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "deleted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with deleted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlContent"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with htmlContent = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "content"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with content = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "quotedFileContent"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        QuotedFileContent.parse
        QuotedFileContent.empty
        (fun v -> { x with quotedFileContent = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.Comment.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CommentList =
struct
  type t = {
    kind : string;
    comments : Comment.t list;
    nextPageToken : string;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let comments = {
    GapiLens.get = (fun x -> x.comments);
    GapiLens.set = (fun v x -> { x with comments = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  
  let empty = {
    kind = "";
    comments = [];
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "comments" Comment.render x.comments;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "comments"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Comment.parse
              Comment.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.CommentList.parse.parse_collection" e x')
        Comment.empty
        (fun v -> { x with comments = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.CommentList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module GeneratedIds =
struct
  type t = {
    ids : string list;
    space : string;
    kind : string;
    
  }
  
  let ids = {
    GapiLens.get = (fun x -> x.ids);
    GapiLens.set = (fun v x -> { x with ids = v });
  }
  let space = {
    GapiLens.get = (fun x -> x.space);
    GapiLens.set = (fun v x -> { x with space = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    ids = [];
    space = "";
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "ids" (GapiJson.render_string_value "") x.ids;
      GapiJson.render_string_value "space" x.space;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "ids"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.GeneratedIds.parse.parse_collection" e x')
        ""
        (fun v -> { x with ids = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "space"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with space = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.GeneratedIds.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Permission =
struct
  module TeamDrivePermissionDetails =
  struct
    type t = {
      teamDrivePermissionType : string;
      inheritedFrom : string;
      role : string;
      inherited : bool;
      
    }
    
    let teamDrivePermissionType = {
      GapiLens.get = (fun x -> x.teamDrivePermissionType);
      GapiLens.set = (fun v x -> { x with teamDrivePermissionType = v });
    }
    let inheritedFrom = {
      GapiLens.get = (fun x -> x.inheritedFrom);
      GapiLens.set = (fun v x -> { x with inheritedFrom = v });
    }
    let role = {
      GapiLens.get = (fun x -> x.role);
      GapiLens.set = (fun v x -> { x with role = v });
    }
    let inherited = {
      GapiLens.get = (fun x -> x.inherited);
      GapiLens.set = (fun v x -> { x with inherited = v });
    }
    
    let empty = {
      teamDrivePermissionType = "";
      inheritedFrom = "";
      role = "";
      inherited = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "teamDrivePermissionType" x.teamDrivePermissionType;
        GapiJson.render_string_value "inheritedFrom" x.inheritedFrom;
        GapiJson.render_string_value "role" x.role;
        GapiJson.render_bool_value "inherited" x.inherited;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "teamDrivePermissionType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with teamDrivePermissionType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "inheritedFrom"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with inheritedFrom = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "role"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with role = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "inherited"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with inherited = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.TeamDrivePermissionDetails.parse" e x
    
  end
  
  module PermissionDetails =
  struct
    type t = {
      permissionType : string;
      inheritedFrom : string;
      role : string;
      inherited : bool;
      
    }
    
    let permissionType = {
      GapiLens.get = (fun x -> x.permissionType);
      GapiLens.set = (fun v x -> { x with permissionType = v });
    }
    let inheritedFrom = {
      GapiLens.get = (fun x -> x.inheritedFrom);
      GapiLens.set = (fun v x -> { x with inheritedFrom = v });
    }
    let role = {
      GapiLens.get = (fun x -> x.role);
      GapiLens.set = (fun v x -> { x with role = v });
    }
    let inherited = {
      GapiLens.get = (fun x -> x.inherited);
      GapiLens.set = (fun v x -> { x with inherited = v });
    }
    
    let empty = {
      permissionType = "";
      inheritedFrom = "";
      role = "";
      inherited = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "permissionType" x.permissionType;
        GapiJson.render_string_value "inheritedFrom" x.inheritedFrom;
        GapiJson.render_string_value "role" x.role;
        GapiJson.render_bool_value "inherited" x.inherited;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "permissionType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with permissionType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "inheritedFrom"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with inheritedFrom = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "role"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with role = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "inherited"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with inherited = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.PermissionDetails.parse" e x
    
  end
  
  type t = {
    id : string;
    displayName : string;
    _type : string;
    kind : string;
    permissionDetails : PermissionDetails.t list;
    photoLink : string;
    emailAddress : string;
    role : string;
    allowFileDiscovery : bool;
    domain : string;
    expirationTime : GapiDate.t;
    teamDrivePermissionDetails : TeamDrivePermissionDetails.t list;
    deleted : bool;
    view : string;
    pendingOwner : bool;
    inheritedPermissionsDisabled : bool;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let permissionDetails = {
    GapiLens.get = (fun x -> x.permissionDetails);
    GapiLens.set = (fun v x -> { x with permissionDetails = v });
  }
  let photoLink = {
    GapiLens.get = (fun x -> x.photoLink);
    GapiLens.set = (fun v x -> { x with photoLink = v });
  }
  let emailAddress = {
    GapiLens.get = (fun x -> x.emailAddress);
    GapiLens.set = (fun v x -> { x with emailAddress = v });
  }
  let role = {
    GapiLens.get = (fun x -> x.role);
    GapiLens.set = (fun v x -> { x with role = v });
  }
  let allowFileDiscovery = {
    GapiLens.get = (fun x -> x.allowFileDiscovery);
    GapiLens.set = (fun v x -> { x with allowFileDiscovery = v });
  }
  let domain = {
    GapiLens.get = (fun x -> x.domain);
    GapiLens.set = (fun v x -> { x with domain = v });
  }
  let expirationTime = {
    GapiLens.get = (fun x -> x.expirationTime);
    GapiLens.set = (fun v x -> { x with expirationTime = v });
  }
  let teamDrivePermissionDetails = {
    GapiLens.get = (fun x -> x.teamDrivePermissionDetails);
    GapiLens.set = (fun v x -> { x with teamDrivePermissionDetails = v });
  }
  let deleted = {
    GapiLens.get = (fun x -> x.deleted);
    GapiLens.set = (fun v x -> { x with deleted = v });
  }
  let view = {
    GapiLens.get = (fun x -> x.view);
    GapiLens.set = (fun v x -> { x with view = v });
  }
  let pendingOwner = {
    GapiLens.get = (fun x -> x.pendingOwner);
    GapiLens.set = (fun v x -> { x with pendingOwner = v });
  }
  let inheritedPermissionsDisabled = {
    GapiLens.get = (fun x -> x.inheritedPermissionsDisabled);
    GapiLens.set = (fun v x -> { x with inheritedPermissionsDisabled = v });
  }
  
  let empty = {
    id = "";
    displayName = "";
    _type = "";
    kind = "";
    permissionDetails = [];
    photoLink = "";
    emailAddress = "";
    role = "";
    allowFileDiscovery = false;
    domain = "";
    expirationTime = GapiDate.epoch;
    teamDrivePermissionDetails = [];
    deleted = false;
    view = "";
    pendingOwner = false;
    inheritedPermissionsDisabled = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "permissionDetails" PermissionDetails.render x.permissionDetails;
      GapiJson.render_string_value "photoLink" x.photoLink;
      GapiJson.render_string_value "emailAddress" x.emailAddress;
      GapiJson.render_string_value "role" x.role;
      GapiJson.render_bool_value "allowFileDiscovery" x.allowFileDiscovery;
      GapiJson.render_string_value "domain" x.domain;
      GapiJson.render_date_value "expirationTime" x.expirationTime;
      GapiJson.render_array "teamDrivePermissionDetails" TeamDrivePermissionDetails.render x.teamDrivePermissionDetails;
      GapiJson.render_bool_value "deleted" x.deleted;
      GapiJson.render_string_value "view" x.view;
      GapiJson.render_bool_value "pendingOwner" x.pendingOwner;
      GapiJson.render_bool_value "inheritedPermissionsDisabled" x.inheritedPermissionsDisabled;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "permissionDetails"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              PermissionDetails.parse
              PermissionDetails.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.Permission.parse.parse_collection" e x')
        PermissionDetails.empty
        (fun v -> { x with permissionDetails = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "photoLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with photoLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "emailAddress"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with emailAddress = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "role"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with role = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "allowFileDiscovery"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with allowFileDiscovery = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "domain"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with domain = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "expirationTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with expirationTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "teamDrivePermissionDetails"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              TeamDrivePermissionDetails.parse
              TeamDrivePermissionDetails.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.Permission.parse.parse_collection" e x')
        TeamDrivePermissionDetails.empty
        (fun v -> { x with teamDrivePermissionDetails = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "deleted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with deleted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "view"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with view = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pendingOwner"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with pendingOwner = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "inheritedPermissionsDisabled"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with inheritedPermissionsDisabled = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.Permission.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ContentRestriction =
struct
  type t = {
    readOnly : bool;
    reason : string;
    _type : string;
    restrictingUser : User.t;
    restrictionTime : GapiDate.t;
    ownerRestricted : bool;
    systemRestricted : bool;
    
  }
  
  let readOnly = {
    GapiLens.get = (fun x -> x.readOnly);
    GapiLens.set = (fun v x -> { x with readOnly = v });
  }
  let reason = {
    GapiLens.get = (fun x -> x.reason);
    GapiLens.set = (fun v x -> { x with reason = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let restrictingUser = {
    GapiLens.get = (fun x -> x.restrictingUser);
    GapiLens.set = (fun v x -> { x with restrictingUser = v });
  }
  let restrictionTime = {
    GapiLens.get = (fun x -> x.restrictionTime);
    GapiLens.set = (fun v x -> { x with restrictionTime = v });
  }
  let ownerRestricted = {
    GapiLens.get = (fun x -> x.ownerRestricted);
    GapiLens.set = (fun v x -> { x with ownerRestricted = v });
  }
  let systemRestricted = {
    GapiLens.get = (fun x -> x.systemRestricted);
    GapiLens.set = (fun v x -> { x with systemRestricted = v });
  }
  
  let empty = {
    readOnly = false;
    reason = "";
    _type = "";
    restrictingUser = User.empty;
    restrictionTime = GapiDate.epoch;
    ownerRestricted = false;
    systemRestricted = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "readOnly" x.readOnly;
      GapiJson.render_string_value "reason" x.reason;
      GapiJson.render_string_value "type" x._type;
      (fun v -> GapiJson.render_object "restrictingUser" (User.render_content v)) x.restrictingUser;
      GapiJson.render_date_value "restrictionTime" x.restrictionTime;
      GapiJson.render_bool_value "ownerRestricted" x.ownerRestricted;
      GapiJson.render_bool_value "systemRestricted" x.systemRestricted;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "readOnly"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with readOnly = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "reason"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with reason = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "restrictingUser"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with restrictingUser = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "restrictionTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with restrictionTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "ownerRestricted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with ownerRestricted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "systemRestricted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with systemRestricted = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.ContentRestriction.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module File =
struct
  module LabelInfo =
  struct
    type t = {
      labels : Label.t list;
      
    }
    
    let labels = {
      GapiLens.get = (fun x -> x.labels);
      GapiLens.set = (fun v x -> { x with labels = v });
    }
    
    let empty = {
      labels = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "labels" Label.render x.labels;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "labels"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children Label.parse Label.empty (fun v -> v) cs
            | e ->
              GapiJson.unexpected "GapiDriveV3Model.LabelInfo.parse.parse_collection" e x')
          Label.empty
          (fun v -> { x with labels = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.LabelInfo.parse" e x
    
  end
  
  module LinkShareMetadata =
  struct
    type t = {
      securityUpdateEligible : bool;
      securityUpdateEnabled : bool;
      
    }
    
    let securityUpdateEligible = {
      GapiLens.get = (fun x -> x.securityUpdateEligible);
      GapiLens.set = (fun v x -> { x with securityUpdateEligible = v });
    }
    let securityUpdateEnabled = {
      GapiLens.get = (fun x -> x.securityUpdateEnabled);
      GapiLens.set = (fun v x -> { x with securityUpdateEnabled = v });
    }
    
    let empty = {
      securityUpdateEligible = false;
      securityUpdateEnabled = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "securityUpdateEligible" x.securityUpdateEligible;
        GapiJson.render_bool_value "securityUpdateEnabled" x.securityUpdateEnabled;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "securityUpdateEligible"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with securityUpdateEligible = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "securityUpdateEnabled"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with securityUpdateEnabled = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.LinkShareMetadata.parse" e x
    
  end
  
  module ShortcutDetails =
  struct
    type t = {
      targetId : string;
      targetMimeType : string;
      targetResourceKey : string;
      
    }
    
    let targetId = {
      GapiLens.get = (fun x -> x.targetId);
      GapiLens.set = (fun v x -> { x with targetId = v });
    }
    let targetMimeType = {
      GapiLens.get = (fun x -> x.targetMimeType);
      GapiLens.set = (fun v x -> { x with targetMimeType = v });
    }
    let targetResourceKey = {
      GapiLens.get = (fun x -> x.targetResourceKey);
      GapiLens.set = (fun v x -> { x with targetResourceKey = v });
    }
    
    let empty = {
      targetId = "";
      targetMimeType = "";
      targetResourceKey = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "targetId" x.targetId;
        GapiJson.render_string_value "targetMimeType" x.targetMimeType;
        GapiJson.render_string_value "targetResourceKey" x.targetResourceKey;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "targetId"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with targetId = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "targetMimeType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with targetMimeType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "targetResourceKey"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with targetResourceKey = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.ShortcutDetails.parse" e x
    
  end
  
  module VideoMediaMetadata =
  struct
    type t = {
      width : int;
      height : int;
      durationMillis : int64;
      
    }
    
    let width = {
      GapiLens.get = (fun x -> x.width);
      GapiLens.set = (fun v x -> { x with width = v });
    }
    let height = {
      GapiLens.get = (fun x -> x.height);
      GapiLens.set = (fun v x -> { x with height = v });
    }
    let durationMillis = {
      GapiLens.get = (fun x -> x.durationMillis);
      GapiLens.set = (fun v x -> { x with durationMillis = v });
    }
    
    let empty = {
      width = 0;
      height = 0;
      durationMillis = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int_value "width" x.width;
        GapiJson.render_int_value "height" x.height;
        GapiJson.render_int64_value "durationMillis" x.durationMillis;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "height"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with height = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "durationMillis"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with durationMillis = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.VideoMediaMetadata.parse" e x
    
  end
  
  module ImageMediaMetadata =
  struct
    module Location =
    struct
      type t = {
        latitude : float;
        longitude : float;
        altitude : float;
        
      }
      
      let latitude = {
        GapiLens.get = (fun x -> x.latitude);
        GapiLens.set = (fun v x -> { x with latitude = v });
      }
      let longitude = {
        GapiLens.get = (fun x -> x.longitude);
        GapiLens.set = (fun v x -> { x with longitude = v });
      }
      let altitude = {
        GapiLens.get = (fun x -> x.altitude);
        GapiLens.set = (fun v x -> { x with altitude = v });
      }
      
      let empty = {
        latitude = 0.0;
        longitude = 0.0;
        altitude = 0.0;
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_float_value "latitude" x.latitude;
          GapiJson.render_float_value "longitude" x.longitude;
          GapiJson.render_float_value "altitude" x.altitude;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "latitude"; data_type = GapiJson.Scalar },
            `Float v) ->
          { x with latitude = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "latitude"; data_type = GapiJson.Scalar },
            `Int v) ->
          { x with latitude = float_of_int v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "longitude"; data_type = GapiJson.Scalar },
            `Float v) ->
          { x with longitude = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "longitude"; data_type = GapiJson.Scalar },
            `Int v) ->
          { x with longitude = float_of_int v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "altitude"; data_type = GapiJson.Scalar },
            `Float v) ->
          { x with altitude = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "altitude"; data_type = GapiJson.Scalar },
            `Int v) ->
          { x with altitude = float_of_int v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiDriveV3Model.Location.parse" e x
      
    end
    
    type t = {
      flashUsed : bool;
      meteringMode : string;
      sensor : string;
      exposureMode : string;
      colorSpace : string;
      whiteBalance : string;
      width : int;
      height : int;
      location : Location.t;
      rotation : int;
      time : string;
      cameraMake : string;
      cameraModel : string;
      exposureTime : float;
      aperture : float;
      focalLength : float;
      isoSpeed : int;
      exposureBias : float;
      maxApertureValue : float;
      subjectDistance : int;
      lens : string;
      
    }
    
    let flashUsed = {
      GapiLens.get = (fun x -> x.flashUsed);
      GapiLens.set = (fun v x -> { x with flashUsed = v });
    }
    let meteringMode = {
      GapiLens.get = (fun x -> x.meteringMode);
      GapiLens.set = (fun v x -> { x with meteringMode = v });
    }
    let sensor = {
      GapiLens.get = (fun x -> x.sensor);
      GapiLens.set = (fun v x -> { x with sensor = v });
    }
    let exposureMode = {
      GapiLens.get = (fun x -> x.exposureMode);
      GapiLens.set = (fun v x -> { x with exposureMode = v });
    }
    let colorSpace = {
      GapiLens.get = (fun x -> x.colorSpace);
      GapiLens.set = (fun v x -> { x with colorSpace = v });
    }
    let whiteBalance = {
      GapiLens.get = (fun x -> x.whiteBalance);
      GapiLens.set = (fun v x -> { x with whiteBalance = v });
    }
    let width = {
      GapiLens.get = (fun x -> x.width);
      GapiLens.set = (fun v x -> { x with width = v });
    }
    let height = {
      GapiLens.get = (fun x -> x.height);
      GapiLens.set = (fun v x -> { x with height = v });
    }
    let location = {
      GapiLens.get = (fun x -> x.location);
      GapiLens.set = (fun v x -> { x with location = v });
    }
    let rotation = {
      GapiLens.get = (fun x -> x.rotation);
      GapiLens.set = (fun v x -> { x with rotation = v });
    }
    let time = {
      GapiLens.get = (fun x -> x.time);
      GapiLens.set = (fun v x -> { x with time = v });
    }
    let cameraMake = {
      GapiLens.get = (fun x -> x.cameraMake);
      GapiLens.set = (fun v x -> { x with cameraMake = v });
    }
    let cameraModel = {
      GapiLens.get = (fun x -> x.cameraModel);
      GapiLens.set = (fun v x -> { x with cameraModel = v });
    }
    let exposureTime = {
      GapiLens.get = (fun x -> x.exposureTime);
      GapiLens.set = (fun v x -> { x with exposureTime = v });
    }
    let aperture = {
      GapiLens.get = (fun x -> x.aperture);
      GapiLens.set = (fun v x -> { x with aperture = v });
    }
    let focalLength = {
      GapiLens.get = (fun x -> x.focalLength);
      GapiLens.set = (fun v x -> { x with focalLength = v });
    }
    let isoSpeed = {
      GapiLens.get = (fun x -> x.isoSpeed);
      GapiLens.set = (fun v x -> { x with isoSpeed = v });
    }
    let exposureBias = {
      GapiLens.get = (fun x -> x.exposureBias);
      GapiLens.set = (fun v x -> { x with exposureBias = v });
    }
    let maxApertureValue = {
      GapiLens.get = (fun x -> x.maxApertureValue);
      GapiLens.set = (fun v x -> { x with maxApertureValue = v });
    }
    let subjectDistance = {
      GapiLens.get = (fun x -> x.subjectDistance);
      GapiLens.set = (fun v x -> { x with subjectDistance = v });
    }
    let lens = {
      GapiLens.get = (fun x -> x.lens);
      GapiLens.set = (fun v x -> { x with lens = v });
    }
    
    let empty = {
      flashUsed = false;
      meteringMode = "";
      sensor = "";
      exposureMode = "";
      colorSpace = "";
      whiteBalance = "";
      width = 0;
      height = 0;
      location = Location.empty;
      rotation = 0;
      time = "";
      cameraMake = "";
      cameraModel = "";
      exposureTime = 0.0;
      aperture = 0.0;
      focalLength = 0.0;
      isoSpeed = 0;
      exposureBias = 0.0;
      maxApertureValue = 0.0;
      subjectDistance = 0;
      lens = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "flashUsed" x.flashUsed;
        GapiJson.render_string_value "meteringMode" x.meteringMode;
        GapiJson.render_string_value "sensor" x.sensor;
        GapiJson.render_string_value "exposureMode" x.exposureMode;
        GapiJson.render_string_value "colorSpace" x.colorSpace;
        GapiJson.render_string_value "whiteBalance" x.whiteBalance;
        GapiJson.render_int_value "width" x.width;
        GapiJson.render_int_value "height" x.height;
        (fun v -> GapiJson.render_object "location" (Location.render_content v)) x.location;
        GapiJson.render_int_value "rotation" x.rotation;
        GapiJson.render_string_value "time" x.time;
        GapiJson.render_string_value "cameraMake" x.cameraMake;
        GapiJson.render_string_value "cameraModel" x.cameraModel;
        GapiJson.render_float_value "exposureTime" x.exposureTime;
        GapiJson.render_float_value "aperture" x.aperture;
        GapiJson.render_float_value "focalLength" x.focalLength;
        GapiJson.render_int_value "isoSpeed" x.isoSpeed;
        GapiJson.render_float_value "exposureBias" x.exposureBias;
        GapiJson.render_float_value "maxApertureValue" x.maxApertureValue;
        GapiJson.render_int_value "subjectDistance" x.subjectDistance;
        GapiJson.render_string_value "lens" x.lens;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "flashUsed"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with flashUsed = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "meteringMode"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with meteringMode = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "sensor"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with sensor = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "exposureMode"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with exposureMode = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "colorSpace"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with colorSpace = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "whiteBalance"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with whiteBalance = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "height"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with height = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "location"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          Location.parse
          Location.empty
          (fun v -> { x with location = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "rotation"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with rotation = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "time"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with time = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "cameraMake"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with cameraMake = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "cameraModel"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with cameraModel = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "exposureTime"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with exposureTime = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "exposureTime"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with exposureTime = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "aperture"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with aperture = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "aperture"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with aperture = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "focalLength"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with focalLength = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "focalLength"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with focalLength = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "isoSpeed"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with isoSpeed = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "exposureBias"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with exposureBias = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "exposureBias"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with exposureBias = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "maxApertureValue"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with maxApertureValue = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "maxApertureValue"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with maxApertureValue = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "subjectDistance"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with subjectDistance = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "lens"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with lens = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.ImageMediaMetadata.parse" e x
    
  end
  
  module Capabilities =
  struct
    type t = {
      canChangeViewersCanCopyContent : bool;
      canMoveChildrenOutOfDrive : bool;
      canReadDrive : bool;
      canEdit : bool;
      canCopy : bool;
      canComment : bool;
      canAddChildren : bool;
      canDelete : bool;
      canDownload : bool;
      canListChildren : bool;
      canRemoveChildren : bool;
      canRename : bool;
      canTrash : bool;
      canReadRevisions : bool;
      canReadTeamDrive : bool;
      canMoveTeamDriveItem : bool;
      canChangeCopyRequiresWriterPermission : bool;
      canMoveItemIntoTeamDrive : bool;
      canUntrash : bool;
      canModifyContent : bool;
      canMoveItemWithinTeamDrive : bool;
      canMoveItemOutOfTeamDrive : bool;
      canDeleteChildren : bool;
      canMoveChildrenOutOfTeamDrive : bool;
      canMoveChildrenWithinTeamDrive : bool;
      canTrashChildren : bool;
      canMoveItemOutOfDrive : bool;
      canAddMyDriveParent : bool;
      canRemoveMyDriveParent : bool;
      canMoveItemWithinDrive : bool;
      canShare : bool;
      canMoveChildrenWithinDrive : bool;
      canModifyContentRestriction : bool;
      canAddFolderFromAnotherDrive : bool;
      canChangeSecurityUpdateEnabled : bool;
      canAcceptOwnership : bool;
      canReadLabels : bool;
      canModifyLabels : bool;
      canModifyEditorContentRestriction : bool;
      canModifyOwnerContentRestriction : bool;
      canRemoveContentRestriction : bool;
      canDisableInheritedPermissions : bool;
      canEnableInheritedPermissions : bool;
      
    }
    
    let canChangeViewersCanCopyContent = {
      GapiLens.get = (fun x -> x.canChangeViewersCanCopyContent);
      GapiLens.set = (fun v x -> { x with canChangeViewersCanCopyContent = v });
    }
    let canMoveChildrenOutOfDrive = {
      GapiLens.get = (fun x -> x.canMoveChildrenOutOfDrive);
      GapiLens.set = (fun v x -> { x with canMoveChildrenOutOfDrive = v });
    }
    let canReadDrive = {
      GapiLens.get = (fun x -> x.canReadDrive);
      GapiLens.set = (fun v x -> { x with canReadDrive = v });
    }
    let canEdit = {
      GapiLens.get = (fun x -> x.canEdit);
      GapiLens.set = (fun v x -> { x with canEdit = v });
    }
    let canCopy = {
      GapiLens.get = (fun x -> x.canCopy);
      GapiLens.set = (fun v x -> { x with canCopy = v });
    }
    let canComment = {
      GapiLens.get = (fun x -> x.canComment);
      GapiLens.set = (fun v x -> { x with canComment = v });
    }
    let canAddChildren = {
      GapiLens.get = (fun x -> x.canAddChildren);
      GapiLens.set = (fun v x -> { x with canAddChildren = v });
    }
    let canDelete = {
      GapiLens.get = (fun x -> x.canDelete);
      GapiLens.set = (fun v x -> { x with canDelete = v });
    }
    let canDownload = {
      GapiLens.get = (fun x -> x.canDownload);
      GapiLens.set = (fun v x -> { x with canDownload = v });
    }
    let canListChildren = {
      GapiLens.get = (fun x -> x.canListChildren);
      GapiLens.set = (fun v x -> { x with canListChildren = v });
    }
    let canRemoveChildren = {
      GapiLens.get = (fun x -> x.canRemoveChildren);
      GapiLens.set = (fun v x -> { x with canRemoveChildren = v });
    }
    let canRename = {
      GapiLens.get = (fun x -> x.canRename);
      GapiLens.set = (fun v x -> { x with canRename = v });
    }
    let canTrash = {
      GapiLens.get = (fun x -> x.canTrash);
      GapiLens.set = (fun v x -> { x with canTrash = v });
    }
    let canReadRevisions = {
      GapiLens.get = (fun x -> x.canReadRevisions);
      GapiLens.set = (fun v x -> { x with canReadRevisions = v });
    }
    let canReadTeamDrive = {
      GapiLens.get = (fun x -> x.canReadTeamDrive);
      GapiLens.set = (fun v x -> { x with canReadTeamDrive = v });
    }
    let canMoveTeamDriveItem = {
      GapiLens.get = (fun x -> x.canMoveTeamDriveItem);
      GapiLens.set = (fun v x -> { x with canMoveTeamDriveItem = v });
    }
    let canChangeCopyRequiresWriterPermission = {
      GapiLens.get = (fun x -> x.canChangeCopyRequiresWriterPermission);
      GapiLens.set = (fun v x -> { x with canChangeCopyRequiresWriterPermission = v });
    }
    let canMoveItemIntoTeamDrive = {
      GapiLens.get = (fun x -> x.canMoveItemIntoTeamDrive);
      GapiLens.set = (fun v x -> { x with canMoveItemIntoTeamDrive = v });
    }
    let canUntrash = {
      GapiLens.get = (fun x -> x.canUntrash);
      GapiLens.set = (fun v x -> { x with canUntrash = v });
    }
    let canModifyContent = {
      GapiLens.get = (fun x -> x.canModifyContent);
      GapiLens.set = (fun v x -> { x with canModifyContent = v });
    }
    let canMoveItemWithinTeamDrive = {
      GapiLens.get = (fun x -> x.canMoveItemWithinTeamDrive);
      GapiLens.set = (fun v x -> { x with canMoveItemWithinTeamDrive = v });
    }
    let canMoveItemOutOfTeamDrive = {
      GapiLens.get = (fun x -> x.canMoveItemOutOfTeamDrive);
      GapiLens.set = (fun v x -> { x with canMoveItemOutOfTeamDrive = v });
    }
    let canDeleteChildren = {
      GapiLens.get = (fun x -> x.canDeleteChildren);
      GapiLens.set = (fun v x -> { x with canDeleteChildren = v });
    }
    let canMoveChildrenOutOfTeamDrive = {
      GapiLens.get = (fun x -> x.canMoveChildrenOutOfTeamDrive);
      GapiLens.set = (fun v x -> { x with canMoveChildrenOutOfTeamDrive = v });
    }
    let canMoveChildrenWithinTeamDrive = {
      GapiLens.get = (fun x -> x.canMoveChildrenWithinTeamDrive);
      GapiLens.set = (fun v x -> { x with canMoveChildrenWithinTeamDrive = v });
    }
    let canTrashChildren = {
      GapiLens.get = (fun x -> x.canTrashChildren);
      GapiLens.set = (fun v x -> { x with canTrashChildren = v });
    }
    let canMoveItemOutOfDrive = {
      GapiLens.get = (fun x -> x.canMoveItemOutOfDrive);
      GapiLens.set = (fun v x -> { x with canMoveItemOutOfDrive = v });
    }
    let canAddMyDriveParent = {
      GapiLens.get = (fun x -> x.canAddMyDriveParent);
      GapiLens.set = (fun v x -> { x with canAddMyDriveParent = v });
    }
    let canRemoveMyDriveParent = {
      GapiLens.get = (fun x -> x.canRemoveMyDriveParent);
      GapiLens.set = (fun v x -> { x with canRemoveMyDriveParent = v });
    }
    let canMoveItemWithinDrive = {
      GapiLens.get = (fun x -> x.canMoveItemWithinDrive);
      GapiLens.set = (fun v x -> { x with canMoveItemWithinDrive = v });
    }
    let canShare = {
      GapiLens.get = (fun x -> x.canShare);
      GapiLens.set = (fun v x -> { x with canShare = v });
    }
    let canMoveChildrenWithinDrive = {
      GapiLens.get = (fun x -> x.canMoveChildrenWithinDrive);
      GapiLens.set = (fun v x -> { x with canMoveChildrenWithinDrive = v });
    }
    let canModifyContentRestriction = {
      GapiLens.get = (fun x -> x.canModifyContentRestriction);
      GapiLens.set = (fun v x -> { x with canModifyContentRestriction = v });
    }
    let canAddFolderFromAnotherDrive = {
      GapiLens.get = (fun x -> x.canAddFolderFromAnotherDrive);
      GapiLens.set = (fun v x -> { x with canAddFolderFromAnotherDrive = v });
    }
    let canChangeSecurityUpdateEnabled = {
      GapiLens.get = (fun x -> x.canChangeSecurityUpdateEnabled);
      GapiLens.set = (fun v x -> { x with canChangeSecurityUpdateEnabled = v });
    }
    let canAcceptOwnership = {
      GapiLens.get = (fun x -> x.canAcceptOwnership);
      GapiLens.set = (fun v x -> { x with canAcceptOwnership = v });
    }
    let canReadLabels = {
      GapiLens.get = (fun x -> x.canReadLabels);
      GapiLens.set = (fun v x -> { x with canReadLabels = v });
    }
    let canModifyLabels = {
      GapiLens.get = (fun x -> x.canModifyLabels);
      GapiLens.set = (fun v x -> { x with canModifyLabels = v });
    }
    let canModifyEditorContentRestriction = {
      GapiLens.get = (fun x -> x.canModifyEditorContentRestriction);
      GapiLens.set = (fun v x -> { x with canModifyEditorContentRestriction = v });
    }
    let canModifyOwnerContentRestriction = {
      GapiLens.get = (fun x -> x.canModifyOwnerContentRestriction);
      GapiLens.set = (fun v x -> { x with canModifyOwnerContentRestriction = v });
    }
    let canRemoveContentRestriction = {
      GapiLens.get = (fun x -> x.canRemoveContentRestriction);
      GapiLens.set = (fun v x -> { x with canRemoveContentRestriction = v });
    }
    let canDisableInheritedPermissions = {
      GapiLens.get = (fun x -> x.canDisableInheritedPermissions);
      GapiLens.set = (fun v x -> { x with canDisableInheritedPermissions = v });
    }
    let canEnableInheritedPermissions = {
      GapiLens.get = (fun x -> x.canEnableInheritedPermissions);
      GapiLens.set = (fun v x -> { x with canEnableInheritedPermissions = v });
    }
    
    let empty = {
      canChangeViewersCanCopyContent = false;
      canMoveChildrenOutOfDrive = false;
      canReadDrive = false;
      canEdit = false;
      canCopy = false;
      canComment = false;
      canAddChildren = false;
      canDelete = false;
      canDownload = false;
      canListChildren = false;
      canRemoveChildren = false;
      canRename = false;
      canTrash = false;
      canReadRevisions = false;
      canReadTeamDrive = false;
      canMoveTeamDriveItem = false;
      canChangeCopyRequiresWriterPermission = false;
      canMoveItemIntoTeamDrive = false;
      canUntrash = false;
      canModifyContent = false;
      canMoveItemWithinTeamDrive = false;
      canMoveItemOutOfTeamDrive = false;
      canDeleteChildren = false;
      canMoveChildrenOutOfTeamDrive = false;
      canMoveChildrenWithinTeamDrive = false;
      canTrashChildren = false;
      canMoveItemOutOfDrive = false;
      canAddMyDriveParent = false;
      canRemoveMyDriveParent = false;
      canMoveItemWithinDrive = false;
      canShare = false;
      canMoveChildrenWithinDrive = false;
      canModifyContentRestriction = false;
      canAddFolderFromAnotherDrive = false;
      canChangeSecurityUpdateEnabled = false;
      canAcceptOwnership = false;
      canReadLabels = false;
      canModifyLabels = false;
      canModifyEditorContentRestriction = false;
      canModifyOwnerContentRestriction = false;
      canRemoveContentRestriction = false;
      canDisableInheritedPermissions = false;
      canEnableInheritedPermissions = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "canChangeViewersCanCopyContent" x.canChangeViewersCanCopyContent;
        GapiJson.render_bool_value "canMoveChildrenOutOfDrive" x.canMoveChildrenOutOfDrive;
        GapiJson.render_bool_value "canReadDrive" x.canReadDrive;
        GapiJson.render_bool_value "canEdit" x.canEdit;
        GapiJson.render_bool_value "canCopy" x.canCopy;
        GapiJson.render_bool_value "canComment" x.canComment;
        GapiJson.render_bool_value "canAddChildren" x.canAddChildren;
        GapiJson.render_bool_value "canDelete" x.canDelete;
        GapiJson.render_bool_value "canDownload" x.canDownload;
        GapiJson.render_bool_value "canListChildren" x.canListChildren;
        GapiJson.render_bool_value "canRemoveChildren" x.canRemoveChildren;
        GapiJson.render_bool_value "canRename" x.canRename;
        GapiJson.render_bool_value "canTrash" x.canTrash;
        GapiJson.render_bool_value "canReadRevisions" x.canReadRevisions;
        GapiJson.render_bool_value "canReadTeamDrive" x.canReadTeamDrive;
        GapiJson.render_bool_value "canMoveTeamDriveItem" x.canMoveTeamDriveItem;
        GapiJson.render_bool_value "canChangeCopyRequiresWriterPermission" x.canChangeCopyRequiresWriterPermission;
        GapiJson.render_bool_value "canMoveItemIntoTeamDrive" x.canMoveItemIntoTeamDrive;
        GapiJson.render_bool_value "canUntrash" x.canUntrash;
        GapiJson.render_bool_value "canModifyContent" x.canModifyContent;
        GapiJson.render_bool_value "canMoveItemWithinTeamDrive" x.canMoveItemWithinTeamDrive;
        GapiJson.render_bool_value "canMoveItemOutOfTeamDrive" x.canMoveItemOutOfTeamDrive;
        GapiJson.render_bool_value "canDeleteChildren" x.canDeleteChildren;
        GapiJson.render_bool_value "canMoveChildrenOutOfTeamDrive" x.canMoveChildrenOutOfTeamDrive;
        GapiJson.render_bool_value "canMoveChildrenWithinTeamDrive" x.canMoveChildrenWithinTeamDrive;
        GapiJson.render_bool_value "canTrashChildren" x.canTrashChildren;
        GapiJson.render_bool_value "canMoveItemOutOfDrive" x.canMoveItemOutOfDrive;
        GapiJson.render_bool_value "canAddMyDriveParent" x.canAddMyDriveParent;
        GapiJson.render_bool_value "canRemoveMyDriveParent" x.canRemoveMyDriveParent;
        GapiJson.render_bool_value "canMoveItemWithinDrive" x.canMoveItemWithinDrive;
        GapiJson.render_bool_value "canShare" x.canShare;
        GapiJson.render_bool_value "canMoveChildrenWithinDrive" x.canMoveChildrenWithinDrive;
        GapiJson.render_bool_value "canModifyContentRestriction" x.canModifyContentRestriction;
        GapiJson.render_bool_value "canAddFolderFromAnotherDrive" x.canAddFolderFromAnotherDrive;
        GapiJson.render_bool_value "canChangeSecurityUpdateEnabled" x.canChangeSecurityUpdateEnabled;
        GapiJson.render_bool_value "canAcceptOwnership" x.canAcceptOwnership;
        GapiJson.render_bool_value "canReadLabels" x.canReadLabels;
        GapiJson.render_bool_value "canModifyLabels" x.canModifyLabels;
        GapiJson.render_bool_value "canModifyEditorContentRestriction" x.canModifyEditorContentRestriction;
        GapiJson.render_bool_value "canModifyOwnerContentRestriction" x.canModifyOwnerContentRestriction;
        GapiJson.render_bool_value "canRemoveContentRestriction" x.canRemoveContentRestriction;
        GapiJson.render_bool_value "canDisableInheritedPermissions" x.canDisableInheritedPermissions;
        GapiJson.render_bool_value "canEnableInheritedPermissions" x.canEnableInheritedPermissions;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeViewersCanCopyContent"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeViewersCanCopyContent = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveChildrenOutOfDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveChildrenOutOfDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canReadDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canReadDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canEdit"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canEdit = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canCopy"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canCopy = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canComment"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canComment = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canAddChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canAddChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDelete"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDelete = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDownload"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDownload = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canListChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canListChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canRemoveChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canRemoveChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canRename"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canRename = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canTrash"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canTrash = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canReadRevisions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canReadRevisions = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canReadTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canReadTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveTeamDriveItem"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveTeamDriveItem = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeCopyRequiresWriterPermission"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeCopyRequiresWriterPermission = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveItemIntoTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveItemIntoTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canUntrash"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canUntrash = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canModifyContent"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canModifyContent = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveItemWithinTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveItemWithinTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveItemOutOfTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveItemOutOfTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDeleteChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDeleteChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveChildrenOutOfTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveChildrenOutOfTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveChildrenWithinTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveChildrenWithinTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canTrashChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canTrashChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveItemOutOfDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveItemOutOfDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canAddMyDriveParent"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canAddMyDriveParent = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canRemoveMyDriveParent"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canRemoveMyDriveParent = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveItemWithinDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveItemWithinDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canShare"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canShare = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveChildrenWithinDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveChildrenWithinDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canModifyContentRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canModifyContentRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canAddFolderFromAnotherDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canAddFolderFromAnotherDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeSecurityUpdateEnabled"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeSecurityUpdateEnabled = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canAcceptOwnership"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canAcceptOwnership = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canReadLabels"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canReadLabels = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canModifyLabels"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canModifyLabels = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canModifyEditorContentRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canModifyEditorContentRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canModifyOwnerContentRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canModifyOwnerContentRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canRemoveContentRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canRemoveContentRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDisableInheritedPermissions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDisableInheritedPermissions = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canEnableInheritedPermissions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canEnableInheritedPermissions = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.Capabilities.parse" e x
    
  end
  
  module ContentHints =
  struct
    module Thumbnail =
    struct
      type t = {
        image : string;
        mimeType : string;
        
      }
      
      let image = {
        GapiLens.get = (fun x -> x.image);
        GapiLens.set = (fun v x -> { x with image = v });
      }
      let mimeType = {
        GapiLens.get = (fun x -> x.mimeType);
        GapiLens.set = (fun v x -> { x with mimeType = v });
      }
      
      let empty = {
        image = "";
        mimeType = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "image" x.image;
          GapiJson.render_string_value "mimeType" x.mimeType;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "image"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with image = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "mimeType"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with mimeType = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiDriveV3Model.Thumbnail.parse" e x
      
    end
    
    type t = {
      indexableText : string;
      thumbnail : Thumbnail.t;
      
    }
    
    let indexableText = {
      GapiLens.get = (fun x -> x.indexableText);
      GapiLens.set = (fun v x -> { x with indexableText = v });
    }
    let thumbnail = {
      GapiLens.get = (fun x -> x.thumbnail);
      GapiLens.set = (fun v x -> { x with thumbnail = v });
    }
    
    let empty = {
      indexableText = "";
      thumbnail = Thumbnail.empty;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "indexableText" x.indexableText;
        (fun v -> GapiJson.render_object "thumbnail" (Thumbnail.render_content v)) x.thumbnail;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "indexableText"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with indexableText = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "thumbnail"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          Thumbnail.parse
          Thumbnail.empty
          (fun v -> { x with thumbnail = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.ContentHints.parse" e x
    
  end
  
  type t = {
    kind : string;
    driveId : string;
    fileExtension : string;
    copyRequiresWriterPermission : bool;
    md5Checksum : string;
    contentHints : ContentHints.t;
    writersCanShare : bool;
    viewedByMe : bool;
    mimeType : string;
    exportLinks : (string * string) list;
    parents : string list;
    thumbnailLink : string;
    iconLink : string;
    shared : bool;
    lastModifyingUser : User.t;
    owners : User.t list;
    headRevisionId : string;
    sharingUser : User.t;
    webViewLink : string;
    webContentLink : string;
    size : int64;
    viewersCanCopyContent : bool;
    permissions : Permission.t list;
    hasThumbnail : bool;
    spaces : string list;
    folderColorRgb : string;
    id : string;
    name : string;
    description : string;
    starred : bool;
    trashed : bool;
    explicitlyTrashed : bool;
    createdTime : GapiDate.t;
    modifiedTime : GapiDate.t;
    modifiedByMeTime : GapiDate.t;
    viewedByMeTime : GapiDate.t;
    sharedWithMeTime : GapiDate.t;
    quotaBytesUsed : int64;
    version : int64;
    originalFilename : string;
    ownedByMe : bool;
    fullFileExtension : string;
    properties : (string * string) list;
    appProperties : (string * string) list;
    isAppAuthorized : bool;
    teamDriveId : string;
    capabilities : Capabilities.t;
    hasAugmentedPermissions : bool;
    trashingUser : User.t;
    thumbnailVersion : int64;
    trashedTime : GapiDate.t;
    modifiedByMe : bool;
    permissionIds : string list;
    imageMediaMetadata : ImageMediaMetadata.t;
    videoMediaMetadata : VideoMediaMetadata.t;
    shortcutDetails : ShortcutDetails.t;
    contentRestrictions : ContentRestriction.t list;
    resourceKey : string;
    linkShareMetadata : LinkShareMetadata.t;
    labelInfo : LabelInfo.t;
    sha1Checksum : string;
    sha256Checksum : string;
    inheritedPermissionsDisabled : bool;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let driveId = {
    GapiLens.get = (fun x -> x.driveId);
    GapiLens.set = (fun v x -> { x with driveId = v });
  }
  let fileExtension = {
    GapiLens.get = (fun x -> x.fileExtension);
    GapiLens.set = (fun v x -> { x with fileExtension = v });
  }
  let copyRequiresWriterPermission = {
    GapiLens.get = (fun x -> x.copyRequiresWriterPermission);
    GapiLens.set = (fun v x -> { x with copyRequiresWriterPermission = v });
  }
  let md5Checksum = {
    GapiLens.get = (fun x -> x.md5Checksum);
    GapiLens.set = (fun v x -> { x with md5Checksum = v });
  }
  let contentHints = {
    GapiLens.get = (fun x -> x.contentHints);
    GapiLens.set = (fun v x -> { x with contentHints = v });
  }
  let writersCanShare = {
    GapiLens.get = (fun x -> x.writersCanShare);
    GapiLens.set = (fun v x -> { x with writersCanShare = v });
  }
  let viewedByMe = {
    GapiLens.get = (fun x -> x.viewedByMe);
    GapiLens.set = (fun v x -> { x with viewedByMe = v });
  }
  let mimeType = {
    GapiLens.get = (fun x -> x.mimeType);
    GapiLens.set = (fun v x -> { x with mimeType = v });
  }
  let exportLinks = {
    GapiLens.get = (fun x -> x.exportLinks);
    GapiLens.set = (fun v x -> { x with exportLinks = v });
  }
  let parents = {
    GapiLens.get = (fun x -> x.parents);
    GapiLens.set = (fun v x -> { x with parents = v });
  }
  let thumbnailLink = {
    GapiLens.get = (fun x -> x.thumbnailLink);
    GapiLens.set = (fun v x -> { x with thumbnailLink = v });
  }
  let iconLink = {
    GapiLens.get = (fun x -> x.iconLink);
    GapiLens.set = (fun v x -> { x with iconLink = v });
  }
  let shared = {
    GapiLens.get = (fun x -> x.shared);
    GapiLens.set = (fun v x -> { x with shared = v });
  }
  let lastModifyingUser = {
    GapiLens.get = (fun x -> x.lastModifyingUser);
    GapiLens.set = (fun v x -> { x with lastModifyingUser = v });
  }
  let owners = {
    GapiLens.get = (fun x -> x.owners);
    GapiLens.set = (fun v x -> { x with owners = v });
  }
  let headRevisionId = {
    GapiLens.get = (fun x -> x.headRevisionId);
    GapiLens.set = (fun v x -> { x with headRevisionId = v });
  }
  let sharingUser = {
    GapiLens.get = (fun x -> x.sharingUser);
    GapiLens.set = (fun v x -> { x with sharingUser = v });
  }
  let webViewLink = {
    GapiLens.get = (fun x -> x.webViewLink);
    GapiLens.set = (fun v x -> { x with webViewLink = v });
  }
  let webContentLink = {
    GapiLens.get = (fun x -> x.webContentLink);
    GapiLens.set = (fun v x -> { x with webContentLink = v });
  }
  let size = {
    GapiLens.get = (fun x -> x.size);
    GapiLens.set = (fun v x -> { x with size = v });
  }
  let viewersCanCopyContent = {
    GapiLens.get = (fun x -> x.viewersCanCopyContent);
    GapiLens.set = (fun v x -> { x with viewersCanCopyContent = v });
  }
  let permissions = {
    GapiLens.get = (fun x -> x.permissions);
    GapiLens.set = (fun v x -> { x with permissions = v });
  }
  let hasThumbnail = {
    GapiLens.get = (fun x -> x.hasThumbnail);
    GapiLens.set = (fun v x -> { x with hasThumbnail = v });
  }
  let spaces = {
    GapiLens.get = (fun x -> x.spaces);
    GapiLens.set = (fun v x -> { x with spaces = v });
  }
  let folderColorRgb = {
    GapiLens.get = (fun x -> x.folderColorRgb);
    GapiLens.set = (fun v x -> { x with folderColorRgb = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let starred = {
    GapiLens.get = (fun x -> x.starred);
    GapiLens.set = (fun v x -> { x with starred = v });
  }
  let trashed = {
    GapiLens.get = (fun x -> x.trashed);
    GapiLens.set = (fun v x -> { x with trashed = v });
  }
  let explicitlyTrashed = {
    GapiLens.get = (fun x -> x.explicitlyTrashed);
    GapiLens.set = (fun v x -> { x with explicitlyTrashed = v });
  }
  let createdTime = {
    GapiLens.get = (fun x -> x.createdTime);
    GapiLens.set = (fun v x -> { x with createdTime = v });
  }
  let modifiedTime = {
    GapiLens.get = (fun x -> x.modifiedTime);
    GapiLens.set = (fun v x -> { x with modifiedTime = v });
  }
  let modifiedByMeTime = {
    GapiLens.get = (fun x -> x.modifiedByMeTime);
    GapiLens.set = (fun v x -> { x with modifiedByMeTime = v });
  }
  let viewedByMeTime = {
    GapiLens.get = (fun x -> x.viewedByMeTime);
    GapiLens.set = (fun v x -> { x with viewedByMeTime = v });
  }
  let sharedWithMeTime = {
    GapiLens.get = (fun x -> x.sharedWithMeTime);
    GapiLens.set = (fun v x -> { x with sharedWithMeTime = v });
  }
  let quotaBytesUsed = {
    GapiLens.get = (fun x -> x.quotaBytesUsed);
    GapiLens.set = (fun v x -> { x with quotaBytesUsed = v });
  }
  let version = {
    GapiLens.get = (fun x -> x.version);
    GapiLens.set = (fun v x -> { x with version = v });
  }
  let originalFilename = {
    GapiLens.get = (fun x -> x.originalFilename);
    GapiLens.set = (fun v x -> { x with originalFilename = v });
  }
  let ownedByMe = {
    GapiLens.get = (fun x -> x.ownedByMe);
    GapiLens.set = (fun v x -> { x with ownedByMe = v });
  }
  let fullFileExtension = {
    GapiLens.get = (fun x -> x.fullFileExtension);
    GapiLens.set = (fun v x -> { x with fullFileExtension = v });
  }
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  let appProperties = {
    GapiLens.get = (fun x -> x.appProperties);
    GapiLens.set = (fun v x -> { x with appProperties = v });
  }
  let isAppAuthorized = {
    GapiLens.get = (fun x -> x.isAppAuthorized);
    GapiLens.set = (fun v x -> { x with isAppAuthorized = v });
  }
  let teamDriveId = {
    GapiLens.get = (fun x -> x.teamDriveId);
    GapiLens.set = (fun v x -> { x with teamDriveId = v });
  }
  let capabilities = {
    GapiLens.get = (fun x -> x.capabilities);
    GapiLens.set = (fun v x -> { x with capabilities = v });
  }
  let hasAugmentedPermissions = {
    GapiLens.get = (fun x -> x.hasAugmentedPermissions);
    GapiLens.set = (fun v x -> { x with hasAugmentedPermissions = v });
  }
  let trashingUser = {
    GapiLens.get = (fun x -> x.trashingUser);
    GapiLens.set = (fun v x -> { x with trashingUser = v });
  }
  let thumbnailVersion = {
    GapiLens.get = (fun x -> x.thumbnailVersion);
    GapiLens.set = (fun v x -> { x with thumbnailVersion = v });
  }
  let trashedTime = {
    GapiLens.get = (fun x -> x.trashedTime);
    GapiLens.set = (fun v x -> { x with trashedTime = v });
  }
  let modifiedByMe = {
    GapiLens.get = (fun x -> x.modifiedByMe);
    GapiLens.set = (fun v x -> { x with modifiedByMe = v });
  }
  let permissionIds = {
    GapiLens.get = (fun x -> x.permissionIds);
    GapiLens.set = (fun v x -> { x with permissionIds = v });
  }
  let imageMediaMetadata = {
    GapiLens.get = (fun x -> x.imageMediaMetadata);
    GapiLens.set = (fun v x -> { x with imageMediaMetadata = v });
  }
  let videoMediaMetadata = {
    GapiLens.get = (fun x -> x.videoMediaMetadata);
    GapiLens.set = (fun v x -> { x with videoMediaMetadata = v });
  }
  let shortcutDetails = {
    GapiLens.get = (fun x -> x.shortcutDetails);
    GapiLens.set = (fun v x -> { x with shortcutDetails = v });
  }
  let contentRestrictions = {
    GapiLens.get = (fun x -> x.contentRestrictions);
    GapiLens.set = (fun v x -> { x with contentRestrictions = v });
  }
  let resourceKey = {
    GapiLens.get = (fun x -> x.resourceKey);
    GapiLens.set = (fun v x -> { x with resourceKey = v });
  }
  let linkShareMetadata = {
    GapiLens.get = (fun x -> x.linkShareMetadata);
    GapiLens.set = (fun v x -> { x with linkShareMetadata = v });
  }
  let labelInfo = {
    GapiLens.get = (fun x -> x.labelInfo);
    GapiLens.set = (fun v x -> { x with labelInfo = v });
  }
  let sha1Checksum = {
    GapiLens.get = (fun x -> x.sha1Checksum);
    GapiLens.set = (fun v x -> { x with sha1Checksum = v });
  }
  let sha256Checksum = {
    GapiLens.get = (fun x -> x.sha256Checksum);
    GapiLens.set = (fun v x -> { x with sha256Checksum = v });
  }
  let inheritedPermissionsDisabled = {
    GapiLens.get = (fun x -> x.inheritedPermissionsDisabled);
    GapiLens.set = (fun v x -> { x with inheritedPermissionsDisabled = v });
  }
  
  let empty = {
    kind = "";
    driveId = "";
    fileExtension = "";
    copyRequiresWriterPermission = false;
    md5Checksum = "";
    contentHints = ContentHints.empty;
    writersCanShare = false;
    viewedByMe = false;
    mimeType = "";
    exportLinks = [];
    parents = [];
    thumbnailLink = "";
    iconLink = "";
    shared = false;
    lastModifyingUser = User.empty;
    owners = [];
    headRevisionId = "";
    sharingUser = User.empty;
    webViewLink = "";
    webContentLink = "";
    size = 0L;
    viewersCanCopyContent = false;
    permissions = [];
    hasThumbnail = false;
    spaces = [];
    folderColorRgb = "";
    id = "";
    name = "";
    description = "";
    starred = false;
    trashed = false;
    explicitlyTrashed = false;
    createdTime = GapiDate.epoch;
    modifiedTime = GapiDate.epoch;
    modifiedByMeTime = GapiDate.epoch;
    viewedByMeTime = GapiDate.epoch;
    sharedWithMeTime = GapiDate.epoch;
    quotaBytesUsed = 0L;
    version = 0L;
    originalFilename = "";
    ownedByMe = false;
    fullFileExtension = "";
    properties = [];
    appProperties = [];
    isAppAuthorized = false;
    teamDriveId = "";
    capabilities = Capabilities.empty;
    hasAugmentedPermissions = false;
    trashingUser = User.empty;
    thumbnailVersion = 0L;
    trashedTime = GapiDate.epoch;
    modifiedByMe = false;
    permissionIds = [];
    imageMediaMetadata = ImageMediaMetadata.empty;
    videoMediaMetadata = VideoMediaMetadata.empty;
    shortcutDetails = ShortcutDetails.empty;
    contentRestrictions = [];
    resourceKey = "";
    linkShareMetadata = LinkShareMetadata.empty;
    labelInfo = LabelInfo.empty;
    sha1Checksum = "";
    sha256Checksum = "";
    inheritedPermissionsDisabled = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "driveId" x.driveId;
      GapiJson.render_string_value "fileExtension" x.fileExtension;
      GapiJson.render_bool_value "copyRequiresWriterPermission" x.copyRequiresWriterPermission;
      GapiJson.render_string_value "md5Checksum" x.md5Checksum;
      (fun v -> GapiJson.render_object "contentHints" (ContentHints.render_content v)) x.contentHints;
      GapiJson.render_bool_value "writersCanShare" x.writersCanShare;
      GapiJson.render_bool_value "viewedByMe" x.viewedByMe;
      GapiJson.render_string_value "mimeType" x.mimeType;
      GapiJson.render_collection "exportLinks" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.exportLinks;
      GapiJson.render_array "parents" (GapiJson.render_string_value "") x.parents;
      GapiJson.render_string_value "thumbnailLink" x.thumbnailLink;
      GapiJson.render_string_value "iconLink" x.iconLink;
      GapiJson.render_bool_value "shared" x.shared;
      (fun v -> GapiJson.render_object "lastModifyingUser" (User.render_content v)) x.lastModifyingUser;
      GapiJson.render_array "owners" User.render x.owners;
      GapiJson.render_string_value "headRevisionId" x.headRevisionId;
      (fun v -> GapiJson.render_object "sharingUser" (User.render_content v)) x.sharingUser;
      GapiJson.render_string_value "webViewLink" x.webViewLink;
      GapiJson.render_string_value "webContentLink" x.webContentLink;
      GapiJson.render_int64_value "size" x.size;
      GapiJson.render_bool_value "viewersCanCopyContent" x.viewersCanCopyContent;
      GapiJson.render_array "permissions" Permission.render x.permissions;
      GapiJson.render_bool_value "hasThumbnail" x.hasThumbnail;
      GapiJson.render_array "spaces" (GapiJson.render_string_value "") x.spaces;
      GapiJson.render_string_value "folderColorRgb" x.folderColorRgb;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_bool_value "starred" x.starred;
      GapiJson.render_bool_value "trashed" x.trashed;
      GapiJson.render_bool_value "explicitlyTrashed" x.explicitlyTrashed;
      GapiJson.render_date_value "createdTime" x.createdTime;
      GapiJson.render_date_value "modifiedTime" x.modifiedTime;
      GapiJson.render_date_value "modifiedByMeTime" x.modifiedByMeTime;
      GapiJson.render_date_value "viewedByMeTime" x.viewedByMeTime;
      GapiJson.render_date_value "sharedWithMeTime" x.sharedWithMeTime;
      GapiJson.render_int64_value "quotaBytesUsed" x.quotaBytesUsed;
      GapiJson.render_int64_value "version" x.version;
      GapiJson.render_string_value "originalFilename" x.originalFilename;
      GapiJson.render_bool_value "ownedByMe" x.ownedByMe;
      GapiJson.render_string_value "fullFileExtension" x.fullFileExtension;
      GapiJson.render_collection "properties" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.properties;
      GapiJson.render_collection "appProperties" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.appProperties;
      GapiJson.render_bool_value "isAppAuthorized" x.isAppAuthorized;
      GapiJson.render_string_value "teamDriveId" x.teamDriveId;
      (fun v -> GapiJson.render_object "capabilities" (Capabilities.render_content v)) x.capabilities;
      GapiJson.render_bool_value "hasAugmentedPermissions" x.hasAugmentedPermissions;
      (fun v -> GapiJson.render_object "trashingUser" (User.render_content v)) x.trashingUser;
      GapiJson.render_int64_value "thumbnailVersion" x.thumbnailVersion;
      GapiJson.render_date_value "trashedTime" x.trashedTime;
      GapiJson.render_bool_value "modifiedByMe" x.modifiedByMe;
      GapiJson.render_array "permissionIds" (GapiJson.render_string_value "") x.permissionIds;
      (fun v -> GapiJson.render_object "imageMediaMetadata" (ImageMediaMetadata.render_content v)) x.imageMediaMetadata;
      (fun v -> GapiJson.render_object "videoMediaMetadata" (VideoMediaMetadata.render_content v)) x.videoMediaMetadata;
      (fun v -> GapiJson.render_object "shortcutDetails" (ShortcutDetails.render_content v)) x.shortcutDetails;
      GapiJson.render_array "contentRestrictions" ContentRestriction.render x.contentRestrictions;
      GapiJson.render_string_value "resourceKey" x.resourceKey;
      (fun v -> GapiJson.render_object "linkShareMetadata" (LinkShareMetadata.render_content v)) x.linkShareMetadata;
      (fun v -> GapiJson.render_object "labelInfo" (LabelInfo.render_content v)) x.labelInfo;
      GapiJson.render_string_value "sha1Checksum" x.sha1Checksum;
      GapiJson.render_string_value "sha256Checksum" x.sha256Checksum;
      GapiJson.render_bool_value "inheritedPermissionsDisabled" x.inheritedPermissionsDisabled;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "driveId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with driveId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fileExtension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fileExtension = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "copyRequiresWriterPermission"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with copyRequiresWriterPermission = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "md5Checksum"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with md5Checksum = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "contentHints"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ContentHints.parse
        ContentHints.empty
        (fun v -> { x with contentHints = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "writersCanShare"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with writersCanShare = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "viewedByMe"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with viewedByMe = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "mimeType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with mimeType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "exportLinks"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = n; data_type = GapiJson.Scalar },
              `String v) ->
            (n, v)
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.File.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with exportLinks = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parents"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.File.parse.parse_collection" e x')
        ""
        (fun v -> { x with parents = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "thumbnailLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with thumbnailLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "iconLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with iconLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "shared"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with shared = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "lastModifyingUser"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with lastModifyingUser = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "owners"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children User.parse User.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.File.parse.parse_collection" e x')
        User.empty
        (fun v -> { x with owners = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "headRevisionId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with headRevisionId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sharingUser"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with sharingUser = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webViewLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webViewLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webContentLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webContentLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with size = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "viewersCanCopyContent"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with viewersCanCopyContent = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "permissions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Permission.parse
              Permission.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.File.parse.parse_collection" e x')
        Permission.empty
        (fun v -> { x with permissions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hasThumbnail"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hasThumbnail = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "spaces"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.File.parse.parse_collection" e x')
        ""
        (fun v -> { x with spaces = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "folderColorRgb"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with folderColorRgb = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "starred"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with starred = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "trashed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with trashed = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "explicitlyTrashed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with explicitlyTrashed = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedByMeTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedByMeTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "viewedByMeTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with viewedByMeTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sharedWithMeTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sharedWithMeTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "quotaBytesUsed"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with quotaBytesUsed = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "version"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with version = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "originalFilename"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with originalFilename = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "ownedByMe"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with ownedByMe = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fullFileExtension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fullFileExtension = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "properties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = n; data_type = GapiJson.Scalar },
              `String v) ->
            (n, v)
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.File.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with properties = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "appProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = n; data_type = GapiJson.Scalar },
              `String v) ->
            (n, v)
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.File.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with appProperties = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "isAppAuthorized"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with isAppAuthorized = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "teamDriveId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with teamDriveId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "capabilities"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Capabilities.parse
        Capabilities.empty
        (fun v -> { x with capabilities = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hasAugmentedPermissions"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hasAugmentedPermissions = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "trashingUser"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with trashingUser = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "thumbnailVersion"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with thumbnailVersion = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "trashedTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with trashedTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedByMe"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with modifiedByMe = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "permissionIds"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.File.parse.parse_collection" e x')
        ""
        (fun v -> { x with permissionIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "imageMediaMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ImageMediaMetadata.parse
        ImageMediaMetadata.empty
        (fun v -> { x with imageMediaMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "videoMediaMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        VideoMediaMetadata.parse
        VideoMediaMetadata.empty
        (fun v -> { x with videoMediaMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "shortcutDetails"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ShortcutDetails.parse
        ShortcutDetails.empty
        (fun v -> { x with shortcutDetails = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "contentRestrictions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ContentRestriction.parse
              ContentRestriction.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.File.parse.parse_collection" e x')
        ContentRestriction.empty
        (fun v -> { x with contentRestrictions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "resourceKey"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with resourceKey = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "linkShareMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        LinkShareMetadata.parse
        LinkShareMetadata.empty
        (fun v -> { x with linkShareMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labelInfo"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        LabelInfo.parse
        LabelInfo.empty
        (fun v -> { x with labelInfo = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sha1Checksum"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sha1Checksum = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sha256Checksum"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sha256Checksum = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "inheritedPermissionsDisabled"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with inheritedPermissionsDisabled = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.File.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Status =
struct
  type t = {
    code : int;
    message : string;
    details : (string * string) list list;
    
  }
  
  let code = {
    GapiLens.get = (fun x -> x.code);
    GapiLens.set = (fun v x -> { x with code = v });
  }
  let message = {
    GapiLens.get = (fun x -> x.message);
    GapiLens.set = (fun v x -> { x with message = v });
  }
  let details = {
    GapiLens.get = (fun x -> x.details);
    GapiLens.set = (fun v x -> { x with details = v });
  }
  
  let empty = {
    code = 0;
    message = "";
    details = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "code" x.code;
      GapiJson.render_string_value "message" x.message;
      GapiJson.render_array "details" (GapiJson.render_collection "" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v)) x.details;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "code"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with code = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "message"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with message = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "details"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_collection
              (fun x' -> function
                | GapiCore.AnnotatedTree.Leaf
                    ({ GapiJson.name = n; data_type = GapiJson.Scalar },
                    `String v) ->
                  (n, v)
                | e ->
                  GapiJson.unexpected "GapiDriveV3Model.Status.parse.parse_dictionary" e x')
              ("", "")
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.Status.parse.parse_collection" e x')
        []
        (fun v -> { x with details = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.Status.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Operation =
struct
  type t = {
    name : string;
    metadata : (string * string) list;
    _done : bool;
    error : Status.t;
    response : (string * string) list;
    
  }
  
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let metadata = {
    GapiLens.get = (fun x -> x.metadata);
    GapiLens.set = (fun v x -> { x with metadata = v });
  }
  let _done = {
    GapiLens.get = (fun x -> x._done);
    GapiLens.set = (fun v x -> { x with _done = v });
  }
  let error = {
    GapiLens.get = (fun x -> x.error);
    GapiLens.set = (fun v x -> { x with error = v });
  }
  let response = {
    GapiLens.get = (fun x -> x.response);
    GapiLens.set = (fun v x -> { x with response = v });
  }
  
  let empty = {
    name = "";
    metadata = [];
    _done = false;
    error = Status.empty;
    response = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_collection "metadata" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.metadata;
      GapiJson.render_bool_value "done" x._done;
      (fun v -> GapiJson.render_object "error" (Status.render_content v)) x.error;
      GapiJson.render_collection "response" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.response;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "metadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = n; data_type = GapiJson.Scalar },
              `String v) ->
            (n, v)
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.Operation.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with metadata = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "done"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with _done = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "error"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Status.parse
        Status.empty
        (fun v -> { x with error = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "response"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = n; data_type = GapiJson.Scalar },
              `String v) ->
            (n, v)
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.Operation.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with response = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.Operation.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ListOperationsResponse =
struct
  type t = {
    operations : Operation.t list;
    nextPageToken : string;
    
  }
  
  let operations = {
    GapiLens.get = (fun x -> x.operations);
    GapiLens.set = (fun v x -> { x with operations = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  
  let empty = {
    operations = [];
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "operations" Operation.render x.operations;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "operations"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Operation.parse
              Operation.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.ListOperationsResponse.parse.parse_collection" e x')
        Operation.empty
        (fun v -> { x with operations = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.ListOperationsResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Drive =
struct
  module Restrictions =
  struct
    type t = {
      copyRequiresWriterPermission : bool;
      domainUsersOnly : bool;
      driveMembersOnly : bool;
      adminManagedRestrictions : bool;
      sharingFoldersRequiresOrganizerPermission : bool;
      downloadRestriction : DownloadRestriction.t;
      
    }
    
    let copyRequiresWriterPermission = {
      GapiLens.get = (fun x -> x.copyRequiresWriterPermission);
      GapiLens.set = (fun v x -> { x with copyRequiresWriterPermission = v });
    }
    let domainUsersOnly = {
      GapiLens.get = (fun x -> x.domainUsersOnly);
      GapiLens.set = (fun v x -> { x with domainUsersOnly = v });
    }
    let driveMembersOnly = {
      GapiLens.get = (fun x -> x.driveMembersOnly);
      GapiLens.set = (fun v x -> { x with driveMembersOnly = v });
    }
    let adminManagedRestrictions = {
      GapiLens.get = (fun x -> x.adminManagedRestrictions);
      GapiLens.set = (fun v x -> { x with adminManagedRestrictions = v });
    }
    let sharingFoldersRequiresOrganizerPermission = {
      GapiLens.get = (fun x -> x.sharingFoldersRequiresOrganizerPermission);
      GapiLens.set = (fun v x -> { x with sharingFoldersRequiresOrganizerPermission = v });
    }
    let downloadRestriction = {
      GapiLens.get = (fun x -> x.downloadRestriction);
      GapiLens.set = (fun v x -> { x with downloadRestriction = v });
    }
    
    let empty = {
      copyRequiresWriterPermission = false;
      domainUsersOnly = false;
      driveMembersOnly = false;
      adminManagedRestrictions = false;
      sharingFoldersRequiresOrganizerPermission = false;
      downloadRestriction = DownloadRestriction.empty;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "copyRequiresWriterPermission" x.copyRequiresWriterPermission;
        GapiJson.render_bool_value "domainUsersOnly" x.domainUsersOnly;
        GapiJson.render_bool_value "driveMembersOnly" x.driveMembersOnly;
        GapiJson.render_bool_value "adminManagedRestrictions" x.adminManagedRestrictions;
        GapiJson.render_bool_value "sharingFoldersRequiresOrganizerPermission" x.sharingFoldersRequiresOrganizerPermission;
        (fun v -> GapiJson.render_object "downloadRestriction" (DownloadRestriction.render_content v)) x.downloadRestriction;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "copyRequiresWriterPermission"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with copyRequiresWriterPermission = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "domainUsersOnly"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with domainUsersOnly = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "driveMembersOnly"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with driveMembersOnly = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "adminManagedRestrictions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with adminManagedRestrictions = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "sharingFoldersRequiresOrganizerPermission"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with sharingFoldersRequiresOrganizerPermission = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "downloadRestriction"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          DownloadRestriction.parse
          DownloadRestriction.empty
          (fun v -> { x with downloadRestriction = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.Restrictions.parse" e x
    
  end
  
  module BackgroundImageFile =
  struct
    type t = {
      id : string;
      xCoordinate : float;
      yCoordinate : float;
      width : float;
      
    }
    
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    let xCoordinate = {
      GapiLens.get = (fun x -> x.xCoordinate);
      GapiLens.set = (fun v x -> { x with xCoordinate = v });
    }
    let yCoordinate = {
      GapiLens.get = (fun x -> x.yCoordinate);
      GapiLens.set = (fun v x -> { x with yCoordinate = v });
    }
    let width = {
      GapiLens.get = (fun x -> x.width);
      GapiLens.set = (fun v x -> { x with width = v });
    }
    
    let empty = {
      id = "";
      xCoordinate = 0.0;
      yCoordinate = 0.0;
      width = 0.0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "id" x.id;
        GapiJson.render_float_value "xCoordinate" x.xCoordinate;
        GapiJson.render_float_value "yCoordinate" x.yCoordinate;
        GapiJson.render_float_value "width" x.width;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "xCoordinate"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with xCoordinate = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "xCoordinate"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with xCoordinate = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "yCoordinate"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with yCoordinate = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "yCoordinate"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with yCoordinate = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with width = float_of_int v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.BackgroundImageFile.parse" e x
    
  end
  
  module Capabilities =
  struct
    type t = {
      canAddChildren : bool;
      canComment : bool;
      canCopy : bool;
      canDeleteDrive : bool;
      canDownload : bool;
      canEdit : bool;
      canListChildren : bool;
      canManageMembers : bool;
      canReadRevisions : bool;
      canRename : bool;
      canRenameDrive : bool;
      canChangeDriveBackground : bool;
      canShare : bool;
      canChangeCopyRequiresWriterPermissionRestriction : bool;
      canChangeDomainUsersOnlyRestriction : bool;
      canChangeDriveMembersOnlyRestriction : bool;
      canChangeSharingFoldersRequiresOrganizerPermissionRestriction : bool;
      canResetDriveRestrictions : bool;
      canDeleteChildren : bool;
      canTrashChildren : bool;
      
    }
    
    let canAddChildren = {
      GapiLens.get = (fun x -> x.canAddChildren);
      GapiLens.set = (fun v x -> { x with canAddChildren = v });
    }
    let canComment = {
      GapiLens.get = (fun x -> x.canComment);
      GapiLens.set = (fun v x -> { x with canComment = v });
    }
    let canCopy = {
      GapiLens.get = (fun x -> x.canCopy);
      GapiLens.set = (fun v x -> { x with canCopy = v });
    }
    let canDeleteDrive = {
      GapiLens.get = (fun x -> x.canDeleteDrive);
      GapiLens.set = (fun v x -> { x with canDeleteDrive = v });
    }
    let canDownload = {
      GapiLens.get = (fun x -> x.canDownload);
      GapiLens.set = (fun v x -> { x with canDownload = v });
    }
    let canEdit = {
      GapiLens.get = (fun x -> x.canEdit);
      GapiLens.set = (fun v x -> { x with canEdit = v });
    }
    let canListChildren = {
      GapiLens.get = (fun x -> x.canListChildren);
      GapiLens.set = (fun v x -> { x with canListChildren = v });
    }
    let canManageMembers = {
      GapiLens.get = (fun x -> x.canManageMembers);
      GapiLens.set = (fun v x -> { x with canManageMembers = v });
    }
    let canReadRevisions = {
      GapiLens.get = (fun x -> x.canReadRevisions);
      GapiLens.set = (fun v x -> { x with canReadRevisions = v });
    }
    let canRename = {
      GapiLens.get = (fun x -> x.canRename);
      GapiLens.set = (fun v x -> { x with canRename = v });
    }
    let canRenameDrive = {
      GapiLens.get = (fun x -> x.canRenameDrive);
      GapiLens.set = (fun v x -> { x with canRenameDrive = v });
    }
    let canChangeDriveBackground = {
      GapiLens.get = (fun x -> x.canChangeDriveBackground);
      GapiLens.set = (fun v x -> { x with canChangeDriveBackground = v });
    }
    let canShare = {
      GapiLens.get = (fun x -> x.canShare);
      GapiLens.set = (fun v x -> { x with canShare = v });
    }
    let canChangeCopyRequiresWriterPermissionRestriction = {
      GapiLens.get = (fun x -> x.canChangeCopyRequiresWriterPermissionRestriction);
      GapiLens.set = (fun v x -> { x with canChangeCopyRequiresWriterPermissionRestriction = v });
    }
    let canChangeDomainUsersOnlyRestriction = {
      GapiLens.get = (fun x -> x.canChangeDomainUsersOnlyRestriction);
      GapiLens.set = (fun v x -> { x with canChangeDomainUsersOnlyRestriction = v });
    }
    let canChangeDriveMembersOnlyRestriction = {
      GapiLens.get = (fun x -> x.canChangeDriveMembersOnlyRestriction);
      GapiLens.set = (fun v x -> { x with canChangeDriveMembersOnlyRestriction = v });
    }
    let canChangeSharingFoldersRequiresOrganizerPermissionRestriction = {
      GapiLens.get = (fun x -> x.canChangeSharingFoldersRequiresOrganizerPermissionRestriction);
      GapiLens.set = (fun v x -> { x with canChangeSharingFoldersRequiresOrganizerPermissionRestriction = v });
    }
    let canResetDriveRestrictions = {
      GapiLens.get = (fun x -> x.canResetDriveRestrictions);
      GapiLens.set = (fun v x -> { x with canResetDriveRestrictions = v });
    }
    let canDeleteChildren = {
      GapiLens.get = (fun x -> x.canDeleteChildren);
      GapiLens.set = (fun v x -> { x with canDeleteChildren = v });
    }
    let canTrashChildren = {
      GapiLens.get = (fun x -> x.canTrashChildren);
      GapiLens.set = (fun v x -> { x with canTrashChildren = v });
    }
    
    let empty = {
      canAddChildren = false;
      canComment = false;
      canCopy = false;
      canDeleteDrive = false;
      canDownload = false;
      canEdit = false;
      canListChildren = false;
      canManageMembers = false;
      canReadRevisions = false;
      canRename = false;
      canRenameDrive = false;
      canChangeDriveBackground = false;
      canShare = false;
      canChangeCopyRequiresWriterPermissionRestriction = false;
      canChangeDomainUsersOnlyRestriction = false;
      canChangeDriveMembersOnlyRestriction = false;
      canChangeSharingFoldersRequiresOrganizerPermissionRestriction = false;
      canResetDriveRestrictions = false;
      canDeleteChildren = false;
      canTrashChildren = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "canAddChildren" x.canAddChildren;
        GapiJson.render_bool_value "canComment" x.canComment;
        GapiJson.render_bool_value "canCopy" x.canCopy;
        GapiJson.render_bool_value "canDeleteDrive" x.canDeleteDrive;
        GapiJson.render_bool_value "canDownload" x.canDownload;
        GapiJson.render_bool_value "canEdit" x.canEdit;
        GapiJson.render_bool_value "canListChildren" x.canListChildren;
        GapiJson.render_bool_value "canManageMembers" x.canManageMembers;
        GapiJson.render_bool_value "canReadRevisions" x.canReadRevisions;
        GapiJson.render_bool_value "canRename" x.canRename;
        GapiJson.render_bool_value "canRenameDrive" x.canRenameDrive;
        GapiJson.render_bool_value "canChangeDriveBackground" x.canChangeDriveBackground;
        GapiJson.render_bool_value "canShare" x.canShare;
        GapiJson.render_bool_value "canChangeCopyRequiresWriterPermissionRestriction" x.canChangeCopyRequiresWriterPermissionRestriction;
        GapiJson.render_bool_value "canChangeDomainUsersOnlyRestriction" x.canChangeDomainUsersOnlyRestriction;
        GapiJson.render_bool_value "canChangeDriveMembersOnlyRestriction" x.canChangeDriveMembersOnlyRestriction;
        GapiJson.render_bool_value "canChangeSharingFoldersRequiresOrganizerPermissionRestriction" x.canChangeSharingFoldersRequiresOrganizerPermissionRestriction;
        GapiJson.render_bool_value "canResetDriveRestrictions" x.canResetDriveRestrictions;
        GapiJson.render_bool_value "canDeleteChildren" x.canDeleteChildren;
        GapiJson.render_bool_value "canTrashChildren" x.canTrashChildren;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canAddChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canAddChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canComment"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canComment = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canCopy"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canCopy = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDeleteDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDeleteDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDownload"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDownload = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canEdit"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canEdit = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canListChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canListChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canManageMembers"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canManageMembers = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canReadRevisions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canReadRevisions = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canRename"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canRename = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canRenameDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canRenameDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeDriveBackground"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeDriveBackground = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canShare"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canShare = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeCopyRequiresWriterPermissionRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeCopyRequiresWriterPermissionRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeDomainUsersOnlyRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeDomainUsersOnlyRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeDriveMembersOnlyRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeDriveMembersOnlyRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeSharingFoldersRequiresOrganizerPermissionRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeSharingFoldersRequiresOrganizerPermissionRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canResetDriveRestrictions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canResetDriveRestrictions = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDeleteChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDeleteChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canTrashChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canTrashChildren = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.Capabilities.parse" e x
    
  end
  
  type t = {
    id : string;
    name : string;
    colorRgb : string;
    kind : string;
    backgroundImageLink : string;
    capabilities : Capabilities.t;
    themeId : string;
    backgroundImageFile : BackgroundImageFile.t;
    createdTime : GapiDate.t;
    hidden : bool;
    restrictions : Restrictions.t;
    orgUnitId : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let colorRgb = {
    GapiLens.get = (fun x -> x.colorRgb);
    GapiLens.set = (fun v x -> { x with colorRgb = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let backgroundImageLink = {
    GapiLens.get = (fun x -> x.backgroundImageLink);
    GapiLens.set = (fun v x -> { x with backgroundImageLink = v });
  }
  let capabilities = {
    GapiLens.get = (fun x -> x.capabilities);
    GapiLens.set = (fun v x -> { x with capabilities = v });
  }
  let themeId = {
    GapiLens.get = (fun x -> x.themeId);
    GapiLens.set = (fun v x -> { x with themeId = v });
  }
  let backgroundImageFile = {
    GapiLens.get = (fun x -> x.backgroundImageFile);
    GapiLens.set = (fun v x -> { x with backgroundImageFile = v });
  }
  let createdTime = {
    GapiLens.get = (fun x -> x.createdTime);
    GapiLens.set = (fun v x -> { x with createdTime = v });
  }
  let hidden = {
    GapiLens.get = (fun x -> x.hidden);
    GapiLens.set = (fun v x -> { x with hidden = v });
  }
  let restrictions = {
    GapiLens.get = (fun x -> x.restrictions);
    GapiLens.set = (fun v x -> { x with restrictions = v });
  }
  let orgUnitId = {
    GapiLens.get = (fun x -> x.orgUnitId);
    GapiLens.set = (fun v x -> { x with orgUnitId = v });
  }
  
  let empty = {
    id = "";
    name = "";
    colorRgb = "";
    kind = "";
    backgroundImageLink = "";
    capabilities = Capabilities.empty;
    themeId = "";
    backgroundImageFile = BackgroundImageFile.empty;
    createdTime = GapiDate.epoch;
    hidden = false;
    restrictions = Restrictions.empty;
    orgUnitId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "colorRgb" x.colorRgb;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "backgroundImageLink" x.backgroundImageLink;
      (fun v -> GapiJson.render_object "capabilities" (Capabilities.render_content v)) x.capabilities;
      GapiJson.render_string_value "themeId" x.themeId;
      (fun v -> GapiJson.render_object "backgroundImageFile" (BackgroundImageFile.render_content v)) x.backgroundImageFile;
      GapiJson.render_date_value "createdTime" x.createdTime;
      GapiJson.render_bool_value "hidden" x.hidden;
      (fun v -> GapiJson.render_object "restrictions" (Restrictions.render_content v)) x.restrictions;
      GapiJson.render_string_value "orgUnitId" x.orgUnitId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "colorRgb"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with colorRgb = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "backgroundImageLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with backgroundImageLink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "capabilities"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Capabilities.parse
        Capabilities.empty
        (fun v -> { x with capabilities = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "themeId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with themeId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundImageFile"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BackgroundImageFile.parse
        BackgroundImageFile.empty
        (fun v -> { x with backgroundImageFile = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hidden"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hidden = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "restrictions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Restrictions.parse
        Restrictions.empty
        (fun v -> { x with restrictions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "orgUnitId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with orgUnitId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.Drive.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Change =
struct
  type t = {
    kind : string;
    removed : bool;
    file : File.t;
    fileId : string;
    time : GapiDate.t;
    driveId : string;
    _type : string;
    teamDriveId : string;
    teamDrive : TeamDrive.t;
    changeType : string;
    drive : Drive.t;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let removed = {
    GapiLens.get = (fun x -> x.removed);
    GapiLens.set = (fun v x -> { x with removed = v });
  }
  let file = {
    GapiLens.get = (fun x -> x.file);
    GapiLens.set = (fun v x -> { x with file = v });
  }
  let fileId = {
    GapiLens.get = (fun x -> x.fileId);
    GapiLens.set = (fun v x -> { x with fileId = v });
  }
  let time = {
    GapiLens.get = (fun x -> x.time);
    GapiLens.set = (fun v x -> { x with time = v });
  }
  let driveId = {
    GapiLens.get = (fun x -> x.driveId);
    GapiLens.set = (fun v x -> { x with driveId = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let teamDriveId = {
    GapiLens.get = (fun x -> x.teamDriveId);
    GapiLens.set = (fun v x -> { x with teamDriveId = v });
  }
  let teamDrive = {
    GapiLens.get = (fun x -> x.teamDrive);
    GapiLens.set = (fun v x -> { x with teamDrive = v });
  }
  let changeType = {
    GapiLens.get = (fun x -> x.changeType);
    GapiLens.set = (fun v x -> { x with changeType = v });
  }
  let drive = {
    GapiLens.get = (fun x -> x.drive);
    GapiLens.set = (fun v x -> { x with drive = v });
  }
  
  let empty = {
    kind = "";
    removed = false;
    file = File.empty;
    fileId = "";
    time = GapiDate.epoch;
    driveId = "";
    _type = "";
    teamDriveId = "";
    teamDrive = TeamDrive.empty;
    changeType = "";
    drive = Drive.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_bool_value "removed" x.removed;
      (fun v -> GapiJson.render_object "file" (File.render_content v)) x.file;
      GapiJson.render_string_value "fileId" x.fileId;
      GapiJson.render_date_value "time" x.time;
      GapiJson.render_string_value "driveId" x.driveId;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_string_value "teamDriveId" x.teamDriveId;
      (fun v -> GapiJson.render_object "teamDrive" (TeamDrive.render_content v)) x.teamDrive;
      GapiJson.render_string_value "changeType" x.changeType;
      (fun v -> GapiJson.render_object "drive" (Drive.render_content v)) x.drive;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "removed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with removed = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "file"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        File.parse
        File.empty
        (fun v -> { x with file = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fileId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fileId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "time"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with time = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "driveId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with driveId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "teamDriveId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with teamDriveId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "teamDrive"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TeamDrive.parse
        TeamDrive.empty
        (fun v -> { x with teamDrive = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "changeType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with changeType = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "drive"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Drive.parse
        Drive.empty
        (fun v -> { x with drive = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.Change.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ReplyList =
struct
  type t = {
    kind : string;
    replies : Reply.t list;
    nextPageToken : string;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let replies = {
    GapiLens.get = (fun x -> x.replies);
    GapiLens.set = (fun v x -> { x with replies = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  
  let empty = {
    kind = "";
    replies = [];
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "replies" Reply.render x.replies;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "replies"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Reply.parse Reply.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.ReplyList.parse.parse_collection" e x')
        Reply.empty
        (fun v -> { x with replies = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.ReplyList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ResolveAccessProposalRequest =
struct
  type t = {
    role : string list;
    view : string;
    action : string;
    sendNotification : bool;
    
  }
  
  let role = {
    GapiLens.get = (fun x -> x.role);
    GapiLens.set = (fun v x -> { x with role = v });
  }
  let view = {
    GapiLens.get = (fun x -> x.view);
    GapiLens.set = (fun v x -> { x with view = v });
  }
  let action = {
    GapiLens.get = (fun x -> x.action);
    GapiLens.set = (fun v x -> { x with action = v });
  }
  let sendNotification = {
    GapiLens.get = (fun x -> x.sendNotification);
    GapiLens.set = (fun v x -> { x with sendNotification = v });
  }
  
  let empty = {
    role = [];
    view = "";
    action = "";
    sendNotification = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "role" (GapiJson.render_string_value "") x.role;
      GapiJson.render_string_value "view" x.view;
      GapiJson.render_string_value "action" x.action;
      GapiJson.render_bool_value "sendNotification" x.sendNotification;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "role"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.ResolveAccessProposalRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with role = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "view"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with view = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "action"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with action = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sendNotification"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with sendNotification = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.ResolveAccessProposalRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module LabelModification =
struct
  type t = {
    labelId : string;
    fieldModifications : LabelFieldModification.t list;
    removeLabel : bool;
    kind : string;
    
  }
  
  let labelId = {
    GapiLens.get = (fun x -> x.labelId);
    GapiLens.set = (fun v x -> { x with labelId = v });
  }
  let fieldModifications = {
    GapiLens.get = (fun x -> x.fieldModifications);
    GapiLens.set = (fun v x -> { x with fieldModifications = v });
  }
  let removeLabel = {
    GapiLens.get = (fun x -> x.removeLabel);
    GapiLens.set = (fun v x -> { x with removeLabel = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    labelId = "";
    fieldModifications = [];
    removeLabel = false;
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "labelId" x.labelId;
      GapiJson.render_array "fieldModifications" LabelFieldModification.render x.fieldModifications;
      GapiJson.render_bool_value "removeLabel" x.removeLabel;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "labelId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with labelId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "fieldModifications"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              LabelFieldModification.parse
              LabelFieldModification.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.LabelModification.parse.parse_collection" e x')
        LabelFieldModification.empty
        (fun v -> { x with fieldModifications = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "removeLabel"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with removeLabel = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.LabelModification.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ModifyLabelsRequest =
struct
  type t = {
    labelModifications : LabelModification.t list;
    kind : string;
    
  }
  
  let labelModifications = {
    GapiLens.get = (fun x -> x.labelModifications);
    GapiLens.set = (fun v x -> { x with labelModifications = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    labelModifications = [];
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "labelModifications" LabelModification.render x.labelModifications;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labelModifications"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              LabelModification.parse
              LabelModification.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.ModifyLabelsRequest.parse.parse_collection" e x')
        LabelModification.empty
        (fun v -> { x with labelModifications = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.ModifyLabelsRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PermissionList =
struct
  type t = {
    nextPageToken : string;
    kind : string;
    permissions : Permission.t list;
    
  }
  
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let permissions = {
    GapiLens.get = (fun x -> x.permissions);
    GapiLens.set = (fun v x -> { x with permissions = v });
  }
  
  let empty = {
    nextPageToken = "";
    kind = "";
    permissions = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "permissions" Permission.render x.permissions;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "permissions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Permission.parse
              Permission.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.PermissionList.parse.parse_collection" e x')
        Permission.empty
        (fun v -> { x with permissions = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.PermissionList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ModifyLabelsResponse =
struct
  type t = {
    modifiedLabels : Label.t list;
    kind : string;
    
  }
  
  let modifiedLabels = {
    GapiLens.get = (fun x -> x.modifiedLabels);
    GapiLens.set = (fun v x -> { x with modifiedLabels = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    modifiedLabels = [];
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "modifiedLabels" Label.render x.modifiedLabels;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "modifiedLabels"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Label.parse Label.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.ModifyLabelsResponse.parse.parse_collection" e x')
        Label.empty
        (fun v -> { x with modifiedLabels = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.ModifyLabelsResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChangeList =
struct
  type t = {
    kind : string;
    nextPageToken : string;
    newStartPageToken : string;
    changes : Change.t list;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let newStartPageToken = {
    GapiLens.get = (fun x -> x.newStartPageToken);
    GapiLens.set = (fun v x -> { x with newStartPageToken = v });
  }
  let changes = {
    GapiLens.get = (fun x -> x.changes);
    GapiLens.set = (fun v x -> { x with changes = v });
  }
  
  let empty = {
    kind = "";
    nextPageToken = "";
    newStartPageToken = "";
    changes = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "newStartPageToken" x.newStartPageToken;
      GapiJson.render_array "changes" Change.render x.changes;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "newStartPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with newStartPageToken = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "changes"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Change.parse Change.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.ChangeList.parse.parse_collection" e x')
        Change.empty
        (fun v -> { x with changes = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.ChangeList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AccessProposalRoleAndView =
struct
  type t = {
    role : string;
    view : string;
    
  }
  
  let role = {
    GapiLens.get = (fun x -> x.role);
    GapiLens.set = (fun v x -> { x with role = v });
  }
  let view = {
    GapiLens.get = (fun x -> x.view);
    GapiLens.set = (fun v x -> { x with view = v });
  }
  
  let empty = {
    role = "";
    view = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "role" x.role;
      GapiJson.render_string_value "view" x.view;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "role"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with role = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "view"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with view = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.AccessProposalRoleAndView.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module StartPageToken =
struct
  type t = {
    startPageToken : string;
    kind : string;
    
  }
  
  let startPageToken = {
    GapiLens.get = (fun x -> x.startPageToken);
    GapiLens.set = (fun v x -> { x with startPageToken = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    startPageToken = "";
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "startPageToken" x.startPageToken;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with startPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.StartPageToken.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AccessProposal =
struct
  type t = {
    fileId : string;
    proposalId : string;
    requesterEmailAddress : string;
    recipientEmailAddress : string;
    rolesAndViews : AccessProposalRoleAndView.t list;
    requestMessage : string;
    createTime : string;
    
  }
  
  let fileId = {
    GapiLens.get = (fun x -> x.fileId);
    GapiLens.set = (fun v x -> { x with fileId = v });
  }
  let proposalId = {
    GapiLens.get = (fun x -> x.proposalId);
    GapiLens.set = (fun v x -> { x with proposalId = v });
  }
  let requesterEmailAddress = {
    GapiLens.get = (fun x -> x.requesterEmailAddress);
    GapiLens.set = (fun v x -> { x with requesterEmailAddress = v });
  }
  let recipientEmailAddress = {
    GapiLens.get = (fun x -> x.recipientEmailAddress);
    GapiLens.set = (fun v x -> { x with recipientEmailAddress = v });
  }
  let rolesAndViews = {
    GapiLens.get = (fun x -> x.rolesAndViews);
    GapiLens.set = (fun v x -> { x with rolesAndViews = v });
  }
  let requestMessage = {
    GapiLens.get = (fun x -> x.requestMessage);
    GapiLens.set = (fun v x -> { x with requestMessage = v });
  }
  let createTime = {
    GapiLens.get = (fun x -> x.createTime);
    GapiLens.set = (fun v x -> { x with createTime = v });
  }
  
  let empty = {
    fileId = "";
    proposalId = "";
    requesterEmailAddress = "";
    recipientEmailAddress = "";
    rolesAndViews = [];
    requestMessage = "";
    createTime = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "fileId" x.fileId;
      GapiJson.render_string_value "proposalId" x.proposalId;
      GapiJson.render_string_value "requesterEmailAddress" x.requesterEmailAddress;
      GapiJson.render_string_value "recipientEmailAddress" x.recipientEmailAddress;
      GapiJson.render_array "rolesAndViews" AccessProposalRoleAndView.render x.rolesAndViews;
      GapiJson.render_string_value "requestMessage" x.requestMessage;
      GapiJson.render_string_value "createTime" x.createTime;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fileId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fileId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "proposalId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with proposalId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "requesterEmailAddress"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with requesterEmailAddress = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "recipientEmailAddress"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with recipientEmailAddress = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "rolesAndViews"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              AccessProposalRoleAndView.parse
              AccessProposalRoleAndView.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.AccessProposal.parse.parse_collection" e x')
        AccessProposalRoleAndView.empty
        (fun v -> { x with rolesAndViews = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "requestMessage"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with requestMessage = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createTime = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.AccessProposal.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ListAccessProposalsResponse =
struct
  type t = {
    accessProposals : AccessProposal.t list;
    nextPageToken : string;
    
  }
  
  let accessProposals = {
    GapiLens.get = (fun x -> x.accessProposals);
    GapiLens.set = (fun v x -> { x with accessProposals = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  
  let empty = {
    accessProposals = [];
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "accessProposals" AccessProposal.render x.accessProposals;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "accessProposals"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              AccessProposal.parse
              AccessProposal.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.ListAccessProposalsResponse.parse.parse_collection" e x')
        AccessProposal.empty
        (fun v -> { x with accessProposals = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.ListAccessProposalsResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RevisionList =
struct
  type t = {
    nextPageToken : string;
    kind : string;
    revisions : Revision.t list;
    
  }
  
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let revisions = {
    GapiLens.get = (fun x -> x.revisions);
    GapiLens.set = (fun v x -> { x with revisions = v });
  }
  
  let empty = {
    nextPageToken = "";
    kind = "";
    revisions = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "revisions" Revision.render x.revisions;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "revisions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Revision.parse
              Revision.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.RevisionList.parse.parse_collection" e x')
        Revision.empty
        (fun v -> { x with revisions = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.RevisionList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Channel =
struct
  type t = {
    payload : bool;
    id : string;
    resourceId : string;
    resourceUri : string;
    token : string;
    expiration : int64;
    _type : string;
    address : string;
    params : (string * string) list;
    kind : string;
    
  }
  
  let payload = {
    GapiLens.get = (fun x -> x.payload);
    GapiLens.set = (fun v x -> { x with payload = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let resourceId = {
    GapiLens.get = (fun x -> x.resourceId);
    GapiLens.set = (fun v x -> { x with resourceId = v });
  }
  let resourceUri = {
    GapiLens.get = (fun x -> x.resourceUri);
    GapiLens.set = (fun v x -> { x with resourceUri = v });
  }
  let token = {
    GapiLens.get = (fun x -> x.token);
    GapiLens.set = (fun v x -> { x with token = v });
  }
  let expiration = {
    GapiLens.get = (fun x -> x.expiration);
    GapiLens.set = (fun v x -> { x with expiration = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let address = {
    GapiLens.get = (fun x -> x.address);
    GapiLens.set = (fun v x -> { x with address = v });
  }
  let params = {
    GapiLens.get = (fun x -> x.params);
    GapiLens.set = (fun v x -> { x with params = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    payload = false;
    id = "";
    resourceId = "";
    resourceUri = "";
    token = "";
    expiration = 0L;
    _type = "";
    address = "";
    params = [];
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "payload" x.payload;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "resourceId" x.resourceId;
      GapiJson.render_string_value "resourceUri" x.resourceUri;
      GapiJson.render_string_value "token" x.token;
      GapiJson.render_int64_value "expiration" x.expiration;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_string_value "address" x.address;
      GapiJson.render_collection "params" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.params;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "payload"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with payload = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "resourceId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with resourceId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "resourceUri"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with resourceUri = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "token"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with token = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "expiration"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with expiration = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "address"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with address = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "params"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = n; data_type = GapiJson.Scalar },
              `String v) ->
            (n, v)
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.Channel.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with params = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.Channel.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FileList =
struct
  type t = {
    nextPageToken : string;
    kind : string;
    incompleteSearch : bool;
    files : File.t list;
    
  }
  
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let incompleteSearch = {
    GapiLens.get = (fun x -> x.incompleteSearch);
    GapiLens.set = (fun v x -> { x with incompleteSearch = v });
  }
  let files = {
    GapiLens.get = (fun x -> x.files);
    GapiLens.set = (fun v x -> { x with files = v });
  }
  
  let empty = {
    nextPageToken = "";
    kind = "";
    incompleteSearch = false;
    files = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_bool_value "incompleteSearch" x.incompleteSearch;
      GapiJson.render_array "files" File.render x.files;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "incompleteSearch"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with incompleteSearch = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "files"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children File.parse File.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.FileList.parse.parse_collection" e x')
        File.empty
        (fun v -> { x with files = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.FileList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DriveList =
struct
  type t = {
    nextPageToken : string;
    kind : string;
    drives : Drive.t list;
    
  }
  
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let drives = {
    GapiLens.get = (fun x -> x.drives);
    GapiLens.set = (fun v x -> { x with drives = v });
  }
  
  let empty = {
    nextPageToken = "";
    kind = "";
    drives = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "drives" Drive.render x.drives;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "drives"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Drive.parse Drive.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV3Model.DriveList.parse.parse_collection" e x')
        Drive.empty
        (fun v -> { x with drives = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.DriveList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

