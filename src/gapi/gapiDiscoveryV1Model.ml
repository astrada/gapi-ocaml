open GapiUtils.Infix
open GapiCore
open GapiJson

module IconsData =
struct
  type t = {
    x16 : string;
    x32 : string
  }

	let x16 = {
		GapiLens.get = (fun x -> x.x16);
		GapiLens.set = (fun v x -> { x with x16 = v })
	}
	let x32 = {
		GapiLens.get = (fun x -> x.x32);
		GapiLens.set = (fun v x -> { x with x32 = v })
	}

  let empty = {
    x16 = "";
    x32 = ""
  }

  let render x =
    [render_string_value "x16" x.x16;
     render_string_value "x32" x.x32]

  let parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ GapiJson.name = "x16"; data_type = Scalar },
           Json_type.String v) ->
          { x with x16 = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "x32"; data_type = Scalar },
           Json_type.String v) ->
          { x with x32 = v }
      | e ->
          unexpected "GapiDiscovery.IconsData.parse" e

end

module ItemsData =
struct
  type t = {
    kind : string;
    id : string;
    name : string;
    version : string;
    title : string;
    description : string;
    discoveryLink : string;
    icons : IconsData.t;
    documentationLink : string;
    labels : string list;
    preferred : bool
  }

	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let name = {
		GapiLens.get = (fun x -> x.name);
		GapiLens.set = (fun v x -> { x with name = v })
	}
	let version = {
		GapiLens.get = (fun x -> x.version);
		GapiLens.set = (fun v x -> { x with version = v })
	}
	let title = {
		GapiLens.get = (fun x -> x.title);
		GapiLens.set = (fun v x -> { x with title = v })
	}
	let description = {
		GapiLens.get = (fun x -> x.description);
		GapiLens.set = (fun v x -> { x with description = v })
	}
	let discoveryLink = {
		GapiLens.get = (fun x -> x.discoveryLink);
		GapiLens.set = (fun v x -> { x with discoveryLink = v })
	}
	let icons = {
		GapiLens.get = (fun x -> x.icons);
		GapiLens.set = (fun v x -> { x with icons = v })
	}
	let documentationLink = {
		GapiLens.get = (fun x -> x.documentationLink);
		GapiLens.set = (fun v x -> { x with documentationLink = v })
	}
	let labels = {
		GapiLens.get = (fun x -> x.labels);
		GapiLens.set = (fun v x -> { x with labels = v })
	}
	let preferred = {
		GapiLens.get = (fun x -> x.preferred);
		GapiLens.set = (fun v x -> { x with preferred = v })
	}

  let empty = {
    kind = "";
    id = "";
    name = "";
    version = "";
    title = "";
    description = "";
    discoveryLink = "";
    icons = IconsData.empty;
    documentationLink = "";
    labels = [];
    preferred = false
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "id" x.id;
       render_string_value "name" x.name;
       render_string_value "version" x.version;
       render_string_value "title" x.title;
       render_string_value "description" x.description;
       render_string_value "discoveryLink" x.discoveryLink;
       render_object "icons" (IconsData.render x.icons);
       render_string_value "documentationLink" x.documentationLink;
       render_array "labels" (render_string_value "") x.labels;
       render_bool_value "preferred" x.preferred]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ GapiJson.name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "name"; data_type = Scalar },
           Json_type.String v) ->
          { x with name = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "version"; data_type = Scalar },
           Json_type.String v) ->
          { x with version = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "title"; data_type = Scalar },
           Json_type.String v) ->
          { x with title = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "description"; data_type = Scalar },
           Json_type.String v) ->
          { x with description = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "discoveryLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with discoveryLink = v }
      | AnnotatedTree.Node
          ({ GapiJson.name = "icons"; data_type = Object },
           cs) ->
          parse_children
            IconsData.parse
            IconsData.empty
            (fun v -> { x with icons = v })
            cs
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "documentationLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with documentationLink = v }
      | AnnotatedTree.Node
          ({ GapiJson.name = "labels"; data_type = Array },
           cs) ->
          parse_collection
            parse_string_element
            ""
            (fun xs -> { x with labels = xs })
            cs
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "preferred"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with preferred = v }
      | AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiDiscovery.ItemsData.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module DirectoryList =
