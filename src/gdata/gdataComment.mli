module Make :
  functor (Link : GdataCore.DATA) ->
sig
  type commentEntry = {
    ce_etag : string;
    ce_authors : GdataAtom.atom_author list;
    ce_content : GdataAtom.atom_content;
    ce_contributors : GdataAtom.atom_contributor list;
    ce_id : GdataAtom.atom_id;
    ce_published : GdataAtom.atom_published;
    ce_updated : GdataAtom.atom_updated;
    ce_links : Link.t list;
    ce_title : GdataAtom.atom_textConstruct;
    ce_category : GdataAtom.atom_category;
    ce_extensions :
      (GdataCore.Metadata.xml,
       GdataCore.Value.t) GdataCore.AnnotatedTree.t list;
  }

  val empty_commentEntry : commentEntry

  type commentFeed = {
    cf_etag : string;
    cf_authors : GdataAtom.atom_author list;
    cf_contributors : GdataAtom.atom_contributor list;
    cf_generator : GdataAtom.atom_generator;
    cf_id : GdataAtom.atom_id;
    cf_updated : GdataAtom.atom_updated;
    cf_entries : commentEntry list;
    cf_links : Link.t list;
    cf_title : GdataAtom.atom_textConstruct;
    cf_category : GdataAtom.atom_category;
    cf_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
    cf_startIndex : GdataAtom.opensearch_startIndex;
    cf_totalResults : GdataAtom.opensearch_totalResults;
    cf_extensions :
      (GdataCore.Metadata.xml,
       GdataCore.Value.t) GdataCore.AnnotatedTree.t list
  }

  val empty_commentFeed : commentFeed

  type comments = {
    c_countHint : int;
    c_href : string;
    c_readOnly : bool;
    c_rel : string;
    c_commentFeed : commentFeed;
  }

  val empty_comments : comments

  val parse_comments :
    comments ->
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
    comments

  val parse_comment_feed :
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
    commentFeed

  val parse_comment_entry :
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
    commentEntry

  val comment_entry_to_data_model :
    commentEntry ->
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t

  val render_comments :
    comments ->
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

end

