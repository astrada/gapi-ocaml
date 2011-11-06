open GdataUtils.Op

let ns_gAcl = "http://schemas.google.com/acl/2007"

(* Calendar ACL data types *)
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
           GdataCore.Value.String v) when ns = "" ->
          { scope with stype = v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "value"; `Namespace ns],
           GdataCore.Value.String v) when ns = "" ->
          { scope with value = v }
      | e ->
          GdataUtils.unexpected e

end

type acl_role = string

type calendar_aclEntry = {
  ae_etag : string;
  ae_kind : string;
  ae_authors : GdataAtom.Author.t list;
  ae_categories : GdataAtom.Category.t list;
  ae_contributors : GdataAtom.Contributor.t list;
  ae_id : GdataAtom.atom_id;
  ae_content : GdataAtom.Content.t;
  ae_published : GdataAtom.atom_published;
  ae_updated : GdataAtom.atom_updated;
  ae_edited : GdataAtom.app_edited;
  ae_links : GdataAtom.Link.t list;
  ae_title : GdataAtom.Title.t;
  ae_scope : Scope.t;
  ae_role : acl_role
}

let empty_entry = {
  ae_etag = "";
  ae_kind = "";
  ae_authors = [];
  ae_categories = [];
  ae_contributors = [];
  ae_id = "";
  ae_content = GdataAtom.Content.empty;
  ae_published = GdataDate.epoch;
  ae_updated = GdataDate.epoch;
  ae_edited = GdataDate.epoch;
  ae_links = [];
  ae_title = GdataAtom.Title.empty;
  ae_scope = Scope.empty;
  ae_role = ""
}
(* END Calendar ACL data types *)

(* Calendar ACL feed: parsing *)
let parse_entry entry tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataAtom.ns_gd ->
        { entry with ae_etag = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "kind"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataAtom.ns_gd ->
        { entry with ae_kind = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Author.of_xml_data_model
          GdataAtom.Author.empty
          (fun author -> { entry with ae_authors = author :: entry.ae_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Category.of_xml_data_model
          GdataAtom.Category.empty
          (fun category -> { entry with ae_categories = category :: entry.ae_categories })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Contributor.of_xml_data_model
          GdataAtom.Contributor.empty
          (fun contributor -> { entry with ae_contributors =
                                  contributor :: entry.ae_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with ae_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "content"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Content.of_xml_data_model
          GdataAtom.Content.empty
          (fun content -> { entry with ae_content = content })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "published"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with ae_published = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with ae_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "edited"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_app ->
        { entry with ae_edited = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Link.of_xml_data_model
          GdataAtom.Link.empty
          (fun link -> { entry with ae_links = link :: entry.ae_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Title.of_xml_data_model
          GdataAtom.Title.empty
          (fun title -> { entry with ae_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "scope"; `Namespace ns],
         cs) when ns = ns_gAcl ->
        GdataAtom.parse_children
          Scope.of_xml_data_model
          Scope.empty
          (fun scope -> { entry with ae_scope = scope })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "role"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = ns_gAcl ->
        { entry with ae_role = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name _; `Namespace ns],
         _) when ns = Xmlm.ns_xmlns ->
        entry
    | e ->
        GdataUtils.unexpected e

let parse_acl_entry tree =
  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "entry"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            parse_entry
            empty_entry
            Std.identity
            cs
      | e ->
          GdataUtils.unexpected e
  in
    parse_root tree
(* END Calendar ACL feed: parsing *)


(* Calendar ACL feed: rendering *)
let get_acl_prefix namespace =
  if namespace = ns_gAcl then "gAcl"
  else GdataAtom.get_standard_prefix namespace

let render_entry entry =
  GdataAtom.render_element GdataAtom.ns_atom "entry"
    [GdataAtom.render_attribute GdataAtom.ns_gd "etag" entry.ae_etag;
     GdataAtom.render_attribute GdataAtom.ns_gd "kind" entry.ae_kind;
     GdataAtom.render_element_list GdataAtom.Author.to_xml_data_model entry.ae_authors;
     GdataAtom.render_element_list GdataAtom.Category.to_xml_data_model entry.ae_categories;
     GdataAtom.render_element_list GdataAtom.Contributor.to_xml_data_model entry.ae_contributors;
     GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.ae_id;
     GdataAtom.Content.to_xml_data_model entry.ae_content;
     GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.ae_updated;
     GdataAtom.render_element_list GdataAtom.Link.to_xml_data_model entry.ae_links;
     GdataAtom.render_value ns_gAcl "role" entry.ae_role;
     Scope.to_xml_data_model entry.ae_scope;
     GdataAtom.Title.to_xml_data_model entry.ae_title]

let acl_entry_to_data_model entry =
  GdataAtom.element_to_data_model
    get_acl_prefix
    render_entry 
    entry
(* END Calendar ACL feed: rendering *)

module Entry =
struct
  type t = calendar_aclEntry

  let empty = empty_entry

  let to_xml_data_model = render_entry

  let of_xml_data_model = parse_entry

end

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