struct
  type t = {
    kind : string;
    items : ItemsData.t list
  }

	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let items = {
		GapiLens.get = (fun x -> x.items);
		GapiLens.set = (fun v x -> { x with items = v })
	}

  let empty = {
    kind = "";
    items = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_array "items" ItemsData.render x.items]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_collection
            ItemsData.parse
            ItemsData.empty
            (fun xs -> { x with items = xs })
            cs
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiDiscovery.DirectoryList.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module ScopesData =
struct
  type t = {
    description : string
  }

	let description = {
		GapiLens.get = (fun x -> x.description);
		GapiLens.set = (fun v x -> { description = v })
	}

  let empty = {
    description = ""
  }

  let render x =
    [render_string_value "description" x.description]

  let parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ GapiJson.name = "description"; data_type = Scalar },
           Json_type.String v) ->
          { description = v }
      | e ->
          unexpected "GapiDiscovery.ScopesData.parse" e

end

module Oauth2Data =
struct
  type t = {
    scopes : (string * ScopesData.t) list
  }

  let scopes = {
    GapiLens.get = (fun x -> x.scopes);
    GapiLens.set = (fun v x -> { scopes = v })
  }

  let empty = {
    scopes = []
  }

  let render x =
    [render_object "oauth2"
       [render_collection "scopes" Object (fun (id, v) -> render_object id (ScopesData.render v)) x.scopes]]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Node
          ({ GapiJson.name = "scopes"; data_type = Object },
           cs) ->
          parse_collection
            (fun _ -> function
                 AnnotatedTree.Node
                   ({ name = n; data_type = Object },
                    cs) ->
                   parse_children
                     ScopesData.parse
                     ScopesData.empty
                     (fun v -> (n, v))
                     cs
               | e ->
                   unexpected "GapiDiscovery.Oauth2Data.parse.parse_scopes" e)
            ("", ScopesData.empty)
            (fun xs -> { scopes = xs })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = "oauth2"; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiDiscovery.Oauth2Data.parse" e

end

