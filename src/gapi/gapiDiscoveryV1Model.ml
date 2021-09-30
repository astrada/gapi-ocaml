(* Warning! This file is generated. Modify at your own risk.
        *)

module JsonSchema =
struct
  module Annotations =
  struct
    type t = {
      required : string list;
      
    }
    
    let required = {
      GapiLens.get = (fun x -> x.required);
      GapiLens.set = (fun v x -> { x with required = v });
    }
    
    let empty = {
      required = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "required" (GapiJson.render_string_value "") x.required;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "required"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiDiscoveryV1Model.Annotations.parse.parse_collection" e x')
          ""
          (fun v -> { x with required = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.Annotations.parse" e x
    
  end
  
  module Variant =
  struct
    module Map =
    struct
      type t = {
        _ref : string;
        type_value : string;
        
      }
      
      let _ref = {
        GapiLens.get = (fun x -> x._ref);
        GapiLens.set = (fun v x -> { x with _ref = v });
      }
      let type_value = {
        GapiLens.get = (fun x -> x.type_value);
        GapiLens.set = (fun v x -> { x with type_value = v });
      }
      
      let empty = {
        _ref = "";
        type_value = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "$ref" x._ref;
          GapiJson.render_string_value "type_value" x.type_value;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "$ref"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with _ref = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "type_value"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with type_value = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiDiscoveryV1Model.Map.parse" e x
      
    end
    
    type t = {
      map : Map.t list;
      discriminant : string;
      
    }
    
    let map = {
      GapiLens.get = (fun x -> x.map);
      GapiLens.set = (fun v x -> { x with map = v });
    }
    let discriminant = {
      GapiLens.get = (fun x -> x.discriminant);
      GapiLens.set = (fun v x -> { x with discriminant = v });
    }
    
    let empty = {
      map = [];
      discriminant = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "map" Map.render x.map;
        GapiJson.render_string_value "discriminant" x.discriminant;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "map"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children Map.parse Map.empty (fun v -> v) cs
            | e ->
              GapiJson.unexpected "GapiDiscoveryV1Model.Variant.parse.parse_collection" e x')
          Map.empty
          (fun v -> { x with map = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "discriminant"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with discriminant = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.Variant.parse" e x
    
  end
  
  type t = {
    items : t option;
    repeated : bool;
    variant : Variant.t;
    pattern : string;
    maximum : string;
    location : string;
    enum : string list;
    _ref : string;
    _type : string;
    annotations : Annotations.t;
    required : bool;
    default : string;
    minimum : string;
    description : string;
    enumDescriptions : string list;
    readOnly : bool;
    id : string;
    format : string;
    additionalProperties : t option;
    properties : (string * t) list;
    
  }
  
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let repeated = {
    GapiLens.get = (fun x -> x.repeated);
    GapiLens.set = (fun v x -> { x with repeated = v });
  }
  let variant = {
    GapiLens.get = (fun x -> x.variant);
    GapiLens.set = (fun v x -> { x with variant = v });
  }
  let pattern = {
    GapiLens.get = (fun x -> x.pattern);
    GapiLens.set = (fun v x -> { x with pattern = v });
  }
  let maximum = {
    GapiLens.get = (fun x -> x.maximum);
    GapiLens.set = (fun v x -> { x with maximum = v });
  }
  let location = {
    GapiLens.get = (fun x -> x.location);
    GapiLens.set = (fun v x -> { x with location = v });
  }
  let enum = {
    GapiLens.get = (fun x -> x.enum);
    GapiLens.set = (fun v x -> { x with enum = v });
  }
  let _ref = {
    GapiLens.get = (fun x -> x._ref);
    GapiLens.set = (fun v x -> { x with _ref = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  let annotations = {
    GapiLens.get = (fun x -> x.annotations);
    GapiLens.set = (fun v x -> { x with annotations = v });
  }
  let required = {
    GapiLens.get = (fun x -> x.required);
    GapiLens.set = (fun v x -> { x with required = v });
  }
  let default = {
    GapiLens.get = (fun x -> x.default);
    GapiLens.set = (fun v x -> { x with default = v });
  }
  let minimum = {
    GapiLens.get = (fun x -> x.minimum);
    GapiLens.set = (fun v x -> { x with minimum = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let enumDescriptions = {
    GapiLens.get = (fun x -> x.enumDescriptions);
    GapiLens.set = (fun v x -> { x with enumDescriptions = v });
  }
  let readOnly = {
    GapiLens.get = (fun x -> x.readOnly);
    GapiLens.set = (fun v x -> { x with readOnly = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let format = {
    GapiLens.get = (fun x -> x.format);
    GapiLens.set = (fun v x -> { x with format = v });
  }
  let additionalProperties = {
    GapiLens.get = (fun x -> x.additionalProperties);
    GapiLens.set = (fun v x -> { x with additionalProperties = v });
  }
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  
  let empty = {
    items = None;
    repeated = false;
    variant = Variant.empty;
    pattern = "";
    maximum = "";
    location = "";
    enum = [];
    _ref = "";
    _type = "";
    annotations = Annotations.empty;
    required = false;
    default = "";
    minimum = "";
    description = "";
    enumDescriptions = [];
    readOnly = false;
    id = "";
    format = "";
    additionalProperties = None;
    properties = [];
    
  }
  
  let rec render_content x = 
     [
      GapiUtils.option_map_default (fun v -> GapiJson.render_object "items" (render_content v)) [] x.items;
      GapiJson.render_bool_value "repeated" x.repeated;
      (fun v -> GapiJson.render_object "variant" (Variant.render_content v)) x.variant;
      GapiJson.render_string_value "pattern" x.pattern;
      GapiJson.render_string_value "maximum" x.maximum;
      GapiJson.render_string_value "location" x.location;
      GapiJson.render_array "enum" (GapiJson.render_string_value "") x.enum;
      GapiJson.render_string_value "$ref" x._ref;
      GapiJson.render_string_value "type" x._type;
      (fun v -> GapiJson.render_object "annotations" (Annotations.render_content v)) x.annotations;
      GapiJson.render_bool_value "required" x.required;
      GapiJson.render_string_value "default" x.default;
      GapiJson.render_string_value "minimum" x.minimum;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_array "enumDescriptions" (GapiJson.render_string_value "") x.enumDescriptions;
      GapiJson.render_bool_value "readOnly" x.readOnly;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "format" x.format;
      GapiUtils.option_map_default (fun v -> GapiJson.render_object "additionalProperties" (render_content v)) [] x.additionalProperties;
      GapiJson.render_collection "properties" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (render_content v)) v) x.properties;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        parse
        empty
        (fun v -> { x with items = Some v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "repeated"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with repeated = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "variant"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Variant.parse
        Variant.empty
        (fun v -> { x with variant = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pattern"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with pattern = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "maximum"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with maximum = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "location"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with location = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "enum"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.JsonSchema.parse.parse_collection" e x')
        ""
        (fun v -> { x with enum = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "$ref"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _ref = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "annotations"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Annotations.parse
        Annotations.empty
        (fun v -> { x with annotations = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "required"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with required = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "default"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with default = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "minimum"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with minimum = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "enumDescriptions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.JsonSchema.parse.parse_collection" e x')
        ""
        (fun v -> { x with enumDescriptions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "readOnly"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with readOnly = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "format"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with format = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "additionalProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        parse
        empty
        (fun v -> { x with additionalProperties = Some v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "properties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children parse empty (fun v -> (n, v)) cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.JsonSchema.parse.parse_dictionary" e x')
        ("", empty)
        (fun v -> { x with properties = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.JsonSchema.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DirectoryList =
struct
  module Items =
  struct
    module Icons =
    struct
      type t = {
        x16 : string;
        x32 : string;
        
      }
      
      let x16 = {
        GapiLens.get = (fun x -> x.x16);
        GapiLens.set = (fun v x -> { x with x16 = v });
      }
      let x32 = {
        GapiLens.get = (fun x -> x.x32);
        GapiLens.set = (fun v x -> { x with x32 = v });
      }
      
      let empty = {
        x16 = "";
        x32 = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "x16" x.x16;
          GapiJson.render_string_value "x32" x.x32;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "x16"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with x16 = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "x32"; data_type = GapiJson.Scalar },
            `String v) ->
          { x with x32 = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiDiscoveryV1Model.Icons.parse" e x
      
    end
    
    type t = {
      title : string;
      id : string;
      labels : string list;
      description : string;
      icons : Icons.t;
      name : string;
      kind : string;
      documentationLink : string;
      discoveryLink : string;
      preferred : bool;
      version : string;
      discoveryRestUrl : string;
      
    }
    
    let title = {
      GapiLens.get = (fun x -> x.title);
      GapiLens.set = (fun v x -> { x with title = v });
    }
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    let labels = {
      GapiLens.get = (fun x -> x.labels);
      GapiLens.set = (fun v x -> { x with labels = v });
    }
    let description = {
      GapiLens.get = (fun x -> x.description);
      GapiLens.set = (fun v x -> { x with description = v });
    }
    let icons = {
      GapiLens.get = (fun x -> x.icons);
      GapiLens.set = (fun v x -> { x with icons = v });
    }
    let name = {
      GapiLens.get = (fun x -> x.name);
      GapiLens.set = (fun v x -> { x with name = v });
    }
    let kind = {
      GapiLens.get = (fun x -> x.kind);
      GapiLens.set = (fun v x -> { x with kind = v });
    }
    let documentationLink = {
      GapiLens.get = (fun x -> x.documentationLink);
      GapiLens.set = (fun v x -> { x with documentationLink = v });
    }
    let discoveryLink = {
      GapiLens.get = (fun x -> x.discoveryLink);
      GapiLens.set = (fun v x -> { x with discoveryLink = v });
    }
    let preferred = {
      GapiLens.get = (fun x -> x.preferred);
      GapiLens.set = (fun v x -> { x with preferred = v });
    }
    let version = {
      GapiLens.get = (fun x -> x.version);
      GapiLens.set = (fun v x -> { x with version = v });
    }
    let discoveryRestUrl = {
      GapiLens.get = (fun x -> x.discoveryRestUrl);
      GapiLens.set = (fun v x -> { x with discoveryRestUrl = v });
    }
    
    let empty = {
      title = "";
      id = "";
      labels = [];
      description = "";
      icons = Icons.empty;
      name = "";
      kind = "";
      documentationLink = "";
      discoveryLink = "";
      preferred = false;
      version = "";
      discoveryRestUrl = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "title" x.title;
        GapiJson.render_string_value "id" x.id;
        GapiJson.render_array "labels" (GapiJson.render_string_value "") x.labels;
        GapiJson.render_string_value "description" x.description;
        (fun v -> GapiJson.render_object "icons" (Icons.render_content v)) x.icons;
        GapiJson.render_string_value "name" x.name;
        GapiJson.render_string_value "kind" x.kind;
        GapiJson.render_string_value "documentationLink" x.documentationLink;
        GapiJson.render_string_value "discoveryLink" x.discoveryLink;
        GapiJson.render_bool_value "preferred" x.preferred;
        GapiJson.render_string_value "version" x.version;
        GapiJson.render_string_value "discoveryRestUrl" x.discoveryRestUrl;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with title = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "labels"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiDiscoveryV1Model.Items.parse.parse_collection" e x')
          ""
          (fun v -> { x with labels = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with description = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "icons"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          Icons.parse
          Icons.empty
          (fun v -> { x with icons = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with name = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with kind = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "documentationLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with documentationLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "discoveryLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with discoveryLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "preferred"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with preferred = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "version"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with version = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "discoveryRestUrl"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with discoveryRestUrl = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.Items.parse" e x
    
  end
  
  type t = {
    kind : string;
    discoveryVersion : string;
    items : Items.t list;
    
  }
  
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let discoveryVersion = {
    GapiLens.get = (fun x -> x.discoveryVersion);
    GapiLens.set = (fun v x -> { x with discoveryVersion = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  
  let empty = {
    kind = "";
    discoveryVersion = "";
    items = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "discoveryVersion" x.discoveryVersion;
      GapiJson.render_array "items" Items.render x.items;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "discoveryVersion"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with discoveryVersion = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Items.parse Items.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.DirectoryList.parse.parse_collection" e x')
        Items.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.DirectoryList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RestMethod =
struct
  module MediaUpload =
  struct
    module Protocols =
    struct
      module Resumable =
      struct
        type t = {
          multipart : bool;
          path : string;
          
        }
        
        let multipart = {
          GapiLens.get = (fun x -> x.multipart);
          GapiLens.set = (fun v x -> { x with multipart = v });
        }
        let path = {
          GapiLens.get = (fun x -> x.path);
          GapiLens.set = (fun v x -> { x with path = v });
        }
        
        let empty = {
          multipart = false;
          path = "";
          
        }
        
        let rec render_content x = 
           [
            GapiJson.render_bool_value "multipart" x.multipart;
            GapiJson.render_string_value "path" x.path;
            
          ]
        and render x = 
          GapiJson.render_object "" (render_content x)
        
        let rec parse x = function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "multipart"; data_type = GapiJson.Scalar },
              `Bool v) ->
            { x with multipart = v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "path"; data_type = GapiJson.Scalar },
              `String v) ->
            { x with path = v }
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.Resumable.parse" e x
        
      end
      
      module Simple =
      struct
        type t = {
          path : string;
          multipart : bool;
          
        }
        
        let path = {
          GapiLens.get = (fun x -> x.path);
          GapiLens.set = (fun v x -> { x with path = v });
        }
        let multipart = {
          GapiLens.get = (fun x -> x.multipart);
          GapiLens.set = (fun v x -> { x with multipart = v });
        }
        
        let empty = {
          path = "";
          multipart = false;
          
        }
        
        let rec render_content x = 
           [
            GapiJson.render_string_value "path" x.path;
            GapiJson.render_bool_value "multipart" x.multipart;
            
          ]
        and render x = 
          GapiJson.render_object "" (render_content x)
        
        let rec parse x = function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "path"; data_type = GapiJson.Scalar },
              `String v) ->
            { x with path = v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "multipart"; data_type = GapiJson.Scalar },
              `Bool v) ->
            { x with multipart = v }
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.Simple.parse" e x
        
      end
      
      type t = {
        simple : Simple.t;
        resumable : Resumable.t;
        
      }
      
      let simple = {
        GapiLens.get = (fun x -> x.simple);
        GapiLens.set = (fun v x -> { x with simple = v });
      }
      let resumable = {
        GapiLens.get = (fun x -> x.resumable);
        GapiLens.set = (fun v x -> { x with resumable = v });
      }
      
      let empty = {
        simple = Simple.empty;
        resumable = Resumable.empty;
        
      }
      
      let rec render_content x = 
         [
          (fun v -> GapiJson.render_object "simple" (Simple.render_content v)) x.simple;
          (fun v -> GapiJson.render_object "resumable" (Resumable.render_content v)) x.resumable;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "simple"; data_type = GapiJson.Object },
            cs) ->
          GapiJson.parse_children
            Simple.parse
            Simple.empty
            (fun v -> { x with simple = v })
            cs
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "resumable"; data_type = GapiJson.Object },
            cs) ->
          GapiJson.parse_children
            Resumable.parse
            Resumable.empty
            (fun v -> { x with resumable = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiDiscoveryV1Model.Protocols.parse" e x
      
    end
    
    type t = {
      protocols : Protocols.t;
      accept : string list;
      maxSize : string;
      
    }
    
    let protocols = {
      GapiLens.get = (fun x -> x.protocols);
      GapiLens.set = (fun v x -> { x with protocols = v });
    }
    let accept = {
      GapiLens.get = (fun x -> x.accept);
      GapiLens.set = (fun v x -> { x with accept = v });
    }
    let maxSize = {
      GapiLens.get = (fun x -> x.maxSize);
      GapiLens.set = (fun v x -> { x with maxSize = v });
    }
    
    let empty = {
      protocols = Protocols.empty;
      accept = [];
      maxSize = "";
      
    }
    
    let rec render_content x = 
       [
        (fun v -> GapiJson.render_object "protocols" (Protocols.render_content v)) x.protocols;
        GapiJson.render_array "accept" (GapiJson.render_string_value "") x.accept;
        GapiJson.render_string_value "maxSize" x.maxSize;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "protocols"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          Protocols.parse
          Protocols.empty
          (fun v -> { x with protocols = v })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "accept"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                `String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiDiscoveryV1Model.MediaUpload.parse.parse_collection" e x')
          ""
          (fun v -> { x with accept = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "maxSize"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with maxSize = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.MediaUpload.parse" e x
    
  end
  
  module Request =
  struct
    type t = {
      parameterName : string;
      _ref : string;
      
    }
    
    let parameterName = {
      GapiLens.get = (fun x -> x.parameterName);
      GapiLens.set = (fun v x -> { x with parameterName = v });
    }
    let _ref = {
      GapiLens.get = (fun x -> x._ref);
      GapiLens.set = (fun v x -> { x with _ref = v });
    }
    
    let empty = {
      parameterName = "";
      _ref = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "parameterName" x.parameterName;
        GapiJson.render_string_value "$ref" x._ref;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "parameterName"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with parameterName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "$ref"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _ref = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.Request.parse" e x
    
  end
  
  module Response =
  struct
    type t = {
      _ref : string;
      
    }
    
    let _ref = {
      GapiLens.get = (fun x -> x._ref);
      GapiLens.set = (fun v x -> { x with _ref = v });
    }
    
    let empty = {
      _ref = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "$ref" x._ref;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "$ref"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _ref = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.Response.parse" e x
    
  end
  
  type t = {
    etagRequired : bool;
    description : string;
    response : Response.t;
    id : string;
    parameters : (string * JsonSchema.t) list;
    supportsSubscription : bool;
    parameterOrder : string list;
    flatPath : string;
    supportsMediaDownload : bool;
    httpMethod : string;
    request : Request.t;
    path : string;
    supportsMediaUpload : bool;
    scopes : string list;
    mediaUpload : MediaUpload.t;
    useMediaDownloadService : bool;
    
  }
  
  let etagRequired = {
    GapiLens.get = (fun x -> x.etagRequired);
    GapiLens.set = (fun v x -> { x with etagRequired = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let response = {
    GapiLens.get = (fun x -> x.response);
    GapiLens.set = (fun v x -> { x with response = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let parameters = {
    GapiLens.get = (fun x -> x.parameters);
    GapiLens.set = (fun v x -> { x with parameters = v });
  }
  let supportsSubscription = {
    GapiLens.get = (fun x -> x.supportsSubscription);
    GapiLens.set = (fun v x -> { x with supportsSubscription = v });
  }
  let parameterOrder = {
    GapiLens.get = (fun x -> x.parameterOrder);
    GapiLens.set = (fun v x -> { x with parameterOrder = v });
  }
  let flatPath = {
    GapiLens.get = (fun x -> x.flatPath);
    GapiLens.set = (fun v x -> { x with flatPath = v });
  }
  let supportsMediaDownload = {
    GapiLens.get = (fun x -> x.supportsMediaDownload);
    GapiLens.set = (fun v x -> { x with supportsMediaDownload = v });
  }
  let httpMethod = {
    GapiLens.get = (fun x -> x.httpMethod);
    GapiLens.set = (fun v x -> { x with httpMethod = v });
  }
  let request = {
    GapiLens.get = (fun x -> x.request);
    GapiLens.set = (fun v x -> { x with request = v });
  }
  let path = {
    GapiLens.get = (fun x -> x.path);
    GapiLens.set = (fun v x -> { x with path = v });
  }
  let supportsMediaUpload = {
    GapiLens.get = (fun x -> x.supportsMediaUpload);
    GapiLens.set = (fun v x -> { x with supportsMediaUpload = v });
  }
  let scopes = {
    GapiLens.get = (fun x -> x.scopes);
    GapiLens.set = (fun v x -> { x with scopes = v });
  }
  let mediaUpload = {
    GapiLens.get = (fun x -> x.mediaUpload);
    GapiLens.set = (fun v x -> { x with mediaUpload = v });
  }
  let useMediaDownloadService = {
    GapiLens.get = (fun x -> x.useMediaDownloadService);
    GapiLens.set = (fun v x -> { x with useMediaDownloadService = v });
  }
  
  let empty = {
    etagRequired = false;
    description = "";
    response = Response.empty;
    id = "";
    parameters = [];
    supportsSubscription = false;
    parameterOrder = [];
    flatPath = "";
    supportsMediaDownload = false;
    httpMethod = "";
    request = Request.empty;
    path = "";
    supportsMediaUpload = false;
    scopes = [];
    mediaUpload = MediaUpload.empty;
    useMediaDownloadService = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "etagRequired" x.etagRequired;
      GapiJson.render_string_value "description" x.description;
      (fun v -> GapiJson.render_object "response" (Response.render_content v)) x.response;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_collection "parameters" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (JsonSchema.render_content v)) v) x.parameters;
      GapiJson.render_bool_value "supportsSubscription" x.supportsSubscription;
      GapiJson.render_array "parameterOrder" (GapiJson.render_string_value "") x.parameterOrder;
      GapiJson.render_string_value "flatPath" x.flatPath;
      GapiJson.render_bool_value "supportsMediaDownload" x.supportsMediaDownload;
      GapiJson.render_string_value "httpMethod" x.httpMethod;
      (fun v -> GapiJson.render_object "request" (Request.render_content v)) x.request;
      GapiJson.render_string_value "path" x.path;
      GapiJson.render_bool_value "supportsMediaUpload" x.supportsMediaUpload;
      GapiJson.render_array "scopes" (GapiJson.render_string_value "") x.scopes;
      (fun v -> GapiJson.render_object "mediaUpload" (MediaUpload.render_content v)) x.mediaUpload;
      GapiJson.render_bool_value "useMediaDownloadService" x.useMediaDownloadService;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etagRequired"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with etagRequired = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "response"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Response.parse
        Response.empty
        (fun v -> { x with response = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parameters"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              JsonSchema.parse
              JsonSchema.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestMethod.parse.parse_dictionary" e x')
        ("", JsonSchema.empty)
        (fun v -> { x with parameters = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "supportsSubscription"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with supportsSubscription = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parameterOrder"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestMethod.parse.parse_collection" e x')
        ""
        (fun v -> { x with parameterOrder = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "flatPath"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with flatPath = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "supportsMediaDownload"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with supportsMediaDownload = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "httpMethod"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with httpMethod = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "request"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Request.parse
        Request.empty
        (fun v -> { x with request = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "path"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with path = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "supportsMediaUpload"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with supportsMediaUpload = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "scopes"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestMethod.parse.parse_collection" e x')
        ""
        (fun v -> { x with scopes = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "mediaUpload"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        MediaUpload.parse
        MediaUpload.empty
        (fun v -> { x with mediaUpload = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "useMediaDownloadService"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with useMediaDownloadService = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestMethod.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RestResource =
struct
  type t = {
    resources : (string * t) list;
    methods : (string * RestMethod.t) list;
    
  }
  
  let resources = {
    GapiLens.get = (fun x -> x.resources);
    GapiLens.set = (fun v x -> { x with resources = v });
  }
  let methods = {
    GapiLens.get = (fun x -> x.methods);
    GapiLens.set = (fun v x -> { x with methods = v });
  }
  
  let empty = {
    resources = [];
    methods = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_collection "resources" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (render_content v)) v) x.resources;
      GapiJson.render_collection "methods" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (RestMethod.render_content v)) v) x.methods;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "resources"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children parse empty (fun v -> (n, v)) cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestResource.parse.parse_dictionary" e x')
        ("", empty)
        (fun v -> { x with resources = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "methods"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RestMethod.parse
              RestMethod.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestResource.parse.parse_dictionary" e x')
        ("", RestMethod.empty)
        (fun v -> { x with methods = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestResource.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RestDescription =
struct
  module Icons =
  struct
    type t = {
      x16 : string;
      x32 : string;
      
    }
    
    let x16 = {
      GapiLens.get = (fun x -> x.x16);
      GapiLens.set = (fun v x -> { x with x16 = v });
    }
    let x32 = {
      GapiLens.get = (fun x -> x.x32);
      GapiLens.set = (fun v x -> { x with x32 = v });
    }
    
    let empty = {
      x16 = "";
      x32 = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "x16" x.x16;
        GapiJson.render_string_value "x32" x.x32;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "x16"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with x16 = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "x32"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with x32 = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.Icons.parse" e x
    
  end
  
  module Auth =
  struct
    module Oauth2 =
    struct
      module Scopes =
      struct
        type t = {
          description : string;
          
        }
        
        let description = {
          GapiLens.get = (fun x -> x.description);
          GapiLens.set = (fun v x -> { x with description = v });
        }
        
        let empty = {
          description = "";
          
        }
        
        let rec render_content x = 
           [
            GapiJson.render_string_value "description" x.description;
            
          ]
        and render x = 
          GapiJson.render_object "" (render_content x)
        
        let rec parse x = function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
              `String v) ->
            { x with description = v }
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.Scopes.parse" e x
        
      end
      
      type t = {
        scopes : (string * Scopes.t) list;
        
      }
      
      let scopes = {
        GapiLens.get = (fun x -> x.scopes);
        GapiLens.set = (fun v x -> { x with scopes = v });
      }
      
      let empty = {
        scopes = [];
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_collection "scopes" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (Scopes.render_content v)) v) x.scopes;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "scopes"; data_type = GapiJson.Object },
            cs) ->
          GapiJson.parse_collection
            (fun x' -> function
              | GapiCore.AnnotatedTree.Node
                  ({ GapiJson.name = n; data_type = GapiJson.Object },
                  cs) ->
                GapiJson.parse_children
                  Scopes.parse
                  Scopes.empty
                  (fun v -> (n, v))
                  cs
              | e ->
                GapiJson.unexpected "GapiDiscoveryV1Model.Oauth2.parse.parse_dictionary" e x')
            ("", Scopes.empty)
            (fun v -> { x with scopes = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiDiscoveryV1Model.Oauth2.parse" e x
      
    end
    
    type t = {
      oauth2 : Oauth2.t;
      
    }
    
    let oauth2 = {
      GapiLens.get = (fun x -> x.oauth2);
      GapiLens.set = (fun v x -> { x with oauth2 = v });
    }
    
    let empty = {
      oauth2 = Oauth2.empty;
      
    }
    
    let rec render_content x = 
       [
        (fun v -> GapiJson.render_object "oauth2" (Oauth2.render_content v)) x.oauth2;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "oauth2"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          Oauth2.parse
          Oauth2.empty
          (fun v -> { x with oauth2 = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.Auth.parse" e x
    
  end
  
  type t = {
    ownerName : string;
    auth : Auth.t;
    revision : string;
    documentationLink : string;
    methods : (string * RestMethod.t) list;
    packagePath : string;
    etag : string;
    name : string;
    resources : (string * RestResource.t) list;
    discoveryVersion : string;
    basePath : string;
    icons : Icons.t;
    exponentialBackoffDefault : bool;
    schemas : (string * JsonSchema.t) list;
    description : string;
    version_module : bool;
    rootUrl : string;
    labels : string list;
    version : string;
    features : string list;
    kind : string;
    title : string;
    baseUrl : string;
    parameters : (string * JsonSchema.t) list;
    batchPath : string;
    id : string;
    protocol : string;
    ownerDomain : string;
    canonicalName : string;
    servicePath : string;
    
  }
  
  let ownerName = {
    GapiLens.get = (fun x -> x.ownerName);
    GapiLens.set = (fun v x -> { x with ownerName = v });
  }
  let auth = {
    GapiLens.get = (fun x -> x.auth);
    GapiLens.set = (fun v x -> { x with auth = v });
  }
  let revision = {
    GapiLens.get = (fun x -> x.revision);
    GapiLens.set = (fun v x -> { x with revision = v });
  }
  let documentationLink = {
    GapiLens.get = (fun x -> x.documentationLink);
    GapiLens.set = (fun v x -> { x with documentationLink = v });
  }
  let methods = {
    GapiLens.get = (fun x -> x.methods);
    GapiLens.set = (fun v x -> { x with methods = v });
  }
  let packagePath = {
    GapiLens.get = (fun x -> x.packagePath);
    GapiLens.set = (fun v x -> { x with packagePath = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let resources = {
    GapiLens.get = (fun x -> x.resources);
    GapiLens.set = (fun v x -> { x with resources = v });
  }
  let discoveryVersion = {
    GapiLens.get = (fun x -> x.discoveryVersion);
    GapiLens.set = (fun v x -> { x with discoveryVersion = v });
  }
  let basePath = {
    GapiLens.get = (fun x -> x.basePath);
    GapiLens.set = (fun v x -> { x with basePath = v });
  }
  let icons = {
    GapiLens.get = (fun x -> x.icons);
    GapiLens.set = (fun v x -> { x with icons = v });
  }
  let exponentialBackoffDefault = {
    GapiLens.get = (fun x -> x.exponentialBackoffDefault);
    GapiLens.set = (fun v x -> { x with exponentialBackoffDefault = v });
  }
  let schemas = {
    GapiLens.get = (fun x -> x.schemas);
    GapiLens.set = (fun v x -> { x with schemas = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let version_module = {
    GapiLens.get = (fun x -> x.version_module);
    GapiLens.set = (fun v x -> { x with version_module = v });
  }
  let rootUrl = {
    GapiLens.get = (fun x -> x.rootUrl);
    GapiLens.set = (fun v x -> { x with rootUrl = v });
  }
  let labels = {
    GapiLens.get = (fun x -> x.labels);
    GapiLens.set = (fun v x -> { x with labels = v });
  }
  let version = {
    GapiLens.get = (fun x -> x.version);
    GapiLens.set = (fun v x -> { x with version = v });
  }
  let features = {
    GapiLens.get = (fun x -> x.features);
    GapiLens.set = (fun v x -> { x with features = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let baseUrl = {
    GapiLens.get = (fun x -> x.baseUrl);
    GapiLens.set = (fun v x -> { x with baseUrl = v });
  }
  let parameters = {
    GapiLens.get = (fun x -> x.parameters);
    GapiLens.set = (fun v x -> { x with parameters = v });
  }
  let batchPath = {
    GapiLens.get = (fun x -> x.batchPath);
    GapiLens.set = (fun v x -> { x with batchPath = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let protocol = {
    GapiLens.get = (fun x -> x.protocol);
    GapiLens.set = (fun v x -> { x with protocol = v });
  }
  let ownerDomain = {
    GapiLens.get = (fun x -> x.ownerDomain);
    GapiLens.set = (fun v x -> { x with ownerDomain = v });
  }
  let canonicalName = {
    GapiLens.get = (fun x -> x.canonicalName);
    GapiLens.set = (fun v x -> { x with canonicalName = v });
  }
  let servicePath = {
    GapiLens.get = (fun x -> x.servicePath);
    GapiLens.set = (fun v x -> { x with servicePath = v });
  }
  
  let empty = {
    ownerName = "";
    auth = Auth.empty;
    revision = "";
    documentationLink = "";
    methods = [];
    packagePath = "";
    etag = "";
    name = "";
    resources = [];
    discoveryVersion = "";
    basePath = "";
    icons = Icons.empty;
    exponentialBackoffDefault = false;
    schemas = [];
    description = "";
    version_module = false;
    rootUrl = "";
    labels = [];
    version = "";
    features = [];
    kind = "";
    title = "";
    baseUrl = "";
    parameters = [];
    batchPath = "";
    id = "";
    protocol = "";
    ownerDomain = "";
    canonicalName = "";
    servicePath = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "ownerName" x.ownerName;
      (fun v -> GapiJson.render_object "auth" (Auth.render_content v)) x.auth;
      GapiJson.render_string_value "revision" x.revision;
      GapiJson.render_string_value "documentationLink" x.documentationLink;
      GapiJson.render_collection "methods" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (RestMethod.render_content v)) v) x.methods;
      GapiJson.render_string_value "packagePath" x.packagePath;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_collection "resources" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (RestResource.render_content v)) v) x.resources;
      GapiJson.render_string_value "discoveryVersion" x.discoveryVersion;
      GapiJson.render_string_value "basePath" x.basePath;
      (fun v -> GapiJson.render_object "icons" (Icons.render_content v)) x.icons;
      GapiJson.render_bool_value "exponentialBackoffDefault" x.exponentialBackoffDefault;
      GapiJson.render_collection "schemas" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (JsonSchema.render_content v)) v) x.schemas;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_bool_value "version_module" x.version_module;
      GapiJson.render_string_value "rootUrl" x.rootUrl;
      GapiJson.render_array "labels" (GapiJson.render_string_value "") x.labels;
      GapiJson.render_string_value "version" x.version;
      GapiJson.render_array "features" (GapiJson.render_string_value "") x.features;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_string_value "baseUrl" x.baseUrl;
      GapiJson.render_collection "parameters" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (JsonSchema.render_content v)) v) x.parameters;
      GapiJson.render_string_value "batchPath" x.batchPath;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "protocol" x.protocol;
      GapiJson.render_string_value "ownerDomain" x.ownerDomain;
      GapiJson.render_string_value "canonicalName" x.canonicalName;
      GapiJson.render_string_value "servicePath" x.servicePath;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "ownerName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with ownerName = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "auth"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Auth.parse
        Auth.empty
        (fun v -> { x with auth = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "revision"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with revision = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "documentationLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with documentationLink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "methods"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RestMethod.parse
              RestMethod.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_dictionary" e x')
        ("", RestMethod.empty)
        (fun v -> { x with methods = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "packagePath"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with packagePath = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "resources"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RestResource.parse
              RestResource.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_dictionary" e x')
        ("", RestResource.empty)
        (fun v -> { x with resources = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "discoveryVersion"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with discoveryVersion = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "basePath"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with basePath = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "icons"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Icons.parse
        Icons.empty
        (fun v -> { x with icons = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "exponentialBackoffDefault"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with exponentialBackoffDefault = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "schemas"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              JsonSchema.parse
              JsonSchema.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_dictionary" e x')
        ("", JsonSchema.empty)
        (fun v -> { x with schemas = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "version_module"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with version_module = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rootUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with rootUrl = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labels"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_collection" e x')
        ""
        (fun v -> { x with labels = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "version"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with version = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "features"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_collection" e x')
        ""
        (fun v -> { x with features = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "baseUrl"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with baseUrl = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parameters"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              JsonSchema.parse
              JsonSchema.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_dictionary" e x')
        ("", JsonSchema.empty)
        (fun v -> { x with parameters = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "batchPath"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with batchPath = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "protocol"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with protocol = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "ownerDomain"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with ownerDomain = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "canonicalName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with canonicalName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "servicePath"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with servicePath = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

