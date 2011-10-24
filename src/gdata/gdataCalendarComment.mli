val messageKind : GdataAtom.atom_category

type calendar_calendarCommentEntry = {
  cce_etag : string;
  cce_authors : GdataAtom.atom_author list;
  cce_content : GdataAtom.atom_content;
  cce_contributors : GdataAtom.atom_contributor list;
  cce_id : GdataAtom.atom_id;
  cce_published : GdataAtom.atom_published;
  cce_updated : GdataAtom.atom_updated;
  cce_links : GdataCalendar.calendar_calendarLink list;
  cce_title : GdataAtom.atom_textConstruct;
  cce_messageKind : GdataAtom.atom_category;
  cce_extensions :
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t
    list;
}

val empty_commentEntry : calendar_calendarCommentEntry

type calendar_calendarCommentFeed = {
  ccf_etag : string;
  ccf_authors : GdataAtom.atom_author list;
  ccf_contributors : GdataAtom.atom_contributor list;
  ccf_generator : GdataAtom.atom_generator;
  ccf_id : GdataAtom.atom_id;
  ccf_updated : GdataAtom.atom_updated;
  ccf_entries : calendar_calendarCommentEntry list;
  ccf_links : GdataCalendar.calendar_calendarLink list;
  ccf_title : GdataAtom.atom_textConstruct;
  ccf_messageKind : GdataAtom.atom_category;
  ccf_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
  ccf_startIndex : GdataAtom.opensearch_startIndex;
  ccf_totalResults : GdataAtom.opensearch_totalResults;
  ccf_extensions :
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t
    list;
}

val empty_commentFeed : calendar_calendarCommentFeed

type calendar_calendarComments = {
  cc_countHint : int;
  cc_href : string;
  cc_readOnly : bool;
  cc_rel : string;
  cc_commentFeed : calendar_calendarCommentFeed;
}

val empty_comments : calendar_calendarComments

val parse_comments :
  calendar_calendarComments ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarComments

val parse_comment_feed :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarCommentFeed

val parse_comment_entry :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarCommentEntry

val comment_entry_to_data_model :
  calendar_calendarCommentEntry ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t

val render_comments :
  calendar_calendarComments ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

