open GapiUtils.Infix
open GapiLens.Infix

let ns_gAcl = "http://schemas.google.com/acl/2007"

module RoleWithKey =
struct
  type t = {
    key : string;
    role : string;
  }

	let key = {
		GapiLens.get = (fun x -> x.key);
		GapiLens.set = (fun v x -> { x with key = v })
	}
	let role = {
		GapiLens.get = (fun x -> x.role);
		GapiLens.set = (fun v x -> { x with role = v })
	}

  let empty = {
    key = "";
    role = "";
  }

  let to_xml_data_model role =
    GdataAtom.render_element ns_gAcl "withKey"
      [GdataAtom.render_attribute "" "key" role.key;
       GdataAtom.render_value "" "role" role.role]

  let of_xml_data_model role tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "key"; `Namespace ""],
           v) ->
          { role with key = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "role"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = ns_gAcl ->
          { role with role = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          role
      | e ->
          GdataUtils.unexpected e

end

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

  let to_xml_data_model scope =
    GdataAtom.render_element ns_gAcl "scope"
      [GdataAtom.render_attribute "" "type" scope._type;
       GdataAtom.render_attribute "" "value" scope.value]

  let of_xml_data_model scope tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "type"; `Namespace ""],
           v) ->
          { scope with _type = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "value"; `Namespace ""],
           v) ->
          { scope with value = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          scope
      | e ->
          GdataUtils.unexpected e

end

module Entry =
struct
  type t = {
    common : GdataAtom.BasicEntry.t;
    scope : Scope.t;
    role : string;
    additionalRole : string;
    withKey : RoleWithKey.t;
    batch : GdataBatch.BatchExtensions.t;
  }

	let common = {
		GapiLens.get = (fun x -> x.common);
		GapiLens.set = (fun v x -> { x with common = v })
	}
	let scope = {
		GapiLens.get = (fun x -> x.scope);
		GapiLens.set = (fun v x -> { x with scope = v })
	}
	let role = {
		GapiLens.get = (fun x -> x.role);
		GapiLens.set = (fun v x -> { x with role = v })
	}
	let additionalRole = {
		GapiLens.get = (fun x -> x.additionalRole);
		GapiLens.set = (fun v x -> { x with additionalRole = v })
	}
	let withKey = {
		GapiLens.get = (fun x -> x.withKey);
		GapiLens.set = (fun v x -> { x with withKey = v })
	}
	let batch = {
		GapiLens.get = (fun x -> x.batch);
		GapiLens.set = (fun v x -> { x with batch = v })
	}

  let etag = common |-- GdataAtom.BasicEntry.etag
  let id = common |-- GdataAtom.BasicEntry.id
  let links = common |-- GdataAtom.BasicEntry.links

  let empty = {
    common = GdataAtom.BasicEntry.empty;
    scope = Scope.empty;
    role = "";
    additionalRole = "";
    withKey = RoleWithKey.empty;
    batch = GdataBatch.BatchExtensions.empty;
  }

  let to_xml_data_model entry =
    GdataAtom.render_element GdataAtom.ns_atom "entry"
      [GdataAtom.BasicEntry.to_xml_data_model entry.common;
       Scope.to_xml_data_model entry.scope;
       GdataAtom.render_value ns_gAcl "role" entry.role;
       GdataAtom.render_value ns_gAcl "additionalRole" entry.additionalRole;
       RoleWithKey.to_xml_data_model entry.withKey;
       GdataBatch.BatchExtensions.to_xml_data_model entry.batch]

  let of_xml_data_model entry tree =
    match tree with
        GapiCore.AnnotatedTree.Node
          ([_; `Name n; `Namespace ns],
           _)
      | GapiCore.AnnotatedTree.Leaf
          ([_; `Name n; `Namespace ns],
           _) when GdataAtom.BasicEntry.node_matches (n, ns) ->
          let common =
            GdataAtom.BasicEntry.of_xml_data_model entry.common tree
          in
            { entry with common }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "scope"; `Namespace ns],
           cs) when ns = ns_gAcl ->
          GdataAtom.parse_children
            Scope.of_xml_data_model
            Scope.empty
            (fun scope -> { entry with scope })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "role"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)])
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "role"; `Namespace ns],
           [_; GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = ns_gAcl ->
          { entry with role = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "additionalRole"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = ns_gAcl ->
          { entry with additionalRole = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "withKey"; `Namespace ns],
           cs) when ns = ns_gAcl ->
          GdataAtom.parse_children
            RoleWithKey.of_xml_data_model
            RoleWithKey.empty
            (fun withKey -> { entry with withKey })
            cs
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          entry
      | e ->
          let batch =
            GdataBatch.BatchExtensions.of_xml_data_model entry.batch e
          in
            { entry with batch }

end

let get_acl_prefix namespace =
  if namespace = ns_gAcl then "gAcl"
  else GdataExtensions.get_extensions_prefix namespace

let parse_entry =
  GdataAtom.data_model_to_entry Entry.of_xml_data_model Entry.empty

let entry_to_data_model =
  GdataAtom.element_to_data_model get_acl_prefix Entry.to_xml_data_model

module Feed =
  GdataAtom.MakeFeed(Entry)(GdataAtom.Link)(GdataAtom.GenericExtensions)

let parse_feed = Feed.parse_feed

let feed_to_data_model =
  GdataAtom.element_to_data_model get_acl_prefix Feed.to_xml_data_model

(* Utilities *)
module Rel =
struct
  type t =
    [ `Acl
    | GdataExtensions.Rel.t ]

  let to_string l  =
    match l with
        `Acl -> ns_gAcl ^ "#accessControlList"
      | #GdataExtensions.Rel.t -> GdataExtensions.Rel.to_string l
      | _ -> failwith "BUG: Unexpected Rel value (GdataACL)"

end

let find_url rel links =
  GdataAtom.find_url_generic
    (module Rel : GdataAtom.LinkRelation with type t = Rel.t) rel links

(* END Utilities *)

