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

val parse_acl_entry :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_aclEntry

val acl_entry_to_data_model :
  calendar_aclEntry ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t

module Entry :
sig
  type t = calendar_aclEntry

  val empty : t

  val to_xml_data_model :
    t ->
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

  val of_xml_data_model :
    t ->
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
    t

end

module Feed :
sig
  type t = GdataAtom.MakeFeed(Entry)(GdataAtom.Link).t = {
    f_etag : string;
    f_kind : string;
    f_authors : GdataAtom.atom_author list;
    f_categories : GdataAtom.atom_category list;
    f_contributors : GdataAtom.atom_contributor list;
    f_generator : GdataAtom.atom_generator;
    f_icon : GdataAtom.atom_icon;
    f_id : GdataAtom.atom_id;
    f_updated : GdataAtom.atom_updated;
    f_entries : Entry.t list;
    f_links : GdataAtom.Link.t list;
    f_logo : GdataAtom.atom_logo;
    f_rights : GdataAtom.atom_textConstruct;
    f_subtitle : GdataAtom.atom_textConstruct;
    f_title : GdataAtom.atom_textConstruct;
    f_totalResults : GdataAtom.opensearch_totalResults;
    f_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
    f_startIndex : GdataAtom.opensearch_startIndex;
    f_extensions :
      (GdataCore.Metadata.xml,
       GdataCore.Value.t) GdataCore.AnnotatedTree.t list;
  }

  val empty : t

  val of_xml_data_model :
    t ->
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
    t

  val to_xml_data_model :
    t ->
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

  val parse_feed :
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
    t

end

