val ns_gAcl : string

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
  ae_updated : GdataAtom.atom_updated;
  ae_links : GdataCalendar.calendar_calendarLink list;
  ae_title : GdataAtom.atom_textConstruct;
  ae_scope : acl_scope;
  ae_role : acl_role
}

val empty_entry : calendar_aclEntry

type calendar_aclFeed = {
  af_etag : string;
  af_kind : string;
  af_authors : GdataAtom.atom_author list;
  af_categories : GdataAtom.atom_category list;
  af_contributors : GdataAtom.atom_contributor list;
  af_generator : GdataAtom.atom_generator;
  af_id : GdataAtom.atom_id;
  af_updated : GdataAtom.atom_updated;
  af_entries : calendar_aclEntry list;
  af_links : GdataCalendar.calendar_calendarLink list;
  af_title : GdataAtom.atom_textConstruct;
  af_totalResults : GdataAtom.opensearch_totalResults;
  af_startIndex : GdataAtom.opensearch_startIndex
}

val empty_feed : calendar_aclFeed

val parse_acl_feed :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_aclFeed

val parse_acl_entry :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_aclEntry

val acl_entry_to_data_model :
  calendar_aclEntry ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t

