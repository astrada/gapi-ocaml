open GdataUtils.Op

(* Atom data types *)
let ns_atom = "http://www.w3.org/2005/Atom"
let ns_app = "http://www.w3.org/2007/app"
let ns_openSearch = "http://a9.com/-/spec/opensearch/1.1/"
let ns_gd = "http://schemas.google.com/g/2005"
let ns_gAcl = "http://schemas.google.com/acl/2007"

type atom_email = string

type atom_name = string

type atom_uri = string

type atom_id = string

type atom_icon = string

type atom_logo = string

type atom_published = GdataDate.t

type atom_updated = GdataDate.t

type atom_author = {
  a_lang : string;
  a_email : atom_email;
  a_name : atom_name;
  a_uri : atom_uri
}

let empty_author = {
  a_lang = "";
  a_email = "";
  a_name = "";
  a_uri = ""
}

type atom_category = {
  c_label : string;
  c_scheme : string;
  c_term : string;
  c_lang : string;
}

let empty_category = {
  c_label = "";
  c_scheme = "";
  c_term = "";
  c_lang = ""
}

type atom_generator = {
  g_uri : string;
  g_version : string;
  g_value : string
}

let empty_generator = {
  g_uri = "";
  g_version = "";
  g_value = ""
}

type atom_textConstruct = {
  tc_src : string;
  tc_type : string;
  tc_lang : string;
  tc_value : string
}

let empty_text = {
  tc_src = "";
  tc_type = "";
  tc_lang = "";
  tc_value = ""
}

type atom_content = atom_textConstruct

let empty_content = empty_text

type atom_contributor = atom_author

type atom_link = {
  l_href : string;
  l_length : Int64.t;
  l_rel : string;
  l_title : string;
  l_type : string
}

let empty_link = {
  l_href = "";
  l_length = 0L;
  l_rel = "";
  l_title = "";
  l_type = ""
}

type opensearch_itemsPerPage = int

type opensearch_startIndex = int

type opensearch_totalResults = int

type app_edited = GdataDate.t
(* END Atom data types *)

(* Parsing *)
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
        { category with c_label = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "scheme"; `Namespace ""],
         GdataCore.Value.String v) ->
        { category with c_scheme = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "term"; `Namespace ""],
         GdataCore.Value.String v) ->
        { category with c_term = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "lang"; `Namespace ns],
         GdataCore.Value.String v) when ns = Xmlm.ns_xml ->
        { category with c_lang = v }
    | e ->
        GdataUtils.unexpected e

let parse_text text tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "src"; `Namespace ""],
         GdataCore.Value.String v) ->
        { text with tc_src = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "type"; `Namespace ""],
         GdataCore.Value.String v) ->
        { text with tc_type = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "lang"; `Namespace ns],
         GdataCore.Value.String v) when ns = Xmlm.ns_xml ->
        { text with tc_lang = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Text],
         GdataCore.Value.String v) ->
        { text with tc_value = v }
    | e ->
        GdataUtils.unexpected e

let parse_author author tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "lang"; `Namespace ns],
         GdataCore.Value.String v) when ns = Xmlm.ns_xml ->
        { author with a_lang = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "name"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
        { author with a_name = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "email"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
        { author with a_email = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "uri"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
        { author with a_uri = v }
    | e ->
        GdataUtils.unexpected e

let parse_generator generator tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "version"; `Namespace ""],
         GdataCore.Value.String v) ->
        { generator with g_version = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "uri"; `Namespace ""],
         GdataCore.Value.String v) ->
        { generator with g_uri = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Text],
         GdataCore.Value.String v) ->
        { generator with g_value = v }
    | e ->
        GdataUtils.unexpected e

let parse_content = parse_text

let parse_link link tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "href"; `Namespace ""],
         GdataCore.Value.String v) ->
        { link with l_href = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "length"; `Namespace ""],
         GdataCore.Value.String v) ->
        { link with l_length = Int64.of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "rel"; `Namespace ""],
         GdataCore.Value.String v) ->
        { link with l_rel = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "title"; `Namespace ""],
         GdataCore.Value.String v) ->
        { link with l_title = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "type"; `Namespace ""],
         GdataCore.Value.String v) ->
        { link with l_type = v }
    | e ->
        GdataUtils.unexpected e
(* END Parsing *)

