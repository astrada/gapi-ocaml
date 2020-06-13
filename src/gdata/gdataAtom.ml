open GapiUtils.Infix

module type AtomData =
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
            Fun.id
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

let render_int64_element namespace name value =
  render_text_element
    ~default:"0"
    namespace
    name
    (Int64.to_string value)

let render_date_element namespace name value =
  render_text_element
    ~default:(GapiDate.to_string GapiDate.epoch)
    namespace
    name
    (GapiDate.to_string value)

let render_empty_element namespace name =
  [GapiCore.AnnotatedTree.Node (
    [`Element; `Name name; `Namespace namespace],
    [])]

let render_bool_empty_element namespace name value =
  if value then
    render_empty_element namespace name
  else
    []

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
module type PersonConstruct =
sig
  type t = {
    lang : string;
    email : atom_email;
    name : atom_name;
    uri : atom_uri;
  }

  val lang : (t, string) GapiLens.t
  val email : (t, atom_email) GapiLens.t
  val name : (t, atom_name) GapiLens.t
  val uri : (t, atom_uri) GapiLens.t

  include AtomData with type t := t

end

module MakePersonConstruct
  (M : sig val element_ns : string val element_name : string end) =
struct
  type t = {
    lang : string;
    email : atom_email;
    name : atom_name;
    uri : atom_uri;
  }

	let lang = {
		GapiLens.get = (fun x -> x.lang);
		GapiLens.set = (fun v x -> { x with lang = v })
	}
	let email = {
		GapiLens.get = (fun x -> x.email);
		GapiLens.set = (fun v x -> { x with email = v })
	}
	let name = {
		GapiLens.get = (fun x -> x.name);
		GapiLens.set = (fun v x -> { x with name = v })
	}
	let uri = {
		GapiLens.get = (fun x -> x.uri);
		GapiLens.set = (fun v x -> { x with uri = v })
	}

  let empty = {
    lang = "";
    email = "";
    name = "";
    uri = "";
  }

  let to_xml_data_model person =
    render_element M.element_ns M.element_name
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
  MakePersonConstruct(struct
                        let element_ns = ns_atom
                        let element_name = "author"
                      end)

module Contributor =
  MakePersonConstruct(struct
                        let element_ns = ns_atom
                        let element_name = "contributor"
                      end)

module Category =
struct
  type t = {
    label : string;
    scheme : string;
    term : string;
    lang : string;
  }

	let label = {
		GapiLens.get = (fun x -> x.label);
		GapiLens.set = (fun v x -> { x with label = v })
	}
	let scheme = {
		GapiLens.get = (fun x -> x.scheme);
		GapiLens.set = (fun v x -> { x with scheme = v })
	}
	let term = {
		GapiLens.get = (fun x -> x.term);
		GapiLens.set = (fun v x -> { x with term = v })
	}
	let lang = {
		GapiLens.get = (fun x -> x.lang);
		GapiLens.set = (fun v x -> { x with lang = v })
	}

  let empty = {
    label = "";
    scheme = "";
    term = "";
    lang = "";
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
    value : string;
  }

	let uri = {
		GapiLens.get = (fun x -> x.uri);
		GapiLens.set = (fun v x -> { x with uri = v })
	}
	let version = {
		GapiLens.get = (fun x -> x.version);
		GapiLens.set = (fun v x -> { x with version = v })
	}
	let value = {
		GapiLens.get = (fun x -> x.value);
		GapiLens.set = (fun v x -> { x with value = v })
	}

  let empty = {
    uri = "";
    version = "";
    value = "";
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

module type TextConstruct =
sig
  type t = {
    src : string;
    _type : string;
    lang : string;
    value : string;
  }

  val src : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val lang : (t, string) GapiLens.t
  val value : (t, string) GapiLens.t

  include AtomData with type t := t

end

module MakeTextConstruct
  (M : sig val element_name : string end) =
struct
  type t = {
    src : string;
    _type : string;
    lang : string;
    value : string;
  }

	let src = {
		GapiLens.get = (fun x -> x.src);
		GapiLens.set = (fun v x -> { x with src = v })
	}
	let _type = {
		GapiLens.get = (fun x -> x._type);
		GapiLens.set = (fun v x -> { x with _type = v })
	}
	let lang = {
		GapiLens.get = (fun x -> x.lang);
		GapiLens.set = (fun v x -> { x with lang = v })
	}
	let value = {
		GapiLens.get = (fun x -> x.value);
		GapiLens.set = (fun v x -> { x with value = v })
	}

  let empty = {
    src = "";
    _type = "";
    lang = "";
    value = "";
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
    _type : string;
  }

	let href = {
		GapiLens.get = (fun x -> x.href);
		GapiLens.set = (fun v x -> { x with href = v })
	}
	let length = {
		GapiLens.get = (fun x -> x.length);
		GapiLens.set = (fun v x -> { x with length = v })
	}
	let rel = {
		GapiLens.get = (fun x -> x.rel);
		GapiLens.set = (fun v x -> { x with rel = v })
	}
	let title = {
		GapiLens.get = (fun x -> x.title);
		GapiLens.set = (fun v x -> { x with title = v })
	}
	let _type = {
		GapiLens.get = (fun x -> x._type);
		GapiLens.set = (fun v x -> { x with _type = v })
	}

  let empty = {
    href = "";
    length = 0L;
    rel = "";
    title = "";
    _type = "";
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

module type Feed =
sig
  type entry_t

  type link_t

  type extensions_t

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
    extensions : extensions_t;
  }

  val etag : (t, string) GapiLens.t
  val kind : (t, string) GapiLens.t
  val authors : (t, Author.t list) GapiLens.t
  val categories : (t, Category.t list) GapiLens.t
  val contributors : (t, Contributor.t list) GapiLens.t
  val generator : (t, Generator.t) GapiLens.t
  val icon : (t, atom_icon) GapiLens.t
  val id : (t, atom_id) GapiLens.t
  val updated : (t, atom_updated) GapiLens.t
  val entries : (t, entry_t list) GapiLens.t
  val links : (t, link_t list) GapiLens.t
  val logo : (t, atom_logo) GapiLens.t
  val rights : (t, Rights.t) GapiLens.t
  val subtitle : (t, Subtitle.t) GapiLens.t
  val title : (t, Title.t) GapiLens.t
  val totalResults : (t, opensearch_totalResults) GapiLens.t
  val itemsPerPage : (t, opensearch_itemsPerPage) GapiLens.t
  val startIndex : (t, opensearch_startIndex) GapiLens.t
  val extensions : (t, extensions_t) GapiLens.t

  include AtomData with type t := t

  val parse_feed : GdataCore.xml_data_model -> t

end

module MakeFeed
  (Entry : AtomData)
  (Link : AtomData)
  (Extensions : AtomData) =
struct
  type entry_t = Entry.t

  type link_t = Link.t

  type extensions_t = Extensions.t

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
    extensions : extensions_t;
  }

	let etag = {
		GapiLens.get = (fun x -> x.etag);
		GapiLens.set = (fun v x -> { x with etag = v })
	}
	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let authors = {
		GapiLens.get = (fun x -> x.authors);
		GapiLens.set = (fun v x -> { x with authors = v })
	}
	let categories = {
		GapiLens.get = (fun x -> x.categories);
		GapiLens.set = (fun v x -> { x with categories = v })
	}
	let contributors = {
		GapiLens.get = (fun x -> x.contributors);
		GapiLens.set = (fun v x -> { x with contributors = v })
	}
	let generator = {
		GapiLens.get = (fun x -> x.generator);
		GapiLens.set = (fun v x -> { x with generator = v })
	}
	let icon = {
		GapiLens.get = (fun x -> x.icon);
		GapiLens.set = (fun v x -> { x with icon = v })
	}
	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let updated = {
		GapiLens.get = (fun x -> x.updated);
		GapiLens.set = (fun v x -> { x with updated = v })
	}
	let entries = {
		GapiLens.get = (fun x -> x.entries);
		GapiLens.set = (fun v x -> { x with entries = v })
	}
	let links = {
		GapiLens.get = (fun x -> x.links);
		GapiLens.set = (fun v x -> { x with links = v })
	}
	let logo = {
		GapiLens.get = (fun x -> x.logo);
		GapiLens.set = (fun v x -> { x with logo = v })
	}
	let rights = {
		GapiLens.get = (fun x -> x.rights);
		GapiLens.set = (fun v x -> { x with rights = v })
	}
	let subtitle = {
		GapiLens.get = (fun x -> x.subtitle);
		GapiLens.set = (fun v x -> { x with subtitle = v })
	}
	let title = {
		GapiLens.get = (fun x -> x.title);
		GapiLens.set = (fun v x -> { x with title = v })
	}
	let totalResults = {
		GapiLens.get = (fun x -> x.totalResults);
		GapiLens.set = (fun v x -> { x with totalResults = v })
	}
	let itemsPerPage = {
		GapiLens.get = (fun x -> x.itemsPerPage);
		GapiLens.set = (fun v x -> { x with itemsPerPage = v })
	}
	let startIndex = {
		GapiLens.get = (fun x -> x.startIndex);
		GapiLens.set = (fun v x -> { x with startIndex = v })
	}
	let extensions = {
		GapiLens.get = (fun x -> x.extensions);
		GapiLens.set = (fun v x -> { x with extensions = v })
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
    extensions = Extensions.empty;
  }

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
       Extensions.to_xml_data_model feed.extensions]

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
            (fun generator -> { feed with generator })
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
            (fun rights -> { feed with rights })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "subtitle"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Subtitle.of_xml_data_model
            Subtitle.empty
            (fun subtitle -> { feed with subtitle })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Title.of_xml_data_model
            Title.empty
            (fun title -> { feed with title })
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
          let extensions =
            Extensions.of_xml_data_model
              feed.extensions
              extension
          in
            { feed with extensions }

  let parse_feed tree =
    let parse_root tree =
      match tree with
          GapiCore.AnnotatedTree.Node
            ([`Element; `Name "feed"; `Namespace ns],
             cs) when ns = ns_atom ->
            parse_children
              of_xml_data_model
              empty
              Fun.id
              cs
        | e ->
            GdataUtils.unexpected e
    in
      parse_root tree

end

module BasicEntry =
struct
  type t = {
      etag : string;
      id : atom_id;
      title : Title.t;
      published : atom_published;
      authors : Author.t list;
      updated : atom_updated;
      edited : app_edited;
      categories : Category.t list;
      content : Content.t;
      links : Link.t list;
  }

	let etag = {
		GapiLens.get = (fun x -> x.etag);
		GapiLens.set = (fun v x -> { x with etag = v })
	}
	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let title = {
		GapiLens.get = (fun x -> x.title);
		GapiLens.set = (fun v x -> { x with title = v })
	}
	let published = {
		GapiLens.get = (fun x -> x.published);
		GapiLens.set = (fun v x -> { x with published = v })
	}
	let authors = {
		GapiLens.get = (fun x -> x.authors);
		GapiLens.set = (fun v x -> { x with authors = v })
	}
	let updated = {
		GapiLens.get = (fun x -> x.updated);
		GapiLens.set = (fun v x -> { x with updated = v })
	}
	let edited = {
		GapiLens.get = (fun x -> x.edited);
		GapiLens.set = (fun v x -> { x with edited = v })
	}
	let categories = {
		GapiLens.get = (fun x -> x.categories);
		GapiLens.set = (fun v x -> { x with categories = v })
	}
	let content = {
		GapiLens.get = (fun x -> x.content);
		GapiLens.set = (fun v x -> { x with content = v })
	}
	let links = {
		GapiLens.get = (fun x -> x.links);
		GapiLens.set = (fun v x -> { x with links = v })
	}

  let empty = {
    etag = "";
    id = "";
    title = Title.empty;
    published = GapiDate.epoch;
    authors = [];
    updated = GapiDate.epoch;
    edited = GapiDate.epoch;
    categories = [];
    content = Content.empty;
    links = [];
  }

  let to_xml_data_model entry =
    List.concat
      [render_attribute ns_gd "etag" entry.etag;
       render_text_element ns_atom "id" entry.id;
       Title.to_xml_data_model entry.title;
       render_date_element ns_atom "published" entry.published;
       render_element_list Author.to_xml_data_model entry.authors;
       render_date_element ns_atom "updated" entry.updated;
       render_date_element ns_app "edited" entry.edited;
       render_element_list Category.to_xml_data_model entry.categories;
       Content.to_xml_data_model entry.content;
       render_element_list Link.to_xml_data_model entry.links]

  let of_xml_data_model entry tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "etag"; `Namespace ns],
           v) when ns = ns_gd ->
          { entry with etag = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "id"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_atom ->
          { entry with id = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Title.of_xml_data_model
            Title.empty
            (fun title -> { entry with title })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "published"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_atom ->
          { entry with published = GapiDate.of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "author"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Author.of_xml_data_model
            Author.empty
            (fun author -> { entry with authors = author :: entry.authors })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "updated"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_atom ->
          { entry with updated = GapiDate.of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "edited"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_app ->
          { entry with edited = GapiDate.of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "edited"; `Namespace ns],
           [_; GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_app ->
          (* parse <app:edited xmlns:app="...">...</app:edited> *)
          { entry with edited = GapiDate.of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Category.of_xml_data_model
            Category.empty
            (fun category -> { entry with categories = category :: entry.categories })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "content"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Content.of_xml_data_model
            Content.empty
            (fun content -> { entry with content })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "link"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Link.of_xml_data_model
            Link.empty
            (fun link -> { entry with links = link :: entry.links })
            cs
      | e ->
          GdataUtils.unexpected e

  let node_matches = function
      ("etag", ns) when ns = ns_gd -> true
    | ("id", ns)
    | ("title", ns)
    | ("published", ns)
    | ("author", ns)
    | ("updated", ns)
    | ("category", ns)
    | ("content", ns)
    | ("link", ns) when ns = ns_atom -> true
    | ("edited", ns) when ns = ns_app -> true
    | _ -> false

end
(* END Atom complex types *)

module GenericExtensions =
struct
  type t = GdataCore.xml_data_model list

  let empty = []

  let of_xml_data_model extensions tree = tree :: extensions

  let to_xml_data_model = Fun.id

end

(* Utilities *)
module type LinkRelation =
sig
  type t

  val to_string : t -> string

end

let find_url_generic (type s) rel_module rel links =
  let module LinkRel = (val rel_module : LinkRelation with type t = s) in
  let rel_string = LinkRel.to_string rel in
  let link =
    List.find
      (fun link ->
         link.Link.rel = rel_string)
      links
  in
    link.Link.href

module Rel =
struct
  type t =
    [ `Self
    | `Alternate
    | `Edit
    | `EditMedia ]

  let to_string l  =
    match l with
        `Self -> "self"
      | `Alternate -> "alternate"
      | `Edit -> "edit"
      | `EditMedia -> "edit-media"
      | _ -> failwith "BUG: Unexpected Rel value (GdataAtom)"

end

let find_url rel links =
  find_url_generic (module Rel : LinkRelation with type t = Rel.t) rel links

let get_standard_prefix namespace =
  if namespace = ns_atom then "xmlns"
  else if namespace = ns_app then "app"
  else if namespace = ns_openSearch then "openSearch"
  else ""
(* END Utilities *)

