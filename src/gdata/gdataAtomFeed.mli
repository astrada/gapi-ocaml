module Make :
  functor (Entry : GdataCore.DATA) ->
  functor (Link : GdataCore.DATA) ->
sig
  type atom_feed = {
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
    f_links : Link.t list;
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

  val empty_feed : atom_feed

  val parse_feed :
    atom_feed ->
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
    atom_feed

  val render_feed :
    atom_feed ->
    (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

end