(* Rendering *)
let render_attribute ?(default = "") namespace name value =
  if value <> default then
    [GdataCore.AnnotatedTree.Leaf (
      [`Attribute; `Name name; `Namespace namespace],
      GdataCore.Value.String value)]
  else
    []

let render_generic_attribute to_string default namespace name value =
  let string_default = to_string default in
  let string_value = to_string value in
    render_attribute
      ~default:string_default
      namespace
      name
      string_value

let render_int_attribute ?(default = 0) namespace name value =
  render_generic_attribute
    string_of_int
    default
    namespace
    name
    value

let render_bool_attribute ?(default = false) namespace name value =
  render_generic_attribute
    string_of_bool
    default
    namespace
    name
    value

let render_date_attribute ?(default = GdataDate.epoch) namespace name value =
  render_generic_attribute
    GdataDate.to_string
    default
    namespace
    name
    value

let render_text ?(default = "") value =
  if value <> default then
    [GdataCore.AnnotatedTree.Leaf (
      [`Text],
      GdataCore.Value.String value)]
  else
    []

let render_text_element ?(default = "") namespace name value =
  if value <> default then
    [GdataCore.AnnotatedTree.Node (
      [`Element; `Name name; `Namespace namespace],
      render_text ~default value)]
  else
    []

let render_int_element namespace name value =
  render_text_element
    ~default:"0"
    namespace
    name
    (string_of_int value)

let render_date_element namespace name value =
  render_text_element
    ~default:(GdataDate.to_string GdataDate.epoch)
    namespace
    name
    (GdataDate.to_string value)

let render_element namespace name children_list =
  let children = List.concat children_list in
    if children <> [] then
      [GdataCore.AnnotatedTree.Node (
        [`Element; `Name name; `Namespace namespace],
        children)]
    else
      []

let render_element_list render element_list =
  element_list
    |> List.map render
    |> List.concat

let render_value ?default ?(attribute = "value") namespace name value =
  render_element namespace name
    [render_attribute ?default "" attribute value]

let render_int_value ?attribute namespace name value =
  render_value ~default:"0" ?attribute namespace name (string_of_int value)

let render_bool_value ?attribute namespace name value =
  render_value ~default:"false" ?attribute namespace name (string_of_bool value)

let render_author element_name author =
  render_element ns_atom element_name
    [render_attribute Xmlm.ns_xml "lang" author.a_lang;
     render_text_element ns_atom "email" author.a_email;
     render_text_element ns_atom "name" author.a_name;
     render_text_element ns_atom "uri" author.a_uri]

let render_category category =
  render_element ns_atom "category"
    [render_attribute "" "label" category.c_label;
     render_attribute "" "scheme" category.c_scheme;
     render_attribute "" "term" category.c_term;
     render_attribute Xmlm.ns_xml "lang" category.c_lang]

let render_text_construct name text_construct =
  render_element ns_atom name
    [render_attribute "" "src" text_construct.tc_src;
     render_attribute "" "type" text_construct.tc_type;
     render_attribute Xmlm.ns_xml "lang" text_construct.tc_lang;
     render_text text_construct.tc_value]

let render_content = render_text_construct "content"

let render_generator generator =
  render_element ns_atom "generator"
    [render_attribute "" "version" generator.g_version;
     render_attribute "" "uri" generator.g_uri;
     render_text generator.g_value]

let render_link link =
  render_element ns_atom "link"
    [render_attribute "" "href" link.l_href;
     render_generic_attribute Int64.to_string Int64.zero "" "length" link.l_length;
     render_attribute "" "rel" link.l_rel;
     render_attribute "" "title" link.l_title;
     render_attribute "" "type" link.l_type]
(* END Rendering *)

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
    | Acl

  let to_string l  =
    match l with
        Self -> "self"
      | Alternate -> "alternate"
      | Edit -> "edit"
      | Feed -> ns_gd ^ "#feed"
      | Post -> ns_gd ^ "#post"
      | Batch -> ns_gd ^ "#batch"
      | Acl -> ns_gAcl ^ "#accessControlList"

end

let find_url rel links =
  let link = List.find
               (fun link ->
                  link.l_rel = Rel.to_string rel)
               links
  in
    link.l_href
(* END Feed: utilities *)

module Link =
struct
  type t = atom_link

  let empty = empty_link

  let to_xml_data_model = render_link

  let of_xml_data_model = parse_link

end

module MakeFeed
  (Entry : GdataCore.DATA)
  (Link : GdataCore.DATA) =
