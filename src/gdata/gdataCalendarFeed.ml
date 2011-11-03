module Feed =
  GdataAtomFeed.Make(GdataCalendar.Entry)(GdataCalendar.Link)

type calendar_calendarFeed = Feed.atom_feed = {
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

let empty_feed = Feed.empty_feed

let parse_feed = Feed.parse_feed

let render_feed = Feed.render_feed

let parse_calendar_feed tree =
  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feed"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            parse_feed
            empty_feed
            Std.identity
            cs
      | e ->
          GdataUtils.unexpected e
  in
    parse_root tree

