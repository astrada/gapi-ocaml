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
  type t = GdataAtom.MakeFeed(Entry)(GdataAtom.Link).t = {
    etag : string;
    kind : string;
    authors : GdataAtom.atom_author list;
    categories : GdataAtom.atom_category list;
    contributors : GdataAtom.atom_contributor list;
    generator : GdataAtom.atom_generator;
    icon : GdataAtom.atom_icon;
    id : GdataAtom.atom_id;
    updated : GdataAtom.atom_updated;
    entries : Entry.t list;
    links : GdataAtom.Link.t list;
    logo : GdataAtom.atom_logo;
    rights : GdataAtom.atom_textConstruct;
    subtitle : GdataAtom.atom_textConstruct;
    title : GdataAtom.atom_textConstruct;
    totalResults : GdataAtom.opensearch_totalResults;
    itemsPerPage : GdataAtom.opensearch_itemsPerPage;
    startIndex : GdataAtom.opensearch_startIndex;
    extensions : GdataCore.xml_data_model list
  }

  val empty : t

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val parse_feed : GdataCore.xml_data_model -> t

end

