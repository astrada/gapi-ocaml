open GdataUtils.Op

(* Calendar ACL data types *)
type acl_scope = {
  as_type : string;
  as_value : string
}

let empty_scope = {
  as_type = "";
  as_value = ""
}

type acl_role = string

type calendar_aclEntry = {
  ae_etag : string;
  ae_kind : string;
  ae_authors : GdataAtom.atom_author list;
  ae_categories : GdataAtom.atom_category list;
  ae_contributors : GdataAtom.atom_contributor list;
  ae_id : GdataAtom.atom_id;
  ae_content : GdataAtom.atom_content;
  ae_published : GdataAtom.atom_published;
  ae_updated : GdataAtom.atom_updated;
  ae_edited : GdataAtom.app_edited;
  ae_links : GdataAtom.atom_link list;
  ae_title : GdataAtom.atom_textConstruct;
  ae_scope : acl_scope;
  ae_role : acl_role
}

let empty_entry = {
  ae_etag = "";
  ae_kind = "";
  ae_authors = [];
  ae_categories = [];
  ae_contributors = [];
  ae_id = "";
  ae_content = GdataAtom.empty_text;
  ae_published = GdataDate.epoch;
  ae_updated = GdataDate.epoch;
  ae_edited = GdataDate.epoch;
  ae_links = [];
  ae_title = GdataAtom.empty_text;
  ae_scope = empty_scope;
  ae_role = ""
}
(* END Calendar ACL data types *)

(* Calendar ACL feed: parsing *)
let parse_scope scope tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "type"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { scope with as_type = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "value"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { scope with as_value = v }
    | e ->
        GdataUtils.unexpected e

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
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { entry with ae_authors = author :: entry.ae_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_category
          GdataAtom.empty_category
          (fun category -> { entry with ae_categories = category :: entry.ae_categories })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
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
          GdataAtom.parse_content
          GdataAtom.empty_content
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
          GdataAtom.parse_link
          GdataAtom.empty_link
          (fun link -> { entry with ae_links = link :: entry.ae_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { entry with ae_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "scope"; `Namespace ns],
         cs) when ns = GdataAtom.ns_gAcl ->
        GdataAtom.parse_children
          parse_scope
          empty_scope
          (fun scope -> { entry with ae_scope = scope })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "role"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataAtom.ns_gAcl ->
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
let render_scope scope =
  GdataAtom.render_element GdataAtom.ns_gAcl "scope"
    [GdataAtom.render_attribute "" "type" scope.as_type;
     GdataAtom.render_attribute "" "value" scope.as_value]

let render_entry entry =
  GdataAtom.render_element GdataAtom.ns_atom "entry"
    [GdataAtom.render_attribute GdataAtom.ns_gd "kind" entry.ae_kind;
     GdataAtom.render_element_list (GdataAtom.render_author "author") entry.ae_authors;
     GdataAtom.render_element_list GdataAtom.render_category entry.ae_categories;
     GdataAtom.render_element_list (GdataAtom.render_author "contributor") entry.ae_contributors;
     GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.ae_id;
     GdataAtom.render_content entry.ae_content;
     GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.ae_updated;
     GdataAtom.render_element_list GdataAtom.render_link entry.ae_links;
     GdataAtom.render_value GdataAtom.ns_gAcl "role" entry.ae_role;
     render_scope entry.ae_scope;
     GdataAtom.render_text_construct "title" entry.ae_title]

let acl_entry_to_data_model entry =
  GdataAtom.element_to_data_model
    GdataAtom.get_standard_prefix
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

