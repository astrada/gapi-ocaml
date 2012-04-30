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
val ns_batch : string

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

val parse_children : ('a -> 'b -> 'a) -> 'a -> ('a -> 'c) -> 'b list -> 'c

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
    uri : atom_uri
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

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
    lang : string
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module Generator :
sig
  type t = {
    uri : string;
    version : string;
    value : string
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module type TextConstruct =
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
    _type : string
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module LastModifiedBy : PersonConstruct

module type Feed =
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

module MakeFeed :
  functor (Entry : AtomData) ->
  functor (Link : AtomData) ->
  Feed
    with type entry_t = Entry.t
      and type link_t = Link.t


module Rel :
sig
  type t =
    [ `Self
    | `Alternate
    | `Edit
    | `EditMedia
    | `Feed
    | `Post
    | `Batch
    | `ResumableCreateMedia
    | `ResumableEditMedia ]

  val to_string : [> t] -> string

end

val find_url : Rel.t -> Link.t list -> string

val get_standard_prefix : string -> string

