val ns_atom : string
val ns_app : string
val ns_openSearch : string
val ns_gd : string
val ns_gAcl : string

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

val empty_author : atom_author

type atom_category = {
  c_label : string;
  c_scheme : string;
  c_term : string;
  c_lang : string
}

val empty_category : atom_category

type atom_generator = {
  g_uri : string;
  g_version : string;
  g_value : string
}

val empty_generator : atom_generator

type atom_textConstruct = {
  tc_src : string;
  tc_type : string;
  tc_lang : string;
  tc_value : string
}

val empty_text : atom_textConstruct

type atom_content = atom_textConstruct

val empty_content : atom_content

type atom_contributor = atom_author

type opensearch_itemsPerPage = int

type opensearch_startIndex = int

type opensearch_totalResults = int

type app_edited = GdataDate.t

val parse_children : ('a -> 'b -> 'a) -> 'a -> ('a -> 'c) -> 'b list -> 'c

val parse_category :
  atom_category ->
  GdataCore.xml_data_model ->
  atom_category

val parse_text :
  atom_textConstruct ->
  GdataCore.xml_data_model ->
  atom_textConstruct

val parse_author :
  atom_author ->
  GdataCore.xml_data_model ->
  atom_author

val parse_generator :
  atom_generator ->
  GdataCore.xml_data_model ->
  atom_generator

val parse_content :
  atom_content ->
  GdataCore.xml_data_model ->
  atom_content

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
  ?default:GdataDate.t ->
  string ->
  string ->
  GdataDate.t ->
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

val render_date_element :
  string ->
  string ->
  GdataDate.t ->
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

val render_author :
  string ->
  atom_author ->
  GdataCore.xml_data_model list

val render_category :
  atom_category ->
  GdataCore.xml_data_model list

val render_content :
  atom_content ->
  GdataCore.xml_data_model list

val render_text_construct :
  string ->
  atom_textConstruct ->
  GdataCore.xml_data_model list

val render_generator :
  atom_generator ->
  GdataCore.xml_data_model list

val element_to_data_model :
  (string -> string) ->
  ('a -> GdataCore.xml_data_model list) ->
  'a ->
  GdataCore.xml_data_model

module Link :
sig
  type t = {
    href : string;
    length : Int64.t;
    rel : string;
    title : string;
    ltype : string
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module type FEED =
sig
  type entry_t

  type link_t

  type t = {
    etag : string;
    kind : string;
    authors : atom_author list;
    categories : atom_category list;
    contributors : atom_contributor list;
    generator : atom_generator;
    icon : atom_icon;
    id : atom_id;
    updated : atom_updated;
    entries : entry_t list;
    links : link_t list;
    logo : atom_logo;
    rights : atom_textConstruct;
    subtitle : atom_textConstruct;
    title : atom_textConstruct;
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
  functor (Entry : GdataCore.DATA) ->
  functor (Link : GdataCore.DATA) ->
sig
  include FEED
    with type entry_t = Entry.t
      and type link_t = Link.t

end

module Rel :
sig
  type t =
    [ `Self
    | `Alternate
    | `Edit
    | `Feed
    | `Post
    | `Batch
    | `Acl ]

  val to_string : [> t] -> string

end

val find_url : Rel.t -> Link.t list -> string

val get_standard_prefix : string -> string

