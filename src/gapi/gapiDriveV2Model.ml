(* Warning! This file is generated. Modify at your own risk. *)

module Permission =
struct
  type t = {
    additionalRoles : string list;
    authKey : string;
    etag : string;
    id : string;
    kind : string;
    name : string;
    photoLink : string;
    role : string;
    selfLink : string;
    _type : string;
    value : string;
    withLink : bool;
    
  }
  
  let additionalRoles = {
    GapiLens.get = (fun x -> x.additionalRoles);
    GapiLens.set = (fun v x -> { x with additionalRoles = v });
  }
  let authKey = {
    GapiLens.get = (fun x -> x.authKey);
    GapiLens.set = (fun v x -> { x with authKey = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
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
  let photoLink = {
    GapiLens.get = (fun x -> x.photoLink);
    GapiLens.set = (fun v x -> { x with photoLink = v });
  }
  let role = {
    GapiLens.get = (fun x -> x.role);
    GapiLens.set = (fun v x -> { x with role = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v });
  }
  let withLink = {
    GapiLens.get = (fun x -> x.withLink);
    GapiLens.set = (fun v x -> { x with withLink = v });
  }
  
  let empty = {
    additionalRoles = [];
    authKey = "";
    etag = "";
    id = "";
    kind = "";
    name = "";
    photoLink = "";
    role = "";
    selfLink = "";
    _type = "";
    value = "";
    withLink = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "additionalRoles" (GapiJson.render_string_value "") x.additionalRoles;
      GapiJson.render_string_value "authKey" x.authKey;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "photoLink" x.photoLink;
      GapiJson.render_string_value "role" x.role;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "type" x._type;
      GapiJson.render_string_value "value" x.value;
      GapiJson.render_bool_value "withLink" x.withLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "additionalRoles"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.Permission.parse.parse_collection" e x')
        ""
        (fun v -> { x with additionalRoles = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "authKey"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with authKey = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "photoLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with photoLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "role"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with role = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with value = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "withLink"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with withLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.Permission.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ParentReference =
struct
  type t = {
    id : string;
    isRoot : bool;
    kind : string;
    parentLink : string;
    selfLink : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let isRoot = {
    GapiLens.get = (fun x -> x.isRoot);
    GapiLens.set = (fun v x -> { x with isRoot = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let parentLink = {
    GapiLens.get = (fun x -> x.parentLink);
    GapiLens.set = (fun v x -> { x with parentLink = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    id = "";
    isRoot = false;
    kind = "";
    parentLink = "";
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_bool_value "isRoot" x.isRoot;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "parentLink" x.parentLink;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "isRoot"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with isRoot = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "parentLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with parentLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.ParentReference.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module User =
struct
  module Picture =
  struct
    type t = {
      url : string;
      
    }
    
    let url = {
      GapiLens.get = (fun x -> x.url);
      GapiLens.set = (fun v x -> { x with url = v });
    }
    
    let empty = {
      url = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "url" x.url;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "url"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with url = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV2Model.Picture.parse" e x
    
  end
  
  type t = {
    displayName : string;
    isAuthenticatedUser : bool;
    kind : string;
    permissionId : string;
    picture : Picture.t;
    
  }
  
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let isAuthenticatedUser = {
    GapiLens.get = (fun x -> x.isAuthenticatedUser);
    GapiLens.set = (fun v x -> { x with isAuthenticatedUser = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let permissionId = {
    GapiLens.get = (fun x -> x.permissionId);
    GapiLens.set = (fun v x -> { x with permissionId = v });
  }
  let picture = {
    GapiLens.get = (fun x -> x.picture);
    GapiLens.set = (fun v x -> { x with picture = v });
  }
  
  let empty = {
    displayName = "";
    isAuthenticatedUser = false;
    kind = "";
    permissionId = "";
    picture = Picture.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_bool_value "isAuthenticatedUser" x.isAuthenticatedUser;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "permissionId" x.permissionId;
      (fun v -> GapiJson.render_object "picture" (Picture.render_content v)) x.picture;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "isAuthenticatedUser"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with isAuthenticatedUser = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "permissionId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with permissionId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "picture"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Picture.parse
        Picture.empty
        (fun v -> { x with picture = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.User.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module File =
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
        GapiJson.unexpected "GapiDriveV2Model.Thumbnail.parse" e x
    
  end
  
  module Labels =
  struct
    type t = {
      hidden : bool;
      restricted : bool;
      starred : bool;
      trashed : bool;
      viewed : bool;
      
    }
    
    let hidden = {
      GapiLens.get = (fun x -> x.hidden);
      GapiLens.set = (fun v x -> { x with hidden = v });
    }
    let restricted = {
      GapiLens.get = (fun x -> x.restricted);
      GapiLens.set = (fun v x -> { x with restricted = v });
    }
    let starred = {
      GapiLens.get = (fun x -> x.starred);
      GapiLens.set = (fun v x -> { x with starred = v });
    }
    let trashed = {
      GapiLens.get = (fun x -> x.trashed);
      GapiLens.set = (fun v x -> { x with trashed = v });
    }
    let viewed = {
      GapiLens.get = (fun x -> x.viewed);
      GapiLens.set = (fun v x -> { x with viewed = v });
    }
    
    let empty = {
      hidden = false;
      restricted = false;
      starred = false;
      trashed = false;
      viewed = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_bool_value "hidden" x.hidden;
        GapiJson.render_bool_value "restricted" x.restricted;
        GapiJson.render_bool_value "starred" x.starred;
        GapiJson.render_bool_value "trashed" x.trashed;
        GapiJson.render_bool_value "viewed" x.viewed;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "hidden"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with hidden = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "restricted"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with restricted = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "starred"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with starred = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "trashed"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with trashed = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "viewed"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with viewed = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV2Model.Labels.parse" e x
    
  end
  
  module IndexableText =
  struct
    type t = {
      text : string;
      
    }
    
    let text = {
      GapiLens.get = (fun x -> x.text);
      GapiLens.set = (fun v x -> { x with text = v });
    }
    
    let empty = {
      text = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "text" x.text;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "text"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with text = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV2Model.IndexableText.parse" e x
    
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
          GapiJson.unexpected "GapiDriveV2Model.Location.parse" e x
      
    end
    
    type t = {
      aperture : float;
      cameraMake : string;
      cameraModel : string;
      colorSpace : string;
      date : string;
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
    let date = {
      GapiLens.get = (fun x -> x.date);
      GapiLens.set = (fun v x -> { x with date = v });
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
      date = "";
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
      whiteBalance = "";
      width = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_float_value "aperture" x.aperture;
        GapiJson.render_string_value "cameraMake" x.cameraMake;
        GapiJson.render_string_value "cameraModel" x.cameraModel;
        GapiJson.render_string_value "colorSpace" x.colorSpace;
        GapiJson.render_string_value "date" x.date;
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
          ({ GapiJson.name = "date"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with date = v }
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
        GapiJson.unexpected "GapiDriveV2Model.ImageMediaMetadata.parse" e x
    
  end
  
  type t = {
    alternateLink : string;
    createdDate : GapiDate.t;
    description : string;
    downloadUrl : string;
    editable : bool;
    embedLink : string;
    etag : string;
    explicitlyTrashed : bool;
    exportLinks : (string * string) list;
    fileExtension : string;
    fileSize : int64;
    iconLink : string;
    id : string;
    imageMediaMetadata : ImageMediaMetadata.t;
    indexableText : IndexableText.t;
    kind : string;
    labels : Labels.t;
    lastModifyingUser : User.t;
    lastModifyingUserName : string;
    lastViewedByMeDate : GapiDate.t;
    md5Checksum : string;
    mimeType : string;
    modifiedByMeDate : GapiDate.t;
    modifiedDate : GapiDate.t;
    originalFilename : string;
    ownerNames : string list;
    owners : User.t list;
    parents : ParentReference.t list;
    quotaBytesUsed : int64;
    selfLink : string;
    shared : bool;
    sharedWithMeDate : GapiDate.t;
    thumbnail : Thumbnail.t;
    thumbnailLink : string;
    title : string;
    userPermission : Permission.t;
    webContentLink : string;
    webViewLink : string;
    writersCanShare : bool;
    
  }
  
  let alternateLink = {
    GapiLens.get = (fun x -> x.alternateLink);
    GapiLens.set = (fun v x -> { x with alternateLink = v });
  }
  let createdDate = {
    GapiLens.get = (fun x -> x.createdDate);
    GapiLens.set = (fun v x -> { x with createdDate = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let downloadUrl = {
    GapiLens.get = (fun x -> x.downloadUrl);
    GapiLens.set = (fun v x -> { x with downloadUrl = v });
  }
  let editable = {
    GapiLens.get = (fun x -> x.editable);
    GapiLens.set = (fun v x -> { x with editable = v });
  }
  let embedLink = {
    GapiLens.get = (fun x -> x.embedLink);
    GapiLens.set = (fun v x -> { x with embedLink = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
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
  let fileSize = {
    GapiLens.get = (fun x -> x.fileSize);
    GapiLens.set = (fun v x -> { x with fileSize = v });
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
  let indexableText = {
    GapiLens.get = (fun x -> x.indexableText);
    GapiLens.set = (fun v x -> { x with indexableText = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let labels = {
    GapiLens.get = (fun x -> x.labels);
    GapiLens.set = (fun v x -> { x with labels = v });
  }
  let lastModifyingUser = {
    GapiLens.get = (fun x -> x.lastModifyingUser);
    GapiLens.set = (fun v x -> { x with lastModifyingUser = v });
  }
  let lastModifyingUserName = {
    GapiLens.get = (fun x -> x.lastModifyingUserName);
    GapiLens.set = (fun v x -> { x with lastModifyingUserName = v });
  }
  let lastViewedByMeDate = {
    GapiLens.get = (fun x -> x.lastViewedByMeDate);
    GapiLens.set = (fun v x -> { x with lastViewedByMeDate = v });
  }
  let md5Checksum = {
    GapiLens.get = (fun x -> x.md5Checksum);
    GapiLens.set = (fun v x -> { x with md5Checksum = v });
  }
  let mimeType = {
    GapiLens.get = (fun x -> x.mimeType);
    GapiLens.set = (fun v x -> { x with mimeType = v });
  }
  let modifiedByMeDate = {
    GapiLens.get = (fun x -> x.modifiedByMeDate);
    GapiLens.set = (fun v x -> { x with modifiedByMeDate = v });
  }
  let modifiedDate = {
    GapiLens.get = (fun x -> x.modifiedDate);
    GapiLens.set = (fun v x -> { x with modifiedDate = v });
  }
  let originalFilename = {
    GapiLens.get = (fun x -> x.originalFilename);
    GapiLens.set = (fun v x -> { x with originalFilename = v });
  }
  let ownerNames = {
    GapiLens.get = (fun x -> x.ownerNames);
    GapiLens.set = (fun v x -> { x with ownerNames = v });
  }
  let owners = {
    GapiLens.get = (fun x -> x.owners);
    GapiLens.set = (fun v x -> { x with owners = v });
  }
  let parents = {
    GapiLens.get = (fun x -> x.parents);
    GapiLens.set = (fun v x -> { x with parents = v });
  }
  let quotaBytesUsed = {
    GapiLens.get = (fun x -> x.quotaBytesUsed);
    GapiLens.set = (fun v x -> { x with quotaBytesUsed = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let shared = {
    GapiLens.get = (fun x -> x.shared);
    GapiLens.set = (fun v x -> { x with shared = v });
  }
  let sharedWithMeDate = {
    GapiLens.get = (fun x -> x.sharedWithMeDate);
    GapiLens.set = (fun v x -> { x with sharedWithMeDate = v });
  }
  let thumbnail = {
    GapiLens.get = (fun x -> x.thumbnail);
    GapiLens.set = (fun v x -> { x with thumbnail = v });
  }
  let thumbnailLink = {
    GapiLens.get = (fun x -> x.thumbnailLink);
    GapiLens.set = (fun v x -> { x with thumbnailLink = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let userPermission = {
    GapiLens.get = (fun x -> x.userPermission);
    GapiLens.set = (fun v x -> { x with userPermission = v });
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
    alternateLink = "";
    createdDate = GapiDate.epoch;
    description = "";
    downloadUrl = "";
    editable = false;
    embedLink = "";
    etag = "";
    explicitlyTrashed = false;
    exportLinks = [];
    fileExtension = "";
    fileSize = 0L;
    iconLink = "";
    id = "";
    imageMediaMetadata = ImageMediaMetadata.empty;
    indexableText = IndexableText.empty;
    kind = "";
    labels = Labels.empty;
    lastModifyingUser = User.empty;
    lastModifyingUserName = "";
    lastViewedByMeDate = GapiDate.epoch;
    md5Checksum = "";
    mimeType = "";
    modifiedByMeDate = GapiDate.epoch;
    modifiedDate = GapiDate.epoch;
    originalFilename = "";
    ownerNames = [];
    owners = [];
    parents = [];
    quotaBytesUsed = 0L;
    selfLink = "";
    shared = false;
    sharedWithMeDate = GapiDate.epoch;
    thumbnail = Thumbnail.empty;
    thumbnailLink = "";
    title = "";
    userPermission = Permission.empty;
    webContentLink = "";
    webViewLink = "";
    writersCanShare = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "alternateLink" x.alternateLink;
      GapiJson.render_date_value "createdDate" x.createdDate;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "downloadUrl" x.downloadUrl;
      GapiJson.render_bool_value "editable" x.editable;
      GapiJson.render_string_value "embedLink" x.embedLink;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_bool_value "explicitlyTrashed" x.explicitlyTrashed;
      GapiJson.render_collection "exportLinks" GapiJson.Object (fun (id, v) -> GapiJson.render_string_value id v) x.exportLinks;
      GapiJson.render_string_value "fileExtension" x.fileExtension;
      GapiJson.render_int64_value "fileSize" x.fileSize;
      GapiJson.render_string_value "iconLink" x.iconLink;
      GapiJson.render_string_value "id" x.id;
      (fun v -> GapiJson.render_object "imageMediaMetadata" (ImageMediaMetadata.render_content v)) x.imageMediaMetadata;
      (fun v -> GapiJson.render_object "indexableText" (IndexableText.render_content v)) x.indexableText;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "labels" (Labels.render_content v)) x.labels;
      (fun v -> GapiJson.render_object "lastModifyingUser" (User.render_content v)) x.lastModifyingUser;
      GapiJson.render_string_value "lastModifyingUserName" x.lastModifyingUserName;
      GapiJson.render_date_value "lastViewedByMeDate" x.lastViewedByMeDate;
      GapiJson.render_string_value "md5Checksum" x.md5Checksum;
      GapiJson.render_string_value "mimeType" x.mimeType;
      GapiJson.render_date_value "modifiedByMeDate" x.modifiedByMeDate;
      GapiJson.render_date_value "modifiedDate" x.modifiedDate;
      GapiJson.render_string_value "originalFilename" x.originalFilename;
      GapiJson.render_array "ownerNames" (GapiJson.render_string_value "") x.ownerNames;
      GapiJson.render_array "owners" User.render x.owners;
      GapiJson.render_array "parents" ParentReference.render x.parents;
      GapiJson.render_int64_value "quotaBytesUsed" x.quotaBytesUsed;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_bool_value "shared" x.shared;
      GapiJson.render_date_value "sharedWithMeDate" x.sharedWithMeDate;
      (fun v -> GapiJson.render_object "thumbnail" (Thumbnail.render_content v)) x.thumbnail;
      GapiJson.render_string_value "thumbnailLink" x.thumbnailLink;
      GapiJson.render_string_value "title" x.title;
      (fun v -> GapiJson.render_object "userPermission" (Permission.render_content v)) x.userPermission;
      GapiJson.render_string_value "webContentLink" x.webContentLink;
      GapiJson.render_string_value "webViewLink" x.webViewLink;
      GapiJson.render_bool_value "writersCanShare" x.writersCanShare;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "alternateLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with alternateLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdDate = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "downloadUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with downloadUrl = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "editable"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with editable = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "embedLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with embedLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
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
            GapiJson.unexpected "GapiDriveV2Model.File.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with exportLinks = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fileExtension"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fileExtension = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fileSize"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fileSize = Int64.of_string v }
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
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "indexableText"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        IndexableText.parse
        IndexableText.empty
        (fun v -> { x with indexableText = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labels"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Labels.parse
        Labels.empty
        (fun v -> { x with labels = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "lastModifyingUser"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        User.parse
        User.empty
        (fun v -> { x with lastModifyingUser = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "lastModifyingUserName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with lastModifyingUserName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "lastViewedByMeDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with lastViewedByMeDate = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "md5Checksum"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with md5Checksum = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "mimeType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with mimeType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedByMeDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedByMeDate = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedDate = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "originalFilename"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with originalFilename = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "ownerNames"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.File.parse.parse_collection" e x')
        ""
        (fun v -> { x with ownerNames = v })
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
            GapiJson.unexpected "GapiDriveV2Model.File.parse.parse_collection" e x')
        User.empty
        (fun v -> { x with owners = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parents"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ParentReference.parse
              ParentReference.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.File.parse.parse_collection" e x')
        ParentReference.empty
        (fun v -> { x with parents = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "quotaBytesUsed"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with quotaBytesUsed = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "shared"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with shared = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sharedWithMeDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sharedWithMeDate = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "thumbnail"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Thumbnail.parse
        Thumbnail.empty
        (fun v -> { x with thumbnail = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "thumbnailLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with thumbnailLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "userPermission"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Permission.parse
        Permission.empty
        (fun v -> { x with userPermission = v })
        cs
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
      GapiJson.unexpected "GapiDriveV2Model.File.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChildReference =
struct
  type t = {
    childLink : string;
    id : string;
    kind : string;
    selfLink : string;
    
  }
  
  let childLink = {
    GapiLens.get = (fun x -> x.childLink);
    GapiLens.set = (fun v x -> { x with childLink = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    childLink = "";
    id = "";
    kind = "";
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "childLink" x.childLink;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "childLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with childLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.ChildReference.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChildList =
struct
  type t = {
    etag : string;
    items : ChildReference.t list;
    kind : string;
    nextLink : string;
    nextPageToken : string;
    selfLink : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextLink = "";
    nextPageToken = "";
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" ChildReference.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ChildReference.parse
              ChildReference.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.ChildList.parse.parse_collection" e x')
        ChildReference.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.ChildList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module About =
struct
  module MaxUploadSizes =
  struct
    type t = {
      size : int64;
      _type : string;
      
    }
    
    let size = {
      GapiLens.get = (fun x -> x.size);
      GapiLens.set = (fun v x -> { x with size = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      size = 0L;
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_int64_value "size" x.size;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with size = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV2Model.MaxUploadSizes.parse" e x
    
  end
  
  module ImportFormats =
  struct
    type t = {
      source : string;
      targets : string list;
      
    }
    
    let source = {
      GapiLens.get = (fun x -> x.source);
      GapiLens.set = (fun v x -> { x with source = v });
    }
    let targets = {
      GapiLens.get = (fun x -> x.targets);
      GapiLens.set = (fun v x -> { x with targets = v });
    }
    
    let empty = {
      source = "";
      targets = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "source" x.source;
        GapiJson.render_array "targets" (GapiJson.render_string_value "") x.targets;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "source"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with source = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "targets"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiDriveV2Model.ImportFormats.parse.parse_collection" e x')
          ""
          (fun v -> { x with targets = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV2Model.ImportFormats.parse" e x
    
  end
  
  module Features =
  struct
    type t = {
      featureName : string;
      featureRate : float;
      
    }
    
    let featureName = {
      GapiLens.get = (fun x -> x.featureName);
      GapiLens.set = (fun v x -> { x with featureName = v });
    }
    let featureRate = {
      GapiLens.get = (fun x -> x.featureRate);
      GapiLens.set = (fun v x -> { x with featureRate = v });
    }
    
    let empty = {
      featureName = "";
      featureRate = 0.0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "featureName" x.featureName;
        GapiJson.render_float_value "featureRate" x.featureRate;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "featureName"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with featureName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "featureRate"; data_type = GapiJson.Scalar },
          `Float v) ->
        { x with featureRate = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "featureRate"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with featureRate = float_of_int v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV2Model.Features.parse" e x
    
  end
  
  module ExportFormats =
  struct
    type t = {
      source : string;
      targets : string list;
      
    }
    
    let source = {
      GapiLens.get = (fun x -> x.source);
      GapiLens.set = (fun v x -> { x with source = v });
    }
    let targets = {
      GapiLens.get = (fun x -> x.targets);
      GapiLens.set = (fun v x -> { x with targets = v });
    }
    
    let empty = {
      source = "";
      targets = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "source" x.source;
        GapiJson.render_array "targets" (GapiJson.render_string_value "") x.targets;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "source"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with source = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "targets"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiDriveV2Model.ExportFormats.parse.parse_collection" e x')
          ""
          (fun v -> { x with targets = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV2Model.ExportFormats.parse" e x
    
  end
  
  module AdditionalRoleInfo =
  struct
    module RoleSets =
    struct
      type t = {
        additionalRoles : string list;
        primaryRole : string;
        
      }
      
      let additionalRoles = {
        GapiLens.get = (fun x -> x.additionalRoles);
        GapiLens.set = (fun v x -> { x with additionalRoles = v });
      }
      let primaryRole = {
        GapiLens.get = (fun x -> x.primaryRole);
        GapiLens.set = (fun v x -> { x with primaryRole = v });
      }
      
      let empty = {
        additionalRoles = [];
        primaryRole = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_array "additionalRoles" (GapiJson.render_string_value "") x.additionalRoles;
          GapiJson.render_string_value "primaryRole" x.primaryRole;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "additionalRoles"; data_type = GapiJson.Array },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Leaf
                  ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                  `String v) ->
                v
              | e ->
                GapiJson.unexpected "GapiDriveV2Model.RoleSets.parse.parse_collection" e x')
            ""
            (fun v -> { x with additionalRoles = v })
            cs
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "primaryRole"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with primaryRole = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiDriveV2Model.RoleSets.parse" e x
      
    end
    
    type t = {
      roleSets : RoleSets.t list;
      _type : string;
      
    }
    
    let roleSets = {
      GapiLens.get = (fun x -> x.roleSets);
      GapiLens.set = (fun v x -> { x with roleSets = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    
    let empty = {
      roleSets = [];
      _type = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "roleSets" RoleSets.render x.roleSets;
        GapiJson.render_string_value "type" x._type;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "roleSets"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children
                RoleSets.parse
                RoleSets.empty
                (fun v -> v)
                cs
            | e ->
              GapiJson.unexpected "GapiDriveV2Model.AdditionalRoleInfo.parse.parse_collection" e x')
          RoleSets.empty
          (fun v -> { x with roleSets = v })
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
        GapiJson.unexpected "GapiDriveV2Model.AdditionalRoleInfo.parse" e x
    
  end
  
  type t = {
    additionalRoleInfo : AdditionalRoleInfo.t list;
    domainSharingPolicy : string;
    etag : string;
    exportFormats : ExportFormats.t list;
    features : Features.t list;
    importFormats : ImportFormats.t list;
    isCurrentAppInstalled : bool;
    kind : string;
    largestChangeId : int64;
    maxUploadSizes : MaxUploadSizes.t list;
    name : string;
    permissionId : string;
    quotaBytesTotal : int64;
    quotaBytesUsed : int64;
    quotaBytesUsedAggregate : int64;
    quotaBytesUsedInTrash : int64;
    remainingChangeIds : int64;
    rootFolderId : string;
    selfLink : string;
    user : User.t;
    
  }
  
  let additionalRoleInfo = {
    GapiLens.get = (fun x -> x.additionalRoleInfo);
    GapiLens.set = (fun v x -> { x with additionalRoleInfo = v });
  }
  let domainSharingPolicy = {
    GapiLens.get = (fun x -> x.domainSharingPolicy);
    GapiLens.set = (fun v x -> { x with domainSharingPolicy = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let exportFormats = {
    GapiLens.get = (fun x -> x.exportFormats);
    GapiLens.set = (fun v x -> { x with exportFormats = v });
  }
  let features = {
    GapiLens.get = (fun x -> x.features);
    GapiLens.set = (fun v x -> { x with features = v });
  }
  let importFormats = {
    GapiLens.get = (fun x -> x.importFormats);
    GapiLens.set = (fun v x -> { x with importFormats = v });
  }
  let isCurrentAppInstalled = {
    GapiLens.get = (fun x -> x.isCurrentAppInstalled);
    GapiLens.set = (fun v x -> { x with isCurrentAppInstalled = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let largestChangeId = {
    GapiLens.get = (fun x -> x.largestChangeId);
    GapiLens.set = (fun v x -> { x with largestChangeId = v });
  }
  let maxUploadSizes = {
    GapiLens.get = (fun x -> x.maxUploadSizes);
    GapiLens.set = (fun v x -> { x with maxUploadSizes = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let permissionId = {
    GapiLens.get = (fun x -> x.permissionId);
    GapiLens.set = (fun v x -> { x with permissionId = v });
  }
  let quotaBytesTotal = {
    GapiLens.get = (fun x -> x.quotaBytesTotal);
    GapiLens.set = (fun v x -> { x with quotaBytesTotal = v });
  }
  let quotaBytesUsed = {
    GapiLens.get = (fun x -> x.quotaBytesUsed);
    GapiLens.set = (fun v x -> { x with quotaBytesUsed = v });
  }
  let quotaBytesUsedAggregate = {
    GapiLens.get = (fun x -> x.quotaBytesUsedAggregate);
    GapiLens.set = (fun v x -> { x with quotaBytesUsedAggregate = v });
  }
  let quotaBytesUsedInTrash = {
    GapiLens.get = (fun x -> x.quotaBytesUsedInTrash);
    GapiLens.set = (fun v x -> { x with quotaBytesUsedInTrash = v });
  }
  let remainingChangeIds = {
    GapiLens.get = (fun x -> x.remainingChangeIds);
    GapiLens.set = (fun v x -> { x with remainingChangeIds = v });
  }
  let rootFolderId = {
    GapiLens.get = (fun x -> x.rootFolderId);
    GapiLens.set = (fun v x -> { x with rootFolderId = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let user = {
    GapiLens.get = (fun x -> x.user);
    GapiLens.set = (fun v x -> { x with user = v });
  }
  
  let empty = {
    additionalRoleInfo = [];
    domainSharingPolicy = "";
    etag = "";
    exportFormats = [];
    features = [];
    importFormats = [];
    isCurrentAppInstalled = false;
    kind = "";
    largestChangeId = 0L;
    maxUploadSizes = [];
    name = "";
    permissionId = "";
    quotaBytesTotal = 0L;
    quotaBytesUsed = 0L;
    quotaBytesUsedAggregate = 0L;
    quotaBytesUsedInTrash = 0L;
    remainingChangeIds = 0L;
    rootFolderId = "";
    selfLink = "";
    user = User.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "additionalRoleInfo" AdditionalRoleInfo.render x.additionalRoleInfo;
      GapiJson.render_string_value "domainSharingPolicy" x.domainSharingPolicy;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "exportFormats" ExportFormats.render x.exportFormats;
      GapiJson.render_array "features" Features.render x.features;
      GapiJson.render_array "importFormats" ImportFormats.render x.importFormats;
      GapiJson.render_bool_value "isCurrentAppInstalled" x.isCurrentAppInstalled;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_int64_value "largestChangeId" x.largestChangeId;
      GapiJson.render_array "maxUploadSizes" MaxUploadSizes.render x.maxUploadSizes;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "permissionId" x.permissionId;
      GapiJson.render_int64_value "quotaBytesTotal" x.quotaBytesTotal;
      GapiJson.render_int64_value "quotaBytesUsed" x.quotaBytesUsed;
      GapiJson.render_int64_value "quotaBytesUsedAggregate" x.quotaBytesUsedAggregate;
      GapiJson.render_int64_value "quotaBytesUsedInTrash" x.quotaBytesUsedInTrash;
      GapiJson.render_int64_value "remainingChangeIds" x.remainingChangeIds;
      GapiJson.render_string_value "rootFolderId" x.rootFolderId;
      GapiJson.render_string_value "selfLink" x.selfLink;
      (fun v -> GapiJson.render_object "user" (User.render_content v)) x.user;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "additionalRoleInfo"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              AdditionalRoleInfo.parse
              AdditionalRoleInfo.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.About.parse.parse_collection" e x')
        AdditionalRoleInfo.empty
        (fun v -> { x with additionalRoleInfo = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "domainSharingPolicy"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with domainSharingPolicy = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "exportFormats"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ExportFormats.parse
              ExportFormats.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.About.parse.parse_collection" e x')
        ExportFormats.empty
        (fun v -> { x with exportFormats = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "features"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Features.parse
              Features.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.About.parse.parse_collection" e x')
        Features.empty
        (fun v -> { x with features = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "importFormats"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ImportFormats.parse
              ImportFormats.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.About.parse.parse_collection" e x')
        ImportFormats.empty
        (fun v -> { x with importFormats = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "isCurrentAppInstalled"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with isCurrentAppInstalled = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "largestChangeId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with largestChangeId = Int64.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "maxUploadSizes"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              MaxUploadSizes.parse
              MaxUploadSizes.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.About.parse.parse_collection" e x')
        MaxUploadSizes.empty
        (fun v -> { x with maxUploadSizes = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "permissionId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with permissionId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "quotaBytesTotal"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with quotaBytesTotal = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "quotaBytesUsed"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with quotaBytesUsed = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "quotaBytesUsedAggregate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with quotaBytesUsedAggregate = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "quotaBytesUsedInTrash"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with quotaBytesUsedInTrash = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "remainingChangeIds"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with remainingChangeIds = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rootFolderId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with rootFolderId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
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
      GapiJson.unexpected "GapiDriveV2Model.About.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CommentReply =
struct
  type t = {
    author : User.t;
    content : string;
    createdDate : GapiDate.t;
    deleted : bool;
    htmlContent : string;
    kind : string;
    modifiedDate : GapiDate.t;
    replyId : string;
    verb : string;
    
  }
  
  let author = {
    GapiLens.get = (fun x -> x.author);
    GapiLens.set = (fun v x -> { x with author = v });
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
  }
  let createdDate = {
    GapiLens.get = (fun x -> x.createdDate);
    GapiLens.set = (fun v x -> { x with createdDate = v });
  }
  let deleted = {
    GapiLens.get = (fun x -> x.deleted);
    GapiLens.set = (fun v x -> { x with deleted = v });
  }
  let htmlContent = {
    GapiLens.get = (fun x -> x.htmlContent);
    GapiLens.set = (fun v x -> { x with htmlContent = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let modifiedDate = {
    GapiLens.get = (fun x -> x.modifiedDate);
    GapiLens.set = (fun v x -> { x with modifiedDate = v });
  }
  let replyId = {
    GapiLens.get = (fun x -> x.replyId);
    GapiLens.set = (fun v x -> { x with replyId = v });
  }
  let verb = {
    GapiLens.get = (fun x -> x.verb);
    GapiLens.set = (fun v x -> { x with verb = v });
  }
  
  let empty = {
    author = User.empty;
    content = "";
    createdDate = GapiDate.epoch;
    deleted = false;
    htmlContent = "";
    kind = "";
    modifiedDate = GapiDate.epoch;
    replyId = "";
    verb = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "author" (User.render_content v)) x.author;
      GapiJson.render_string_value "content" x.content;
      GapiJson.render_date_value "createdDate" x.createdDate;
      GapiJson.render_bool_value "deleted" x.deleted;
      GapiJson.render_string_value "htmlContent" x.htmlContent;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "modifiedDate" x.modifiedDate;
      GapiJson.render_string_value "replyId" x.replyId;
      GapiJson.render_string_value "verb" x.verb;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
        ({ GapiJson.name = "createdDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdDate = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "deleted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with deleted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlContent"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with htmlContent = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedDate = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "replyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with replyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "verb"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with verb = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.CommentReply.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Comment =
struct
  module Context =
  struct
    type t = {
      _type : string;
      value : string;
      
    }
    
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    let value = {
      GapiLens.get = (fun x -> x.value);
      GapiLens.set = (fun v x -> { x with value = v });
    }
    
    let empty = {
      _type = "";
      value = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "type" x._type;
        GapiJson.render_string_value "value" x.value;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with value = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV2Model.Context.parse" e x
    
  end
  
  type t = {
    anchor : string;
    author : User.t;
    commentId : string;
    content : string;
    context : Context.t;
    createdDate : GapiDate.t;
    deleted : bool;
    fileId : string;
    fileTitle : string;
    htmlContent : string;
    kind : string;
    modifiedDate : GapiDate.t;
    replies : CommentReply.t list;
    selfLink : string;
    status : string;
    
  }
  
  let anchor = {
    GapiLens.get = (fun x -> x.anchor);
    GapiLens.set = (fun v x -> { x with anchor = v });
  }
  let author = {
    GapiLens.get = (fun x -> x.author);
    GapiLens.set = (fun v x -> { x with author = v });
  }
  let commentId = {
    GapiLens.get = (fun x -> x.commentId);
    GapiLens.set = (fun v x -> { x with commentId = v });
  }
  let content = {
    GapiLens.get = (fun x -> x.content);
    GapiLens.set = (fun v x -> { x with content = v });
  }
  let context = {
    GapiLens.get = (fun x -> x.context);
    GapiLens.set = (fun v x -> { x with context = v });
  }
  let createdDate = {
    GapiLens.get = (fun x -> x.createdDate);
    GapiLens.set = (fun v x -> { x with createdDate = v });
  }
  let deleted = {
    GapiLens.get = (fun x -> x.deleted);
    GapiLens.set = (fun v x -> { x with deleted = v });
  }
  let fileId = {
    GapiLens.get = (fun x -> x.fileId);
    GapiLens.set = (fun v x -> { x with fileId = v });
  }
  let fileTitle = {
    GapiLens.get = (fun x -> x.fileTitle);
    GapiLens.set = (fun v x -> { x with fileTitle = v });
  }
  let htmlContent = {
    GapiLens.get = (fun x -> x.htmlContent);
    GapiLens.set = (fun v x -> { x with htmlContent = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let modifiedDate = {
    GapiLens.get = (fun x -> x.modifiedDate);
    GapiLens.set = (fun v x -> { x with modifiedDate = v });
  }
  let replies = {
    GapiLens.get = (fun x -> x.replies);
    GapiLens.set = (fun v x -> { x with replies = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  let status = {
    GapiLens.get = (fun x -> x.status);
    GapiLens.set = (fun v x -> { x with status = v });
  }
  
  let empty = {
    anchor = "";
    author = User.empty;
    commentId = "";
    content = "";
    context = Context.empty;
    createdDate = GapiDate.epoch;
    deleted = false;
    fileId = "";
    fileTitle = "";
    htmlContent = "";
    kind = "";
    modifiedDate = GapiDate.epoch;
    replies = [];
    selfLink = "";
    status = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "anchor" x.anchor;
      (fun v -> GapiJson.render_object "author" (User.render_content v)) x.author;
      GapiJson.render_string_value "commentId" x.commentId;
      GapiJson.render_string_value "content" x.content;
      (fun v -> GapiJson.render_object "context" (Context.render_content v)) x.context;
      GapiJson.render_date_value "createdDate" x.createdDate;
      GapiJson.render_bool_value "deleted" x.deleted;
      GapiJson.render_string_value "fileId" x.fileId;
      GapiJson.render_string_value "fileTitle" x.fileTitle;
      GapiJson.render_string_value "htmlContent" x.htmlContent;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "modifiedDate" x.modifiedDate;
      GapiJson.render_array "replies" CommentReply.render x.replies;
      GapiJson.render_string_value "selfLink" x.selfLink;
      GapiJson.render_string_value "status" x.status;
      
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
        ({ GapiJson.name = "commentId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with commentId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "content"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with content = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "context"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Context.parse
        Context.empty
        (fun v -> { x with context = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "createdDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with createdDate = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "deleted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with deleted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fileId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fileId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fileTitle"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fileTitle = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlContent"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with htmlContent = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedDate = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "replies"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              CommentReply.parse
              CommentReply.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.Comment.parse.parse_collection" e x')
        CommentReply.empty
        (fun v -> { x with replies = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "status"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with status = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.Comment.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CommentList =
struct
  type t = {
    items : Comment.t list;
    kind : string;
    nextPageToken : string;
    
  }
  
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
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
    items = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" Comment.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
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
            GapiJson.unexpected "GapiDriveV2Model.CommentList.parse.parse_collection" e x')
        Comment.empty
        (fun v -> { x with items = v })
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
      GapiJson.unexpected "GapiDriveV2Model.CommentList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Revision =
struct
  type t = {
    downloadUrl : string;
    etag : string;
    exportLinks : (string * string) list;
    fileSize : int64;
    id : string;
    kind : string;
    lastModifyingUser : User.t;
    lastModifyingUserName : string;
    md5Checksum : string;
    mimeType : string;
    modifiedDate : GapiDate.t;
    originalFilename : string;
    pinned : bool;
    publishAuto : bool;
    published : bool;
    publishedLink : string;
    publishedOutsideDomain : bool;
    selfLink : string;
    
  }
  
  let downloadUrl = {
    GapiLens.get = (fun x -> x.downloadUrl);
    GapiLens.set = (fun v x -> { x with downloadUrl = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let exportLinks = {
    GapiLens.get = (fun x -> x.exportLinks);
    GapiLens.set = (fun v x -> { x with exportLinks = v });
  }
  let fileSize = {
    GapiLens.get = (fun x -> x.fileSize);
    GapiLens.set = (fun v x -> { x with fileSize = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let lastModifyingUser = {
    GapiLens.get = (fun x -> x.lastModifyingUser);
    GapiLens.set = (fun v x -> { x with lastModifyingUser = v });
  }
  let lastModifyingUserName = {
    GapiLens.get = (fun x -> x.lastModifyingUserName);
    GapiLens.set = (fun v x -> { x with lastModifyingUserName = v });
  }
  let md5Checksum = {
    GapiLens.get = (fun x -> x.md5Checksum);
    GapiLens.set = (fun v x -> { x with md5Checksum = v });
  }
  let mimeType = {
    GapiLens.get = (fun x -> x.mimeType);
    GapiLens.set = (fun v x -> { x with mimeType = v });
  }
  let modifiedDate = {
    GapiLens.get = (fun x -> x.modifiedDate);
    GapiLens.set = (fun v x -> { x with modifiedDate = v });
  }
  let originalFilename = {
    GapiLens.get = (fun x -> x.originalFilename);
    GapiLens.set = (fun v x -> { x with originalFilename = v });
  }
  let pinned = {
    GapiLens.get = (fun x -> x.pinned);
    GapiLens.set = (fun v x -> { x with pinned = v });
  }
  let publishAuto = {
    GapiLens.get = (fun x -> x.publishAuto);
    GapiLens.set = (fun v x -> { x with publishAuto = v });
  }
  let published = {
    GapiLens.get = (fun x -> x.published);
    GapiLens.set = (fun v x -> { x with published = v });
  }
  let publishedLink = {
    GapiLens.get = (fun x -> x.publishedLink);
    GapiLens.set = (fun v x -> { x with publishedLink = v });
  }
  let publishedOutsideDomain = {
    GapiLens.get = (fun x -> x.publishedOutsideDomain);
    GapiLens.set = (fun v x -> { x with publishedOutsideDomain = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    downloadUrl = "";
    etag = "";
    exportLinks = [];
    fileSize = 0L;
    id = "";
    kind = "";
    lastModifyingUser = User.empty;
    lastModifyingUserName = "";
    md5Checksum = "";
    mimeType = "";
    modifiedDate = GapiDate.epoch;
    originalFilename = "";
    pinned = false;
    publishAuto = false;
    published = false;
    publishedLink = "";
    publishedOutsideDomain = false;
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "downloadUrl" x.downloadUrl;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_collection "exportLinks" GapiJson.Object (fun (id, v) -> GapiJson.render_string_value id v) x.exportLinks;
      GapiJson.render_int64_value "fileSize" x.fileSize;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      (fun v -> GapiJson.render_object "lastModifyingUser" (User.render_content v)) x.lastModifyingUser;
      GapiJson.render_string_value "lastModifyingUserName" x.lastModifyingUserName;
      GapiJson.render_string_value "md5Checksum" x.md5Checksum;
      GapiJson.render_string_value "mimeType" x.mimeType;
      GapiJson.render_date_value "modifiedDate" x.modifiedDate;
      GapiJson.render_string_value "originalFilename" x.originalFilename;
      GapiJson.render_bool_value "pinned" x.pinned;
      GapiJson.render_bool_value "publishAuto" x.publishAuto;
      GapiJson.render_bool_value "published" x.published;
      GapiJson.render_string_value "publishedLink" x.publishedLink;
      GapiJson.render_bool_value "publishedOutsideDomain" x.publishedOutsideDomain;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "downloadUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with downloadUrl = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
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
            GapiJson.unexpected "GapiDriveV2Model.Revision.parse.parse_dictionary" e x')
        ("", "")
        (fun v -> { x with exportLinks = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "fileSize"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with fileSize = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
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
        ({ GapiJson.name = "lastModifyingUserName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with lastModifyingUserName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "md5Checksum"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with md5Checksum = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "mimeType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with mimeType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "modifiedDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with modifiedDate = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "originalFilename"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with originalFilename = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pinned"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with pinned = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "publishAuto"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with publishAuto = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "published"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with published = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "publishedLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with publishedLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "publishedOutsideDomain"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with publishedOutsideDomain = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.Revision.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RevisionList =
struct
  type t = {
    etag : string;
    items : Revision.t list;
    kind : string;
    selfLink : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" Revision.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
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
            GapiJson.unexpected "GapiDriveV2Model.RevisionList.parse.parse_collection" e x')
        Revision.empty
        (fun v -> { x with items = v })
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
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.RevisionList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module App =
struct
  module Icons =
  struct
    type t = {
      category : string;
      iconUrl : string;
      size : int;
      
    }
    
    let category = {
      GapiLens.get = (fun x -> x.category);
      GapiLens.set = (fun v x -> { x with category = v });
    }
    let iconUrl = {
      GapiLens.get = (fun x -> x.iconUrl);
      GapiLens.set = (fun v x -> { x with iconUrl = v });
    }
    let size = {
      GapiLens.get = (fun x -> x.size);
      GapiLens.set = (fun v x -> { x with size = v });
    }
    
    let empty = {
      category = "";
      iconUrl = "";
      size = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "category" x.category;
        GapiJson.render_string_value "iconUrl" x.iconUrl;
        GapiJson.render_int_value "size" x.size;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "category"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with category = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "iconUrl"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with iconUrl = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with size = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDriveV2Model.Icons.parse" e x
    
  end
  
  type t = {
    authorized : bool;
    icons : Icons.t list;
    id : string;
    installed : bool;
    kind : string;
    name : string;
    objectType : string;
    primaryFileExtensions : string list;
    primaryMimeTypes : string list;
    productUrl : string;
    secondaryFileExtensions : string list;
    secondaryMimeTypes : string list;
    supportsCreate : bool;
    supportsImport : bool;
    useByDefault : bool;
    
  }
  
  let authorized = {
    GapiLens.get = (fun x -> x.authorized);
    GapiLens.set = (fun v x -> { x with authorized = v });
  }
  let icons = {
    GapiLens.get = (fun x -> x.icons);
    GapiLens.set = (fun v x -> { x with icons = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let installed = {
    GapiLens.get = (fun x -> x.installed);
    GapiLens.set = (fun v x -> { x with installed = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let objectType = {
    GapiLens.get = (fun x -> x.objectType);
    GapiLens.set = (fun v x -> { x with objectType = v });
  }
  let primaryFileExtensions = {
    GapiLens.get = (fun x -> x.primaryFileExtensions);
    GapiLens.set = (fun v x -> { x with primaryFileExtensions = v });
  }
  let primaryMimeTypes = {
    GapiLens.get = (fun x -> x.primaryMimeTypes);
    GapiLens.set = (fun v x -> { x with primaryMimeTypes = v });
  }
  let productUrl = {
    GapiLens.get = (fun x -> x.productUrl);
    GapiLens.set = (fun v x -> { x with productUrl = v });
  }
  let secondaryFileExtensions = {
    GapiLens.get = (fun x -> x.secondaryFileExtensions);
    GapiLens.set = (fun v x -> { x with secondaryFileExtensions = v });
  }
  let secondaryMimeTypes = {
    GapiLens.get = (fun x -> x.secondaryMimeTypes);
    GapiLens.set = (fun v x -> { x with secondaryMimeTypes = v });
  }
  let supportsCreate = {
    GapiLens.get = (fun x -> x.supportsCreate);
    GapiLens.set = (fun v x -> { x with supportsCreate = v });
  }
  let supportsImport = {
    GapiLens.get = (fun x -> x.supportsImport);
    GapiLens.set = (fun v x -> { x with supportsImport = v });
  }
  let useByDefault = {
    GapiLens.get = (fun x -> x.useByDefault);
    GapiLens.set = (fun v x -> { x with useByDefault = v });
  }
  
  let empty = {
    authorized = false;
    icons = [];
    id = "";
    installed = false;
    kind = "";
    name = "";
    objectType = "";
    primaryFileExtensions = [];
    primaryMimeTypes = [];
    productUrl = "";
    secondaryFileExtensions = [];
    secondaryMimeTypes = [];
    supportsCreate = false;
    supportsImport = false;
    useByDefault = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "authorized" x.authorized;
      GapiJson.render_array "icons" Icons.render x.icons;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_bool_value "installed" x.installed;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "objectType" x.objectType;
      GapiJson.render_array "primaryFileExtensions" (GapiJson.render_string_value "") x.primaryFileExtensions;
      GapiJson.render_array "primaryMimeTypes" (GapiJson.render_string_value "") x.primaryMimeTypes;
      GapiJson.render_string_value "productUrl" x.productUrl;
      GapiJson.render_array "secondaryFileExtensions" (GapiJson.render_string_value "") x.secondaryFileExtensions;
      GapiJson.render_array "secondaryMimeTypes" (GapiJson.render_string_value "") x.secondaryMimeTypes;
      GapiJson.render_bool_value "supportsCreate" x.supportsCreate;
      GapiJson.render_bool_value "supportsImport" x.supportsImport;
      GapiJson.render_bool_value "useByDefault" x.useByDefault;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
            GapiJson.parse_children Icons.parse Icons.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.App.parse.parse_collection" e x')
        Icons.empty
        (fun v -> { x with icons = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "installed"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with installed = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "objectType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with objectType = v }
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
            GapiJson.unexpected "GapiDriveV2Model.App.parse.parse_collection" e x')
        ""
        (fun v -> { x with primaryFileExtensions = v })
        cs
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
            GapiJson.unexpected "GapiDriveV2Model.App.parse.parse_collection" e x')
        ""
        (fun v -> { x with primaryMimeTypes = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "productUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with productUrl = v }
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
            GapiJson.unexpected "GapiDriveV2Model.App.parse.parse_collection" e x')
        ""
        (fun v -> { x with secondaryFileExtensions = v })
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
            GapiJson.unexpected "GapiDriveV2Model.App.parse.parse_collection" e x')
        ""
        (fun v -> { x with secondaryMimeTypes = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "supportsCreate"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with supportsCreate = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "supportsImport"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with supportsImport = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "useByDefault"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with useByDefault = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.App.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Change =
struct
  type t = {
    deleted : bool;
    file : File.t;
    fileId : string;
    id : int64;
    kind : string;
    selfLink : string;
    
  }
  
  let deleted = {
    GapiLens.get = (fun x -> x.deleted);
    GapiLens.set = (fun v x -> { x with deleted = v });
  }
  let file = {
    GapiLens.get = (fun x -> x.file);
    GapiLens.set = (fun v x -> { x with file = v });
  }
  let fileId = {
    GapiLens.get = (fun x -> x.fileId);
    GapiLens.set = (fun v x -> { x with fileId = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    deleted = false;
    file = File.empty;
    fileId = "";
    id = 0L;
    kind = "";
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "deleted" x.deleted;
      (fun v -> GapiJson.render_object "file" (File.render_content v)) x.file;
      GapiJson.render_string_value "fileId" x.fileId;
      GapiJson.render_int64_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "deleted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with deleted = v }
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
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.Change.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ChangeList =
struct
  type t = {
    etag : string;
    items : Change.t list;
    kind : string;
    largestChangeId : int64;
    nextLink : string;
    nextPageToken : string;
    selfLink : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let largestChangeId = {
    GapiLens.get = (fun x -> x.largestChangeId);
    GapiLens.set = (fun v x -> { x with largestChangeId = v });
  }
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    largestChangeId = 0L;
    nextLink = "";
    nextPageToken = "";
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" Change.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_int64_value "largestChangeId" x.largestChangeId;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Change.parse Change.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.ChangeList.parse.parse_collection" e x')
        Change.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "largestChangeId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with largestChangeId = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.ChangeList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FileList =
struct
  type t = {
    etag : string;
    items : File.t list;
    kind : string;
    nextLink : string;
    nextPageToken : string;
    selfLink : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextLink = {
    GapiLens.get = (fun x -> x.nextLink);
    GapiLens.set = (fun v x -> { x with nextLink = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextLink = "";
    nextPageToken = "";
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" File.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextLink" x.nextLink;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children File.parse File.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.FileList.parse.parse_collection" e x')
        File.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selfLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with selfLink = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.FileList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module PermissionList =
struct
  type t = {
    etag : string;
    items : Permission.t list;
    kind : string;
    selfLink : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" Permission.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
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
            GapiJson.unexpected "GapiDriveV2Model.PermissionList.parse.parse_collection" e x')
        Permission.empty
        (fun v -> { x with items = v })
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
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.PermissionList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AppList =
struct
  type t = {
    etag : string;
    items : App.t list;
    kind : string;
    selfLink : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" App.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
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
            GapiJson.unexpected "GapiDriveV2Model.AppList.parse.parse_collection" e x')
        App.empty
        (fun v -> { x with items = v })
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
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.AppList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CommentReplyList =
struct
  type t = {
    items : CommentReply.t list;
    kind : string;
    nextPageToken : string;
    
  }
  
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
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
    items = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "items" CommentReply.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              CommentReply.parse
              CommentReply.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.CommentReplyList.parse.parse_collection" e x')
        CommentReply.empty
        (fun v -> { x with items = v })
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
      GapiJson.unexpected "GapiDriveV2Model.CommentReplyList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ParentList =
struct
  type t = {
    etag : string;
    items : ParentReference.t list;
    kind : string;
    selfLink : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let selfLink = {
    GapiLens.get = (fun x -> x.selfLink);
    GapiLens.set = (fun v x -> { x with selfLink = v });
  }
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    selfLink = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" ParentReference.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "selfLink" x.selfLink;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ParentReference.parse
              ParentReference.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDriveV2Model.ParentList.parse.parse_collection" e x')
        ParentReference.empty
        (fun v -> { x with items = v })
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
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDriveV2Model.ParentList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

