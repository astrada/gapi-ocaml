open GdataUtils.Op

(* Calendar data types *)
let ns_gCal = "http://schemas.google.com/gCal/2005"
let ns_gd = "http://schemas.google.com/g/2005"
let ns_acl = "http://schemas.google.com/acl/2007"

type calendar_accessLevelProperty = string

type calendar_webContentGadgetPref = {
  wcgp_name : string;
  wcgp_value : string;
}

let empty_webContentGadgetPref = {
  wcgp_name = "";
  wcgp_value = ""
}

type calendar_webContent = {
  wc_height : int;
  wc_url : string;
  wc_width : int;
  wc_webContentGadgetPrefs : calendar_webContentGadgetPref list
}

let empty_webContent = {
  wc_height = 0;
  wc_url = "";
  wc_width = 0;
  wc_webContentGadgetPrefs = []
}

type calendar_calendarLink = {
  cl_href : string;
  cl_length : Int64.t;
  cl_rel : string;
  cl_title : string;
  cl_type : string;
  cl_webContent : calendar_webContent
}

let empty_link = {
  cl_href = "";
  cl_length = 0L;
  cl_rel = "";
  cl_title = "";
  cl_type = "";
  cl_webContent = empty_webContent
}

type calendar_calendarWhere = string

type calendar_colorProperty = string

type calendar_hiddenProperty = bool

type calendar_overrideNameProperty = string

type calendar_selectedProperty = bool

type calendar_timeZoneProperty = string

type calendar_timesCleanedProperty = int

type calendar_calendarEntry = {
  ce_etag : string;
  ce_kind : string;
  ce_authors : GdataAtom.atom_author list;
  ce_categories : GdataAtom.atom_category list;
  ce_contributors : GdataAtom.atom_contributor list;
  ce_id : GdataAtom.atom_id;
  ce_content : GdataAtom.atom_content;
  ce_published : GdataAtom.atom_published;
  ce_updated : GdataAtom.atom_updated;
  ce_edited : GdataAtom.app_edited;
  ce_accesslevel : calendar_accessLevelProperty;
  ce_links : calendar_calendarLink list;
  ce_where : calendar_calendarWhere list;
  ce_color : calendar_colorProperty;
  ce_hidden : calendar_hiddenProperty;
  ce_overridename : calendar_overrideNameProperty;
  ce_selected : calendar_selectedProperty;
  ce_timezone : calendar_timeZoneProperty;
  ce_timesCleaned : calendar_timesCleanedProperty;
  ce_summary : GdataAtom.atom_textConstruct;
  ce_title : GdataAtom.atom_textConstruct;
  ce_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_entry = {
  ce_etag = "";
  ce_kind = "";
  ce_authors = [];
  ce_categories = [];
  ce_contributors = [];
  ce_id = "";
  ce_content = GdataAtom.empty_content;
  ce_published = GdataDate.epoch;
  ce_updated = GdataDate.epoch;
  ce_edited = GdataDate.epoch;
  ce_accesslevel = "";
  ce_links = [];
  ce_where = [];
  ce_color = "";
  ce_hidden = false;
  ce_overridename = "";
  ce_selected = false;
  ce_timezone = "";
  ce_timesCleaned = 0;
  ce_summary = GdataAtom.empty_text;
  ce_title = GdataAtom.empty_text;
  ce_extensions = []
}

type calendar_calendarFeed = {
  cf_etag : string;
  cf_kind : string;
  cf_authors : GdataAtom.atom_author list;
  cf_categories : GdataAtom.atom_category list;
  cf_contributors : GdataAtom.atom_contributor list;
  cf_generator : GdataAtom.atom_generator;
  cf_id : GdataAtom.atom_id;
  cf_updated : GdataAtom.atom_updated;
  cf_entries : calendar_calendarEntry list;
  cf_links : calendar_calendarLink list;
  cf_title : GdataAtom.atom_textConstruct;
  cf_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
  cf_startIndex : GdataAtom.opensearch_startIndex
}

let empty_feed = {
  cf_etag = "";
  cf_kind = "";
  cf_authors = [];
  cf_categories = [];
  cf_contributors = [];
  cf_generator = GdataAtom.empty_generator;
  cf_id = "";
  cf_updated = GdataDate.epoch;
  cf_entries = [];
  cf_links = [];
  cf_title = GdataAtom.empty_text;
  cf_itemsPerPage = 0;
  cf_startIndex = 0
}
(* END Calendar data types *)


(* Calendar feed: parsing *)
let parse_webContentGadgetPref wcgp tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "name"; `Namespace ""],
         GdataCore.Value.String v) ->
        { wcgp with wcgp_name = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "value"; `Namespace ""],
         GdataCore.Value.String v) ->
        { wcgp with wcgp_value = v }
    | _ ->
        assert false

