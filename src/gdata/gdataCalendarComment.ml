open GdataUtils.Op

module Comment =
  GdataComment.Make(GdataCalendar.Link)

type calendar_calendarCommentEntry = Comment.commentEntry = {
  ce_etag : string;
  ce_authors : GdataAtom.atom_author list;
  ce_content : GdataAtom.atom_content;
  ce_contributors : GdataAtom.atom_contributor list;
  ce_id : GdataAtom.atom_id;
  ce_published : GdataAtom.atom_published;
  ce_updated : GdataAtom.atom_updated;
  ce_links : GdataCalendar.Link.t list;
  ce_title : GdataAtom.atom_textConstruct;
  ce_category : GdataAtom.atom_category;
  ce_extensions :
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t
    list;
}

let empty_commentEntry = Comment.empty_commentEntry

type calendar_calendarCommentFeed = Comment.commentFeed = {
  cf_etag : string;
  cf_authors : GdataAtom.atom_author list;
  cf_contributors : GdataAtom.atom_contributor list;
  cf_generator : GdataAtom.atom_generator;
  cf_id : GdataAtom.atom_id;
  cf_updated : GdataAtom.atom_updated;
  cf_entries : calendar_calendarCommentEntry list;
  cf_links : GdataCalendar.Link.t list;
  cf_title : GdataAtom.atom_textConstruct;
  cf_category : GdataAtom.atom_category;
  cf_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
  cf_startIndex : GdataAtom.opensearch_startIndex;
  cf_totalResults : GdataAtom.opensearch_totalResults;
  cf_extensions :
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t
    list;
}

let empty_commentFeed = Comment.empty_commentFeed

type calendar_calendarComments = Comment.comments = {
  c_countHint : int;
  c_href : string;
  c_readOnly : bool;
  c_rel : string;
  c_commentFeed : calendar_calendarCommentFeed;
}

let empty_comments = Comment.empty_comments


let parse_comments = Comment.parse_comments

let parse_comment_feed = Comment.parse_comment_feed

let parse_comment_entry = Comment.parse_comment_entry

let render_comments = Comment.render_comments
