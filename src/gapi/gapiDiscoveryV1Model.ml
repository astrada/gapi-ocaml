(* Warning! This file is generated. Modify at your own risk. *)

module RestMethodResponseData =
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
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "$ref"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _ref = v }
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestMethodResponseData.parse" e
  
end

module RestMethodMediaUploadProtocolsResumableData =
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
  
  let render x = 
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
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestMethodMediaUploadProtocolsResumableData.parse" e
  
end

module RestMethodMediaUploadProtocolsSimpleData =
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
  
  let render x = 
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
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestMethodMediaUploadProtocolsSimpleData.parse" e
  
end

module RestMethodMediaUploadProtocolsData =
struct
  type t = {
    resumable : RestMethodMediaUploadProtocolsResumableData.t;
    simple : RestMethodMediaUploadProtocolsSimpleData.t;
    
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
    resumable = RestMethodMediaUploadProtocolsResumableData.empty;
    simple = RestMethodMediaUploadProtocolsSimpleData.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_object "resumable" (RestMethodMediaUploadProtocolsResumableData.render_content x.resumable);
      GapiJson.render_object "simple" (RestMethodMediaUploadProtocolsSimpleData.render_content x.simple);
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "resumable"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RestMethodMediaUploadProtocolsResumableData.parse
        RestMethodMediaUploadProtocolsResumableData.empty
        (fun v -> { x with resumable = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "simple"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RestMethodMediaUploadProtocolsSimpleData.parse
        RestMethodMediaUploadProtocolsSimpleData.empty
        (fun v -> { x with simple = v })
        cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestMethodMediaUploadProtocolsData.parse" e
  
end

module RestMethodMediaUploadData =
struct
  type t = {
    accept : string list;
    maxSize : string;
    protocols : RestMethodMediaUploadProtocolsData.t;
    
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
    protocols = RestMethodMediaUploadProtocolsData.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_collection "accept" GapiJson.Array (GapiJson.render_string_value "") x.accept;
      GapiJson.render_string_value "maxSize" x.maxSize;
      GapiJson.render_object "protocols" (RestMethodMediaUploadProtocolsData.render_content x.protocols);
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "accept"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with accept = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "maxSize"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with maxSize = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "protocols"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RestMethodMediaUploadProtocolsData.parse
        RestMethodMediaUploadProtocolsData.empty
        (fun v -> { x with protocols = v })
        cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestMethodMediaUploadData.parse" e
  
end

module JsonSchema =
struct
  type t = {
    _ref : string;
    additionalProperties : t option;
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
      GapiJson.render_string_value "default" x.default;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_collection "enum" GapiJson.Array (GapiJson.render_string_value "") x.enum;
      GapiJson.render_collection "enumDescriptions" GapiJson.Array (GapiJson.render_string_value "") x.enumDescriptions;
      GapiJson.render_string_value "format" x.format;
      GapiJson.render_string_value "id" x.id;
      Option.map_default (fun v -> GapiJson.render_object "items" (render_content v)) [] x.items;
      GapiJson.render_string_value "location" x.location;
      GapiJson.render_string_value "maximum" x.maximum;
      GapiJson.render_string_value "minimum" x.minimum;
      GapiJson.render_string_value "pattern" x.pattern;
      GapiJson.render_collection "properties" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (render_content v)) x.properties;
      GapiJson.render_bool_value "repeated" x.repeated;
      GapiJson.render_bool_value "required" x.required;
      GapiJson.render_string_value "type" x._type;
      
    ]
  
  let render x = 
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
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with enum = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "enumDescriptions"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with enumDescriptions = xs })
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
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children parse empty (fun v -> (n, v)) cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.JsonSchema.parse.parse_dictionary" e)
        ("", empty)
        (fun xs -> { x with properties = xs })
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
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.JsonSchema.parse" e
  
end

module RestMethodRequestData =
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
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "$ref"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _ref = v }
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestMethodRequestData.parse" e
  
end

