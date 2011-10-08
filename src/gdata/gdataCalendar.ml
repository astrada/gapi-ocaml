open GdataUtils.Op

(* Calendar data types *)
let ns_atom = "http://www.w3.org/2005/Atom"
let ns_app = "http://www.w3.org/2007/app"
let ns_openSearch = "http://a9.com/-/spec/opensearch/1.1/"
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
  ce_content : GdataAtom.atom_outOfLineContent;
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
  ce_published = "";
  ce_updated = "";
  ce_edited = "";
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
  cf_updated = "";
  cf_entries = [];
  cf_links = [];
  cf_title = GdataAtom.empty_text;
  cf_itemsPerPage = 0;
  cf_startIndex = 0
}
(* END Calendar data types *)


(* Calendar feed: parsing *)
let parse_children parse_child empty_element update cs =
  let element = List.fold_left
                  parse_child
                  empty_element
                  cs
  in
    update element

let parse_category category tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "label"; `Namespace ""],
         GdataCore.Value.String v) ->
        { category with GdataAtom.c_label = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "scheme"; `Namespace ""],
         GdataCore.Value.String v) ->
        { category with GdataAtom.c_scheme = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "term"; `Namespace ""],
         GdataCore.Value.String v) ->
        { category with GdataAtom.c_term = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "lang"; `Namespace ns],
         GdataCore.Value.String v) when ns = Xmlm.ns_xml ->
        { category with GdataAtom.c_lang = v }
    | _ ->
        assert false

let parse_text text tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "src"; `Namespace ""],
         GdataCore.Value.String v) ->
        { text with GdataAtom.tc_src = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "type"; `Namespace ""],
         GdataCore.Value.String v) ->
        { text with GdataAtom.tc_type = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "lang"; `Namespace ns],
         GdataCore.Value.String v) when ns = Xmlm.ns_xml ->
        { text with GdataAtom.tc_lang = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Text],
         GdataCore.Value.String v) ->
        { text with GdataAtom.tc_value = v }
    | _ ->
        assert false

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
        parse_children
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
        parse_children
          parse_webContent
          empty_webContent 
          (fun webContent -> { link with cl_webContent = webContent })
          cs
    | _ ->
        assert false

let parse_author author tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "lang"; `Namespace ns],
         GdataCore.Value.String v) when ns = Xmlm.ns_xml ->
        { author with GdataAtom.a_lang = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "name"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
        { author with GdataAtom.a_name = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "email"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
        { author with GdataAtom.a_email = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "uri"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
        { author with GdataAtom.a_uri = v }
    | _ ->
        assert false

let parse_generator generator tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "version"; `Namespace ""],
         GdataCore.Value.String v) ->
        { generator with GdataAtom.g_version = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "uri"; `Namespace ""],
         GdataCore.Value.String v) ->
        { generator with GdataAtom.g_uri = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Text],
         GdataCore.Value.String v) ->
        { generator with GdataAtom.g_value = v }
    | _ ->
        assert false

