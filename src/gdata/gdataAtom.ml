open GapiUtils.Infix

module type ATOMDATA =
sig
  type t

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

(* Atom simple types *)
let ns_atom = "http://www.w3.org/2005/Atom"
let ns_app = "http://www.w3.org/2007/app"
let ns_openSearch = "http://a9.com/-/spec/opensearch/1.1/"
let ns_gd = "http://schemas.google.com/g/2005"
let ns_batch = "http://schemas.google.com/gdata/batch"

type atom_email = string

type atom_name = string

type atom_uri = string

type atom_id = string

type atom_icon = string

type atom_logo = string

type atom_published = GapiDate.t

type atom_updated = GapiDate.t

type opensearch_itemsPerPage = int

type opensearch_startIndex = int

type opensearch_totalResults = int

type app_edited = GapiDate.t
(* END Atom simple types *)

(* Parsing *)
let parse_children parse_child empty_element update cs =
  let element = List.fold_left
                  parse_child
                  empty_element
                  cs
  in
    update element

let data_model_to_entry
      ?(element_name = "entry")
      ?(element_namespace = ns_atom)
      entry_of_xml_data_model
      empty_entry
      tree =
  let parse_root tree =
    match tree with
        GapiCore.AnnotatedTree.Node
          ([`Element; `Name element_name; `Namespace ns],
           cs) when ns = element_namespace ->
          parse_children
            entry_of_xml_data_model
            empty_entry
            Std.identity
            cs
      | e ->
          GdataUtils.unexpected e
  in
    parse_root tree
(* END Parsing *)

(* Rendering *)
let render_attribute ?(default = "") namespace name value =
  if value <> default then
    [GapiCore.AnnotatedTree.Leaf (
      [`Attribute; `Name name; `Namespace namespace],
      value)]
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

let render_date_attribute ?(default = GapiDate.epoch) namespace name value =
  render_generic_attribute
    GapiDate.to_string
    default
    namespace
    name
    value

let render_text ?(default = "") value =
  if value <> default then
    [GapiCore.AnnotatedTree.Leaf (
      [`Text],
      value)]
  else
    []

let render_text_element ?(default = "") namespace name value =
  if value <> default then
    [GapiCore.AnnotatedTree.Node (
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
    ~default:(GapiDate.to_string GapiDate.epoch)
    namespace
    name
    (GapiDate.to_string value)

let render_element namespace name children_list =
  let children = List.concat children_list in
    if children <> [] then
      [GapiCore.AnnotatedTree.Node (
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

let element_to_data_model get_prefix render_element element =
  let xml_element = render_element element |> List.hd in
  let ns_table = GdataUtils.build_namespace_table get_prefix xml_element in
    GdataUtils.append_namespaces ns_table xml_element
(* END Rendering *)

(* Atom complex types *)
module type PERSONCONSTRUCT =
sig
  type t = {
    lang : string;
    email : atom_email;
    name : atom_name;
    uri : atom_uri
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module MakePersonConstruct
  (M : sig val element_name : string end) =
struct
  type t = {
    lang : string;
    email : atom_email;
    name : atom_name;
    uri : atom_uri
  }

  let empty = {
    lang = "";
    email = "";
    name = "";
    uri = ""
  }

  let to_xml_data_model person =
    render_element ns_atom M.element_name
      [render_attribute Xmlm.ns_xml "lang" person.lang;
       render_text_element ns_atom "email" person.email;
       render_text_element ns_atom "name" person.name;
       render_text_element ns_atom "uri" person.uri]

  let of_xml_data_model person tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "lang"; `Namespace ns],
           v) when ns = Xmlm.ns_xml ->
          { person with lang = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "name"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_atom ->
          { person with name = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "email"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_atom ->
          { person with email = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "uri"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_atom ->
          { person with uri = v }
      | e ->
          GdataUtils.unexpected e

end

module Author =
  MakePersonConstruct(struct let element_name = "author" end)

module Contributor =
  MakePersonConstruct(struct let element_name = "contributor" end)

module Category =
struct
  type t = {
    label : string;
    scheme : string;
    term : string;
    lang : string;
  }

  let empty = {
    label = "";
    scheme = "";
    term = "";
    lang = ""
  }

  let to_xml_data_model category =
    render_element ns_atom "category"
      [render_attribute "" "label" category.label;
       render_attribute "" "scheme" category.scheme;
       render_attribute "" "term" category.term;
       render_attribute Xmlm.ns_xml "lang" category.lang]

  let of_xml_data_model category tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "label"; `Namespace ""],
           v) ->
          { category with label = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "scheme"; `Namespace ""],
           v) ->
          { category with scheme = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "term"; `Namespace ""],
           v) ->
          { category with term = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "lang"; `Namespace ns],
           v) when ns = Xmlm.ns_xml ->
          { category with lang = v }
      | e ->
          GdataUtils.unexpected e

end

module Generator =
struct
  type t = {
    uri : string;
    version : string;
    value : string
  }

  let empty = {
    uri = "";
    version = "";
    value = ""
  }

  let to_xml_data_model generator =
    render_element ns_atom "generator"
      [render_attribute "" "version" generator.version;
       render_attribute "" "uri" generator.uri;
       render_text generator.value]

  let of_xml_data_model generator tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "version"; `Namespace ""],
           v) ->
          { generator with version = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "uri"; `Namespace ""],
           v) ->
          { generator with uri = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Text],
           v) ->
          { generator with value = v }
      | e ->
          GdataUtils.unexpected e