let parse_webContent webContent tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "height"; `Namespace ""],
         GdataCore.Value.String v) ->
        { webContent with wc_height = int_of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "url"; `Namespace ""],
         GdataCore.Value.String v) ->
        { webContent with wc_url = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "width"; `Namespace ""],
         GdataCore.Value.String v) ->
        { webContent with wc_width = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "webContentGadgetPref"; `Namespace ns],
         cs) when ns = ns_gCal ->
        GdataAtom.parse_children
          parse_webContentGadgetPref
          empty_webContentGadgetPref
          (fun wcgp -> { webContent with wc_webContentGadgetPrefs =
                           wcgp :: webContent.wc_webContentGadgetPrefs })
          cs
    | _ ->
        assert false

let parse_link link tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "href"; `Namespace ""],
         GdataCore.Value.String v) ->
        { link with cl_href = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "length"; `Namespace ""],
         GdataCore.Value.String v) ->
        { link with cl_length = Int64.of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "rel"; `Namespace ""],
         GdataCore.Value.String v) ->
        { link with cl_rel = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "title"; `Namespace ""],
         GdataCore.Value.String v) ->
        { link with cl_title = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "type"; `Namespace ""],
         GdataCore.Value.String v) ->
        { link with cl_type = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "webContent"; `Namespace ns],
         cs) when ns = ns_gCal ->
        GdataAtom.parse_children
          parse_webContent
          empty_webContent 
          (fun webContent -> { link with cl_webContent = webContent })
          cs
    | _ ->
        assert false

