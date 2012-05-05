(** Google Data Protocol ACLs.
  *)

val ns_gAcl : string

module Scope :
sig
  type t = {
    _type : string;
    value : string
  }

  val empty : t

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

end

type acl_role = string

module Entry :
sig
  type t = {
    etag : string;
    kind : string;
    authors : GdataAtom.Author.t list;
    categories : GdataAtom.Category.t list;
    contributors : GdataAtom.Contributor.t list;
    id : GdataAtom.atom_id;
    content : GdataAtom.Content.t;
    published : GdataAtom.atom_published;
    updated : GdataAtom.atom_updated;
    edited : GdataAtom.app_edited;
    links : GdataAtom.Link.t list;
    title : GdataAtom.Title.t;
    scope : Scope.t;
    role : acl_role
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

val parse_acl_entry : GdataCore.xml_data_model -> Entry.t

val acl_entry_to_data_model : Entry.t -> GdataCore.xml_data_model

module Feed : GdataAtom.Feed
  with type entry_t = Entry.t
    and type link_t = GdataAtom.Link.t

module Rel :
sig
  type t =
    [ `Acl
    | GdataExtensions.Rel.t ]

  val to_string : [> t] -> string

end

val find_url : Rel.t -> GdataAtom.Link.t list -> string

val get_acl_prefix : string -> string

