(** Defines basic ATOM data structures (e.g., feed, author, title).
  *)

module type AtomData =
sig
  type t

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

val ns_atom : string
val ns_app : string
val ns_openSearch : string
val ns_gd : string

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

val parse_children :
  ('a -> 'b -> 'a) -> 'a -> ('a -> 'c) -> 'b list -> 'c

val data_model_to_entry :
  ?element_name:string ->
  ?element_namespace:string ->
  ('a -> GdataCore.xml_data_model -> 'a) ->
  'a ->
  GdataCore.xml_data_model ->
  'a

val render_attribute :
  ?default:string ->
  string ->
  string ->
  string ->
  GdataCore.xml_data_model list

val render_generic_attribute :
  ('a -> string) ->
  'a ->
  string ->
  string ->
  'a ->
  GdataCore.xml_data_model list

val render_int_attribute :
  ?default:int ->
  string ->
  string ->
  int ->
  GdataCore.xml_data_model list

val render_bool_attribute :
  ?default:bool ->
  string ->
  string ->
  bool ->
  GdataCore.xml_data_model list

val render_date_attribute :
  ?default:GapiDate.t ->
  string ->
  string ->
  GapiDate.t ->
  GdataCore.xml_data_model list

val render_text :
  ?default:string ->
  string ->
  GdataCore.xml_data_model list

val render_text_element :
  ?default:string ->
  string ->
  string ->
  string ->
  GdataCore.xml_data_model list

val render_int_element :
  string ->
  string ->
  int ->
  GdataCore.xml_data_model list

val render_int64_element :
  string ->
  string ->
  int64 ->
  GdataCore.xml_data_model list

val render_date_element :
  string ->
  string ->
  GapiDate.t ->
  GdataCore.xml_data_model list

val render_bool_empty_element :
  string ->
  string ->
  bool ->
  GdataCore.xml_data_model list

val render_empty_element :
  string ->
  string ->
  GdataCore.xml_data_model list

val render_element :
  string ->
  string ->
  GdataCore.xml_data_model list list ->
  GdataCore.xml_data_model list

val render_element_list : ('a -> 'b list) -> 'a list -> 'b list

val render_value :
  ?default:string ->
  ?attribute:string ->
  string ->
  string ->
  string ->
  GdataCore.xml_data_model list

val render_int_value :
  ?attribute:string ->
  string ->
  string ->
  int ->
  GdataCore.xml_data_model list

val render_bool_value :
  ?attribute:string ->
  string ->
  string ->
  bool ->
  GdataCore.xml_data_model list

val element_to_data_model :
  (string -> string) ->
  ('a -> GdataCore.xml_data_model list) ->
  'a ->
  GdataCore.xml_data_model

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

module MakePersonConstruct :
  functor (M : sig val element_ns : string val element_name : string end) ->
  PersonConstruct

module Author : PersonConstruct

module Contributor : PersonConstruct

module Category :
sig
  type t = {
    label : string;
    scheme : string;
    term : string;
    lang : string;
  }

  val label : (t, string) GapiLens.t
  val scheme : (t, string) GapiLens.t
  val term : (t, string) GapiLens.t
  val lang : (t, string) GapiLens.t

  include AtomData with type t := t

end

module Generator :
sig
  type t = {
    uri : string;
    version : string;
    value : string;
  }

  val uri : (t, string) GapiLens.t
  val version : (t, string) GapiLens.t
  val value : (t, string) GapiLens.t

  include AtomData with type t := t

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

module MakeTextConstruct :
  functor (M : sig val element_name : string end) -> TextConstruct

module Content : TextConstruct

module Title : TextConstruct

module Subtitle : TextConstruct

module Summary : TextConstruct

module Rights : TextConstruct

module Link :
sig
  type t = {
    href : string;
    length : Int64.t;
    rel : string;
    title : string;
    _type : string;
  }

  val href : (t, string) GapiLens.t
  val length : (t, Int64.t) GapiLens.t
  val rel : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t

  include AtomData with type t := t

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

module MakeFeed :
  functor (Entry : AtomData) ->
  functor (Link : AtomData) ->
  functor (Extensions : AtomData) ->
  Feed
    with type entry_t = Entry.t
      and type link_t = Link.t
      and type extensions_t = Extensions.t

module BasicEntry :
sig
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

  val etag : (t, string) GapiLens.t
  val id : (t, atom_id) GapiLens.t
  val title : (t, Title.t) GapiLens.t
  val published : (t, atom_published) GapiLens.t
  val authors : (t, Author.t list) GapiLens.t
  val updated : (t, atom_updated) GapiLens.t
  val edited : (t, app_edited) GapiLens.t
  val categories : (t, Category.t list) GapiLens.t
  val content : (t, Content.t) GapiLens.t
  val links : (t, Link.t list) GapiLens.t

  include AtomData with type t := t

  val node_matches : (string * string) -> bool

end

module GenericExtensions :
  AtomData with type t = GdataCore.xml_data_model list

module Rel :
sig
  type t =
    [ `Self
    | `Alternate
    | `Edit
    | `EditMedia ]

  val to_string : [> t] -> string

end

val find_url : Rel.t -> Link.t list -> string

val get_standard_prefix : string -> string