module RestMethod =
struct
  type t = {
    description : string;
    httpMethod : string;
    id : string;
    mediaUpload : RestMethodMediaUploadData.t;
    parameterOrder : string list;
    parameters : (string * JsonSchema.t) list;
    path : string;
    request : RestMethodRequestData.t;
    response : RestMethodResponseData.t;
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
    mediaUpload = RestMethodMediaUploadData.empty;
    parameterOrder = [];
    parameters = [];
    path = "";
    request = RestMethodRequestData.empty;
    response = RestMethodResponseData.empty;
    scopes = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "httpMethod" x.httpMethod;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_object "mediaUpload" (RestMethodMediaUploadData.render_content x.mediaUpload);
      GapiJson.render_collection "parameterOrder" GapiJson.Array (GapiJson.render_string_value "") x.parameterOrder;
      GapiJson.render_collection "parameters" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (JsonSchema.render_content v)) x.parameters;
      GapiJson.render_string_value "path" x.path;
      GapiJson.render_object "request" (RestMethodRequestData.render_content x.request);
      GapiJson.render_object "response" (RestMethodResponseData.render_content x.response);
      GapiJson.render_collection "scopes" GapiJson.Array (GapiJson.render_string_value "") x.scopes;
      
    ]
  
  let render x = 
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
        RestMethodMediaUploadData.parse
        RestMethodMediaUploadData.empty
        (fun v -> { x with mediaUpload = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parameterOrder"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with parameterOrder = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parameters"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              JsonSchema.parse
              JsonSchema.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestMethod.parse.parse_dictionary" e)
        ("", JsonSchema.empty)
        (fun xs -> { x with parameters = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "path"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with path = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "request"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RestMethodRequestData.parse
        RestMethodRequestData.empty
        (fun v -> { x with request = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "response"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RestMethodResponseData.parse
        RestMethodResponseData.empty
        (fun v -> { x with response = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "scopes"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with scopes = xs })
        cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestMethod.parse" e
  
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
      GapiJson.render_collection "methods" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (RestMethod.render_content v)) x.methods;
      GapiJson.render_collection "resources" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (render_content v)) x.resources;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "methods"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RestMethod.parse
              RestMethod.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestResource.parse.parse_dictionary" e)
        ("", RestMethod.empty)
        (fun xs -> { x with methods = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "resources"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children parse empty (fun v -> (n, v)) cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestResource.parse.parse_dictionary" e)
        ("", empty)
        (fun xs -> { x with resources = xs })
        cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestResource.parse" e
  
end

module RestDescriptionIconsData =
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
  
  let render x = 
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
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestDescriptionIconsData.parse" e
  
end

module RestDescriptionAuthOauth2ScopesData =
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
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with description = v }
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestDescriptionAuthOauth2ScopesData.parse" e
  
end

module RestDescriptionAuthOauth2Data =
struct
  type t = {
    scopes : (string * RestDescriptionAuthOauth2ScopesData.t) list;
    
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
      GapiJson.render_collection "scopes" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (RestDescriptionAuthOauth2ScopesData.render_content v)) x.scopes;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "scopes"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RestDescriptionAuthOauth2ScopesData.parse
              RestDescriptionAuthOauth2ScopesData.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescriptionAuthOauth2Data.parse.parse_dictionary" e)
        ("", RestDescriptionAuthOauth2ScopesData.empty)
        (fun xs -> { x with scopes = xs })
        cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestDescriptionAuthOauth2Data.parse" e
  
end

module RestDescriptionAuthData =
struct
  type t = {
    oauth2 : RestDescriptionAuthOauth2Data.t;
    
  }
  
  let oauth2 = {
    GapiLens.get = (fun x -> x.oauth2);
    GapiLens.set = (fun v x -> { x with oauth2 = v });
  }
  
  let empty = {
    oauth2 = RestDescriptionAuthOauth2Data.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_object "oauth2" (RestDescriptionAuthOauth2Data.render_content x.oauth2);
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "oauth2"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RestDescriptionAuthOauth2Data.parse
        RestDescriptionAuthOauth2Data.empty
        (fun v -> { x with oauth2 = v })
        cs
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.RestDescriptionAuthData.parse" e
  
end

module RestDescription =
struct
  type t = {
    auth : RestDescriptionAuthData.t;
    basePath : string;
    description : string;
    documentationLink : string;
    features : string list;
    icons : RestDescriptionIconsData.t;
    id : string;
    kind : string;
    labels : string list;
    methods : (string * RestMethod.t) list;
    name : string;
    parameters : (string * JsonSchema.t) list;
    protocol : string;
    resources : (string * RestResource.t) list;
    schemas : (string * JsonSchema.t) list;
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
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
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
  let schemas = {
    GapiLens.get = (fun x -> x.schemas);
    GapiLens.set = (fun v x -> { x with schemas = v });
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
    auth = RestDescriptionAuthData.empty;
    basePath = "";
    description = "";
    documentationLink = "";
    features = [];
    icons = RestDescriptionIconsData.empty;
    id = "";
    kind = "";
    labels = [];
    methods = [];
    name = "";
    parameters = [];
    protocol = "";
    resources = [];
    schemas = [];
    title = "";
    version = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_object "auth" (RestDescriptionAuthData.render_content x.auth);
      GapiJson.render_string_value "basePath" x.basePath;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "documentationLink" x.documentationLink;
      GapiJson.render_collection "features" GapiJson.Array (GapiJson.render_string_value "") x.features;
      GapiJson.render_object "icons" (RestDescriptionIconsData.render_content x.icons);
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_collection "labels" GapiJson.Array (GapiJson.render_string_value "") x.labels;
      GapiJson.render_collection "methods" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (RestMethod.render_content v)) x.methods;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_collection "parameters" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (JsonSchema.render_content v)) x.parameters;
      GapiJson.render_string_value "protocol" x.protocol;
      GapiJson.render_collection "resources" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (RestResource.render_content v)) x.resources;
      GapiJson.render_collection "schemas" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (JsonSchema.render_content v)) x.schemas;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_string_value "version" x.version;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "auth"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RestDescriptionAuthData.parse
        RestDescriptionAuthData.empty
        (fun v -> { x with auth = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "basePath"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with basePath = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "documentationLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with documentationLink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "features"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with features = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "icons"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RestDescriptionIconsData.parse
        RestDescriptionIconsData.empty
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
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with labels = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "methods"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RestMethod.parse
              RestMethod.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_dictionary" e)
        ("", RestMethod.empty)
        (fun xs -> { x with methods = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parameters"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              JsonSchema.parse
              JsonSchema.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_dictionary" e)
        ("", JsonSchema.empty)
        (fun xs -> { x with parameters = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "protocol"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with protocol = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "resources"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              RestResource.parse
              RestResource.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_dictionary" e)
        ("", RestResource.empty)
        (fun xs -> { x with resources = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "schemas"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              JsonSchema.parse
              JsonSchema.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse.parse_dictionary" e)
        ("", JsonSchema.empty)
        (fun xs -> { x with schemas = xs })
        cs
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
      GapiJson.unexpected "GapiDiscoveryV1Model.RestDescription.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DirectoryListItemsIconsData =
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
  
  let render x = 
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
    | e ->
      GapiJson.unexpected "GapiDiscoveryV1Model.DirectoryListItemsIconsData.parse" e
  
end

module DirectoryListItemsData =
struct
  type t = {
    description : string;
    discoveryLink : string;
    documentationLink : string;
    icons : DirectoryListItemsIconsData.t;
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
    documentationLink = "";
    icons = DirectoryListItemsIconsData.empty;
    id = "";
    kind = "";
    labels = [];
    name = "";
    preferred = false;
    title = "";
    version = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "discoveryLink" x.discoveryLink;
      GapiJson.render_string_value "documentationLink" x.documentationLink;
      GapiJson.render_object "icons" (DirectoryListItemsIconsData.render_content x.icons);
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_collection "labels" GapiJson.Array (GapiJson.render_string_value "") x.labels;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_bool_value "preferred" x.preferred;
      GapiJson.render_string_value "title" x.title;
      GapiJson.render_string_value "version" x.version;
      
    ]
  
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
        ({ GapiJson.name = "documentationLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with documentationLink = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "icons"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        DirectoryListItemsIconsData.parse
        DirectoryListItemsIconsData.empty
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
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with labels = xs })
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
      GapiJson.unexpected "GapiDiscoveryV1Model.DirectoryListItemsData.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module DirectoryList =
struct
  type t = {
    items : DirectoryListItemsData.t list;
    kind : string;
    
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
    items = [];
    kind = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_array "items" DirectoryListItemsData.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        DirectoryListItemsData.parse
        DirectoryListItemsData.empty
        (fun xs -> { x with items = xs })
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
      GapiJson.unexpected "GapiDiscoveryV1Model.DirectoryList.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

