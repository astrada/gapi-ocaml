(* Warning! This file is generated. Modify at your own risk. *)

module JsonSchema =
struct
  module AnnotationsData =
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
                Json_type.String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiDiscoveryV1Model.AnnotationsData.parse.parse_collection" e x')
          ""
          (fun v -> { x with required = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.AnnotationsData.parse" e x
    
  end
  
  type t = {
    _ref : string;
    additionalProperties : t option;
    annotations : AnnotationsData.t;
    default : string;
    description : string;
    enum : string list;
    enumDescriptions : string list;
    format : string;
    id : string;
    items : t option;
    location : string;
    maximum : string;
    minimum : string;
    pattern : string;
    properties : (string * t) list;
    repeated : bool;
    required : bool;
    _type : string;
    
  }
  
  let _ref = {
    GapiLens.get = (fun x -> x._ref);
    GapiLens.set = (fun v x -> { x with _ref = v });
  }
  let additionalProperties = {
    GapiLens.get = (fun x -> x.additionalProperties);
    GapiLens.set = (fun v x -> { x with additionalProperties = v });
  }
  let annotations = {
    GapiLens.get = (fun x -> x.annotations);
    GapiLens.set = (fun v x -> { x with annotations = v });
  }
  let default = {
    GapiLens.get = (fun x -> x.default);
    GapiLens.set = (fun v x -> { x with default = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let enum = {
    GapiLens.get = (fun x -> x.enum);
    GapiLens.set = (fun v x -> { x with enum = v });
  }
  let enumDescriptions = {
    GapiLens.get = (fun x -> x.enumDescriptions);
    GapiLens.set = (fun v x -> { x with enumDescriptions = v });
  }
  let format = {
    GapiLens.get = (fun x -> x.format);
    GapiLens.set = (fun v x -> { x with format = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let location = {
    GapiLens.get = (fun x -> x.location);
    GapiLens.set = (fun v x -> { x with location = v });
  }
  let maximum = {
    GapiLens.get = (fun x -> x.maximum);
    GapiLens.set = (fun v x -> { x with maximum = v });
  }
  let minimum = {
    GapiLens.get = (fun x -> x.minimum);
    GapiLens.set = (fun v x -> { x with minimum = v });
  }
  let pattern = {
    GapiLens.get = (fun x -> x.pattern);
    GapiLens.set = (fun v x -> { x with pattern = v });
  }
  let properties = {
    GapiLens.get = (fun x -> x.properties);
    GapiLens.set = (fun v x -> { x with properties = v });
  }
  let repeated = {
    GapiLens.get = (fun x -> x.repeated);
    GapiLens.set = (fun v x -> { x with repeated = v });
  }
  let required = {
    GapiLens.get = (fun x -> x.required);
    GapiLens.set = (fun v x -> { x with required = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    _ref = "";
    additionalProperties = None;
    annotations = AnnotationsData.empty;
    default = "";
    description = "";
    enum = [];
    enumDescriptions = [];
    format = "";
    id = "";
    items = None;
    location = "";
    maximum = "";
    minimum = "";
    pattern = "";
    properties = [];
    repeated = false;
    required = false;
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "$ref" x._ref;
      Option.map_default (fun v -> GapiJson.render_object "additionalProperties" (render_content v)) [] x.additionalProperties;
      (fun v -> GapiJson.render_object "annotations" (AnnotationsData.render_content v)) x.annotations;
      GapiJson.render_string_value "default" x.default;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_array "enum" (GapiJson.render_string_value "") x.enum;
      GapiJson.render_array "enumDescriptions" (GapiJson.render_string_value "") x.enumDescriptions;
      GapiJson.render_string_value "format" x.format;
      GapiJson.render_string_value "id" x.id;
      Option.map_default (fun v -> GapiJson.render_object "items" (render_content v)) [] x.items;
      GapiJson.render_string_value "location" x.location;
      GapiJson.render_string_value "maximum" x.maximum;
      GapiJson.render_string_value "minimum" x.minimum;
      GapiJson.render_string_value "pattern" x.pattern;
      GapiJson.render_collection "properties" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (render_content v)) v) x.properties;
      GapiJson.render_bool_value "repeated" x.repeated;
      GapiJson.render_bool_value "required" x.required;
      GapiJson.render_string_value "type" x._type;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "$ref"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _ref = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "additionalProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        parse
        empty
        (fun v -> { x with additionalProperties = Some v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "annotations"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AnnotationsData.parse
        AnnotationsData.empty
        (fun v -> { x with annotations = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "default"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with default = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "enum"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              Json_type.String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.JsonSchema.parse.parse_collection" e x')
        ""
        (fun v -> { x with enum = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "enumDescriptions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              Json_type.String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.JsonSchema.parse.parse_collection" e x')
        ""
        (fun v -> { x with enumDescriptions = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "format"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with format = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        parse
        empty
        (fun v -> { x with items = Some v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "location"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with location = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "maximum"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with maximum = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "minimum"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with minimum = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pattern"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with pattern = v }
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "repeated"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with repeated = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "required"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with required = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.JsonSchema.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module RestMethod =
struct
  module ResponseData =
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
          Json_type.String v) ->
        { x with _ref = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.ResponseData.parse" e x
    
  end
  
  module RequestData =
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
          Json_type.String v) ->
        { x with _ref = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.RequestData.parse" e x
    
  end
  
  module MediaUploadData =
  struct
    module ProtocolsData =
    struct
      module SimpleData =
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
              Json_type.Bool v) ->
            { x with multipart = v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "path"; data_type = GapiJson.Scalar },
              Json_type.String v) ->
            { x with path = v }
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.SimpleData.parse" e x
        
      end
      
      module ResumableData =
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
              Json_type.Bool v) ->
            { x with multipart = v }
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = "path"; data_type = GapiJson.Scalar },
              Json_type.String v) ->
            { x with path = v }
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.ResumableData.parse" e x
        
      end
      
      type t = {
        resumable : ResumableData.t;
        simple : SimpleData.t;
        
      }
      
      let resumable = {
        GapiLens.get = (fun x -> x.resumable);
        GapiLens.set = (fun v x -> { x with resumable = v });
      }
      let simple = {
        GapiLens.get = (fun x -> x.simple);
        GapiLens.set = (fun v x -> { x with simple = v });
      }
      
      let empty = {
        resumable = ResumableData.empty;
        simple = SimpleData.empty;
        
      }
      
      let rec render_content x = 
         [
          (fun v -> GapiJson.render_object "resumable" (ResumableData.render_content v)) x.resumable;
          (fun v -> GapiJson.render_object "simple" (SimpleData.render_content v)) x.simple;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "resumable"; data_type = GapiJson.Object },
            cs) ->
          GapiJson.parse_children
            ResumableData.parse
            ResumableData.empty
            (fun v -> { x with resumable = v })
            cs
        | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = "simple"; data_type = GapiJson.Object },
            cs) ->
          GapiJson.parse_children
            SimpleData.parse
            SimpleData.empty
            (fun v -> { x with simple = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiDiscoveryV1Model.ProtocolsData.parse" e x
      
    end
    
    type t = {
      accept : string list;
      maxSize : string;
      protocols : ProtocolsData.t;
      
    }
    
    let accept = {
      GapiLens.get = (fun x -> x.accept);
      GapiLens.set = (fun v x -> { x with accept = v });
    }
    let maxSize = {
      GapiLens.get = (fun x -> x.maxSize);
      GapiLens.set = (fun v x -> { x with maxSize = v });
    }
    let protocols = {
      GapiLens.get = (fun x -> x.protocols);
      GapiLens.set = (fun v x -> { x with protocols = v });
    }
    
    let empty = {
      accept = [];
      maxSize = "";
      protocols = ProtocolsData.empty;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "accept" (GapiJson.render_string_value "") x.accept;
        GapiJson.render_string_value "maxSize" x.maxSize;
        (fun v -> GapiJson.render_object "protocols" (ProtocolsData.render_content v)) x.protocols;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "accept"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                Json_type.String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiDiscoveryV1Model.MediaUploadData.parse.parse_collection" e x')
          ""
          (fun v -> { x with accept = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "maxSize"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with maxSize = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "protocols"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          ProtocolsData.parse
          ProtocolsData.empty
          (fun v -> { x with protocols = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.MediaUploadData.parse" e x
    
  end
  
  type t = {
    description : string;
    httpMethod : string;
    id : string;
    mediaUpload : MediaUploadData.t;
    parameterOrder : string list;
    parameters : (string * JsonSchema.t) list;
    path : string;
    request : RequestData.t;
    response : ResponseData.t;
    scopes : string list;
    
  }
  
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let httpMethod = {
    GapiLens.get = (fun x -> x.httpMethod);
    GapiLens.set = (fun v x -> { x with httpMethod = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let mediaUpload = {
    GapiLens.get = (fun x -> x.mediaUpload);
    GapiLens.set = (fun v x -> { x with mediaUpload = v });
  }
  let parameterOrder = {
    GapiLens.get = (fun x -> x.parameterOrder);
    GapiLens.set = (fun v x -> { x with parameterOrder = v });
  }
  let parameters = {
    GapiLens.get = (fun x -> x.parameters);
    GapiLens.set = (fun v x -> { x with parameters = v });
  }
  let path = {
    GapiLens.get = (fun x -> x.path);
    GapiLens.set = (fun v x -> { x with path = v });
  }
  let request = {
    GapiLens.get = (fun x -> x.request);
    GapiLens.set = (fun v x -> { x with request = v });
  }
  let response = {
    GapiLens.get = (fun x -> x.response);
    GapiLens.set = (fun v x -> { x with response = v });
  }
  let scopes = {
    GapiLens.get = (fun x -> x.scopes);
    GapiLens.set = (fun v x -> { x with scopes = v });
  }
  
  let empty = {
    description = "";
    httpMethod = "";
    id = "";
    mediaUpload = MediaUploadData.empty;
    parameterOrder = [];
    parameters = [];
    path = "";
    request = RequestData.empty;
    response = ResponseData.empty;
    scopes = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "httpMethod" x.httpMethod;
      GapiJson.render_string_value "id" x.id;
      (fun v -> GapiJson.render_object "mediaUpload" (MediaUploadData.render_content v)) x.mediaUpload;
      GapiJson.render_array "parameterOrder" (GapiJson.render_string_value "") x.parameterOrder;
      GapiJson.render_collection "parameters" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (JsonSchema.render_content v)) v) x.parameters;
      GapiJson.render_string_value "path" x.path;
      (fun v -> GapiJson.render_object "request" (RequestData.render_content v)) x.request;
      (fun v -> GapiJson.render_object "response" (ResponseData.render_content v)) x.response;
      GapiJson.render_array "scopes" (GapiJson.render_string_value "") x.scopes;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "httpMethod"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with httpMethod = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "mediaUpload"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        MediaUploadData.parse
        MediaUploadData.empty
        (fun v -> { x with mediaUpload = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parameterOrder"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              Json_type.String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestMethod.parse.parse_collection" e x')
        ""
        (fun v -> { x with parameterOrder = v })
        cs
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
        ({ GapiJson.name = "path"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with path = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "request"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RequestData.parse
        RequestData.empty
        (fun v -> { x with request = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "response"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ResponseData.parse
        ResponseData.empty
        (fun v -> { x with response = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "scopes"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              Json_type.String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestMethod.parse.parse_collection" e x')
        ""
        (fun v -> { x with scopes = v })
        cs
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
    methods : (string * RestMethod.t) list;
    resources : (string * t) list;
    
  }
  
  let methods = {
    GapiLens.get = (fun x -> x.methods);
    GapiLens.set = (fun v x -> { x with methods = v });
  }
  let resources = {
    GapiLens.get = (fun x -> x.resources);
    GapiLens.set = (fun v x -> { x with resources = v });
  }
  
  let empty = {
    methods = [];
    resources = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_collection "methods" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (RestMethod.render_content v)) v) x.methods;
      GapiJson.render_collection "resources" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (render_content v)) v) x.resources;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
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
  module IconsData =
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
          Json_type.String v) ->
        { x with x16 = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "x32"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with x32 = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.IconsData.parse" e x
    
  end
  
  module AuthData =
  struct
    module Oauth2Data =
    struct
      module ScopesData =
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
              Json_type.String v) ->
            { x with description = v }
          | GapiCore.AnnotatedTree.Node
            ({ GapiJson.name = ""; data_type = GapiJson.Object },
            cs) ->
            GapiJson.parse_children parse empty (fun x -> x) cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.ScopesData.parse" e x
        
      end
      
      type t = {
        scopes : (string * ScopesData.t) list;
        
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
          GapiJson.render_collection "scopes" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (ScopesData.render_content v)) v) x.scopes;
          
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
                  ScopesData.parse
                  ScopesData.empty
                  (fun v -> (n, v))
                  cs
              | e ->
                GapiJson.unexpected "GapiDiscoveryV1Model.Oauth2Data.parse.parse_dictionary" e x')
            ("", ScopesData.empty)
            (fun v -> { x with scopes = v })
            cs
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiDiscoveryV1Model.Oauth2Data.parse" e x
      
    end
    
    type t = {
      oauth2 : Oauth2Data.t;
      
    }
    
    let oauth2 = {
      GapiLens.get = (fun x -> x.oauth2);
      GapiLens.set = (fun v x -> { x with oauth2 = v });
    }
    
    let empty = {
      oauth2 = Oauth2Data.empty;
      
    }
    
    let rec render_content x = 
       [
        (fun v -> GapiJson.render_object "oauth2" (Oauth2Data.render_content v)) x.oauth2;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "oauth2"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          Oauth2Data.parse
          Oauth2Data.empty
          (fun v -> { x with oauth2 = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.AuthData.parse" e x
    
  end
  
  type t = {
    auth : AuthData.t;
    basePath : string;
    baseUrl : string;
    batchPath : string;
    description : string;
    discoveryVersion : string;
    documentationLink : string;
    features : string list;
    icons : IconsData.t;
    id : string;
    kind : string;
    labels : string list;
    methods : (string * RestMethod.t) list;
    name : string;
    parameters : (string * JsonSchema.t) list;
    protocol : string;
    resources : (string * RestResource.t) list;
    revision : string;
    rootUrl : string;
    schemas : (string * JsonSchema.t) list;
    servicePath : string;
    title : string;
    version : string;
    
  }
  
  let auth = {
    GapiLens.get = (fun x -> x.auth);
    GapiLens.set = (fun v x -> { x with auth = v });
  }
  let basePath = {
    GapiLens.get = (fun x -> x.basePath);
    GapiLens.set = (fun v x -> { x with basePath = v });
  }
  let baseUrl = {
    GapiLens.get = (fun x -> x.baseUrl);
    GapiLens.set = (fun v x -> { x with baseUrl = v });
  }
  let batchPath = {
    GapiLens.get = (fun x -> x.batchPath);
    GapiLens.set = (fun v x -> { x with batchPath = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let discoveryVersion = {
    GapiLens.get = (fun x -> x.discoveryVersion);
    GapiLens.set = (fun v x -> { x with discoveryVersion = v });
  }
  let documentationLink = {
    GapiLens.get = (fun x -> x.documentationLink);
    GapiLens.set = (fun v x -> { x with documentationLink = v });
  }
  let features = {
    GapiLens.get = (fun x -> x.features);
    GapiLens.set = (fun v x -> { x with features = v });
  }
  let icons = {
    GapiLens.get = (fun x -> x.icons);
    GapiLens.set = (fun v x -> { x with icons = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let labels = {
    GapiLens.get = (fun x -> x.labels);
    GapiLens.set = (fun v x -> { x with labels = v });
  }
  let methods = {
    GapiLens.get = (fun x -> x.methods);
    GapiLens.set = (fun v x -> { x with methods = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let parameters = {
    GapiLens.get = (fun x -> x.parameters);
    GapiLens.set = (fun v x -> { x with parameters = v });
  }
  let protocol = {
    GapiLens.get = (fun x -> x.protocol);
    GapiLens.set = (fun v x -> { x with protocol = v });
  }
  let resources = {
    GapiLens.get = (fun x -> x.resources);
    GapiLens.set = (fun v x -> { x with resources = v });
  }
  let revision = {
    GapiLens.get = (fun x -> x.revision);
    GapiLens.set = (fun v x -> { x with revision = v });
  }
  let rootUrl = {
    GapiLens.get = (fun x -> x.rootUrl);
    GapiLens.set = (fun v x -> { x with rootUrl = v });
  }
  let schemas = {
    GapiLens.get = (fun x -> x.schemas);
    GapiLens.set = (fun v x -> { x with schemas = v });
  }
  let servicePath = {
    GapiLens.get = (fun x -> x.servicePath);
    GapiLens.set = (fun v x -> { x with servicePath = v });
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v });
  }
  let version = {
    GapiLens.get = (fun x -> x.version);
    GapiLens.set = (fun v x -> { x with version = v });
  }
  
  let empty = {
    auth = AuthData.empty;
    basePath = "";
    baseUrl = "";
    batchPath = "";
    description = "";
    discoveryVersion = "";
    documentationLink = "";
    features = [];
    icons = IconsData.empty;
    id = "";
    kind = "";
    labels = [];
    methods = [];
    name = "";
    parameters = [];
    protocol = "";
    resources = [];
    revision = "";
    rootUrl = "";
    schemas = [];
    servicePath = "";
    title = "";
    version = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "auth" (AuthData.render_content v)) x.auth;
      GapiJson.render_string_value "basePath" x.basePath;
      GapiJson.render_string_value "baseUrl" x.baseUrl;
      GapiJson.render_string_value "batchPath" x.batchPath;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "discoveryVersion" x.discoveryVersion;
      GapiJson.render_string_value "documentationLink" x.documentationLink;
      GapiJson.render_array "features" (GapiJson.render_string_value "") x.features;
      (fun v -> GapiJson.render_object "icons" (IconsData.render_content v)) x.icons;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_array "labels" (GapiJson.render_string_value "") x.labels;
      GapiJson.render_collection "methods" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (RestMethod.render_content v)) v) x.methods;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_collection "parameters" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (JsonSchema.render_content v)) v) x.parameters;
      GapiJson.render_string_value "protocol" x.protocol;
      GapiJson.render_collection "resources" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (RestResource.render_content v)) v) x.resources;
      GapiJson.render_string_value "revision" x.revision;
      GapiJson.render_string_value "rootUrl" x.rootUrl;
      GapiJson.render_collection "schemas" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (JsonSchema.render_content v)) v) x.schemas;
      GapiJson.render_string_value "servicePath" x.servicePath;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_string_value "version" x.version;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "auth"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        AuthData.parse
        AuthData.empty
        (fun v -> { x with auth = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "basePath"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with basePath = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "baseUrl"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with baseUrl = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "batchPath"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with batchPath = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "discoveryVersion"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with discoveryVersion = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "documentationLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with documentationLink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "features"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              Json_type.String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_collection" e x')
        ""
        (fun v -> { x with features = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "icons"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        IconsData.parse
        IconsData.empty
        (fun v -> { x with icons = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labels"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              Json_type.String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_collection" e x')
        ""
        (fun v -> { x with labels = v })
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
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_dictionary" e x')
        ("", RestMethod.empty)
        (fun v -> { x with methods = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with name = v }
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
        ({ GapiJson.name = "protocol"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with protocol = v }
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
        ({ GapiJson.name = "revision"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with revision = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "rootUrl"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with rootUrl = v }
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
        ({ GapiJson.name = "servicePath"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with servicePath = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with title = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "version"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with version = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DirectoryList =
struct
  module ItemsData =
  struct
    module IconsData =
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
            Json_type.String v) ->
          { x with x16 = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "x32"; data_type = GapiJson.Scalar },
            Json_type.String v) ->
          { x with x32 = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiDiscoveryV1Model.IconsData.parse" e x
      
    end
    
    type t = {
      description : string;
      discoveryLink : string;
      discoveryRestUrl : string;
      documentationLink : string;
      icons : IconsData.t;
      id : string;
      kind : string;
      labels : string list;
      name : string;
      preferred : bool;
      title : string;
      version : string;
      
    }
    
    let description = {
      GapiLens.get = (fun x -> x.description);
      GapiLens.set = (fun v x -> { x with description = v });
    }
    let discoveryLink = {
      GapiLens.get = (fun x -> x.discoveryLink);
      GapiLens.set = (fun v x -> { x with discoveryLink = v });
    }
    let discoveryRestUrl = {
      GapiLens.get = (fun x -> x.discoveryRestUrl);
      GapiLens.set = (fun v x -> { x with discoveryRestUrl = v });
    }
    let documentationLink = {
      GapiLens.get = (fun x -> x.documentationLink);
      GapiLens.set = (fun v x -> { x with documentationLink = v });
    }
    let icons = {
      GapiLens.get = (fun x -> x.icons);
      GapiLens.set = (fun v x -> { x with icons = v });
    }
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    let kind = {
      GapiLens.get = (fun x -> x.kind);
      GapiLens.set = (fun v x -> { x with kind = v });
    }
    let labels = {
      GapiLens.get = (fun x -> x.labels);
      GapiLens.set = (fun v x -> { x with labels = v });
    }
    let name = {
      GapiLens.get = (fun x -> x.name);
      GapiLens.set = (fun v x -> { x with name = v });
    }
    let preferred = {
      GapiLens.get = (fun x -> x.preferred);
      GapiLens.set = (fun v x -> { x with preferred = v });
    }
    let title = {
      GapiLens.get = (fun x -> x.title);
      GapiLens.set = (fun v x -> { x with title = v });
    }
    let version = {
      GapiLens.get = (fun x -> x.version);
      GapiLens.set = (fun v x -> { x with version = v });
    }
    
    let empty = {
      description = "";
      discoveryLink = "";
      discoveryRestUrl = "";
      documentationLink = "";
      icons = IconsData.empty;
      id = "";
      kind = "";
      labels = [];
      name = "";
      preferred = false;
      title = "";
      version = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "description" x.description;
        GapiJson.render_string_value "discoveryLink" x.discoveryLink;
        GapiJson.render_string_value "discoveryRestUrl" x.discoveryRestUrl;
        GapiJson.render_string_value "documentationLink" x.documentationLink;
        (fun v -> GapiJson.render_object "icons" (IconsData.render_content v)) x.icons;
        GapiJson.render_string_value "id" x.id;
        GapiJson.render_string_value "kind" x.kind;
        GapiJson.render_array "labels" (GapiJson.render_string_value "") x.labels;
        GapiJson.render_string_value "name" x.name;
        GapiJson.render_bool_value "preferred" x.preferred;
        GapiJson.render_string_value "title" x.title;
        GapiJson.render_string_value "version" x.version;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with description = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "discoveryLink"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with discoveryLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "discoveryRestUrl"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with discoveryRestUrl = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "documentationLink"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with documentationLink = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "icons"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          IconsData.parse
          IconsData.empty
          (fun v -> { x with icons = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with kind = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "labels"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
                Json_type.String v) ->
              v
            | e ->
              GapiJson.unexpected "GapiDiscoveryV1Model.ItemsData.parse.parse_collection" e x')
          ""
          (fun v -> { x with labels = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with name = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "preferred"; data_type = GapiJson.Scalar },
          Json_type.Bool v) ->
        { x with preferred = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with title = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "version"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with version = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiDiscoveryV1Model.ItemsData.parse" e x
    
  end
  
  type t = {
    discoveryVersion : string;
    items : ItemsData.t list;
    kind : string;
    
  }
  
  let discoveryVersion = {
    GapiLens.get = (fun x -> x.discoveryVersion);
    GapiLens.set = (fun v x -> { x with discoveryVersion = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    discoveryVersion = "";
    items = [];
    kind = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "discoveryVersion" x.discoveryVersion;
      GapiJson.render_array "items" ItemsData.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "discoveryVersion"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with discoveryVersion = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ItemsData.parse
              ItemsData.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.DirectoryList.parse.parse_collection" e x')
        ItemsData.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.DirectoryList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