struct
  type t = {
    f_etag : string;
    f_kind : string;
    f_authors : atom_author list;
    f_categories : atom_category list;
    f_contributors : atom_contributor list;
    f_generator : atom_generator;
    f_icon : atom_icon;
    f_id : atom_id;
    f_updated : atom_updated;
    f_entries : Entry.t list;
    f_links : Link.t list;
    f_logo : atom_logo;
    f_rights : atom_textConstruct;
    f_subtitle : atom_textConstruct;
    f_title : atom_textConstruct;
    f_totalResults : opensearch_totalResults;
    f_itemsPerPage : opensearch_itemsPerPage;
    f_startIndex : opensearch_startIndex;
    f_extensions : GdataCore.xml_data_model list
  }

  let empty = {
    f_etag = "";
    f_kind = "";
    f_authors = [];
    f_categories = [];
    f_contributors = [];
    f_generator = empty_generator;
    f_icon = "";
    f_id = "";
    f_updated = GdataDate.epoch;
    f_entries = [];
    f_links = [];
    f_logo = "";
    f_rights = empty_text;
    f_subtitle = empty_text;
    f_title = empty_text;
    f_totalResults = 0;
    f_itemsPerPage = 0;
    f_startIndex = 0;
    f_extensions = []
  }

  let of_xml_data_model feed tree =
    match tree with
        GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "etag"; `Namespace ns],
           GdataCore.Value.String v) when ns = ns_gd ->
          { feed with f_etag = v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "kind"; `Namespace ns],
           GdataCore.Value.String v) when ns = ns_gd ->
          { feed with f_kind = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "author"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            parse_author
            empty_author
            (fun author -> { feed with f_authors = author :: feed.f_authors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            parse_category
            empty_category
            (fun category -> { feed with f_categories = category :: feed.f_categories })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "contributor"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            parse_author
            empty_author
            (fun contributor -> { feed with f_contributors =
                                    contributor :: feed.f_contributors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "generator"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            parse_generator
            empty_generator
            (fun generator -> { feed with f_generator = generator })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "icon"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
          { feed with f_icon = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "id"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
          { feed with f_id = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "updated"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
          { feed with f_updated = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "entry"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Entry.of_xml_data_model
            Entry.empty
            (fun entry -> { feed with f_entries = entry :: feed.f_entries })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "link"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Link.of_xml_data_model
            Link.empty
            (fun link -> { feed with f_links = link :: feed.f_links })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "logo"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = ns_atom ->
          { feed with f_logo = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "rights"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            parse_text
            empty_text
            (fun rights -> { feed with f_rights = rights })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "subtitle"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            parse_text
            empty_text
            (fun subtitle -> { feed with f_subtitle = subtitle })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            parse_text
            empty_text
            (fun title -> { feed with f_title = title })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "totalResults"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = ns_openSearch ->
          { feed with f_totalResults = int_of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "itemsPerPage"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = ns_openSearch ->
          { feed with f_itemsPerPage = int_of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "startIndex"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = ns_openSearch ->
          { feed with f_startIndex = int_of_string v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          feed
      | extension ->
          let extensions = extension :: feed.f_extensions in
            { feed with f_extensions = extensions }

  let to_xml_data_model feed =
    render_element ns_atom "feed"
      [render_attribute Xmlm.ns_xmlns "xmlns" ns_atom;
       (* TODO: render_attribute Xmlm.ns_xmlns "gCal" ns_gCal;*)
       render_attribute Xmlm.ns_xmlns "gd" ns_gd;
       render_attribute Xmlm.ns_xmlns "app" ns_app;
       render_attribute ns_gd "etag" feed.f_etag;
       render_attribute ns_gd "kind" feed.f_kind;
       render_element_list (render_author "author") feed.f_authors;
       render_element_list render_category feed.f_categories;
       render_element_list (render_author "contributor") feed.f_contributors;
       render_generator feed.f_generator;
       render_text_element ns_atom "icon" feed.f_icon;
       render_text_element ns_atom "id" feed.f_id;
       render_date_element ns_atom "updated" feed.f_updated;
       render_element_list Entry.to_xml_data_model feed.f_entries;
       render_element_list Link.to_xml_data_model feed.f_links;
       render_text_element ns_atom "logo" feed.f_logo;
       render_text_construct "rights" feed.f_rights;
       render_text_construct "title" feed.f_title;
       render_text_construct "subtitle" feed.f_subtitle;
       render_int_element ns_openSearch "totalResults" feed.f_totalResults;
       render_int_element ns_openSearch "itemsPerPage" feed.f_itemsPerPage;
       render_int_element ns_openSearch "startIndex" feed.f_startIndex;
       feed.f_extensions]

  let parse_feed tree =
    let parse_root tree =
      match tree with
          GdataCore.AnnotatedTree.Node
            ([`Element; `Name "feed"; `Namespace ns],
             cs) when ns = ns_atom ->
            parse_children
              of_xml_data_model
              empty
              Std.identity
              cs
        | e ->
            GdataUtils.unexpected e
    in
      parse_root tree

end

