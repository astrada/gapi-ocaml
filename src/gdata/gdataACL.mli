type acl_scope = {
  as_type : string;
  as_value : string
}

val empty_scope : acl_scope

type acl_role = string

type calendar_aclEntry = {
  ae_etag : string;
  ae_kind : string;
  ae_authors : GdataAtom.atom_author list;
  ae_categories : GdataAtom.atom_category list;
  ae_contributors : GdataAtom.atom_contributor list;
  ae_id : GdataAtom.atom_id;
  ae_content : GdataAtom.atom_content;
  ae_published : GdataAtom.atom_published;
  ae_updated : GdataAtom.atom_updated;
  ae_edited : GdataAtom.app_edited;
  ae_links : GdataAtom.atom_link list;
  ae_title : GdataAtom.atom_textConstruct;
  ae_scope : acl_scope;
  ae_role : acl_role
}

val empty_entry : calendar_aclEntry

val parse_acl_entry : GdataCore.xml_data_model -> calendar_aclEntry

val acl_entry_to_data_model : calendar_aclEntry -> GdataCore.xml_data_model

module Entry :
sig
  type t = calendar_aclEntry

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module Feed :
sig
  include GdataAtom.FEED
    with type entry_t = Entry.t
      and type link_t = GdataAtom.Link.t

end