end

module type TEXTCONSTRUCT =
sig
  type t = {
    src : string;
    _type : string;
    lang : string;
    value : string
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module MakeTextConstruct
  (M : sig val element_name : string end) =
struct
  type t = {
    src : string;
    _type : string;
    lang : string;
    value : string
  }

  let empty = {
    src = "";
    _type = "";
    lang = "";
    value = ""
  }

  let to_xml_data_model text_construct =
    render_element ns_atom M.element_name
      [render_attribute "" "src" text_construct.src;
       render_attribute "" "type" text_construct._type;
       render_attribute Xmlm.ns_xml "lang" text_construct.lang;
       render_text text_construct.value]

  let of_xml_data_model text tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "src"; `Namespace ""],
           v) ->
          { text with src = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "type"; `Namespace ""],
           v) ->
          { text with _type = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "lang"; `Namespace ns],
           v) when ns = Xmlm.ns_xml ->
          { text with lang = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Text],
           v) ->
          { text with value = v }
      | e ->
          GdataUtils.unexpected e

end

module Content =
  MakeTextConstruct(struct let element_name = "content" end)

module Title =
  MakeTextConstruct(struct let element_name = "title" end)

module Subtitle =
  MakeTextConstruct(struct let element_name = "subtitle" end)

module Summary =
  MakeTextConstruct(struct let element_name = "summary" end)

module Rights =
  MakeTextConstruct(struct let element_name = "rights" end)

module Link =
struct
  type t = {
    href : string;
    length : Int64.t;
    rel : string;
    title : string;
    _type : string
  }

  let empty = {
    href = "";
    length = 0L;
    rel = "";
    title = "";
    _type = ""
  }

  let to_xml_data_model link =
    render_element ns_atom "link"
      [render_attribute "" "href" link.href;
       render_generic_attribute Int64.to_string Int64.zero "" "length" link.length;
       render_attribute "" "rel" link.rel;
       render_attribute "" "title" link.title;
       render_attribute "" "type" link._type]

  let of_xml_data_model link tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "href"; `Namespace ""],
           v) ->
          { link with href = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "length"; `Namespace ""],
           v) ->
          { link with length = Int64.of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "rel"; `Namespace ""],
           v) ->
          { link with rel = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "title"; `Namespace ""],
           v) ->
          { link with title = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "type"; `Namespace ""],
           v) ->
          { link with _type = v }
      | e ->
          GdataUtils.unexpected e

end

module type FEED =
sig
  type entry_t

  type link_t

  type t = {
    etag : string;
    kind : string;
    authors : Author.t list;
    categories : Category.t list;
    contributors : Contributor.t list;
    generator : Generator.t;
    icon : atom_icon;
    id : atom_id;
    updated : atom_updated;
    entries : entry_t list;
    links : link_t list;
    logo : atom_logo;
    rights : Rights.t;
    subtitle : Subtitle.t;
    title : Title.t;
    totalResults : opensearch_totalResults;
    itemsPerPage : opensearch_itemsPerPage;
    startIndex : opensearch_startIndex;
    extensions : GdataCore.xml_data_model list
  }

  val empty : t

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val parse_feed : GdataCore.xml_data_model -> t

end

module MakeFeed
  (Entry : ATOMDATA)
  (Link : ATOMDATA) =
