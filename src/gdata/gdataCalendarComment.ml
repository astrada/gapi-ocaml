open GdataUtils.Op

(* Calendar comment data types *)
let messageKind = {
  GdataAtom.empty_category with
      GdataAtom.c_scheme = "http://schemas.google.com/g/2005#kind";
      GdataAtom.c_term = "http://schemas.google.com/g/2005#message";
}

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
  cce_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_commentEntry = {
  cce_etag = "";
  cce_authors = [];
  cce_content = GdataAtom.empty_content;
  cce_contributors = [];
  cce_id = "";
  cce_published = GdataDate.epoch;
  cce_updated = GdataDate.epoch;
  cce_links = [];
  cce_title = GdataAtom.empty_text;
  cce_messageKind = messageKind;
  cce_extensions = []
}

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
  ccf_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_commentFeed = {
  ccf_etag = "";
  ccf_authors = [];
  ccf_contributors = [];
  ccf_generator = GdataAtom.empty_generator;
  ccf_id = "";
  ccf_updated = GdataDate.epoch;
  ccf_entries = [];
  ccf_links = [];
  ccf_title = GdataAtom.empty_text;
  ccf_messageKind = messageKind;
  ccf_itemsPerPage = 0;
  ccf_startIndex = 0;
  ccf_totalResults = 0;
  ccf_extensions = []
}

type calendar_calendarComments = {
  cc_countHint : int;
  cc_href : string;
  cc_readOnly : bool;
  cc_rel : string;
  cc_commentFeed : calendar_calendarCommentFeed
}

let empty_comments = {
  cc_countHint = 0;
  cc_href = "";
  cc_readOnly = false;
  cc_rel = "";
  cc_commentFeed = empty_commentFeed
}
(* END Calendar comment data types *)


