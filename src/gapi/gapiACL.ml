open GapiUtils.Infix
open GapiCore
open GapiJson

module Scope =
struct
  type t = {
    _type : string;
    value : string
  }

  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v })
  }
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v })
  }

  let empty = {
    _type = "";
    value = ""
  }

  let render x =
    render_object "scope"
      [render_string_value "type" x._type;
       render_string_value "value" x.value]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "type"; data_type = Scalar },
           Json_type.String v) ->
          { x with _type = v }
      | AnnotatedTree.Leaf
          ({ name = "value"; data_type = Scalar },
           Json_type.String v) ->
          { x with value = v }
      | AnnotatedTree.Node
          ({ name = "scope"; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiACL.Scope.parse" e

end

module ACLResource =
struct
  type t = {
    kind : string;
    etag : string;
    id : string;
    scope : Scope.t;
    role : string
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v })
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v })
  }
  let scope = {
    GapiLens.get = (fun x -> x.scope);
    GapiLens.set = (fun v x -> { x with scope = v })
  }
  let role = {
    GapiLens.get = (fun x -> x.role);
    GapiLens.set = (fun v x -> { x with role = v })
  }

  let empty = {
    kind = "";
    etag = "";
    id = "";
    scope = Scope.empty;
    role = ""
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "etag" x.etag;
       render_string_value "id" x.id;
       Scope.render x.scope;
       render_string_value "role" x.role]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "etag"; data_type = Scalar },
           Json_type.String v) ->
          { x with etag = v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Node
          ({ name = "scope"; data_type = Object },
           cs) ->
          parse_children
            Scope.parse
            Scope.empty
            (fun s -> { x with scope = s })
            cs
      | AnnotatedTree.Leaf
          ({ name = "role"; data_type = Scalar },
           Json_type.String v) ->
          { x with role = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiACL.ACLResource.parse" e

end

module ACLList =
struct
  type t = {
    kind : string;
    etag : string;
    nextPageToken : string;
    items : ACLResource.t list
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v })
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v })
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v })
  }

  let empty = {
    kind = "";
    etag = "";
    nextPageToken = "";
    items = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "etag" x.etag;
       render_string_value "nextPageToken" x.nextPageToken;
       render_array "items" ACLResource.render x.items]

  let parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "etag"; data_type = Scalar },
           Json_type.String v) ->
          { x with etag = v }
      | AnnotatedTree.Leaf
          ({ name = "nextPageToken"; data_type = Scalar },
           Json_type.String v) ->
          { x with nextPageToken = v }
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_array
            ACLResource.parse
            ACLResource.empty
            (fun xs -> { x with items = xs })
            cs
      | e ->
          unexpected "GapiACL.ACLList.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

