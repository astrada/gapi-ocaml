open GdataUtils.Op

(* Calendar ACL data types *)
let ns_gAcl = "http://schemas.google.com/acl/2007"

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
  ae_updated : GdataAtom.atom_updated;
  ae_edited : GdataAtom.app_edited;
  ae_links : GdataCalendar.calendar_calendarLink list;
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
  ae_updated = GdataDate.epoch;
  ae_edited = GdataDate.epoch;
  ae_links = [];
  ae_title = GdataAtom.empty_text;
  ae_scope = empty_scope;
  ae_role = ""
}

type calendar_aclFeed = {
  af_etag : string;
  af_kind : string;
  af_authors : GdataAtom.atom_author list;
  af_categories : GdataAtom.atom_category list;
  af_contributors : GdataAtom.atom_contributor list;
  af_generator : GdataAtom.atom_generator;
  af_id : GdataAtom.atom_id;
  af_updated : GdataAtom.atom_updated;
  af_entries : calendar_aclEntry list;
  af_links : GdataCalendar.calendar_calendarLink list;
  af_title : GdataAtom.atom_textConstruct;
  af_totalResults : GdataAtom.opensearch_totalResults;
  af_startIndex : GdataAtom.opensearch_startIndex
}

let empty_feed = {
  af_etag = "";
  af_kind = "";
  af_authors = [];
  af_categories = [];
  af_contributors = [];
  af_generator = GdataAtom.empty_generator;
  af_id = "";
  af_updated = GdataDate.epoch;
  af_entries = [];
  af_links = [];
  af_title = GdataAtom.empty_text;
  af_totalResults = 0;
  af_startIndex = 0
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
    | _ ->
        assert false

let parse_entry entry tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { entry with ae_etag = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "kind"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
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
          GdataCalendar.parse_link
          GdataCalendar.empty_link
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
         cs) when ns = ns_gAcl ->
        GdataAtom.parse_children
          parse_scope
          empty_scope
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
    | _ ->
        assert false

let parse_feed feed tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { feed with af_etag = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "kind"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { feed with af_kind = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { feed with af_authors = author :: feed.af_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_category
          GdataAtom.empty_category
          (fun category -> { feed with af_categories = category :: feed.af_categories })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun contributor -> { feed with af_contributors =
                                  contributor :: feed.af_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "generator"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_generator
          GdataAtom.empty_generator
          (fun generator -> { feed with af_generator = generator })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { feed with af_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { feed with af_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "entry"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          parse_entry
          empty_entry
          (fun entry -> { feed with af_entries = entry :: feed.af_entries })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataCalendar.parse_link
          GdataCalendar.empty_link
          (fun link -> { feed with af_links = link :: feed.af_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { feed with af_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "totalResults"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with af_totalResults = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "startIndex"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with af_startIndex = int_of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name _; `Namespace ns],
         _) when ns = Xmlm.ns_xmlns ->
        feed
    | e ->
        assert false

let parse_acl_feed tree =
  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feed"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            parse_feed
            empty_feed
            Std.identity
            cs
      | _ ->
          assert false
  in
    parse_root tree

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
      | _ ->
          assert false
  in
    parse_root tree
(* END Calendar ACL feed: parsing *)


(* Calendar ACL feed: rendering *)
let render_scope scope =
  GdataAtom.render_element ns_gAcl "scope"
    [GdataAtom.render_attribute "" "type" scope.as_type;
     GdataAtom.render_attribute "" "value" scope.as_value]

let acl_entry_to_data_model entry =
  let entry_element =
    GdataAtom.render_element GdataAtom.ns_atom "entry"
      [GdataAtom.render_attribute Xmlm.ns_xmlns "xmlns" GdataAtom.ns_atom;
       GdataAtom.render_attribute Xmlm.ns_xmlns "gd" GdataCalendar.ns_gd;
       GdataAtom.render_attribute Xmlm.ns_xmlns "gAcl" ns_gAcl;
       GdataAtom.render_attribute GdataCalendar.ns_gd "kind" entry.ae_kind;
       GdataAtom.render_element_list (GdataAtom.render_author "author") entry.ae_authors;
       GdataAtom.render_element_list GdataAtom.render_category entry.ae_categories;
       GdataAtom.render_element_list (GdataAtom.render_author "contributor") entry.ae_contributors;
       GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.ae_id;
       GdataAtom.render_content entry.ae_content;
       GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.ae_updated;
       GdataAtom.render_date_element GdataAtom.ns_app "edited" entry.ae_edited;
       GdataAtom.render_element_list GdataCalendar.render_link entry.ae_links;
       GdataAtom.render_value ns_gAcl "role" entry.ae_role;
       render_scope entry.ae_scope;
       GdataAtom.render_text_construct "title" entry.ae_title]
  in

    List.hd entry_element
(* END Calendar ACL feed: rendering *)