(* Calendar comment feed: parsing *)
let parse_entry entry tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { entry with cce_etag = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { entry with cce_authors =
                             author :: entry.cce_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "content"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_content
          GdataAtom.empty_content
          (fun content -> { entry with cce_content = content })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun contributor -> { entry with cce_contributors =
                                  contributor :: entry.cce_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cce_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "published"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cce_published = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cce_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataCalendar.parse_link
          GdataCalendar.empty_link
          (fun link -> { entry with cce_links = link :: entry.cce_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { entry with cce_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_category
          GdataAtom.empty_category
          (fun category -> { entry with cce_messageKind = category })
          cs
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name _; `Namespace ns],
         _) when ns = Xmlm.ns_xmlns ->
        entry
    | extension ->
        let extensions = extension :: entry.cce_extensions in
          { entry with cce_extensions = extensions }

let parse_feed feed tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { feed with ccf_etag = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { feed with ccf_authors = author :: feed.ccf_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun contributor -> { feed with ccf_contributors =
                                  contributor :: feed.ccf_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "generator"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_generator
          GdataAtom.empty_generator
          (fun generator -> { feed with ccf_generator = generator })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { feed with ccf_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { feed with ccf_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "entry"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          parse_entry
          empty_commentEntry
          (fun entry -> { feed with ccf_entries = entry :: feed.ccf_entries })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataCalendar.parse_link
          GdataCalendar.empty_link
          (fun link -> { feed with ccf_links = link :: feed.ccf_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { feed with ccf_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "itemsPerPage"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with ccf_itemsPerPage = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "startIndex"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with ccf_startIndex = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "totalResults"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with ccf_totalResults = int_of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name _; `Namespace ns],
         _) when ns = Xmlm.ns_xmlns ->
        feed
    | extension ->
        let extensions = extension :: feed.ccf_extensions in
          { feed with ccf_extensions = extensions }

let parse_commentsFeedLink link tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "countHint"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { link with cc_countHint = int_of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "href"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { link with cc_href = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "readOnly"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { link with cc_readOnly = bool_of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "rel"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { link with cc_rel = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "feed"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          parse_feed
          empty_commentFeed
          (fun title -> { link with cc_commentFeed = title })
          cs
    | e ->
        GdataUtils.unexpected e

let parse_comments comments tree =
  match tree with
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "feedLink"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_commentsFeedLink
          empty_comments
          Std.identity
          cs
    | e ->
        GdataUtils.unexpected e

let parse_comment_feed tree =
  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feed"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            parse_feed
            empty_commentFeed
            Std.identity
            cs
      | e ->
          GdataUtils.unexpected e
  in
    parse_root tree

let parse_comment_entry tree =
  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "entry"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            parse_entry
            empty_commentEntry
            Std.identity
            cs
      | e ->
          GdataUtils.unexpected e
  in
    parse_root tree
(* END Calendar comment feed: parsing *)


(* Calendar comment: rendering *)
let render_entry entry =
  GdataAtom.render_element GdataAtom.ns_atom "entry"
    [GdataAtom.render_element_list (GdataAtom.render_author "author") entry.cce_authors;
     GdataAtom.render_content entry.cce_content;
     GdataAtom.render_element_list (GdataAtom.render_author "contributor") entry.cce_contributors;
     GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.cce_id;
     GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.cce_published;
     GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.cce_updated;
     GdataAtom.render_element_list GdataCalendar.render_link entry.cce_links;
     GdataAtom.render_text_construct "title" entry.cce_title;
     GdataAtom.render_category entry.cce_messageKind;
     entry.cce_extensions]

let render_commentsFeedLink link =
  let render_feed feed =
    GdataAtom.render_element GdataAtom.ns_atom "feed"
      [GdataAtom.render_attribute GdataCalendar.ns_gd "etag" feed.ccf_etag;
       GdataAtom.render_element_list (GdataAtom.render_author "author") feed.ccf_authors;
       GdataAtom.render_element_list (GdataAtom.render_author "contributor") feed.ccf_contributors;
       GdataAtom.render_generator feed.ccf_generator;
       GdataAtom.render_text_element GdataAtom.ns_atom "id" feed.ccf_id;
       GdataAtom.render_date_element GdataAtom.ns_atom "updated" feed.ccf_updated;
       GdataAtom.render_element_list render_entry feed.ccf_entries;
       GdataAtom.render_element_list GdataCalendar.render_link feed.ccf_links;
       GdataAtom.render_text_construct "title" feed.ccf_title;
       GdataAtom.render_int_value GdataAtom.ns_openSearch "itemsPerPage" feed.ccf_itemsPerPage;
       GdataAtom.render_int_value GdataAtom.ns_openSearch "startIndex" feed.ccf_startIndex;
       GdataAtom.render_int_value GdataAtom.ns_openSearch "totalResults" feed.ccf_totalResults;
       feed.ccf_extensions]
  in
    GdataAtom.render_element GdataCalendar.ns_gd "feedLink"
      [GdataAtom.render_int_attribute "" "countHint" link.cc_countHint;
       GdataAtom.render_attribute "" "href" link.cc_href;
       GdataAtom.render_bool_attribute "" "readOnly" link.cc_readOnly;
       GdataAtom.render_attribute "" "rel" link.cc_rel;
       render_feed link.cc_commentFeed]

let render_comments comments =
  GdataAtom.render_element GdataCalendar.ns_gd "comments"
    [render_commentsFeedLink comments]

let comment_entry_to_data_model entry =
  let entry_element =
    (* TODO: better namespace handling *)
    GdataAtom.render_element GdataAtom.ns_atom "entry"
      [GdataAtom.render_attribute Xmlm.ns_xmlns "xmlns" GdataAtom.ns_atom;
       GdataAtom.render_attribute Xmlm.ns_xmlns "gCal" GdataCalendar.ns_gCal;
       GdataAtom.render_attribute Xmlm.ns_xmlns "gd" GdataCalendar.ns_gd;
       GdataAtom.render_attribute Xmlm.ns_xmlns "app" GdataAtom.ns_app;
       render_entry entry]
  in
    List.hd entry_element
(* END Calendar comment: rendering *)

