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

type atom_link = {
  l_href : string;
  l_length : Int64.t;
  l_rel : string;
  l_title : string;
  l_type : string
}

val empty_link : atom_link

type opensearch_itemsPerPage = int

type opensearch_startIndex = int

type opensearch_totalResults = int

type app_edited = GdataDate.t

val parse_children : ('a -> 'b -> 'a) -> 'a -> ('a -> 'c) -> 'b list -> 'c

val parse_category :
  atom_category ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  atom_category

val parse_text :
  atom_textConstruct ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  atom_textConstruct

val parse_author :
  atom_author ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  atom_author

val parse_generator :
  atom_generator ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  atom_generator

val parse_content :
  atom_content ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  atom_content

val parse_link :
  atom_link ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  atom_link

val render_attribute :
  ?default:string ->
  string ->
  string ->
  string ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_generic_attribute :
  ('a -> string) ->
  'a ->
  string ->
  string ->
  'a ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_int_attribute :
  ?default:int ->
  string ->
  string ->
  int ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_bool_attribute :
  ?default:bool ->
  string ->
  string ->
  bool ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_date_attribute :
  ?default:GdataDate.t ->
  string ->
  string ->
  GdataDate.t ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_text :
  ?default:string ->
  string ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_text_element :
  ?default:string ->
  string ->
  string ->
  string ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_int_element :
  string ->
  string ->
  int ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_date_element :
  string ->
  string ->
  GdataDate.t ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_element :
  string ->
  string ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list list ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_element_list : ('a -> 'b list) -> 'a list -> 'b list

val render_value :
  ?default:string ->
  ?attribute:string ->
  string ->
  string ->
  string ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_int_value :
  ?attribute:string ->
  string ->
  string ->
  int ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_bool_value :
  ?attribute:string ->
  string ->
  string ->
  bool ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_author :
  string ->
  atom_author ->
  (GdataCore.Metadata.xml , GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_category :
  atom_category ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_content :
  atom_content ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_text_construct :
  string ->
  atom_textConstruct ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_generator :
  atom_generator ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

val render_link :
  atom_link ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

module Rel :
sig
  type t =
      Self
    | Alternate
    | Edit
    | Feed
    | Post
    | Batch
    | Acl

  val to_string : t -> string

end

val find_url : Rel.t -> atom_link list -> string

module Link :
sig
  type t = atom_link

  val empty : t

  val to_xml_data_model :
    t ->
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

  val of_xml_data_model :
    t ->
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t -> t

end