let parse_content content tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "src"; `Namespace ""],
         GdataCore.Value.String v) ->
        { content with GdataAtom.oolc_src = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "type"; `Namespace ""],
         GdataCore.Value.String v) ->
        { content with GdataAtom.oolc_type = v }
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
         cs) when ns = ns_atom ->
        parse_children
          parse_author
          GdataAtom.empty_author
          (fun author -> { entry with ce_authors = author :: entry.ce_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         cs) when ns = ns_atom ->
        parse_children
          parse_category
          GdataAtom.empty_category
          (fun category -> { entry with ce_categories = category :: entry.ce_categories })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = ns_atom ->
        parse_children
          parse_author
          GdataAtom.empty_author
          (fun contributor -> { entry with ce_contributors =
                                  contributor :: entry.ce_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
        { entry with ce_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "content"; `Namespace ns],
         cs) when ns = ns_atom ->
        parse_children
          parse_content
          GdataAtom.empty_content
          (fun content -> { entry with ce_content = content })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "published"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
        { entry with ce_published = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
        { entry with ce_updated = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "edited"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_app ->
        { entry with ce_updated = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "accesslevel"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = ns_gCal ->
        { entry with ce_accesslevel = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = ns_atom ->
        parse_children
          parse_link
          empty_link
          (fun link -> { entry with ce_links = link :: entry.ce_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "where"; `Namespace ns],
         cs) when ns = ns_gd ->
        parse_children
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
         cs) when ns = ns_atom ->
        parse_children
          parse_text
          GdataAtom.empty_text
          (fun summary -> { entry with ce_summary = summary })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = ns_atom ->
        parse_children
          parse_text
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
         cs) when ns = ns_atom ->
        parse_children
          parse_author
          GdataAtom.empty_author
          (fun author -> { feed with cf_authors = author :: feed.cf_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         cs) when ns = ns_atom ->
        parse_children
          parse_category
          GdataAtom.empty_category
          (fun category -> { feed with cf_categories = category :: feed.cf_categories })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = ns_atom ->
        parse_children
          parse_author
          GdataAtom.empty_author
          (fun contributor -> { feed with cf_contributors =
                                  contributor :: feed.cf_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "generator"; `Namespace ns],
         cs) when ns = ns_atom ->
        parse_children
          parse_generator
          GdataAtom.empty_generator
          (fun generator -> { feed with cf_generator = generator })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
        { feed with cf_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
        { feed with cf_updated = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "entry"; `Namespace ns],
         cs) when ns = ns_atom ->
        parse_children
          parse_entry
          empty_entry
          (fun entry -> { feed with cf_entries = entry :: feed.cf_entries })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = ns_atom ->
        parse_children
          parse_link
          empty_link
          (fun link -> { feed with cf_links = link :: feed.cf_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = ns_atom ->
        parse_children
          parse_text
          GdataAtom.empty_text
          (fun title -> { feed with cf_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "itemsPerPage"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_openSearch ->
        { feed with cf_itemsPerPage = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "startIndex"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_openSearch ->
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
           cs) when ns = ns_atom ->
          parse_children
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
           cs) when ns = ns_atom ->
          parse_children
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
let tree_of_calendar_entry entry =
  let render_attribute ?(default = "") namespace name value =
    if value <> default then
      [GdataCore.AnnotatedTree.Leaf (
        [`Attribute; `Name name; `Namespace namespace],
        GdataCore.Value.String value)]
    else
      []
  in

  let render_text ?(default = "") value =
    if value <> default then
      [GdataCore.AnnotatedTree.Leaf (
        [`Text],
        GdataCore.Value.String value)]
    else
      []
  in
 
  let render_text_element ?(default = "") namespace name value =
    if value <> default then
      [GdataCore.AnnotatedTree.Node (
        [`Element; `Name name; `Namespace namespace],
        render_text ~default value)]
    else
      []
  in

  let render_element namespace name children_list =
    let children = List.concat children_list in
      if children <> [] then
        [GdataCore.AnnotatedTree.Node (
          [`Element; `Name name; `Namespace namespace],
          children)]
      else
        []
  in

  let render_element_list render element_list =
    element_list
      |> List.map render
      |> List.concat
  in

  let render_value ?default ?(attribute = "value") namespace name value =
    render_element namespace name
      [render_attribute ?default "" attribute value]
  in

  let render_author element_name author =
    render_element ns_atom element_name
      [render_attribute Xmlm.ns_xml "lang" author.GdataAtom.a_lang;
       render_text_element ns_atom "email" author.GdataAtom.a_email;
       render_text_element ns_atom "name" author.GdataAtom.a_name;
       render_text_element ns_atom "uri" author.GdataAtom.a_uri]
  in

  let render_category category =
    render_element ns_atom "category"
      [render_attribute "" "label" category.GdataAtom.c_label;
       render_attribute "" "scheme" category.GdataAtom.c_scheme;
       render_attribute "" "term" category.GdataAtom.c_term;
       render_attribute Xmlm.ns_xml "lang" category.GdataAtom.c_lang]
  in

  let render_content content =
    render_element ns_atom "content"
      [render_attribute "" "src" content.GdataAtom.oolc_src;
       render_attribute "" "type" content.GdataAtom.oolc_type]
  in

  let render_link link =
    let render_webContent webContent =
      let render_webContentGadgetPref webContentGadgetPref =
        render_element ns_gCal "webContentGadgetPref"
          [render_attribute "" "name" webContentGadgetPref.wcgp_name;
           render_attribute "" "value" webContentGadgetPref.wcgp_value]
      in

      render_element ns_gCal "webContent"
        [render_attribute ~default:"0" "" "height" (string_of_int webContent.wc_height);
         render_attribute "" "url" webContent.wc_url;
         render_attribute ~default:"0" "" "width" (string_of_int webContent.wc_width);
         render_element_list render_webContentGadgetPref webContent.wc_webContentGadgetPrefs]
    in

    render_element ns_atom "link"
      [render_attribute "" "href" link.cl_href;
       render_attribute ~default:"0" "" "length" (Int64.to_string link.cl_length);
       render_attribute "" "rel" link.cl_rel;
       render_attribute "" "title" link.cl_title;
       render_attribute "" "type" link.cl_type;
       render_webContent link.cl_webContent]
  in

  let render_where where =
    render_value ~attribute:"valueString" ns_gd "where" where
  in

  let render_text_construct name text_construct =
    render_element ns_atom name
      [render_attribute "" "src" text_construct.GdataAtom.tc_src;
       render_attribute "" "type" text_construct.GdataAtom.tc_type;
       render_attribute Xmlm.ns_xml "lang" text_construct.GdataAtom.tc_lang;
       render_text text_construct.GdataAtom.tc_value]
  in

  let entry_element =
    (* TODO: better namespace handling *)
    render_element ns_atom "entry"
      [render_attribute Xmlm.ns_xmlns "xmlns" ns_atom;
       render_attribute Xmlm.ns_xmlns "gCal" ns_gCal;
       render_attribute Xmlm.ns_xmlns "gd" ns_gd;
       render_attribute Xmlm.ns_xmlns "app" ns_app;
       render_attribute ns_gd "kind" entry.ce_kind;
       render_element_list (render_author "author") entry.ce_authors;
       render_element_list render_category entry.ce_categories;
       render_element_list (render_author "contributor") entry.ce_contributors;
       render_text_element ns_atom "id" entry.ce_id;
       render_content entry.ce_content;
       render_text_element ns_atom "published" entry.ce_published;
       render_text_element ns_atom "updated" entry.ce_updated;
       render_text_element ns_app "edited" entry.ce_edited;
       render_value ns_gCal "accesslevel" entry.ce_accesslevel;
       render_element_list render_link entry.ce_links;
       render_element_list render_where entry.ce_where;
       render_value ns_gCal "color" entry.ce_color;
       render_value ns_gCal "hidden" (string_of_bool entry.ce_hidden);
       render_value ns_gCal "selected" (string_of_bool entry.ce_selected);
       render_value ns_gCal "timezone" entry.ce_timezone;
       render_value ~default:"0" ns_gCal "timesCleaned" (string_of_int entry.ce_timesCleaned);
       render_text_construct "summary" entry.ce_summary;
       render_text_construct "title" entry.ce_title;
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
           cs) when ns = ns_atom ->
          List.iter parse_entry cs
      | _ ->
          ()
  in

  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feed"; `Namespace ns],
           cs) when ns = ns_atom ->
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

