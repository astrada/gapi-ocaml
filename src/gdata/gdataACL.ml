open GdataUtils.Op

let ns_gAcl = "http://schemas.google.com/acl/2007"

module Scope =
struct
  type t = {
    stype : string;
    value : string
  }

  let empty = {
    stype = "";
    value = ""
  }

  let to_xml_data_model scope =
    GdataAtom.render_element ns_gAcl "scope"
      [GdataAtom.render_attribute "" "type" scope.stype;
       GdataAtom.render_attribute "" "value" scope.value]

  let of_xml_data_model scope tree =
    match tree with
        GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "type"; `Namespace ns],
           v) when ns = "" ->
          { scope with stype = v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "value"; `Namespace ns],
           v) when ns = "" ->
          { scope with value = v }
      | e ->
          GdataUtils.unexpected e

end

type acl_role = string

module Entry =
struct
  type t = {
    etag : string;
    kind : string;
    authors : GdataAtom.Author.t list;
    categories : GdataAtom.Category.t list;
    contributors : GdataAtom.Contributor.t list;
    id : GdataAtom.atom_id;
    content : GdataAtom.Content.t;
    published : GdataAtom.atom_published;
    updated : GdataAtom.atom_updated;
    edited : GdataAtom.app_edited;
    links : GdataAtom.Link.t list;
    title : GdataAtom.Title.t;
    scope : Scope.t;
    role : acl_role
  }

  let empty = {
    etag = "";
    kind = "";
    authors = [];
    categories = [];
    contributors = [];
    id = "";
    content = GdataAtom.Content.empty;
    published = GdataDate.epoch;
    updated = GdataDate.epoch;
    edited = GdataDate.epoch;
    links = [];
    title = GdataAtom.Title.empty;
    scope = Scope.empty;
    role = ""
  }

  let to_xml_data_model entry =
    GdataAtom.render_element GdataAtom.ns_atom "entry"
      [GdataAtom.render_attribute GdataAtom.ns_gd "etag" entry.etag;
       GdataAtom.render_attribute GdataAtom.ns_gd "kind" entry.kind;
       GdataAtom.render_element_list GdataAtom.Author.to_xml_data_model entry.authors;
       GdataAtom.render_element_list GdataAtom.Category.to_xml_data_model entry.categories;
       GdataAtom.render_element_list GdataAtom.Contributor.to_xml_data_model entry.contributors;
       GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.id;
       GdataAtom.Content.to_xml_data_model entry.content;
       GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.updated;
       GdataAtom.render_element_list GdataAtom.Link.to_xml_data_model entry.links;
       GdataAtom.render_value ns_gAcl "role" entry.role;
       Scope.to_xml_data_model entry.scope;
       GdataAtom.Title.to_xml_data_model entry.title]

  let of_xml_data_model entry tree =
    match tree with
        GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "etag"; `Namespace ns],
           v) when ns = GdataAtom.ns_gd ->
          { entry with etag = v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "kind"; `Namespace ns],
           v) when ns = GdataAtom.ns_gd ->
          { entry with kind = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "author"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Author.of_xml_data_model
            GdataAtom.Author.empty
            (fun author -> { entry with authors = author :: entry.authors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Category.of_xml_data_model
            GdataAtom.Category.empty
            (fun category -> { entry with categories = category :: entry.categories })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "contributor"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Contributor.of_xml_data_model
            GdataAtom.Contributor.empty
            (fun contributor -> { entry with contributors =
                                    contributor :: entry.contributors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "id"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with id = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "content"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Content.of_xml_data_model
            GdataAtom.Content.empty
            (fun content -> { entry with content = content })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "published"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with published = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "updated"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with updated = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "edited"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_app ->
          { entry with edited = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "link"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Link.of_xml_data_model
            GdataAtom.Link.empty
            (fun link -> { entry with links = link :: entry.links })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Title.of_xml_data_model
            GdataAtom.Title.empty
            (fun title -> { entry with title = title })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "scope"; `Namespace ns],
           cs) when ns = ns_gAcl ->
          GdataAtom.parse_children
            Scope.of_xml_data_model
            Scope.empty
            (fun scope -> { entry with scope = scope })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "role"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = ns_gAcl ->
          { entry with role = v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          entry
      | e ->
          GdataUtils.unexpected e

end

let get_acl_prefix namespace =
  if namespace = ns_gAcl then "gAcl"
  else GdataAtom.get_standard_prefix namespace

module EntryElement = GdataAtom.MakeElement
                        (struct
                           include Entry

                           let element_name = "entry"

                           let element_namespace = GdataAtom.ns_atom

                           let get_prefix = get_acl_prefix
                         end)

let parse_acl_entry = EntryElement.parse_xml_tree

let acl_entry_to_data_model = EntryElement.build_xml_tree

module Feed = GdataAtom.MakeFeed(Entry)(GdataAtom.Link)

(* Utilities *)
module Rel =
struct
  type t =
    [ `Acl
    | GdataAtom.Rel.t ]

  let to_string l  =
    match l with
        `Acl -> ns_gAcl ^ "#accessControlList"
      | #GdataAtom.Rel.t -> GdataAtom.Rel.to_string l
      | _ -> failwith "BUG: Unexpected Rel value (GdataACL)"

end

let find_url rel links =
  let link = List.find
               (fun link ->
                  link.GdataAtom.Link.rel = Rel.to_string rel)
               links
  in
    link.GdataAtom.Link.href
(* END Utilities *)

