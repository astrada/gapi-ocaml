(* Warning! This file is generated. Modify at your own risk. *)

module TeamDrive =
struct
  module Restrictions =
  struct
    type t = {
      adminManagedRestrictions : bool;
      copyRequiresWriterPermission : bool;
      domainUsersOnly : bool;
      teamMembersOnly : bool;
      
    }
    
    let adminManagedRestrictions = {
      GapiLens.get = (fun x -> x.adminManagedRestrictions);
      GapiLens.set = (fun v x -> { x with adminManagedRestrictions = v });
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
    
    let empty = {
      adminManagedRestrictions = false;
      copyRequiresWriterPermission = false;
      domainUsersOnly = false;
      teamMembersOnly = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "adminManagedRestrictions" x.adminManagedRestrictions;
        GapiJson.render_bool_value "copyRequiresWriterPermission" x.copyRequiresWriterPermission;
        GapiJson.render_bool_value "domainUsersOnly" x.domainUsersOnly;
        GapiJson.render_bool_value "teamMembersOnly" x.teamMembersOnly;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "adminManagedRestrictions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with adminManagedRestrictions = v }
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
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.Restrictions.parse" e x
    
  end
  
  module Capabilities =
  struct
    type t = {
      canAddChildren : bool;
      canChangeCopyRequiresWriterPermissionRestriction : bool;
      canChangeDomainUsersOnlyRestriction : bool;
      canChangeTeamDriveBackground : bool;
      canChangeTeamMembersOnlyRestriction : bool;
      canComment : bool;
      canCopy : bool;
      canDeleteChildren : bool;
      canDeleteTeamDrive : bool;
      canDownload : bool;
      canEdit : bool;
      canListChildren : bool;
      canManageMembers : bool;
      canReadRevisions : bool;
      canRemoveChildren : bool;
      canRename : bool;
      canRenameTeamDrive : bool;
      canShare : bool;
      canTrashChildren : bool;
      
    }
    
    let canAddChildren = {
      GapiLens.get = (fun x -> x.canAddChildren);
      GapiLens.set = (fun v x -> { x with canAddChildren = v });
    }
    let canChangeCopyRequiresWriterPermissionRestriction = {
      GapiLens.get = (fun x -> x.canChangeCopyRequiresWriterPermissionRestriction);
      GapiLens.set = (fun v x -> { x with canChangeCopyRequiresWriterPermissionRestriction = v });
    }
    let canChangeDomainUsersOnlyRestriction = {
      GapiLens.get = (fun x -> x.canChangeDomainUsersOnlyRestriction);
      GapiLens.set = (fun v x -> { x with canChangeDomainUsersOnlyRestriction = v });
    }
    let canChangeTeamDriveBackground = {
      GapiLens.get = (fun x -> x.canChangeTeamDriveBackground);
      GapiLens.set = (fun v x -> { x with canChangeTeamDriveBackground = v });
    }
    let canChangeTeamMembersOnlyRestriction = {
      GapiLens.get = (fun x -> x.canChangeTeamMembersOnlyRestriction);
      GapiLens.set = (fun v x -> { x with canChangeTeamMembersOnlyRestriction = v });
    }
    let canComment = {
      GapiLens.get = (fun x -> x.canComment);
      GapiLens.set = (fun v x -> { x with canComment = v });
    }
    let canCopy = {
      GapiLens.get = (fun x -> x.canCopy);
      GapiLens.set = (fun v x -> { x with canCopy = v });
    }
    let canDeleteChildren = {
      GapiLens.get = (fun x -> x.canDeleteChildren);
      GapiLens.set = (fun v x -> { x with canDeleteChildren = v });
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
    let canShare = {
      GapiLens.get = (fun x -> x.canShare);
      GapiLens.set = (fun v x -> { x with canShare = v });
    }
    let canTrashChildren = {
      GapiLens.get = (fun x -> x.canTrashChildren);
      GapiLens.set = (fun v x -> { x with canTrashChildren = v });
    }
    
    let empty = {
      canAddChildren = false;
      canChangeCopyRequiresWriterPermissionRestriction = false;
      canChangeDomainUsersOnlyRestriction = false;
      canChangeTeamDriveBackground = false;
      canChangeTeamMembersOnlyRestriction = false;
      canComment = false;
      canCopy = false;
      canDeleteChildren = false;
      canDeleteTeamDrive = false;
      canDownload = false;
      canEdit = false;
      canListChildren = false;
      canManageMembers = false;
      canReadRevisions = false;
      canRemoveChildren = false;
      canRename = false;
      canRenameTeamDrive = false;
      canShare = false;
      canTrashChildren = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "canAddChildren" x.canAddChildren;
        GapiJson.render_bool_value "canChangeCopyRequiresWriterPermissionRestriction" x.canChangeCopyRequiresWriterPermissionRestriction;
        GapiJson.render_bool_value "canChangeDomainUsersOnlyRestriction" x.canChangeDomainUsersOnlyRestriction;
        GapiJson.render_bool_value "canChangeTeamDriveBackground" x.canChangeTeamDriveBackground;
        GapiJson.render_bool_value "canChangeTeamMembersOnlyRestriction" x.canChangeTeamMembersOnlyRestriction;
        GapiJson.render_bool_value "canComment" x.canComment;
        GapiJson.render_bool_value "canCopy" x.canCopy;
        GapiJson.render_bool_value "canDeleteChildren" x.canDeleteChildren;
        GapiJson.render_bool_value "canDeleteTeamDrive" x.canDeleteTeamDrive;
        GapiJson.render_bool_value "canDownload" x.canDownload;
        GapiJson.render_bool_value "canEdit" x.canEdit;
        GapiJson.render_bool_value "canListChildren" x.canListChildren;
        GapiJson.render_bool_value "canManageMembers" x.canManageMembers;
        GapiJson.render_bool_value "canReadRevisions" x.canReadRevisions;
        GapiJson.render_bool_value "canRemoveChildren" x.canRemoveChildren;
        GapiJson.render_bool_value "canRename" x.canRename;
        GapiJson.render_bool_value "canRenameTeamDrive" x.canRenameTeamDrive;
        GapiJson.render_bool_value "canShare" x.canShare;
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
          ({ GapiJson.name = "canChangeCopyRequiresWriterPermissionRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeCopyRequiresWriterPermissionRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeDomainUsersOnlyRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeDomainUsersOnlyRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeTeamDriveBackground"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeTeamDriveBackground = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeTeamMembersOnlyRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeTeamMembersOnlyRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canComment"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canComment = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canCopy"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canCopy = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDeleteChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDeleteChildren = v }
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
          ({ GapiJson.name = "canShare"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canShare = v }
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
  
  module BackgroundImageFile =
  struct
    type t = {
      id : string;
      width : float;
      xCoordinate : float;
      yCoordinate : float;
      
    }
    
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    let width = {
      GapiLens.get = (fun x -> x.width);
      GapiLens.set = (fun v x -> { x with width = v });
    }
    let xCoordinate = {
      GapiLens.get = (fun x -> x.xCoordinate);
      GapiLens.set = (fun v x -> { x with xCoordinate = v });
    }
    let yCoordinate = {
      GapiLens.get = (fun x -> x.yCoordinate);
      GapiLens.set = (fun v x -> { x with yCoordinate = v });
    }
    
    let empty = {
      id = "";
      width = 0.0;
      xCoordinate = 0.0;
      yCoordinate = 0.0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "id" x.id;
        GapiJson.render_float_value "width" x.width;
        GapiJson.render_float_value "xCoordinate" x.xCoordinate;
        GapiJson.render_float_value "yCoordinate" x.yCoordinate;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with width = float_of_int v }
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
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.BackgroundImageFile.parse" e x
    
  end
  
  type t = {
    backgroundImageFile : BackgroundImageFile.t;
    backgroundImageLink : string;
    capabilities : Capabilities.t;
    colorRgb : string;
    createdTime : GapiDate.t;
    id : string;
    kind : string;
    name : string;
    restrictions : Restrictions.t;
    themeId : string;
    
  }
  
  let backgroundImageFile = {
    GapiLens.get = (fun x -> x.backgroundImageFile);
    GapiLens.set = (fun v x -> { x with backgroundImageFile = v });
  }
  let backgroundImageLink = {
    GapiLens.get = (fun x -> x.backgroundImageLink);
    GapiLens.set = (fun v x -> { x with backgroundImageLink = v });
  }
  let capabilities = {
    GapiLens.get = (fun x -> x.capabilities);
    GapiLens.set = (fun v x -> { x with capabilities = v });
  }
  let colorRgb = {
    GapiLens.get = (fun x -> x.colorRgb);
    GapiLens.set = (fun v x -> { x with colorRgb = v });
  }
  let createdTime = {
    GapiLens.get = (fun x -> x.createdTime);
    GapiLens.set = (fun v x -> { x with createdTime = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let restrictions = {
    GapiLens.get = (fun x -> x.restrictions);
    GapiLens.set = (fun v x -> { x with restrictions = v });
  }
  let themeId = {
    GapiLens.get = (fun x -> x.themeId);
    GapiLens.set = (fun v x -> { x with themeId = v });
  }
  
  let empty = {
    backgroundImageFile = BackgroundImageFile.empty;
    backgroundImageLink = "";
    capabilities = Capabilities.empty;
    colorRgb = "";
    createdTime = GapiDate.epoch;
    id = "";
    kind = "";
    name = "";
    restrictions = Restrictions.empty;
    themeId = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "backgroundImageFile" (BackgroundImageFile.render_content v)) x.backgroundImageFile;
      GapiJson.render_string_value "backgroundImageLink" x.backgroundImageLink;
      (fun v -> GapiJson.render_object "capabilities" (Capabilities.render_content v)) x.capabilities;
      GapiJson.render_string_value "colorRgb" x.colorRgb;
      GapiJson.render_date_value "createdTime" x.createdTime;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "restrictions" (Restrictions.render_content v)) x.restrictions;
      GapiJson.render_string_value "themeId" x.themeId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundImageFile"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BackgroundImageFile.parse
        BackgroundImageFile.empty
        (fun v -> { x with backgroundImageFile = v })
        cs
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
        ({ GapiJson.name = "colorRgb"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with colorRgb = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "restrictions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Restrictions.parse
        Restrictions.empty
        (fun v -> { x with restrictions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "themeId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with themeId = v }
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
    kind : string;
    nextPageToken : string;
    teamDrives : TeamDrive.t list;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let teamDrives = {
    GapiLens.get = (fun x -> x.teamDrives);
    GapiLens.set = (fun v x -> { x with teamDrives = v });
  }
  
  let empty = {
    kind = "";
    nextPageToken = "";
    teamDrives = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_array "teamDrives" TeamDrive.render x.teamDrives;
      
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
    emailAddress : string;
    kind : string;
    me : bool;
    permissionId : string;
    photoLink : string;
    
  }
  
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let emailAddress = {
    GapiLens.get = (fun x -> x.emailAddress);
    GapiLens.set = (fun v x -> { x with emailAddress = v });
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
  let photoLink = {
    GapiLens.get = (fun x -> x.photoLink);
    GapiLens.set = (fun v x -> { x with photoLink = v });
  }
  
  let empty = {
    displayName = "";
    emailAddress = "";
    kind = "";
    me = false;
    permissionId = "";
    photoLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_string_value "emailAddress" x.emailAddress;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_bool_value "me" x.me;
      GapiJson.render_string_value "permissionId" x.permissionId;
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
        ({ GapiJson.name = "emailAddress"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with emailAddress = v }
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
      backgroundImageLink : string;
      colorRgb : string;
      id : string;
      
    }
    
    let backgroundImageLink = {
      GapiLens.get = (fun x -> x.backgroundImageLink);
      GapiLens.set = (fun v x -> { x with backgroundImageLink = v });
    }
    let colorRgb = {
      GapiLens.get = (fun x -> x.colorRgb);
      GapiLens.set = (fun v x -> { x with colorRgb = v });
    }
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    
    let empty = {
      backgroundImageLink = "";
      colorRgb = "";
      id = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "backgroundImageLink" x.backgroundImageLink;
        GapiJson.render_string_value "colorRgb" x.colorRgb;
        GapiJson.render_string_value "id" x.id;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "backgroundImageLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with backgroundImageLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "colorRgb"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with colorRgb = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.TeamDriveThemes.parse" e x
    
  end
  
  module StorageQuota =
  struct
    type t = {
      limit : int64;
      usage : int64;
      usageInDrive : int64;
      usageInDriveTrash : int64;
      
    }
    
    let limit = {
      GapiLens.get = (fun x -> x.limit);
      GapiLens.set = (fun v x -> { x with limit = v });
    }
    let usage = {
      GapiLens.get = (fun x -> x.usage);
      GapiLens.set = (fun v x -> { x with usage = v });
    }
    let usageInDrive = {
      GapiLens.get = (fun x -> x.usageInDrive);
      GapiLens.set = (fun v x -> { x with usageInDrive = v });
    }
    let usageInDriveTrash = {
      GapiLens.get = (fun x -> x.usageInDriveTrash);
      GapiLens.set = (fun v x -> { x with usageInDriveTrash = v });
    }
    
    let empty = {
      limit = 0L;
      usage = 0L;
      usageInDrive = 0L;
      usageInDriveTrash = 0L;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int64_value "limit" x.limit;
        GapiJson.render_int64_value "usage" x.usage;
        GapiJson.render_int64_value "usageInDrive" x.usageInDrive;
        GapiJson.render_int64_value "usageInDriveTrash" x.usageInDriveTrash;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "limit"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with limit = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "usage"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with usage = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "usageInDrive"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with usageInDrive = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "usageInDriveTrash"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with usageInDriveTrash = Int64.of_string v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.StorageQuota.parse" e x
    
  end
  
  module DriveThemes =
  struct
    type t = {
      backgroundImageLink : string;
      colorRgb : string;
      id : string;
      
    }
    
    let backgroundImageLink = {
      GapiLens.get = (fun x -> x.backgroundImageLink);
      GapiLens.set = (fun v x -> { x with backgroundImageLink = v });
    }
    let colorRgb = {
      GapiLens.get = (fun x -> x.colorRgb);
      GapiLens.set = (fun v x -> { x with colorRgb = v });
    }
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    
    let empty = {
      backgroundImageLink = "";
      colorRgb = "";
      id = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "backgroundImageLink" x.backgroundImageLink;
        GapiJson.render_string_value "colorRgb" x.colorRgb;
        GapiJson.render_string_value "id" x.id;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "backgroundImageLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with backgroundImageLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "colorRgb"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with colorRgb = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.DriveThemes.parse" e x
    
  end
  
  type t = {
    appInstalled : bool;
    canCreateDrives : bool;
    canCreateTeamDrives : bool;
    driveThemes : DriveThemes.t list;
    exportFormats : (string * string list) list;
    folderColorPalette : string list;
    importFormats : (string * string list) list;
    kind : string;
    maxImportSizes : (string * int64) list;
    maxUploadSize : int64;
    storageQuota : StorageQuota.t;
    teamDriveThemes : TeamDriveThemes.t list;
    user : User.t;
    
  }
  
  let appInstalled = {
    GapiLens.get = (fun x -> x.appInstalled);
    GapiLens.set = (fun v x -> { x with appInstalled = v });
  }
  let canCreateDrives = {
    GapiLens.get = (fun x -> x.canCreateDrives);
    GapiLens.set = (fun v x -> { x with canCreateDrives = v });
  }
  let canCreateTeamDrives = {
    GapiLens.get = (fun x -> x.canCreateTeamDrives);
    GapiLens.set = (fun v x -> { x with canCreateTeamDrives = v });
  }
  let driveThemes = {
    GapiLens.get = (fun x -> x.driveThemes);
    GapiLens.set = (fun v x -> { x with driveThemes = v });
  }
  let exportFormats = {
    GapiLens.get = (fun x -> x.exportFormats);
    GapiLens.set = (fun v x -> { x with exportFormats = v });
  }
  let folderColorPalette = {
    GapiLens.get = (fun x -> x.folderColorPalette);
    GapiLens.set = (fun v x -> { x with folderColorPalette = v });
  }
  let importFormats = {
    GapiLens.get = (fun x -> x.importFormats);
    GapiLens.set = (fun v x -> { x with importFormats = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let maxImportSizes = {
    GapiLens.get = (fun x -> x.maxImportSizes);
    GapiLens.set = (fun v x -> { x with maxImportSizes = v });
  }
  let maxUploadSize = {
    GapiLens.get = (fun x -> x.maxUploadSize);
    GapiLens.set = (fun v x -> { x with maxUploadSize = v });
  }
  let storageQuota = {
    GapiLens.get = (fun x -> x.storageQuota);
    GapiLens.set = (fun v x -> { x with storageQuota = v });
  }
  let teamDriveThemes = {
    GapiLens.get = (fun x -> x.teamDriveThemes);
    GapiLens.set = (fun v x -> { x with teamDriveThemes = v });
  }
  let user = {
    GapiLens.get = (fun x -> x.user);
    GapiLens.set = (fun v x -> { x with user = v });
  }
  
  let empty = {
    appInstalled = false;
    canCreateDrives = false;
    canCreateTeamDrives = false;
    driveThemes = [];
    exportFormats = [];
    folderColorPalette = [];
    importFormats = [];
    kind = "";
    maxImportSizes = [];
    maxUploadSize = 0L;
    storageQuota = StorageQuota.empty;
    teamDriveThemes = [];
    user = User.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "appInstalled" x.appInstalled;
      GapiJson.render_bool_value "canCreateDrives" x.canCreateDrives;
      GapiJson.render_bool_value "canCreateTeamDrives" x.canCreateTeamDrives;
      GapiJson.render_array "driveThemes" DriveThemes.render x.driveThemes;
      GapiJson.render_collection "exportFormats" GapiJson.Object (fun (id, v) -> GapiJson.render_array id (GapiJson.render_string_value "") v) x.exportFormats;
      GapiJson.render_array "folderColorPalette" (GapiJson.render_string_value "") x.folderColorPalette;
      GapiJson.render_collection "importFormats" GapiJson.Object (fun (id, v) -> GapiJson.render_array id (GapiJson.render_string_value "") v) x.importFormats;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_collection "maxImportSizes" GapiJson.Object (fun (id, v) -> GapiJson.render_int64_value id v) x.maxImportSizes;
      GapiJson.render_int64_value "maxUploadSize" x.maxUploadSize;
      (fun v -> GapiJson.render_object "storageQuota" (StorageQuota.render_content v)) x.storageQuota;
      GapiJson.render_array "teamDriveThemes" TeamDriveThemes.render x.teamDriveThemes;
      (fun v -> GapiJson.render_object "user" (User.render_content v)) x.user;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "appInstalled"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with appInstalled = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "canCreateDrives"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with canCreateDrives = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "canCreateTeamDrives"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with canCreateTeamDrives = v }
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
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
        ({ GapiJson.name = "storageQuota"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        StorageQuota.parse
        StorageQuota.empty
        (fun v -> { x with storageQuota = v })
        cs
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
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "user"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with user = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.About.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Revision =
struct
  type t = {
    exportLinks : (string * string) list;
    id : string;
    keepForever : bool;
    kind : string;
    lastModifyingUser : User.t;
    md5Checksum : string;
    mimeType : string;
    modifiedTime : GapiDate.t;
    originalFilename : string;
    publishAuto : bool;
    published : bool;
    publishedOutsideDomain : bool;
    size : int64;
    
  }
  
  let exportLinks = {
    GapiLens.get = (fun x -> x.exportLinks);
    GapiLens.set = (fun v x -> { x with exportLinks = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let keepForever = {
    GapiLens.get = (fun x -> x.keepForever);
    GapiLens.set = (fun v x -> { x with keepForever = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let lastModifyingUser = {
    GapiLens.get = (fun x -> x.lastModifyingUser);
    GapiLens.set = (fun v x -> { x with lastModifyingUser = v });
  }
  let md5Checksum = {
    GapiLens.get = (fun x -> x.md5Checksum);
    GapiLens.set = (fun v x -> { x with md5Checksum = v });
  }
  let mimeType = {
    GapiLens.get = (fun x -> x.mimeType);
    GapiLens.set = (fun v x -> { x with mimeType = v });
  }
  let modifiedTime = {
    GapiLens.get = (fun x -> x.modifiedTime);
    GapiLens.set = (fun v x -> { x with modifiedTime = v });
  }
  let originalFilename = {
    GapiLens.get = (fun x -> x.originalFilename);
    GapiLens.set = (fun v x -> { x with originalFilename = v });
  }
  let publishAuto = {
    GapiLens.get = (fun x -> x.publishAuto);
    GapiLens.set = (fun v x -> { x with publishAuto = v });
  }
  let published = {
    GapiLens.get = (fun x -> x.published);
    GapiLens.set = (fun v x -> { x with published = v });
  }
  let publishedOutsideDomain = {
    GapiLens.get = (fun x -> x.publishedOutsideDomain);
    GapiLens.set = (fun v x -> { x with publishedOutsideDomain = v });
  }
  let size = {
    GapiLens.get = (fun x -> x.size);
    GapiLens.set = (fun v x -> { x with size = v });
  }
  
  let empty = {
    exportLinks = [];
    id = "";
    keepForever = false;
    kind = "";
    lastModifyingUser = User.empty;
    md5Checksum = "";
    mimeType = "";
    modifiedTime = GapiDate.epoch;
    originalFilename = "";
    publishAuto = false;
    published = false;
    publishedOutsideDomain = false;
    size = 0L;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_collection "exportLinks" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.exportLinks;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_bool_value "keepForever" x.keepForever;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "lastModifyingUser" (User.render_content v)) x.lastModifyingUser;
      GapiJson.render_string_value "md5Checksum" x.md5Checksum;
      GapiJson.render_string_value "mimeType" x.mimeType;
      GapiJson.render_date_value "modifiedTime" x.modifiedTime;
      GapiJson.render_string_value "originalFilename" x.originalFilename;
      GapiJson.render_bool_value "publishAuto" x.publishAuto;
      GapiJson.render_bool_value "published" x.published;
      GapiJson.render_bool_value "publishedOutsideDomain" x.publishedOutsideDomain;
      GapiJson.render_int64_value "size" x.size;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "keepForever"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with keepForever = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "lastModifyingUser"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with lastModifyingUser = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "md5Checksum"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with md5Checksum = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "mimeType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with mimeType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "originalFilename"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with originalFilename = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "publishAuto"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with publishAuto = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "published"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with published = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "publishedOutsideDomain"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with publishedOutsideDomain = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with size = Int64.of_string v }
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
    action : string;
    author : User.t;
    content : string;
    createdTime : GapiDate.t;
    deleted : bool;
    htmlContent : string;
    id : string;
    kind : string;
    modifiedTime : GapiDate.t;
    
  }
  
  let action = {
    GapiLens.get = (fun x -> x.action);
    GapiLens.set = (fun v x -> { x with action = v });
  }
  let author = {
    GapiLens.get = (fun x -> x.author);
    GapiLens.set = (fun v x -> { x with author = v });
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
  }
  let createdTime = {
    GapiLens.get = (fun x -> x.createdTime);
    GapiLens.set = (fun v x -> { x with createdTime = v });
  }
  let deleted = {
    GapiLens.get = (fun x -> x.deleted);
    GapiLens.set = (fun v x -> { x with deleted = v });
  }
  let htmlContent = {
    GapiLens.get = (fun x -> x.htmlContent);
    GapiLens.set = (fun v x -> { x with htmlContent = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let modifiedTime = {
    GapiLens.get = (fun x -> x.modifiedTime);
    GapiLens.set = (fun v x -> { x with modifiedTime = v });
  }
  
  let empty = {
    action = "";
    author = User.empty;
    content = "";
    createdTime = GapiDate.epoch;
    deleted = false;
    htmlContent = "";
    id = "";
    kind = "";
    modifiedTime = GapiDate.epoch;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "action" x.action;
      (fun v -> GapiJson.render_object "author" (User.render_content v)) x.author;
      GapiJson.render_string_value "content" x.content;
      GapiJson.render_date_value "createdTime" x.createdTime;
      GapiJson.render_bool_value "deleted" x.deleted;
      GapiJson.render_string_value "htmlContent" x.htmlContent;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "modifiedTime" x.modifiedTime;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
        ({ GapiJson.name = "content"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with content = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "deleted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with deleted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlContent"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with htmlContent = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedTime = GapiDate.of_string v }
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
    anchor : string;
    author : User.t;
    content : string;
    createdTime : GapiDate.t;
    deleted : bool;
    htmlContent : string;
    id : string;
    kind : string;
    modifiedTime : GapiDate.t;
    quotedFileContent : QuotedFileContent.t;
    replies : Reply.t list;
    resolved : bool;
    
  }
  
  let anchor = {
    GapiLens.get = (fun x -> x.anchor);
    GapiLens.set = (fun v x -> { x with anchor = v });
  }
  let author = {
    GapiLens.get = (fun x -> x.author);
    GapiLens.set = (fun v x -> { x with author = v });
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
  }
  let createdTime = {
    GapiLens.get = (fun x -> x.createdTime);
    GapiLens.set = (fun v x -> { x with createdTime = v });
  }
  let deleted = {
    GapiLens.get = (fun x -> x.deleted);
    GapiLens.set = (fun v x -> { x with deleted = v });
  }
  let htmlContent = {
    GapiLens.get = (fun x -> x.htmlContent);
    GapiLens.set = (fun v x -> { x with htmlContent = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let modifiedTime = {
    GapiLens.get = (fun x -> x.modifiedTime);
    GapiLens.set = (fun v x -> { x with modifiedTime = v });
  }
  let quotedFileContent = {
    GapiLens.get = (fun x -> x.quotedFileContent);
    GapiLens.set = (fun v x -> { x with quotedFileContent = v });
  }
  let replies = {
    GapiLens.get = (fun x -> x.replies);
    GapiLens.set = (fun v x -> { x with replies = v });
  }
  let resolved = {
    GapiLens.get = (fun x -> x.resolved);
    GapiLens.set = (fun v x -> { x with resolved = v });
  }
  
  let empty = {
    anchor = "";
    author = User.empty;
    content = "";
    createdTime = GapiDate.epoch;
    deleted = false;
    htmlContent = "";
    id = "";
    kind = "";
    modifiedTime = GapiDate.epoch;
    quotedFileContent = QuotedFileContent.empty;
    replies = [];
    resolved = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "anchor" x.anchor;
      (fun v -> GapiJson.render_object "author" (User.render_content v)) x.author;
      GapiJson.render_string_value "content" x.content;
      GapiJson.render_date_value "createdTime" x.createdTime;
      GapiJson.render_bool_value "deleted" x.deleted;
      GapiJson.render_string_value "htmlContent" x.htmlContent;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "modifiedTime" x.modifiedTime;
      (fun v -> GapiJson.render_object "quotedFileContent" (QuotedFileContent.render_content v)) x.quotedFileContent;
      GapiJson.render_array "replies" Reply.render x.replies;
      GapiJson.render_bool_value "resolved" x.resolved;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "anchor"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with anchor = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "author"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with author = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "content"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with content = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "deleted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with deleted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlContent"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with htmlContent = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "quotedFileContent"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        QuotedFileContent.parse
        QuotedFileContent.empty
        (fun v -> { x with quotedFileContent = v })
        cs
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "resolved"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with resolved = v }
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
    comments : Comment.t list;
    kind : string;
    nextPageToken : string;
    
  }
  
  let comments = {
    GapiLens.get = (fun x -> x.comments);
    GapiLens.set = (fun v x -> { x with comments = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  
  let empty = {
    comments = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "comments" Comment.render x.comments;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
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
    kind : string;
    space : string;
    
  }
  
  let ids = {
    GapiLens.get = (fun x -> x.ids);
    GapiLens.set = (fun v x -> { x with ids = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let space = {
    GapiLens.get = (fun x -> x.space);
    GapiLens.set = (fun v x -> { x with space = v });
  }
  
  let empty = {
    ids = [];
    kind = "";
    space = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "ids" (GapiJson.render_string_value "") x.ids;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "space" x.space;
      
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
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "space"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with space = v }
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
      inherited : bool;
      inheritedFrom : string;
      role : string;
      teamDrivePermissionType : string;
      
    }
    
    let inherited = {
      GapiLens.get = (fun x -> x.inherited);
      GapiLens.set = (fun v x -> { x with inherited = v });
    }
    let inheritedFrom = {
      GapiLens.get = (fun x -> x.inheritedFrom);
      GapiLens.set = (fun v x -> { x with inheritedFrom = v });
    }
    let role = {
      GapiLens.get = (fun x -> x.role);
      GapiLens.set = (fun v x -> { x with role = v });
    }
    let teamDrivePermissionType = {
      GapiLens.get = (fun x -> x.teamDrivePermissionType);
      GapiLens.set = (fun v x -> { x with teamDrivePermissionType = v });
    }
    
    let empty = {
      inherited = false;
      inheritedFrom = "";
      role = "";
      teamDrivePermissionType = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "inherited" x.inherited;
        GapiJson.render_string_value "inheritedFrom" x.inheritedFrom;
        GapiJson.render_string_value "role" x.role;
        GapiJson.render_string_value "teamDrivePermissionType" x.teamDrivePermissionType;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "inherited"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with inherited = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "inheritedFrom"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with inheritedFrom = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "role"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with role = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "teamDrivePermissionType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with teamDrivePermissionType = v }
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
      inherited : bool;
      inheritedFrom : string;
      permissionType : string;
      role : string;
      
    }
    
    let inherited = {
      GapiLens.get = (fun x -> x.inherited);
      GapiLens.set = (fun v x -> { x with inherited = v });
    }
    let inheritedFrom = {
      GapiLens.get = (fun x -> x.inheritedFrom);
      GapiLens.set = (fun v x -> { x with inheritedFrom = v });
    }
    let permissionType = {
      GapiLens.get = (fun x -> x.permissionType);
      GapiLens.set = (fun v x -> { x with permissionType = v });
    }
    let role = {
      GapiLens.get = (fun x -> x.role);
      GapiLens.set = (fun v x -> { x with role = v });
    }
    
    let empty = {
      inherited = false;
      inheritedFrom = "";
      permissionType = "";
      role = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "inherited" x.inherited;
        GapiJson.render_string_value "inheritedFrom" x.inheritedFrom;
        GapiJson.render_string_value "permissionType" x.permissionType;
        GapiJson.render_string_value "role" x.role;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "inherited"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with inherited = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "inheritedFrom"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with inheritedFrom = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "permissionType"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with permissionType = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "role"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with role = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.PermissionDetails.parse" e x
    
  end
  
  type t = {
    allowFileDiscovery : bool;
    deleted : bool;
    displayName : string;
    domain : string;
    emailAddress : string;
    expirationTime : GapiDate.t;
    id : string;
    kind : string;
    permissionDetails : PermissionDetails.t list;
    photoLink : string;
    role : string;
    teamDrivePermissionDetails : TeamDrivePermissionDetails.t list;
    _type : string;
    
  }
  
  let allowFileDiscovery = {
    GapiLens.get = (fun x -> x.allowFileDiscovery);
    GapiLens.set = (fun v x -> { x with allowFileDiscovery = v });
  }
  let deleted = {
    GapiLens.get = (fun x -> x.deleted);
    GapiLens.set = (fun v x -> { x with deleted = v });
  }
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let domain = {
    GapiLens.get = (fun x -> x.domain);
    GapiLens.set = (fun v x -> { x with domain = v });
  }
  let emailAddress = {
    GapiLens.get = (fun x -> x.emailAddress);
    GapiLens.set = (fun v x -> { x with emailAddress = v });
  }
  let expirationTime = {
    GapiLens.get = (fun x -> x.expirationTime);
    GapiLens.set = (fun v x -> { x with expirationTime = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
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
  let role = {
    GapiLens.get = (fun x -> x.role);
    GapiLens.set = (fun v x -> { x with role = v });
  }
  let teamDrivePermissionDetails = {
    GapiLens.get = (fun x -> x.teamDrivePermissionDetails);
    GapiLens.set = (fun v x -> { x with teamDrivePermissionDetails = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    allowFileDiscovery = false;
    deleted = false;
    displayName = "";
    domain = "";
    emailAddress = "";
    expirationTime = GapiDate.epoch;
    id = "";
    kind = "";
    permissionDetails = [];
    photoLink = "";
    role = "";
    teamDrivePermissionDetails = [];
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "allowFileDiscovery" x.allowFileDiscovery;
      GapiJson.render_bool_value "deleted" x.deleted;
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_string_value "domain" x.domain;
      GapiJson.render_string_value "emailAddress" x.emailAddress;
      GapiJson.render_date_value "expirationTime" x.expirationTime;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "permissionDetails" PermissionDetails.render x.permissionDetails;
      GapiJson.render_string_value "photoLink" x.photoLink;
      GapiJson.render_string_value "role" x.role;
      GapiJson.render_array "teamDrivePermissionDetails" TeamDrivePermissionDetails.render x.teamDrivePermissionDetails;
      GapiJson.render_string_value "type" x._type;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "allowFileDiscovery"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with allowFileDiscovery = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "deleted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with deleted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "domain"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with domain = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "emailAddress"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with emailAddress = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "expirationTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with expirationTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
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
        ({ GapiJson.name = "role"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with role = v }
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
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.Permission.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module File =
struct
  module VideoMediaMetadata =
  struct
    type t = {
      durationMillis : int64;
      height : int;
      width : int;
      
    }
    
    let durationMillis = {
      GapiLens.get = (fun x -> x.durationMillis);
      GapiLens.set = (fun v x -> { x with durationMillis = v });
    }
    let height = {
      GapiLens.get = (fun x -> x.height);
      GapiLens.set = (fun v x -> { x with height = v });
    }
    let width = {
      GapiLens.get = (fun x -> x.width);
      GapiLens.set = (fun v x -> { x with width = v });
    }
    
    let empty = {
      durationMillis = 0L;
      height = 0;
      width = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int64_value "durationMillis" x.durationMillis;
        GapiJson.render_int_value "height" x.height;
        GapiJson.render_int_value "width" x.width;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "durationMillis"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with durationMillis = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "height"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with height = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with width = v }
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
        altitude : float;
        latitude : float;
        longitude : float;
        
      }
      
      let altitude = {
        GapiLens.get = (fun x -> x.altitude);
        GapiLens.set = (fun v x -> { x with altitude = v });
      }
      let latitude = {
        GapiLens.get = (fun x -> x.latitude);
        GapiLens.set = (fun v x -> { x with latitude = v });
      }
      let longitude = {
        GapiLens.get = (fun x -> x.longitude);
        GapiLens.set = (fun v x -> { x with longitude = v });
      }
      
      let empty = {
        altitude = 0.0;
        latitude = 0.0;
        longitude = 0.0;
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_float_value "altitude" x.altitude;
          GapiJson.render_float_value "latitude" x.latitude;
          GapiJson.render_float_value "longitude" x.longitude;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "altitude"; data_type = GapiJson.Scalar },
            `Float v) ->
          { x with altitude = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "altitude"; data_type = GapiJson.Scalar },
            `Int v) ->
          { x with altitude = float_of_int v }
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
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiDriveV3Model.Location.parse" e x
      
    end
    
    type t = {
      aperture : float;
      cameraMake : string;
      cameraModel : string;
      colorSpace : string;
      exposureBias : float;
      exposureMode : string;
      exposureTime : float;
      flashUsed : bool;
      focalLength : float;
      height : int;
      isoSpeed : int;
      lens : string;
      location : Location.t;
      maxApertureValue : float;
      meteringMode : string;
      rotation : int;
      sensor : string;
      subjectDistance : int;
      time : string;
      whiteBalance : string;
      width : int;
      
    }
    
    let aperture = {
      GapiLens.get = (fun x -> x.aperture);
      GapiLens.set = (fun v x -> { x with aperture = v });
    }
    let cameraMake = {
      GapiLens.get = (fun x -> x.cameraMake);
      GapiLens.set = (fun v x -> { x with cameraMake = v });
    }
    let cameraModel = {
      GapiLens.get = (fun x -> x.cameraModel);
      GapiLens.set = (fun v x -> { x with cameraModel = v });
    }
    let colorSpace = {
      GapiLens.get = (fun x -> x.colorSpace);
      GapiLens.set = (fun v x -> { x with colorSpace = v });
    }
    let exposureBias = {
      GapiLens.get = (fun x -> x.exposureBias);
      GapiLens.set = (fun v x -> { x with exposureBias = v });
    }
    let exposureMode = {
      GapiLens.get = (fun x -> x.exposureMode);
      GapiLens.set = (fun v x -> { x with exposureMode = v });
    }
    let exposureTime = {
      GapiLens.get = (fun x -> x.exposureTime);
      GapiLens.set = (fun v x -> { x with exposureTime = v });
    }
    let flashUsed = {
      GapiLens.get = (fun x -> x.flashUsed);
      GapiLens.set = (fun v x -> { x with flashUsed = v });
    }
    let focalLength = {
      GapiLens.get = (fun x -> x.focalLength);
      GapiLens.set = (fun v x -> { x with focalLength = v });
    }
    let height = {
      GapiLens.get = (fun x -> x.height);
      GapiLens.set = (fun v x -> { x with height = v });
    }
    let isoSpeed = {
      GapiLens.get = (fun x -> x.isoSpeed);
      GapiLens.set = (fun v x -> { x with isoSpeed = v });
    }
    let lens = {
      GapiLens.get = (fun x -> x.lens);
      GapiLens.set = (fun v x -> { x with lens = v });
    }
    let location = {
      GapiLens.get = (fun x -> x.location);
      GapiLens.set = (fun v x -> { x with location = v });
    }
    let maxApertureValue = {
      GapiLens.get = (fun x -> x.maxApertureValue);
      GapiLens.set = (fun v x -> { x with maxApertureValue = v });
    }
    let meteringMode = {
      GapiLens.get = (fun x -> x.meteringMode);
      GapiLens.set = (fun v x -> { x with meteringMode = v });
    }
    let rotation = {
      GapiLens.get = (fun x -> x.rotation);
      GapiLens.set = (fun v x -> { x with rotation = v });
    }
    let sensor = {
      GapiLens.get = (fun x -> x.sensor);
      GapiLens.set = (fun v x -> { x with sensor = v });
    }
    let subjectDistance = {
      GapiLens.get = (fun x -> x.subjectDistance);
      GapiLens.set = (fun v x -> { x with subjectDistance = v });
    }
    let time = {
      GapiLens.get = (fun x -> x.time);
      GapiLens.set = (fun v x -> { x with time = v });
    }
    let whiteBalance = {
      GapiLens.get = (fun x -> x.whiteBalance);
      GapiLens.set = (fun v x -> { x with whiteBalance = v });
    }
    let width = {
      GapiLens.get = (fun x -> x.width);
      GapiLens.set = (fun v x -> { x with width = v });
    }
    
    let empty = {
      aperture = 0.0;
      cameraMake = "";
      cameraModel = "";
      colorSpace = "";
      exposureBias = 0.0;
      exposureMode = "";
      exposureTime = 0.0;
      flashUsed = false;
      focalLength = 0.0;
      height = 0;
      isoSpeed = 0;
      lens = "";
      location = Location.empty;
      maxApertureValue = 0.0;
      meteringMode = "";
      rotation = 0;
      sensor = "";
      subjectDistance = 0;
      time = "";
      whiteBalance = "";
      width = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_float_value "aperture" x.aperture;
        GapiJson.render_string_value "cameraMake" x.cameraMake;
        GapiJson.render_string_value "cameraModel" x.cameraModel;
        GapiJson.render_string_value "colorSpace" x.colorSpace;
        GapiJson.render_float_value "exposureBias" x.exposureBias;
        GapiJson.render_string_value "exposureMode" x.exposureMode;
        GapiJson.render_float_value "exposureTime" x.exposureTime;
        GapiJson.render_bool_value "flashUsed" x.flashUsed;
        GapiJson.render_float_value "focalLength" x.focalLength;
        GapiJson.render_int_value "height" x.height;
        GapiJson.render_int_value "isoSpeed" x.isoSpeed;
        GapiJson.render_string_value "lens" x.lens;
        (fun v -> GapiJson.render_object "location" (Location.render_content v)) x.location;
        GapiJson.render_float_value "maxApertureValue" x.maxApertureValue;
        GapiJson.render_string_value "meteringMode" x.meteringMode;
        GapiJson.render_int_value "rotation" x.rotation;
        GapiJson.render_string_value "sensor" x.sensor;
        GapiJson.render_int_value "subjectDistance" x.subjectDistance;
        GapiJson.render_string_value "time" x.time;
        GapiJson.render_string_value "whiteBalance" x.whiteBalance;
        GapiJson.render_int_value "width" x.width;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "aperture"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with aperture = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "aperture"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with aperture = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "cameraMake"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with cameraMake = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "cameraModel"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with cameraModel = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "colorSpace"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with colorSpace = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "exposureBias"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with exposureBias = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "exposureBias"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with exposureBias = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "exposureMode"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with exposureMode = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "exposureTime"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with exposureTime = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "exposureTime"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with exposureTime = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "flashUsed"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with flashUsed = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "focalLength"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with focalLength = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "focalLength"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with focalLength = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "height"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with height = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "isoSpeed"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with isoSpeed = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "lens"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with lens = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "location"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          Location.parse
          Location.empty
          (fun v -> { x with location = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "maxApertureValue"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with maxApertureValue = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "maxApertureValue"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with maxApertureValue = float_of_int v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "meteringMode"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with meteringMode = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "rotation"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with rotation = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "sensor"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with sensor = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "subjectDistance"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with subjectDistance = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "time"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with time = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "whiteBalance"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with whiteBalance = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.ImageMediaMetadata.parse" e x
    
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
  
  module Capabilities =
  struct
    type t = {
      canAddChildren : bool;
      canChangeCopyRequiresWriterPermission : bool;
      canChangeViewersCanCopyContent : bool;
      canComment : bool;
      canCopy : bool;
      canDelete : bool;
      canDeleteChildren : bool;
      canDownload : bool;
      canEdit : bool;
      canListChildren : bool;
      canMoveChildrenOutOfDrive : bool;
      canMoveChildrenOutOfTeamDrive : bool;
      canMoveChildrenWithinDrive : bool;
      canMoveChildrenWithinTeamDrive : bool;
      canMoveItemIntoTeamDrive : bool;
      canMoveItemOutOfDrive : bool;
      canMoveItemOutOfTeamDrive : bool;
      canMoveItemWithinDrive : bool;
      canMoveItemWithinTeamDrive : bool;
      canMoveTeamDriveItem : bool;
      canReadDrive : bool;
      canReadRevisions : bool;
      canReadTeamDrive : bool;
      canRemoveChildren : bool;
      canRename : bool;
      canShare : bool;
      canTrash : bool;
      canTrashChildren : bool;
      canUntrash : bool;
      
    }
    
    let canAddChildren = {
      GapiLens.get = (fun x -> x.canAddChildren);
      GapiLens.set = (fun v x -> { x with canAddChildren = v });
    }
    let canChangeCopyRequiresWriterPermission = {
      GapiLens.get = (fun x -> x.canChangeCopyRequiresWriterPermission);
      GapiLens.set = (fun v x -> { x with canChangeCopyRequiresWriterPermission = v });
    }
    let canChangeViewersCanCopyContent = {
      GapiLens.get = (fun x -> x.canChangeViewersCanCopyContent);
      GapiLens.set = (fun v x -> { x with canChangeViewersCanCopyContent = v });
    }
    let canComment = {
      GapiLens.get = (fun x -> x.canComment);
      GapiLens.set = (fun v x -> { x with canComment = v });
    }
    let canCopy = {
      GapiLens.get = (fun x -> x.canCopy);
      GapiLens.set = (fun v x -> { x with canCopy = v });
    }
    let canDelete = {
      GapiLens.get = (fun x -> x.canDelete);
      GapiLens.set = (fun v x -> { x with canDelete = v });
    }
    let canDeleteChildren = {
      GapiLens.get = (fun x -> x.canDeleteChildren);
      GapiLens.set = (fun v x -> { x with canDeleteChildren = v });
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
    let canMoveChildrenOutOfDrive = {
      GapiLens.get = (fun x -> x.canMoveChildrenOutOfDrive);
      GapiLens.set = (fun v x -> { x with canMoveChildrenOutOfDrive = v });
    }
    let canMoveChildrenOutOfTeamDrive = {
      GapiLens.get = (fun x -> x.canMoveChildrenOutOfTeamDrive);
      GapiLens.set = (fun v x -> { x with canMoveChildrenOutOfTeamDrive = v });
    }
    let canMoveChildrenWithinDrive = {
      GapiLens.get = (fun x -> x.canMoveChildrenWithinDrive);
      GapiLens.set = (fun v x -> { x with canMoveChildrenWithinDrive = v });
    }
    let canMoveChildrenWithinTeamDrive = {
      GapiLens.get = (fun x -> x.canMoveChildrenWithinTeamDrive);
      GapiLens.set = (fun v x -> { x with canMoveChildrenWithinTeamDrive = v });
    }
    let canMoveItemIntoTeamDrive = {
      GapiLens.get = (fun x -> x.canMoveItemIntoTeamDrive);
      GapiLens.set = (fun v x -> { x with canMoveItemIntoTeamDrive = v });
    }
    let canMoveItemOutOfDrive = {
      GapiLens.get = (fun x -> x.canMoveItemOutOfDrive);
      GapiLens.set = (fun v x -> { x with canMoveItemOutOfDrive = v });
    }
    let canMoveItemOutOfTeamDrive = {
      GapiLens.get = (fun x -> x.canMoveItemOutOfTeamDrive);
      GapiLens.set = (fun v x -> { x with canMoveItemOutOfTeamDrive = v });
    }
    let canMoveItemWithinDrive = {
      GapiLens.get = (fun x -> x.canMoveItemWithinDrive);
      GapiLens.set = (fun v x -> { x with canMoveItemWithinDrive = v });
    }
    let canMoveItemWithinTeamDrive = {
      GapiLens.get = (fun x -> x.canMoveItemWithinTeamDrive);
      GapiLens.set = (fun v x -> { x with canMoveItemWithinTeamDrive = v });
    }
    let canMoveTeamDriveItem = {
      GapiLens.get = (fun x -> x.canMoveTeamDriveItem);
      GapiLens.set = (fun v x -> { x with canMoveTeamDriveItem = v });
    }
    let canReadDrive = {
      GapiLens.get = (fun x -> x.canReadDrive);
      GapiLens.set = (fun v x -> { x with canReadDrive = v });
    }
    let canReadRevisions = {
      GapiLens.get = (fun x -> x.canReadRevisions);
      GapiLens.set = (fun v x -> { x with canReadRevisions = v });
    }
    let canReadTeamDrive = {
      GapiLens.get = (fun x -> x.canReadTeamDrive);
      GapiLens.set = (fun v x -> { x with canReadTeamDrive = v });
    }
    let canRemoveChildren = {
      GapiLens.get = (fun x -> x.canRemoveChildren);
      GapiLens.set = (fun v x -> { x with canRemoveChildren = v });
    }
    let canRename = {
      GapiLens.get = (fun x -> x.canRename);
      GapiLens.set = (fun v x -> { x with canRename = v });
    }
    let canShare = {
      GapiLens.get = (fun x -> x.canShare);
      GapiLens.set = (fun v x -> { x with canShare = v });
    }
    let canTrash = {
      GapiLens.get = (fun x -> x.canTrash);
      GapiLens.set = (fun v x -> { x with canTrash = v });
    }
    let canTrashChildren = {
      GapiLens.get = (fun x -> x.canTrashChildren);
      GapiLens.set = (fun v x -> { x with canTrashChildren = v });
    }
    let canUntrash = {
      GapiLens.get = (fun x -> x.canUntrash);
      GapiLens.set = (fun v x -> { x with canUntrash = v });
    }
    
    let empty = {
      canAddChildren = false;
      canChangeCopyRequiresWriterPermission = false;
      canChangeViewersCanCopyContent = false;
      canComment = false;
      canCopy = false;
      canDelete = false;
      canDeleteChildren = false;
      canDownload = false;
      canEdit = false;
      canListChildren = false;
      canMoveChildrenOutOfDrive = false;
      canMoveChildrenOutOfTeamDrive = false;
      canMoveChildrenWithinDrive = false;
      canMoveChildrenWithinTeamDrive = false;
      canMoveItemIntoTeamDrive = false;
      canMoveItemOutOfDrive = false;
      canMoveItemOutOfTeamDrive = false;
      canMoveItemWithinDrive = false;
      canMoveItemWithinTeamDrive = false;
      canMoveTeamDriveItem = false;
      canReadDrive = false;
      canReadRevisions = false;
      canReadTeamDrive = false;
      canRemoveChildren = false;
      canRename = false;
      canShare = false;
      canTrash = false;
      canTrashChildren = false;
      canUntrash = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "canAddChildren" x.canAddChildren;
        GapiJson.render_bool_value "canChangeCopyRequiresWriterPermission" x.canChangeCopyRequiresWriterPermission;
        GapiJson.render_bool_value "canChangeViewersCanCopyContent" x.canChangeViewersCanCopyContent;
        GapiJson.render_bool_value "canComment" x.canComment;
        GapiJson.render_bool_value "canCopy" x.canCopy;
        GapiJson.render_bool_value "canDelete" x.canDelete;
        GapiJson.render_bool_value "canDeleteChildren" x.canDeleteChildren;
        GapiJson.render_bool_value "canDownload" x.canDownload;
        GapiJson.render_bool_value "canEdit" x.canEdit;
        GapiJson.render_bool_value "canListChildren" x.canListChildren;
        GapiJson.render_bool_value "canMoveChildrenOutOfDrive" x.canMoveChildrenOutOfDrive;
        GapiJson.render_bool_value "canMoveChildrenOutOfTeamDrive" x.canMoveChildrenOutOfTeamDrive;
        GapiJson.render_bool_value "canMoveChildrenWithinDrive" x.canMoveChildrenWithinDrive;
        GapiJson.render_bool_value "canMoveChildrenWithinTeamDrive" x.canMoveChildrenWithinTeamDrive;
        GapiJson.render_bool_value "canMoveItemIntoTeamDrive" x.canMoveItemIntoTeamDrive;
        GapiJson.render_bool_value "canMoveItemOutOfDrive" x.canMoveItemOutOfDrive;
        GapiJson.render_bool_value "canMoveItemOutOfTeamDrive" x.canMoveItemOutOfTeamDrive;
        GapiJson.render_bool_value "canMoveItemWithinDrive" x.canMoveItemWithinDrive;
        GapiJson.render_bool_value "canMoveItemWithinTeamDrive" x.canMoveItemWithinTeamDrive;
        GapiJson.render_bool_value "canMoveTeamDriveItem" x.canMoveTeamDriveItem;
        GapiJson.render_bool_value "canReadDrive" x.canReadDrive;
        GapiJson.render_bool_value "canReadRevisions" x.canReadRevisions;
        GapiJson.render_bool_value "canReadTeamDrive" x.canReadTeamDrive;
        GapiJson.render_bool_value "canRemoveChildren" x.canRemoveChildren;
        GapiJson.render_bool_value "canRename" x.canRename;
        GapiJson.render_bool_value "canShare" x.canShare;
        GapiJson.render_bool_value "canTrash" x.canTrash;
        GapiJson.render_bool_value "canTrashChildren" x.canTrashChildren;
        GapiJson.render_bool_value "canUntrash" x.canUntrash;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canAddChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canAddChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeCopyRequiresWriterPermission"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeCopyRequiresWriterPermission = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeViewersCanCopyContent"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeViewersCanCopyContent = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canComment"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canComment = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canCopy"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canCopy = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDelete"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDelete = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDeleteChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDeleteChildren = v }
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
          ({ GapiJson.name = "canMoveChildrenOutOfDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveChildrenOutOfDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveChildrenOutOfTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveChildrenOutOfTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveChildrenWithinDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveChildrenWithinDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveChildrenWithinTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveChildrenWithinTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveItemIntoTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveItemIntoTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveItemOutOfDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveItemOutOfDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveItemOutOfTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveItemOutOfTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveItemWithinDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveItemWithinDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveItemWithinTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveItemWithinTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canMoveTeamDriveItem"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canMoveTeamDriveItem = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canReadDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canReadDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canReadRevisions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canReadRevisions = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canReadTeamDrive"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canReadTeamDrive = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canRemoveChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canRemoveChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canRename"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canRename = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canShare"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canShare = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canTrash"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canTrash = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canTrashChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canTrashChildren = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canUntrash"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canUntrash = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.Capabilities.parse" e x
    
  end
  
  type t = {
    appProperties : (string * string) list;
    capabilities : Capabilities.t;
    contentHints : ContentHints.t;
    copyRequiresWriterPermission : bool;
    createdTime : GapiDate.t;
    description : string;
    driveId : string;
    explicitlyTrashed : bool;
    exportLinks : (string * string) list;
    fileExtension : string;
    folderColorRgb : string;
    fullFileExtension : string;
    hasAugmentedPermissions : bool;
    hasThumbnail : bool;
    headRevisionId : string;
    iconLink : string;
    id : string;
    imageMediaMetadata : ImageMediaMetadata.t;
    isAppAuthorized : bool;
    kind : string;
    lastModifyingUser : User.t;
    md5Checksum : string;
    mimeType : string;
    modifiedByMe : bool;
    modifiedByMeTime : GapiDate.t;
    modifiedTime : GapiDate.t;
    name : string;
    originalFilename : string;
    ownedByMe : bool;
    owners : User.t list;
    parents : string list;
    permissionIds : string list;
    permissions : Permission.t list;
    properties : (string * string) list;
    quotaBytesUsed : int64;
    shared : bool;
    sharedWithMeTime : GapiDate.t;
    sharingUser : User.t;
    size : int64;
    spaces : string list;
    starred : bool;
    teamDriveId : string;
    thumbnailLink : string;
    thumbnailVersion : int64;
    trashed : bool;
    trashedTime : GapiDate.t;
    trashingUser : User.t;
    version : int64;
    videoMediaMetadata : VideoMediaMetadata.t;
    viewedByMe : bool;
    viewedByMeTime : GapiDate.t;
    viewersCanCopyContent : bool;
    webContentLink : string;
    webViewLink : string;
    writersCanShare : bool;
    
  }
  
  let appProperties = {
    GapiLens.get = (fun x -> x.appProperties);
    GapiLens.set = (fun v x -> { x with appProperties = v });
  }
  let capabilities = {
    GapiLens.get = (fun x -> x.capabilities);
    GapiLens.set = (fun v x -> { x with capabilities = v });
  }
  let contentHints = {
    GapiLens.get = (fun x -> x.contentHints);
    GapiLens.set = (fun v x -> { x with contentHints = v });
  }
  let copyRequiresWriterPermission = {
    GapiLens.get = (fun x -> x.copyRequiresWriterPermission);
    GapiLens.set = (fun v x -> { x with copyRequiresWriterPermission = v });
  }
  let createdTime = {
    GapiLens.get = (fun x -> x.createdTime);
    GapiLens.set = (fun v x -> { x with createdTime = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let driveId = {
    GapiLens.get = (fun x -> x.driveId);
    GapiLens.set = (fun v x -> { x with driveId = v });
  }
  let explicitlyTrashed = {
    GapiLens.get = (fun x -> x.explicitlyTrashed);
    GapiLens.set = (fun v x -> { x with explicitlyTrashed = v });
  }
  let exportLinks = {
    GapiLens.get = (fun x -> x.exportLinks);
    GapiLens.set = (fun v x -> { x with exportLinks = v });
  }
  let fileExtension = {
    GapiLens.get = (fun x -> x.fileExtension);
    GapiLens.set = (fun v x -> { x with fileExtension = v });
  }
  let folderColorRgb = {
    GapiLens.get = (fun x -> x.folderColorRgb);
    GapiLens.set = (fun v x -> { x with folderColorRgb = v });
  }
  let fullFileExtension = {
    GapiLens.get = (fun x -> x.fullFileExtension);
    GapiLens.set = (fun v x -> { x with fullFileExtension = v });
  }
  let hasAugmentedPermissions = {
    GapiLens.get = (fun x -> x.hasAugmentedPermissions);
    GapiLens.set = (fun v x -> { x with hasAugmentedPermissions = v });
  }
  let hasThumbnail = {
    GapiLens.get = (fun x -> x.hasThumbnail);
    GapiLens.set = (fun v x -> { x with hasThumbnail = v });
  }
  let headRevisionId = {
    GapiLens.get = (fun x -> x.headRevisionId);
    GapiLens.set = (fun v x -> { x with headRevisionId = v });
  }
  let iconLink = {
    GapiLens.get = (fun x -> x.iconLink);
    GapiLens.set = (fun v x -> { x with iconLink = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let imageMediaMetadata = {
    GapiLens.get = (fun x -> x.imageMediaMetadata);
    GapiLens.set = (fun v x -> { x with imageMediaMetadata = v });
  }
  let isAppAuthorized = {
    GapiLens.get = (fun x -> x.isAppAuthorized);
    GapiLens.set = (fun v x -> { x with isAppAuthorized = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let lastModifyingUser = {
    GapiLens.get = (fun x -> x.lastModifyingUser);
    GapiLens.set = (fun v x -> { x with lastModifyingUser = v });
  }
  let md5Checksum = {
    GapiLens.get = (fun x -> x.md5Checksum);
    GapiLens.set = (fun v x -> { x with md5Checksum = v });
  }
  let mimeType = {
    GapiLens.get = (fun x -> x.mimeType);
    GapiLens.set = (fun v x -> { x with mimeType = v });
  }
  let modifiedByMe = {
    GapiLens.get = (fun x -> x.modifiedByMe);
    GapiLens.set = (fun v x -> { x with modifiedByMe = v });
  }
  let modifiedByMeTime = {
    GapiLens.get = (fun x -> x.modifiedByMeTime);
    GapiLens.set = (fun v x -> { x with modifiedByMeTime = v });
  }
  let modifiedTime = {
    GapiLens.get = (fun x -> x.modifiedTime);
    GapiLens.set = (fun v x -> { x with modifiedTime = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let originalFilename = {
    GapiLens.get = (fun x -> x.originalFilename);
    GapiLens.set = (fun v x -> { x with originalFilename = v });
  }
  let ownedByMe = {
    GapiLens.get = (fun x -> x.ownedByMe);
    GapiLens.set = (fun v x -> { x with ownedByMe = v });
  }
  let owners = {
    GapiLens.get = (fun x -> x.owners);
    GapiLens.set = (fun v x -> { x with owners = v });
  }
  let parents = {
    GapiLens.get = (fun x -> x.parents);
    GapiLens.set = (fun v x -> { x with parents = v });
  }
  let permissionIds = {
    GapiLens.get = (fun x -> x.permissionIds);
    GapiLens.set = (fun v x -> { x with permissionIds = v });
  }
  let permissions = {
    GapiLens.get = (fun x -> x.permissions);
    GapiLens.set = (fun v x -> { x with permissions = v });
  }
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  let quotaBytesUsed = {
    GapiLens.get = (fun x -> x.quotaBytesUsed);
    GapiLens.set = (fun v x -> { x with quotaBytesUsed = v });
  }
  let shared = {
    GapiLens.get = (fun x -> x.shared);
    GapiLens.set = (fun v x -> { x with shared = v });
  }
  let sharedWithMeTime = {
    GapiLens.get = (fun x -> x.sharedWithMeTime);
    GapiLens.set = (fun v x -> { x with sharedWithMeTime = v });
  }
  let sharingUser = {
    GapiLens.get = (fun x -> x.sharingUser);
    GapiLens.set = (fun v x -> { x with sharingUser = v });
  }
  let size = {
    GapiLens.get = (fun x -> x.size);
    GapiLens.set = (fun v x -> { x with size = v });
  }
  let spaces = {
    GapiLens.get = (fun x -> x.spaces);
    GapiLens.set = (fun v x -> { x with spaces = v });
  }
  let starred = {
    GapiLens.get = (fun x -> x.starred);
    GapiLens.set = (fun v x -> { x with starred = v });
  }
  let teamDriveId = {
    GapiLens.get = (fun x -> x.teamDriveId);
    GapiLens.set = (fun v x -> { x with teamDriveId = v });
  }
  let thumbnailLink = {
    GapiLens.get = (fun x -> x.thumbnailLink);
    GapiLens.set = (fun v x -> { x with thumbnailLink = v });
  }
  let thumbnailVersion = {
    GapiLens.get = (fun x -> x.thumbnailVersion);
    GapiLens.set = (fun v x -> { x with thumbnailVersion = v });
  }
  let trashed = {
    GapiLens.get = (fun x -> x.trashed);
    GapiLens.set = (fun v x -> { x with trashed = v });
  }
  let trashedTime = {
    GapiLens.get = (fun x -> x.trashedTime);
    GapiLens.set = (fun v x -> { x with trashedTime = v });
  }
  let trashingUser = {
    GapiLens.get = (fun x -> x.trashingUser);
    GapiLens.set = (fun v x -> { x with trashingUser = v });
  }
  let version = {
    GapiLens.get = (fun x -> x.version);
    GapiLens.set = (fun v x -> { x with version = v });
  }
  let videoMediaMetadata = {
    GapiLens.get = (fun x -> x.videoMediaMetadata);
    GapiLens.set = (fun v x -> { x with videoMediaMetadata = v });
  }
  let viewedByMe = {
    GapiLens.get = (fun x -> x.viewedByMe);
    GapiLens.set = (fun v x -> { x with viewedByMe = v });
  }
  let viewedByMeTime = {
    GapiLens.get = (fun x -> x.viewedByMeTime);
    GapiLens.set = (fun v x -> { x with viewedByMeTime = v });
  }
  let viewersCanCopyContent = {
    GapiLens.get = (fun x -> x.viewersCanCopyContent);
    GapiLens.set = (fun v x -> { x with viewersCanCopyContent = v });
  }
  let webContentLink = {
    GapiLens.get = (fun x -> x.webContentLink);
    GapiLens.set = (fun v x -> { x with webContentLink = v });
  }
  let webViewLink = {
    GapiLens.get = (fun x -> x.webViewLink);
    GapiLens.set = (fun v x -> { x with webViewLink = v });
  }
  let writersCanShare = {
    GapiLens.get = (fun x -> x.writersCanShare);
    GapiLens.set = (fun v x -> { x with writersCanShare = v });
  }
  
  let empty = {
    appProperties = [];
    capabilities = Capabilities.empty;
    contentHints = ContentHints.empty;
    copyRequiresWriterPermission = false;
    createdTime = GapiDate.epoch;
    description = "";
    driveId = "";
    explicitlyTrashed = false;
    exportLinks = [];
    fileExtension = "";
    folderColorRgb = "";
    fullFileExtension = "";
    hasAugmentedPermissions = false;
    hasThumbnail = false;
    headRevisionId = "";
    iconLink = "";
    id = "";
    imageMediaMetadata = ImageMediaMetadata.empty;
    isAppAuthorized = false;
    kind = "";
    lastModifyingUser = User.empty;
    md5Checksum = "";
    mimeType = "";
    modifiedByMe = false;
    modifiedByMeTime = GapiDate.epoch;
    modifiedTime = GapiDate.epoch;
    name = "";
    originalFilename = "";
    ownedByMe = false;
    owners = [];
    parents = [];
    permissionIds = [];
    permissions = [];
    properties = [];
    quotaBytesUsed = 0L;
    shared = false;
    sharedWithMeTime = GapiDate.epoch;
    sharingUser = User.empty;
    size = 0L;
    spaces = [];
    starred = false;
    teamDriveId = "";
    thumbnailLink = "";
    thumbnailVersion = 0L;
    trashed = false;
    trashedTime = GapiDate.epoch;
    trashingUser = User.empty;
    version = 0L;
    videoMediaMetadata = VideoMediaMetadata.empty;
    viewedByMe = false;
    viewedByMeTime = GapiDate.epoch;
    viewersCanCopyContent = false;
    webContentLink = "";
    webViewLink = "";
    writersCanShare = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_collection "appProperties" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.appProperties;
      (fun v -> GapiJson.render_object "capabilities" (Capabilities.render_content v)) x.capabilities;
      (fun v -> GapiJson.render_object "contentHints" (ContentHints.render_content v)) x.contentHints;
      GapiJson.render_bool_value "copyRequiresWriterPermission" x.copyRequiresWriterPermission;
      GapiJson.render_date_value "createdTime" x.createdTime;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "driveId" x.driveId;
      GapiJson.render_bool_value "explicitlyTrashed" x.explicitlyTrashed;
      GapiJson.render_collection "exportLinks" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.exportLinks;
      GapiJson.render_string_value "fileExtension" x.fileExtension;
      GapiJson.render_string_value "folderColorRgb" x.folderColorRgb;
      GapiJson.render_string_value "fullFileExtension" x.fullFileExtension;
      GapiJson.render_bool_value "hasAugmentedPermissions" x.hasAugmentedPermissions;
      GapiJson.render_bool_value "hasThumbnail" x.hasThumbnail;
      GapiJson.render_string_value "headRevisionId" x.headRevisionId;
      GapiJson.render_string_value "iconLink" x.iconLink;
      GapiJson.render_string_value "id" x.id;
      (fun v -> GapiJson.render_object "imageMediaMetadata" (ImageMediaMetadata.render_content v)) x.imageMediaMetadata;
      GapiJson.render_bool_value "isAppAuthorized" x.isAppAuthorized;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "lastModifyingUser" (User.render_content v)) x.lastModifyingUser;
      GapiJson.render_string_value "md5Checksum" x.md5Checksum;
      GapiJson.render_string_value "mimeType" x.mimeType;
      GapiJson.render_bool_value "modifiedByMe" x.modifiedByMe;
      GapiJson.render_date_value "modifiedByMeTime" x.modifiedByMeTime;
      GapiJson.render_date_value "modifiedTime" x.modifiedTime;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "originalFilename" x.originalFilename;
      GapiJson.render_bool_value "ownedByMe" x.ownedByMe;
      GapiJson.render_array "owners" User.render x.owners;
      GapiJson.render_array "parents" (GapiJson.render_string_value "") x.parents;
      GapiJson.render_array "permissionIds" (GapiJson.render_string_value "") x.permissionIds;
      GapiJson.render_array "permissions" Permission.render x.permissions;
      GapiJson.render_collection "properties" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.properties;
      GapiJson.render_int64_value "quotaBytesUsed" x.quotaBytesUsed;
      GapiJson.render_bool_value "shared" x.shared;
      GapiJson.render_date_value "sharedWithMeTime" x.sharedWithMeTime;
      (fun v -> GapiJson.render_object "sharingUser" (User.render_content v)) x.sharingUser;
      GapiJson.render_int64_value "size" x.size;
      GapiJson.render_array "spaces" (GapiJson.render_string_value "") x.spaces;
      GapiJson.render_bool_value "starred" x.starred;
      GapiJson.render_string_value "teamDriveId" x.teamDriveId;
      GapiJson.render_string_value "thumbnailLink" x.thumbnailLink;
      GapiJson.render_int64_value "thumbnailVersion" x.thumbnailVersion;
      GapiJson.render_bool_value "trashed" x.trashed;
      GapiJson.render_date_value "trashedTime" x.trashedTime;
      (fun v -> GapiJson.render_object "trashingUser" (User.render_content v)) x.trashingUser;
      GapiJson.render_int64_value "version" x.version;
      (fun v -> GapiJson.render_object "videoMediaMetadata" (VideoMediaMetadata.render_content v)) x.videoMediaMetadata;
      GapiJson.render_bool_value "viewedByMe" x.viewedByMe;
      GapiJson.render_date_value "viewedByMeTime" x.viewedByMeTime;
      GapiJson.render_bool_value "viewersCanCopyContent" x.viewersCanCopyContent;
      GapiJson.render_string_value "webContentLink" x.webContentLink;
      GapiJson.render_string_value "webViewLink" x.webViewLink;
      GapiJson.render_bool_value "writersCanShare" x.writersCanShare;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "capabilities"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Capabilities.parse
        Capabilities.empty
        (fun v -> { x with capabilities = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "contentHints"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ContentHints.parse
        ContentHints.empty
        (fun v -> { x with contentHints = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "copyRequiresWriterPermission"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with copyRequiresWriterPermission = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "driveId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with driveId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "explicitlyTrashed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with explicitlyTrashed = v }
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fileExtension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fileExtension = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "folderColorRgb"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with folderColorRgb = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fullFileExtension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fullFileExtension = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hasAugmentedPermissions"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hasAugmentedPermissions = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hasThumbnail"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hasThumbnail = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "headRevisionId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with headRevisionId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "iconLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with iconLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "imageMediaMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ImageMediaMetadata.parse
        ImageMediaMetadata.empty
        (fun v -> { x with imageMediaMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "isAppAuthorized"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with isAppAuthorized = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "lastModifyingUser"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with lastModifyingUser = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "md5Checksum"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with md5Checksum = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "mimeType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with mimeType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedByMe"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with modifiedByMe = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedByMeTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedByMeTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "originalFilename"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with originalFilename = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "ownedByMe"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with ownedByMe = v }
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "quotaBytesUsed"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with quotaBytesUsed = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "shared"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with shared = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sharedWithMeTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sharedWithMeTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sharingUser"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with sharingUser = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with size = Int64.of_string v }
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
        ({ GapiJson.name = "starred"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with starred = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "teamDriveId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with teamDriveId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "thumbnailLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with thumbnailLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "thumbnailVersion"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with thumbnailVersion = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "trashed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with trashed = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "trashedTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with trashedTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "trashingUser"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with trashingUser = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "version"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with version = Int64.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "videoMediaMetadata"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        VideoMediaMetadata.parse
        VideoMediaMetadata.empty
        (fun v -> { x with videoMediaMetadata = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "viewedByMe"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with viewedByMe = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "viewedByMeTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with viewedByMeTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "viewersCanCopyContent"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with viewersCanCopyContent = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webContentLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webContentLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "webViewLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with webViewLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "writersCanShare"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with writersCanShare = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.File.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Drive =
struct
  module Restrictions =
  struct
    type t = {
      adminManagedRestrictions : bool;
      copyRequiresWriterPermission : bool;
      domainUsersOnly : bool;
      driveMembersOnly : bool;
      
    }
    
    let adminManagedRestrictions = {
      GapiLens.get = (fun x -> x.adminManagedRestrictions);
      GapiLens.set = (fun v x -> { x with adminManagedRestrictions = v });
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
    
    let empty = {
      adminManagedRestrictions = false;
      copyRequiresWriterPermission = false;
      domainUsersOnly = false;
      driveMembersOnly = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "adminManagedRestrictions" x.adminManagedRestrictions;
        GapiJson.render_bool_value "copyRequiresWriterPermission" x.copyRequiresWriterPermission;
        GapiJson.render_bool_value "domainUsersOnly" x.domainUsersOnly;
        GapiJson.render_bool_value "driveMembersOnly" x.driveMembersOnly;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "adminManagedRestrictions"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with adminManagedRestrictions = v }
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
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.Restrictions.parse" e x
    
  end
  
  module Capabilities =
  struct
    type t = {
      canAddChildren : bool;
      canChangeCopyRequiresWriterPermissionRestriction : bool;
      canChangeDomainUsersOnlyRestriction : bool;
      canChangeDriveBackground : bool;
      canChangeDriveMembersOnlyRestriction : bool;
      canComment : bool;
      canCopy : bool;
      canDeleteChildren : bool;
      canDeleteDrive : bool;
      canDownload : bool;
      canEdit : bool;
      canListChildren : bool;
      canManageMembers : bool;
      canReadRevisions : bool;
      canRename : bool;
      canRenameDrive : bool;
      canShare : bool;
      canTrashChildren : bool;
      
    }
    
    let canAddChildren = {
      GapiLens.get = (fun x -> x.canAddChildren);
      GapiLens.set = (fun v x -> { x with canAddChildren = v });
    }
    let canChangeCopyRequiresWriterPermissionRestriction = {
      GapiLens.get = (fun x -> x.canChangeCopyRequiresWriterPermissionRestriction);
      GapiLens.set = (fun v x -> { x with canChangeCopyRequiresWriterPermissionRestriction = v });
    }
    let canChangeDomainUsersOnlyRestriction = {
      GapiLens.get = (fun x -> x.canChangeDomainUsersOnlyRestriction);
      GapiLens.set = (fun v x -> { x with canChangeDomainUsersOnlyRestriction = v });
    }
    let canChangeDriveBackground = {
      GapiLens.get = (fun x -> x.canChangeDriveBackground);
      GapiLens.set = (fun v x -> { x with canChangeDriveBackground = v });
    }
    let canChangeDriveMembersOnlyRestriction = {
      GapiLens.get = (fun x -> x.canChangeDriveMembersOnlyRestriction);
      GapiLens.set = (fun v x -> { x with canChangeDriveMembersOnlyRestriction = v });
    }
    let canComment = {
      GapiLens.get = (fun x -> x.canComment);
      GapiLens.set = (fun v x -> { x with canComment = v });
    }
    let canCopy = {
      GapiLens.get = (fun x -> x.canCopy);
      GapiLens.set = (fun v x -> { x with canCopy = v });
    }
    let canDeleteChildren = {
      GapiLens.get = (fun x -> x.canDeleteChildren);
      GapiLens.set = (fun v x -> { x with canDeleteChildren = v });
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
    let canShare = {
      GapiLens.get = (fun x -> x.canShare);
      GapiLens.set = (fun v x -> { x with canShare = v });
    }
    let canTrashChildren = {
      GapiLens.get = (fun x -> x.canTrashChildren);
      GapiLens.set = (fun v x -> { x with canTrashChildren = v });
    }
    
    let empty = {
      canAddChildren = false;
      canChangeCopyRequiresWriterPermissionRestriction = false;
      canChangeDomainUsersOnlyRestriction = false;
      canChangeDriveBackground = false;
      canChangeDriveMembersOnlyRestriction = false;
      canComment = false;
      canCopy = false;
      canDeleteChildren = false;
      canDeleteDrive = false;
      canDownload = false;
      canEdit = false;
      canListChildren = false;
      canManageMembers = false;
      canReadRevisions = false;
      canRename = false;
      canRenameDrive = false;
      canShare = false;
      canTrashChildren = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "canAddChildren" x.canAddChildren;
        GapiJson.render_bool_value "canChangeCopyRequiresWriterPermissionRestriction" x.canChangeCopyRequiresWriterPermissionRestriction;
        GapiJson.render_bool_value "canChangeDomainUsersOnlyRestriction" x.canChangeDomainUsersOnlyRestriction;
        GapiJson.render_bool_value "canChangeDriveBackground" x.canChangeDriveBackground;
        GapiJson.render_bool_value "canChangeDriveMembersOnlyRestriction" x.canChangeDriveMembersOnlyRestriction;
        GapiJson.render_bool_value "canComment" x.canComment;
        GapiJson.render_bool_value "canCopy" x.canCopy;
        GapiJson.render_bool_value "canDeleteChildren" x.canDeleteChildren;
        GapiJson.render_bool_value "canDeleteDrive" x.canDeleteDrive;
        GapiJson.render_bool_value "canDownload" x.canDownload;
        GapiJson.render_bool_value "canEdit" x.canEdit;
        GapiJson.render_bool_value "canListChildren" x.canListChildren;
        GapiJson.render_bool_value "canManageMembers" x.canManageMembers;
        GapiJson.render_bool_value "canReadRevisions" x.canReadRevisions;
        GapiJson.render_bool_value "canRename" x.canRename;
        GapiJson.render_bool_value "canRenameDrive" x.canRenameDrive;
        GapiJson.render_bool_value "canShare" x.canShare;
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
          ({ GapiJson.name = "canChangeCopyRequiresWriterPermissionRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeCopyRequiresWriterPermissionRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeDomainUsersOnlyRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeDomainUsersOnlyRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeDriveBackground"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeDriveBackground = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canChangeDriveMembersOnlyRestriction"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canChangeDriveMembersOnlyRestriction = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canComment"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canComment = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canCopy"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canCopy = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "canDeleteChildren"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canDeleteChildren = v }
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
          ({ GapiJson.name = "canShare"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with canShare = v }
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
  
  module BackgroundImageFile =
  struct
    type t = {
      id : string;
      width : float;
      xCoordinate : float;
      yCoordinate : float;
      
    }
    
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    let width = {
      GapiLens.get = (fun x -> x.width);
      GapiLens.set = (fun v x -> { x with width = v });
    }
    let xCoordinate = {
      GapiLens.get = (fun x -> x.xCoordinate);
      GapiLens.set = (fun v x -> { x with xCoordinate = v });
    }
    let yCoordinate = {
      GapiLens.get = (fun x -> x.yCoordinate);
      GapiLens.set = (fun v x -> { x with yCoordinate = v });
    }
    
    let empty = {
      id = "";
      width = 0.0;
      xCoordinate = 0.0;
      yCoordinate = 0.0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "id" x.id;
        GapiJson.render_float_value "width" x.width;
        GapiJson.render_float_value "xCoordinate" x.xCoordinate;
        GapiJson.render_float_value "yCoordinate" x.yCoordinate;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with width = float_of_int v }
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
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV3Model.BackgroundImageFile.parse" e x
    
  end
  
  type t = {
    backgroundImageFile : BackgroundImageFile.t;
    backgroundImageLink : string;
    capabilities : Capabilities.t;
    colorRgb : string;
    createdTime : GapiDate.t;
    hidden : bool;
    id : string;
    kind : string;
    name : string;
    restrictions : Restrictions.t;
    themeId : string;
    
  }
  
  let backgroundImageFile = {
    GapiLens.get = (fun x -> x.backgroundImageFile);
    GapiLens.set = (fun v x -> { x with backgroundImageFile = v });
  }
  let backgroundImageLink = {
    GapiLens.get = (fun x -> x.backgroundImageLink);
    GapiLens.set = (fun v x -> { x with backgroundImageLink = v });
  }
  let capabilities = {
    GapiLens.get = (fun x -> x.capabilities);
    GapiLens.set = (fun v x -> { x with capabilities = v });
  }
  let colorRgb = {
    GapiLens.get = (fun x -> x.colorRgb);
    GapiLens.set = (fun v x -> { x with colorRgb = v });
  }
  let createdTime = {
    GapiLens.get = (fun x -> x.createdTime);
    GapiLens.set = (fun v x -> { x with createdTime = v });
  }
  let hidden = {
    GapiLens.get = (fun x -> x.hidden);
    GapiLens.set = (fun v x -> { x with hidden = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let restrictions = {
    GapiLens.get = (fun x -> x.restrictions);
    GapiLens.set = (fun v x -> { x with restrictions = v });
  }
  let themeId = {
    GapiLens.get = (fun x -> x.themeId);
    GapiLens.set = (fun v x -> { x with themeId = v });
  }
  
  let empty = {
    backgroundImageFile = BackgroundImageFile.empty;
    backgroundImageLink = "";
    capabilities = Capabilities.empty;
    colorRgb = "";
    createdTime = GapiDate.epoch;
    hidden = false;
    id = "";
    kind = "";
    name = "";
    restrictions = Restrictions.empty;
    themeId = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "backgroundImageFile" (BackgroundImageFile.render_content v)) x.backgroundImageFile;
      GapiJson.render_string_value "backgroundImageLink" x.backgroundImageLink;
      (fun v -> GapiJson.render_object "capabilities" (Capabilities.render_content v)) x.capabilities;
      GapiJson.render_string_value "colorRgb" x.colorRgb;
      GapiJson.render_date_value "createdTime" x.createdTime;
      GapiJson.render_bool_value "hidden" x.hidden;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      (fun v -> GapiJson.render_object "restrictions" (Restrictions.render_content v)) x.restrictions;
      GapiJson.render_string_value "themeId" x.themeId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "backgroundImageFile"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        BackgroundImageFile.parse
        BackgroundImageFile.empty
        (fun v -> { x with backgroundImageFile = v })
        cs
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
        ({ GapiJson.name = "colorRgb"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with colorRgb = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hidden"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hidden = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "restrictions"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Restrictions.parse
        Restrictions.empty
        (fun v -> { x with restrictions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "themeId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with themeId = v }
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
    changeType : string;
    drive : Drive.t;
    driveId : string;
    file : File.t;
    fileId : string;
    kind : string;
    removed : bool;
    teamDrive : TeamDrive.t;
    teamDriveId : string;
    time : GapiDate.t;
    _type : string;
    
  }
  
  let changeType = {
    GapiLens.get = (fun x -> x.changeType);
    GapiLens.set = (fun v x -> { x with changeType = v });
  }
  let drive = {
    GapiLens.get = (fun x -> x.drive);
    GapiLens.set = (fun v x -> { x with drive = v });
  }
  let driveId = {
    GapiLens.get = (fun x -> x.driveId);
    GapiLens.set = (fun v x -> { x with driveId = v });
  }
  let file = {
    GapiLens.get = (fun x -> x.file);
    GapiLens.set = (fun v x -> { x with file = v });
  }
  let fileId = {
    GapiLens.get = (fun x -> x.fileId);
    GapiLens.set = (fun v x -> { x with fileId = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let removed = {
    GapiLens.get = (fun x -> x.removed);
    GapiLens.set = (fun v x -> { x with removed = v });
  }
  let teamDrive = {
    GapiLens.get = (fun x -> x.teamDrive);
    GapiLens.set = (fun v x -> { x with teamDrive = v });
  }
  let teamDriveId = {
    GapiLens.get = (fun x -> x.teamDriveId);
    GapiLens.set = (fun v x -> { x with teamDriveId = v });
  }
  let time = {
    GapiLens.get = (fun x -> x.time);
    GapiLens.set = (fun v x -> { x with time = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    changeType = "";
    drive = Drive.empty;
    driveId = "";
    file = File.empty;
    fileId = "";
    kind = "";
    removed = false;
    teamDrive = TeamDrive.empty;
    teamDriveId = "";
    time = GapiDate.epoch;
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "changeType" x.changeType;
      (fun v -> GapiJson.render_object "drive" (Drive.render_content v)) x.drive;
      GapiJson.render_string_value "driveId" x.driveId;
      (fun v -> GapiJson.render_object "file" (File.render_content v)) x.file;
      GapiJson.render_string_value "fileId" x.fileId;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_bool_value "removed" x.removed;
      (fun v -> GapiJson.render_object "teamDrive" (TeamDrive.render_content v)) x.teamDrive;
      GapiJson.render_string_value "teamDriveId" x.teamDriveId;
      GapiJson.render_date_value "time" x.time;
      GapiJson.render_string_value "type" x._type;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "driveId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with driveId = v }
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
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "removed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with removed = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "teamDrive"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        TeamDrive.parse
        TeamDrive.empty
        (fun v -> { x with teamDrive = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "teamDriveId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with teamDriveId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "time"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with time = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
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
    nextPageToken : string;
    replies : Reply.t list;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let replies = {
    GapiLens.get = (fun x -> x.replies);
    GapiLens.set = (fun v x -> { x with replies = v });
  }
  
  let empty = {
    kind = "";
    nextPageToken = "";
    replies = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_array "replies" Reply.render x.replies;
      
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
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.ReplyList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PermissionList =
struct
  type t = {
    kind : string;
    nextPageToken : string;
    permissions : Permission.t list;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let permissions = {
    GapiLens.get = (fun x -> x.permissions);
    GapiLens.set = (fun v x -> { x with permissions = v });
  }
  
  let empty = {
    kind = "";
    nextPageToken = "";
    permissions = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_array "permissions" Permission.render x.permissions;
      
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

module ChangeList =
struct
  type t = {
    changes : Change.t list;
    kind : string;
    newStartPageToken : string;
    nextPageToken : string;
    
  }
  
  let changes = {
    GapiLens.get = (fun x -> x.changes);
    GapiLens.set = (fun v x -> { x with changes = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let newStartPageToken = {
    GapiLens.get = (fun x -> x.newStartPageToken);
    GapiLens.set = (fun v x -> { x with newStartPageToken = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  
  let empty = {
    changes = [];
    kind = "";
    newStartPageToken = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "changes" Change.render x.changes;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "newStartPageToken" x.newStartPageToken;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "newStartPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with newStartPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.ChangeList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module StartPageToken =
struct
  type t = {
    kind : string;
    startPageToken : string;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let startPageToken = {
    GapiLens.get = (fun x -> x.startPageToken);
    GapiLens.set = (fun v x -> { x with startPageToken = v });
  }
  
  let empty = {
    kind = "";
    startPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "startPageToken" x.startPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with startPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.StartPageToken.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RevisionList =
struct
  type t = {
    kind : string;
    nextPageToken : string;
    revisions : Revision.t list;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let revisions = {
    GapiLens.get = (fun x -> x.revisions);
    GapiLens.set = (fun v x -> { x with revisions = v });
  }
  
  let empty = {
    kind = "";
    nextPageToken = "";
    revisions = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_array "revisions" Revision.render x.revisions;
      
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
    address : string;
    expiration : int64;
    id : string;
    kind : string;
    params : (string * string) list;
    payload : bool;
    resourceId : string;
    resourceUri : string;
    token : string;
    _type : string;
    
  }
  
  let address = {
    GapiLens.get = (fun x -> x.address);
    GapiLens.set = (fun v x -> { x with address = v });
  }
  let expiration = {
    GapiLens.get = (fun x -> x.expiration);
    GapiLens.set = (fun v x -> { x with expiration = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let params = {
    GapiLens.get = (fun x -> x.params);
    GapiLens.set = (fun v x -> { x with params = v });
  }
  let payload = {
    GapiLens.get = (fun x -> x.payload);
    GapiLens.set = (fun v x -> { x with payload = v });
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
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    address = "";
    expiration = 0L;
    id = "";
    kind = "";
    params = [];
    payload = false;
    resourceId = "";
    resourceUri = "";
    token = "";
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "address" x.address;
      GapiJson.render_int64_value "expiration" x.expiration;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_collection "params" GapiJson.Object (fun (id, v) -> GapiJson.render_nullable_string_value id v) x.params;
      GapiJson.render_bool_value "payload" x.payload;
      GapiJson.render_string_value "resourceId" x.resourceId;
      GapiJson.render_string_value "resourceUri" x.resourceUri;
      GapiJson.render_string_value "token" x.token;
      GapiJson.render_string_value "type" x._type;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "address"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with address = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "expiration"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with expiration = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
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
        ({ GapiJson.name = "payload"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with payload = v }
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
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
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
    files : File.t list;
    incompleteSearch : bool;
    kind : string;
    nextPageToken : string;
    
  }
  
  let files = {
    GapiLens.get = (fun x -> x.files);
    GapiLens.set = (fun v x -> { x with files = v });
  }
  let incompleteSearch = {
    GapiLens.get = (fun x -> x.incompleteSearch);
    GapiLens.set = (fun v x -> { x with incompleteSearch = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  
  let empty = {
    files = [];
    incompleteSearch = false;
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "files" File.render x.files;
      GapiJson.render_bool_value "incompleteSearch" x.incompleteSearch;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "incompleteSearch"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with incompleteSearch = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
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
    drives : Drive.t list;
    kind : string;
    nextPageToken : string;
    
  }
  
  let drives = {
    GapiLens.get = (fun x -> x.drives);
    GapiLens.set = (fun v x -> { x with drives = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  
  let empty = {
    drives = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "drives" Drive.render x.drives;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV3Model.DriveList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