module JsonSchema =
struct
  type t = {
    id : string;
    _type : string;
    _ref : string;
    description : string;
    default : string;
    required : bool;
    format : string;
    pattern : string;
    minimum : string;
    maximum : string;
    enum : string list;
    enumDescriptions : string list;
    repeated : bool;
    location : string;
    properties : (string * t) list;
    additionalProperties : t option;
    items : t option
  }

	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let _type = {
		GapiLens.get = (fun x -> x._type);
		GapiLens.set = (fun v x -> { x with _type = v })
	}
	let _ref = {
		GapiLens.get = (fun x -> x._ref);
		GapiLens.set = (fun v x -> { x with _ref = v })
	}
	let description = {
		GapiLens.get = (fun x -> x.description);
		GapiLens.set = (fun v x -> { x with description = v })
	}
	let default = {
		GapiLens.get = (fun x -> x.default);
		GapiLens.set = (fun v x -> { x with default = v })
	}
	let required = {
		GapiLens.get = (fun x -> x.required);
		GapiLens.set = (fun v x -> { x with required = v })
	}
	let format = {
		GapiLens.get = (fun x -> x.format);
		GapiLens.set = (fun v x -> { x with format = v })
	}
	let pattern = {
		GapiLens.get = (fun x -> x.pattern);
		GapiLens.set = (fun v x -> { x with pattern = v })
	}
	let minimum = {
		GapiLens.get = (fun x -> x.minimum);
		GapiLens.set = (fun v x -> { x with minimum = v })
	}
	let maximum = {
		GapiLens.get = (fun x -> x.maximum);
		GapiLens.set = (fun v x -> { x with maximum = v })
	}
	let enum = {
		GapiLens.get = (fun x -> x.enum);
		GapiLens.set = (fun v x -> { x with enum = v })
	}
	let enumDescriptions = {
		GapiLens.get = (fun x -> x.enumDescriptions);
		GapiLens.set = (fun v x -> { x with enumDescriptions = v })
	}
	let repeated = {
		GapiLens.get = (fun x -> x.repeated);
		GapiLens.set = (fun v x -> { x with repeated = v })
	}
	let location = {
		GapiLens.get = (fun x -> x.location);
		GapiLens.set = (fun v x -> { x with location = v })
	}
	let properties = {
		GapiLens.get = (fun x -> x.properties);
		GapiLens.set = (fun v x -> { x with properties = v })
	}
	let additionalProperties = {
		GapiLens.get = (fun x -> x.additionalProperties);
		GapiLens.set = (fun v x -> { x with additionalProperties = v })
	}
	let items = {
		GapiLens.get = (fun x -> x.items);
		GapiLens.set = (fun v x -> { x with items = v })
	}

  let empty = {
    id = "";
    _type = "";
    _ref = "";
    description = "";
    default = "";
    required = false;
    format = "";
    pattern = "";
    minimum = "";
    maximum = "";
    enum = [];
    enumDescriptions = [];
    repeated = false;
    location = "";
    properties = [];
    additionalProperties = None;
    items = None
  }

  let rec render x =
    [render_string_value "id" x.id;
     render_string_value "type" x._type;
     render_string_value "$ref" x._ref;
     render_string_value "description" x.description;
     render_string_value "default" x.default;
     render_bool_value "required" x.required;
     render_string_value "format" x.format;
     render_string_value "pattern" x.pattern;
     render_string_value "minimum" x.minimum;
     render_string_value "maximum" x.maximum;
     render_array "enum" (render_string_value "") x.enum;
     render_array "enumDescriptions" (render_string_value "") x.enumDescriptions;
     render_bool_value "repeated" x.repeated;
     render_string_value "location" x.location;
     render_collection "properties" Object (fun (id, v) -> render_object id (render v)) x.properties;
     Option.map_default (fun p -> render_object "additionalProperties" (render p)) [] x.additionalProperties;
     Option.map_default (fun i -> render_object "items" (render i)) [] x.items]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "type"; data_type = Scalar },
           Json_type.String v) ->
          { x with _type = v }
      | AnnotatedTree.Leaf
          ({ name = "$ref"; data_type = Scalar },
           Json_type.String v) ->
          { x with _ref = v }
      | AnnotatedTree.Leaf
          ({ name = "description"; data_type = Scalar },
           Json_type.String v) ->
          { x with description = v }
      | AnnotatedTree.Leaf
          ({ name = "default"; data_type = Scalar },
           Json_type.String v) ->
          { x with default = v }
      | AnnotatedTree.Leaf
          ({ name = "required"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with required = v }
      | AnnotatedTree.Leaf
          ({ name = "format"; data_type = Scalar },
           Json_type.String v) ->
          { x with format = v }
      | AnnotatedTree.Leaf
          ({ name = "pattern"; data_type = Scalar },
           Json_type.String v) ->
          { x with pattern = v }
      | AnnotatedTree.Leaf
          ({ name = "minimum"; data_type = Scalar },
           Json_type.String v) ->
          { x with minimum = v }
      | AnnotatedTree.Leaf
          ({ name = "maximum"; data_type = Scalar },
           Json_type.String v) ->
          { x with maximum = v }
      | AnnotatedTree.Node
          ({ name = "enum"; data_type = Array },
           cs) ->
          parse_collection
            parse_string_element
            ""
            (fun xs -> { x with enum = xs })
            cs
      | AnnotatedTree.Node
          ({ name = "enumDescriptions"; data_type = Array },
           cs) ->
          parse_collection
            parse_string_element
            ""
            (fun xs -> { x with enumDescriptions = xs })
            cs
      | AnnotatedTree.Leaf
          ({ name = "repeated"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with repeated = v }
      | AnnotatedTree.Leaf
          ({ name = "location"; data_type = Scalar },
           Json_type.String v) ->
          { x with location = v }
      | AnnotatedTree.Node
          ({ name = "additionalProperties"; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            (fun v -> { x with additionalProperties = Some v })
            cs
      | AnnotatedTree.Node
          ({ name = "properties"; data_type = Object },
           cs) ->
          parse_collection
            (fun _ -> function
                 AnnotatedTree.Node
                   ({ name = n; data_type = Object },
                    cs) ->
                   parse_children
                     parse
                     empty
                     (fun v -> (n, v))
                     cs
               | e ->
                   unexpected "GapiDiscovery.JsonSchema.parse.parse_properties" e)
            ("", empty)
            (fun xs -> { x with properties = xs })
            cs
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            (fun v -> { x with items = Some v })
            cs
      | AnnotatedTree.Node
          ({ name = n; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            (fun v -> { x with properties = (n, v) :: x.properties })
            cs
      | e ->
          unexpected "GapiDiscovery.JsonSchema.parse" e

end

module RefData =
struct
  type t = {
    _ref : string
  }

	let _ref = {
		GapiLens.get = (fun x -> x._ref);
		GapiLens.set = (fun v x -> { _ref = v })
	}

  let empty = {
    _ref = ""
  }

  let render x =
    [render_string_value "$ref" x._ref]

  let parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "$ref"; data_type = Scalar },
           Json_type.String v) ->
          { _ref = v }
      | e ->
          unexpected "GapiDiscovery.RefData.parse" e

end

module ProtocolData =
struct
  type t = {
    multipart : bool;
    path : string
  }

	let multipart = {
		GapiLens.get = (fun x -> x.multipart);
		GapiLens.set = (fun v x -> { x with multipart = v })
	}
	let path = {
		GapiLens.get = (fun x -> x.path);
		GapiLens.set = (fun v x -> { x with path = v })
	}

  let empty = {
    multipart = false;
    path = ""
  }

  let render x =
    [render_bool_value "multipart" x.multipart;
     render_string_value "path" x.path]

  let parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "multipart"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with multipart = v }
      | AnnotatedTree.Leaf
          ({ name = "path"; data_type = Scalar },
           Json_type.String v) ->
          { x with path = v }
      | e ->
          unexpected "GapiDiscovery.ProtocolData.parse" e

end

module ProtocolsData =
struct
  type t = {
    simple : ProtocolData.t;
    resumable : ProtocolData.t
  }

	let simple = {
		GapiLens.get = (fun x -> x.simple);
		GapiLens.set = (fun v x -> { x with simple = v })
	}
	let resumable = {
		GapiLens.get = (fun x -> x.resumable);
		GapiLens.set = (fun v x -> { x with resumable = v })
	}

  let empty = {
    simple = ProtocolData.empty;
    resumable = ProtocolData.empty
  }

  let render x =
    [render_object "simple" (ProtocolData.render x.simple);
     render_object "resumable" (ProtocolData.render x.resumable)]

  let parse x tree =
    match tree with
        AnnotatedTree.Node
          ({ name = "simple"; data_type = Object },
           cs) ->
          parse_children
            ProtocolData.parse
            ProtocolData.empty
            (fun v -> { x with simple = v })
            cs
      | AnnotatedTree.Node
          ({ name = "resumable"; data_type = Object },
           cs) ->
          parse_children
            ProtocolData.parse
            ProtocolData.empty
            (fun v -> { x with resumable = v })
            cs
      | e ->
          unexpected "GapiDiscovery.ProtocolsData.parse" e

end

module MediaUploadData =
struct
  type t = {
    accept : string list;
    maxSize : string;
    protocols : ProtocolsData.t
  }

	let accept = {
		GapiLens.get = (fun x -> x.accept);
		GapiLens.set = (fun v x -> { x with accept = v })
	}
	let maxSize = {
		GapiLens.get = (fun x -> x.maxSize);
		GapiLens.set = (fun v x -> { x with maxSize = v })
	}
	let protocols = {
		GapiLens.get = (fun x -> x.protocols);
		GapiLens.set = (fun v x -> { x with protocols = v })
	}

  let empty = {
    accept = [];
    maxSize = "";
    protocols = ProtocolsData.empty
  }

  let render x =
    [render_array "accept" (render_string_value "") x.accept;
     render_string_value "maxSize" x.maxSize;
     render_object "protocols" (ProtocolsData.render x.protocols)]

  let parse x tree =
    match tree with
        AnnotatedTree.Node
          ({ name = "accept"; data_type = Array },
           cs) ->
          parse_collection
            parse_string_element
            ""
            (fun xs -> { x with accept = xs })
            cs
      | AnnotatedTree.Leaf
          ({ name = "maxSize"; data_type = Scalar },
           Json_type.String v) ->
          { x with maxSize = v }
      | AnnotatedTree.Node
          ({ name = "protocols"; data_type = Object },
           cs) ->
          parse_children
            ProtocolsData.parse
            ProtocolsData.empty
            (fun v -> { x with protocols = v })
            cs
      | e ->
          unexpected "GapiDiscovery.MediaUploadData.parse" e

end

module RestMethod =
struct
  type t = {
    id : string;
    path : string;
    httpMethod : string;
    description : string;
    parameters : (string * JsonSchema.t) list;
    parameterOrder : string list;
    request : RefData.t;
    response : RefData.t;
    scopes : string list;
    mediaUpload : MediaUploadData.t
  }

	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let path = {
		GapiLens.get = (fun x -> x.path);
		GapiLens.set = (fun v x -> { x with path = v })
	}
	let httpMethod = {
		GapiLens.get = (fun x -> x.httpMethod);
		GapiLens.set = (fun v x -> { x with httpMethod = v })
	}
	let description = {
		GapiLens.get = (fun x -> x.description);
		GapiLens.set = (fun v x -> { x with description = v })
	}
	let parameters = {
		GapiLens.get = (fun x -> x.parameters);
		GapiLens.set = (fun v x -> { x with parameters = v })
	}
	let parameterOrder = {
		GapiLens.get = (fun x -> x.parameterOrder);
		GapiLens.set = (fun v x -> { x with parameterOrder = v })
	}
	let request = {
		GapiLens.get = (fun x -> x.request);
		GapiLens.set = (fun v x -> { x with request = v })
	}
	let response = {
		GapiLens.get = (fun x -> x.response);
		GapiLens.set = (fun v x -> { x with response = v })
	}
	let scopes = {
		GapiLens.get = (fun x -> x.scopes);
		GapiLens.set = (fun v x -> { x with scopes = v })
	}
	let mediaUpload = {
		GapiLens.get = (fun x -> x.mediaUpload);
		GapiLens.set = (fun v x -> { x with mediaUpload = v })
	}

  let empty = {
    id = "";
    path = "";
    httpMethod = "";
    description = "";
    parameters = [];
    parameterOrder = [];
    request = RefData.empty;
    response = RefData.empty;
    scopes = [];
    mediaUpload = MediaUploadData.empty
  }

  let render x =
    [render_string_value "id" x.id;
     render_string_value "path" x.path;
     render_string_value "httpMethod" x.httpMethod;
     render_string_value "description" x.description;
     render_collection "parameters" Object (fun (id, v) -> render_object id (JsonSchema.render v)) x.parameters;
     render_array "parameterOrder" (render_string_value "") x.parameterOrder;
     render_object "request" (RefData.render x.request);
     render_object "response" (RefData.render x.response);
     render_array "scopes" (render_string_value "") x.scopes;
     render_object "mediaUpload" (MediaUploadData.render x.mediaUpload)]

  let parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "path"; data_type = Scalar },
           Json_type.String v) ->
          { x with path = v }
      | AnnotatedTree.Leaf
          ({ name = "httpMethod"; data_type = Scalar },
           Json_type.String v) ->
          { x with httpMethod = v }
      | AnnotatedTree.Leaf
          ({ name = "description"; data_type = Scalar },
           Json_type.String v) ->
          { x with description = v }
      | AnnotatedTree.Node
          ({ name = "parameters"; data_type = Object },
           cs) ->
          parse_collection
            (fun _ -> function
                 AnnotatedTree.Node
                   ({ name = n; data_type = Object },
                    cs) ->
                   parse_children
                     JsonSchema.parse
                     JsonSchema.empty
                     (fun v -> (n, v))
                     cs
               | e ->
                   unexpected "GapiDiscovery.RestMethod.parse.parse_parameters" e)
            ("", JsonSchema.empty)
            (fun xs -> { x with parameters = xs })
            cs
      | AnnotatedTree.Node
          ({ name = "parameterOrder"; data_type = Array },
           cs) ->
          parse_collection
            parse_string_element
            ""
            (fun xs -> { x with parameterOrder = xs })
            cs
      | AnnotatedTree.Node
          ({ name = "request"; data_type = Object },
           cs) ->
          parse_children
            RefData.parse
            RefData.empty
            (fun v -> { x with request = v })
            cs
      | AnnotatedTree.Node
          ({ name = "response"; data_type = Object },
           cs) ->
          parse_children
            RefData.parse
            RefData.empty
            (fun v -> { x with response = v })
            cs
      | AnnotatedTree.Node
          ({ name = "scopes"; data_type = Array },
           cs) ->
          parse_collection
            parse_string_element
            ""
            (fun xs -> { x with scopes = xs })
            cs
      | AnnotatedTree.Node
          ({ name = "mediaUpload"; data_type = Object },
           cs) ->
          parse_children
            MediaUploadData.parse
            MediaUploadData.empty
            (fun v -> { x with mediaUpload = v })
            cs
      | e ->
          unexpected "GapiDiscovery.RestMethod.parse" e

end

module RestResource =
struct
  type t = {
    methods : (string * RestMethod.t) list;
    resources : (string * t) list
  }

	let methods = {
		GapiLens.get = (fun x -> x.methods);
		GapiLens.set = (fun v x -> { x with methods = v })
	}
	let resources = {
		GapiLens.get = (fun x -> x.resources);
		GapiLens.set = (fun v x -> { x with resources = v })
	}

  let empty = {
    methods = [];
    resources = []
  }

  let rec render x =
    [render_collection "methods" Object (fun (id, v) -> render_object id (RestMethod.render v)) x.methods;
     render_collection "resources" Object (fun (id, v) -> render_object id (render v)) x.resources]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Node
          ({ name = "methods"; data_type = Object },
           cs) ->
          parse_collection
            (fun _ -> function
                 AnnotatedTree.Node
                   ({ name = n; data_type = Object },
                    cs) ->
                   parse_children
                     RestMethod.parse
                     RestMethod.empty
                     (fun v -> (n, v))
                     cs
               | e ->
                   unexpected "GapiDiscovery.RestResource.parse.parse_methods" e)
            ("", RestMethod.empty)
            (fun xs -> { x with methods = xs })
            cs
      | AnnotatedTree.Node
          ({ name = "resources"; data_type = Object },
           cs) ->
          parse_collection
            (fun _ -> function
                 AnnotatedTree.Node
                   ({ name = n; data_type = Object },
                    cs) ->
                   parse_children
                     parse
                     empty
                     (fun v -> (n, v))
                     cs
               | e ->
                   unexpected "GapiDiscovery.RestResource.parse.parse_resources" e)
            ("", empty)
            (fun xs -> { x with resources = xs })
            cs
      | e ->
          unexpected "GapiDiscovery.RestResource.parse" e

end

module RestDescription =
struct
  type t = {
    kind : string;
    id : string;
    name : string;
    version : string;
    title : string;
    description : string;
    icons : IconsData.t;
    documentationLink : string;
    labels : string list;
    protocol : string;
    basePath : string;
    parameters : (string * JsonSchema.t) list;
    auth : Oauth2Data.t;
    features : string list;
    schemas : (string * JsonSchema.t) list;
    methods : (string * RestMethod.t) list;
    resources : (string * RestResource.t) list
  }

	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let name = {
		GapiLens.get = (fun x -> x.name);
		GapiLens.set = (fun v x -> { x with name = v })
	}
	let version = {
		GapiLens.get = (fun x -> x.version);
		GapiLens.set = (fun v x -> { x with version = v })
	}
	let title = {
		GapiLens.get = (fun x -> x.title);
		GapiLens.set = (fun v x -> { x with title = v })
	}
	let description = {
		GapiLens.get = (fun x -> x.description);
		GapiLens.set = (fun v x -> { x with description = v })
	}
	let icons = {
		GapiLens.get = (fun x -> x.icons);
		GapiLens.set = (fun v x -> { x with icons = v })
	}
	let documentationLink = {
		GapiLens.get = (fun x -> x.documentationLink);
		GapiLens.set = (fun v x -> { x with documentationLink = v })
	}
	let labels = {
		GapiLens.get = (fun x -> x.labels);
		GapiLens.set = (fun v x -> { x with labels = v })
	}
	let protocol = {
		GapiLens.get = (fun x -> x.protocol);
		GapiLens.set = (fun v x -> { x with protocol = v })
	}
	let basePath = {
		GapiLens.get = (fun x -> x.basePath);
		GapiLens.set = (fun v x -> { x with basePath = v })
	}
	let parameters = {
		GapiLens.get = (fun x -> x.parameters);
		GapiLens.set = (fun v x -> { x with parameters = v })
	}
	let auth = {
		GapiLens.get = (fun x -> x.auth);
		GapiLens.set = (fun v x -> { x with auth = v })
	}
	let features = {
		GapiLens.get = (fun x -> x.features);
		GapiLens.set = (fun v x -> { x with features = v })
	}
	let schemas = {
		GapiLens.get = (fun x -> x.schemas);
		GapiLens.set = (fun v x -> { x with schemas = v })
	}
	let methods = {
		GapiLens.get = (fun x -> x.methods);
		GapiLens.set = (fun v x -> { x with methods = v })
	}
	let resources = {
		GapiLens.get = (fun x -> x.resources);
		GapiLens.set = (fun v x -> { x with resources = v })
	}

  let empty = {
    kind = "";
    id = "";
    name = "";
    version = "";
    title = "";
    description = "";
    icons = IconsData.empty;
    documentationLink = "";
    labels = [];
    protocol = "";
    basePath = "";
    parameters = [];
    auth = Oauth2Data.empty;
    features = [];
    schemas = [];
    methods = [];
    resources = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "id" x.id;
       render_string_value "name" x.name;
       render_string_value "version" x.version;
       render_string_value "title" x.title;
       render_string_value "description" x.description;
       render_object "icons" (IconsData.render x.icons);
       render_string_value "documentationLink" x.documentationLink;
       render_array "labels" (render_string_value "") x.labels;
       render_string_value "protocol" x.protocol;
       render_string_value "basePath" x.basePath;
       render_collection "parameters" Object (fun (id, v) -> render_object id (JsonSchema.render v)) x.parameters;
       render_object "auth" (Oauth2Data.render x.auth);
       render_array "features" (render_string_value "") x.features;
       render_collection "schemas" Object (fun (id, v) -> render_object id (JsonSchema.render v)) x.schemas;
       render_collection "methods" Object (fun (id, v) -> render_object id (RestMethod.render v)) x.methods;
       render_collection "resources" Object (fun (id, v) -> render_object id (RestResource.render v)) x.resources]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ GapiJson.name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "name"; data_type = Scalar },
           Json_type.String v) ->
          { x with name = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "version"; data_type = Scalar },
           Json_type.String v) ->
          { x with version = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "title"; data_type = Scalar },
           Json_type.String v) ->
          { x with title = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "description"; data_type = Scalar },
           Json_type.String v) ->
          { x with description = v }
      | AnnotatedTree.Node
          ({ GapiJson.name = "icons"; data_type = Object },
           cs) ->
          parse_children
            IconsData.parse
            IconsData.empty
            (fun v -> { x with icons = v })
            cs
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "documentationLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with documentationLink = v }
      | AnnotatedTree.Node
          ({ GapiJson.name = "labels"; data_type = Array },
           cs) ->
          parse_collection
            parse_string_element
            ""
            (fun xs -> { x with labels = xs })
            cs
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "protocol"; data_type = Scalar },
           Json_type.String v) ->
          { x with protocol = v }
      | AnnotatedTree.Leaf
          ({ GapiJson.name = "basePath"; data_type = Scalar },
           Json_type.String v) ->
          { x with basePath = v }
      | AnnotatedTree.Node
          ({ GapiJson.name = "parameters"; data_type = Object },
           cs) ->
          parse_collection
            (fun _ -> function
                 AnnotatedTree.Node
                   ({ GapiJson.name = n; data_type = Object },
                    cs) ->
                   parse_children
                     JsonSchema.parse
                     JsonSchema.empty
                     (fun v -> (n, v))
                     cs
               | e ->
                   unexpected "GapiDiscovery.RestDescription.parse.parse_parameters" e)
            ("", JsonSchema.empty)
            (fun xs -> { x with parameters = xs })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = "auth"; data_type = Object },
           cs) ->
          parse_children
            Oauth2Data.parse
            Oauth2Data.empty
            (fun v -> { x with auth = v })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = "features"; data_type = Array },
           cs) ->
          parse_collection
            parse_string_element
            ""
            (fun xs -> { x with features = xs })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = "schemas"; data_type = Object },
           cs) ->
          parse_collection
            (fun _ -> function
                 AnnotatedTree.Node
                   ({ GapiJson.name = n; data_type = Object },
                    cs) ->
                   parse_children
                     JsonSchema.parse
                     JsonSchema.empty
                     (fun v -> (n, v))
                     cs
               | e ->
                   unexpected "GapiDiscovery.RestDescription.parse.parse_schemas" e)
            ("", JsonSchema.empty)
            (fun xs -> { x with schemas = xs })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = "methods"; data_type = Object },
           cs) ->
          parse_collection
            (fun _ -> function
                 AnnotatedTree.Node
                   ({ GapiJson.name = n; data_type = Object },
                    cs) ->
                   parse_children
                     RestMethod.parse
                     RestMethod.empty
                     (fun v -> (n, v))
                     cs
               | e ->
                   unexpected "GapiDiscovery.RestDescription.parse.parse_methods" e)
            ("", RestMethod.empty)
            (fun xs -> { x with methods = xs })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = "resources"; data_type = Object },
           cs) ->
          parse_collection
            (fun _ -> function
                 AnnotatedTree.Node
                   ({ GapiJson.name = n; data_type = Object },
                    cs) ->
                   parse_children
                     RestResource.parse
                     RestResource.empty
                     (fun v -> (n, v))
                     cs
               | e ->
                   unexpected "GapiDiscovery.RestDescription.parse.parse_resources" e)
            ("", RestResource.empty)
            (fun xs -> { x with resources = xs })
            cs
      | AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiDiscovery.ItemsData.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