struct
  type entry_t = Entry.t

  type link_t = Link.t

  type t = {
    etag : string;
    kind : string;
    authors : Author.t list;
    categories : Category.t list;
    contributors : Contributor.t list;
    generator : Generator.t;
    icon : atom_icon;
    id : atom_id;
    updated : atom_updated;
    entries : entry_t list;
    links : link_t list;
    logo : atom_logo;
    rights : Rights.t;
    subtitle : Subtitle.t;
    title : Title.t;
    totalResults : opensearch_totalResults;
    itemsPerPage : opensearch_itemsPerPage;
    startIndex : opensearch_startIndex;
    extensions : GdataCore.xml_data_model list
  }

  let empty = {
    etag = "";
    kind = "";
    authors = [];
    categories = [];
    contributors = [];
    generator = Generator.empty;
    icon = "";
    id = "";
    updated = GapiDate.epoch;
    entries = [];
    links = [];
    logo = "";
    rights = Rights.empty;
    subtitle = Subtitle.empty;
    title = Title.empty;
    totalResults = 0;
    itemsPerPage = 0;
    startIndex = 0;
    extensions = []
  }

  let of_xml_data_model feed tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "etag"; `Namespace ns],
           v) when ns = ns_gd ->
          { feed with etag = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "kind"; `Namespace ns],
           v) when ns = ns_gd ->
          { feed with kind = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "author"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Author.of_xml_data_model
            Author.empty
            (fun author -> { feed with authors = author :: feed.authors })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Category.of_xml_data_model
            Category.empty
            (fun category -> { feed with categories = category :: feed.categories })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "contributor"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Contributor.of_xml_data_model
            Contributor.empty
            (fun contributor -> { feed with contributors =
                                    contributor :: feed.contributors })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "generator"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Generator.of_xml_data_model
            Generator.empty
            (fun generator -> { feed with generator = generator })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "icon"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_atom ->
          { feed with icon = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "id"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_atom ->
          { feed with id = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "updated"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_atom ->
          { feed with updated = GapiDate.of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "entry"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Entry.of_xml_data_model
            Entry.empty
            (fun entry -> { feed with entries = entry :: feed.entries })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "link"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Link.of_xml_data_model
            Link.empty
            (fun link -> { feed with links = link :: feed.links })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "logo"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_atom ->
          { feed with logo = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "rights"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Rights.of_xml_data_model
            Rights.empty
            (fun rights -> { feed with rights = rights })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "subtitle"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Subtitle.of_xml_data_model
            Subtitle.empty
            (fun subtitle -> { feed with subtitle = subtitle })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Title.of_xml_data_model
            Title.empty
            (fun title -> { feed with title = title })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "totalResults"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_openSearch ->
          { feed with totalResults = int_of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "itemsPerPage"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_openSearch ->
          { feed with itemsPerPage = int_of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "startIndex"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_openSearch ->
          { feed with startIndex = int_of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          feed
      | extension ->
          let extensions = extension :: feed.extensions in
            { feed with extensions = extensions }

  let to_xml_data_model feed =
    render_element ns_atom "feed"
      [render_attribute ns_gd "etag" feed.etag;
       render_attribute ns_gd "kind" feed.kind;
       render_element_list Author.to_xml_data_model feed.authors;
       render_element_list Category.to_xml_data_model feed.categories;
       render_element_list Contributor.to_xml_data_model feed.contributors;
       Generator.to_xml_data_model feed.generator;
       render_text_element ns_atom "icon" feed.icon;
       render_text_element ns_atom "id" feed.id;
       render_date_element ns_atom "updated" feed.updated;
       render_element_list Entry.to_xml_data_model feed.entries;
       render_element_list Link.to_xml_data_model feed.links;
       render_text_element ns_atom "logo" feed.logo;
       Rights.to_xml_data_model feed.rights;
       Title.to_xml_data_model feed.title;
       Subtitle.to_xml_data_model feed.subtitle;
       render_int_element ns_openSearch "totalResults" feed.totalResults;
       render_int_element ns_openSearch "itemsPerPage" feed.itemsPerPage;
       render_int_element ns_openSearch "startIndex" feed.startIndex;
       feed.extensions]

  let parse_feed tree =
    let parse_root tree =
      match tree with
          GapiCore.AnnotatedTree.Node
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
(* END Atom complex types *)

(* Utilities *)
module Rel =
struct
  type t =
    [ `Self
    | `Alternate
    | `Edit
    | `Feed
    | `Post
    | `Batch ]

  let to_string l  =
    match l with
        `Self -> "self"
      | `Alternate -> "alternate"
      | `Edit -> "edit"
      | `Feed -> ns_gd ^ "#feed"
      | `Post -> ns_gd ^ "#post"
      | `Batch -> ns_gd ^ "#batch"
      | _ -> failwith "BUG: Unexpected Rel value (GdataAtom)"

end

let find_url rel links =
  let rel_string = Rel.to_string rel in
  let link =
    try
      List.find
        (fun link ->
           link.Link.rel = rel_string)
        links
    with Not_found ->
      failwith ("Link relation " ^ rel_string ^ " not found")
  in
    link.Link.href

let get_standard_prefix namespace =
  if namespace = ns_atom then "xmlns"
  else if namespace = ns_app then "app"
  else if namespace = ns_openSearch then "openSearch"
  else if namespace = ns_gd then "gd"
  else if namespace = ns_batch then "batch"
  else ""
(* END Utilities *)