let parse_where where tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "valueString"; `Namespace ""],
         GdataCore.Value.String v) ->
        v
    | _ ->
        assert false

let parse_entry entry tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = ns_gd ->
        { entry with ce_etag = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "kind"; `Namespace ns],
         GdataCore.Value.String v) when ns = ns_gd ->
        { entry with ce_kind = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { entry with ce_authors = author :: entry.ce_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_category
          GdataAtom.empty_category
          (fun category -> { entry with ce_categories = category :: entry.ce_categories })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun contributor -> { entry with ce_contributors =
                                  contributor :: entry.ce_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with ce_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "content"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_content
          GdataAtom.empty_content
          (fun content -> { entry with ce_content = content })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "published"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with ce_published = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with ce_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "edited"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_app ->
        { entry with ce_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "accesslevel"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = ns_gCal ->
        { entry with ce_accesslevel = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          parse_link
          empty_link
          (fun link -> { entry with ce_links = link :: entry.ce_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "where"; `Namespace ns],
         cs) when ns = ns_gd ->
        GdataAtom.parse_children
          parse_where
          ""
          (fun where -> { entry with ce_where = where :: entry.ce_where })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "color"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = ns_gCal ->
        { entry with ce_color = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "hidden"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = ns_gCal ->
        { entry with ce_hidden = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "overridename"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = ns_gCal ->
        { entry with ce_overridename = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "selected"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = ns_gCal ->
        { entry with ce_selected = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "timezone"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = ns_gCal ->
        { entry with ce_timezone = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "timesCleaned"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = ns_gCal ->
        { entry with ce_timesCleaned = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "summary"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun summary -> { entry with ce_summary = summary })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { entry with ce_title = title })
          cs
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name _; `Namespace ns],
         _) when ns = Xmlm.ns_xmlns ->
        entry
    | extension ->
        let extensions = extension :: entry.ce_extensions in
          { entry with ce_extensions = extensions }

let parse_feed feed tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = ns_gd ->
        { feed with cf_etag = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "kind"; `Namespace ns],
         GdataCore.Value.String v) when ns = ns_gd ->
        { feed with cf_kind = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { feed with cf_authors = author :: feed.cf_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_category
          GdataAtom.empty_category
          (fun category -> { feed with cf_categories = category :: feed.cf_categories })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun contributor -> { feed with cf_contributors =
                                  contributor :: feed.cf_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "generator"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_generator
          GdataAtom.empty_generator
          (fun generator -> { feed with cf_generator = generator })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { feed with cf_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { feed with cf_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "entry"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          parse_entry
          empty_entry
          (fun entry -> { feed with cf_entries = entry :: feed.cf_entries })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          parse_link
          empty_link
          (fun link -> { feed with cf_links = link :: feed.cf_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { feed with cf_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "itemsPerPage"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with cf_itemsPerPage = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "startIndex"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with cf_startIndex = int_of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name _; `Namespace ns],
         _) when ns = Xmlm.ns_xmlns ->
        feed
    | e ->
        (* TODO: error handling *)
        assert false

let parse_calendar_feed tree =
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

let parse_calendar_entry tree =
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
(* END Calendar feed: parsing *)


(* Calendar feed: rendering *)
let render_link link =
  let render_webContent webContent =
    let render_webContentGadgetPref webContentGadgetPref =
      GdataAtom.render_element ns_gCal "webContentGadgetPref"
        [GdataAtom.render_attribute "" "name" webContentGadgetPref.wcgp_name;
         GdataAtom.render_attribute "" "value" webContentGadgetPref.wcgp_value]
    in

    GdataAtom.render_element ns_gCal "webContent"
      [GdataAtom.render_int_attribute "" "height" webContent.wc_height;
       GdataAtom.render_attribute "" "url" webContent.wc_url;
       GdataAtom.render_int_attribute "" "width" webContent.wc_width;
       GdataAtom.render_element_list render_webContentGadgetPref webContent.wc_webContentGadgetPrefs]
  in

  GdataAtom.render_element GdataAtom.ns_atom "link"
    [GdataAtom.render_attribute "" "href" link.cl_href;
     GdataAtom.render_generic_attribute Int64.to_string Int64.zero "" "length" link.cl_length;
     GdataAtom.render_attribute "" "rel" link.cl_rel;
     GdataAtom.render_attribute "" "title" link.cl_title;
     GdataAtom.render_attribute "" "type" link.cl_type;
     render_webContent link.cl_webContent]

let render_where where =
  GdataAtom.render_value ~attribute:"valueString" ns_gd "where" where

let calendar_entry_to_data_model entry =
  let entry_element =
    (* TODO: better namespace handling *)
    GdataAtom.render_element GdataAtom.ns_atom "entry"
      [GdataAtom.render_attribute Xmlm.ns_xmlns "xmlns" GdataAtom.ns_atom;
       GdataAtom.render_attribute Xmlm.ns_xmlns "gCal" ns_gCal;
       GdataAtom.render_attribute Xmlm.ns_xmlns "gd" ns_gd;
       GdataAtom.render_attribute Xmlm.ns_xmlns "app" GdataAtom.ns_app;
       GdataAtom.render_attribute ns_gd "kind" entry.ce_kind;
       GdataAtom.render_element_list (GdataAtom.render_author "author") entry.ce_authors;
       GdataAtom.render_element_list GdataAtom.render_category entry.ce_categories;
       GdataAtom.render_element_list (GdataAtom.render_author "contributor") entry.ce_contributors;
       GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.ce_id;
       GdataAtom.render_content entry.ce_content;
       GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.ce_published;
       GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.ce_updated;
       GdataAtom.render_date_element GdataAtom.ns_app "edited" entry.ce_edited;
       GdataAtom.render_value ns_gCal "accesslevel" entry.ce_accesslevel;
       GdataAtom.render_element_list render_link entry.ce_links;
       GdataAtom.render_element_list render_where entry.ce_where;
       GdataAtom.render_value ns_gCal "color" entry.ce_color;
       GdataAtom.render_bool_value ns_gCal "hidden" entry.ce_hidden;
       GdataAtom.render_bool_value ns_gCal "selected" entry.ce_selected;
       GdataAtom.render_value ns_gCal "timezone" entry.ce_timezone;
       GdataAtom.render_int_value ns_gCal "timesCleaned" entry.ce_timesCleaned;
       GdataAtom.render_text_construct "summary" entry.ce_summary;
       GdataAtom.render_text_construct "title" entry.ce_title;
       entry.ce_extensions]
  in

    List.hd entry_element
(* END Calendar feed: rendering *)


(* Personal settings *)
let parse_personal_settings tree =
  let settings = Hashtbl.create 16 in

  let parse_entry tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "settingsProperty"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "name"; `Namespace ""],
               GdataCore.Value.String n);
            GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               GdataCore.Value.String v)]) when ns = ns_gCal ->
          Hashtbl.add settings n v
      | _ ->
          ()
  in

  let parse_feed tree =
    match tree with
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "entry"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          List.iter parse_entry cs
      | _ ->
          ()
  in

  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feed"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          List.iter parse_feed cs
      | _ ->
          assert false
  in
    parse_root tree;
    settings
(* END Personal settings *)


(* Feed: utilities *)
module Rel =
struct
  type t =
      Self
    | Alternate
    | Edit
    | Feed
    | Post
    | Batch
    | EventFeed
    | Acl

  let to_string l  =
    match l with
        Self -> "self"
      | Alternate -> "alternate"
      | Edit -> "edit"
      | Feed -> ns_gd ^ "#feed"
      | Post -> ns_gd ^ "#post"
      | Batch -> ns_gd ^ "#batch"
      | EventFeed -> ns_gCal ^ "#eventFeed"
      | Acl -> ns_acl ^ "#accessControlList"

end

let find_url rel links =
  let link = List.find
               (fun link ->
                  link.cl_rel = Rel.to_string rel)
               links
  in
    link.cl_href
(* END Feed: utilities *)

