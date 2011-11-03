type calendar_calendarFeed =
    GdataAtomFeed.Make(GdataCalendar.Entry)(GdataCalendar.Link).atom_feed = {
      f_etag : string;
      f_kind : string;
      f_authors : GdataAtom.atom_author list;
      f_categories : GdataAtom.atom_category list;
      f_contributors : GdataAtom.atom_contributor list;
      f_generator : GdataAtom.atom_generator;
      f_icon : GdataAtom.atom_icon;
      f_id : GdataAtom.atom_id;
      f_updated : GdataAtom.atom_updated;
      f_entries : GdataCalendar.Entry.t list;
      f_links : GdataCalendar.Link.t list;
      f_logo : GdataAtom.atom_logo;
      f_rights : GdataAtom.atom_textConstruct;
      f_subtitle : GdataAtom.atom_textConstruct;
      f_title : GdataAtom.atom_textConstruct;
      f_totalResults : GdataAtom.opensearch_totalResults;
      f_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
      f_startIndex : GdataAtom.opensearch_startIndex;
      f_extensions :
        (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t
        list;
    }


val empty_feed : calendar_calendarFeed

val parse_feed :
  calendar_calendarFeed ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarFeed

val parse_calendar_feed :
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t ->
  calendar_calendarFeed

val render_feed :
  calendar_calendarFeed ->
  (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list

