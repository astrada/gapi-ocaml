open GdataUtils.Op

module Make(Link : GdataCore.DATA) =
struct
  (* Comment data types *)
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
    ce_extensions : GdataCore.xml_data_model list
  }

  let empty_commentEntry = {
    ce_etag = "";
    ce_authors = [];
    ce_content = GdataAtom.empty_content;
    ce_contributors = [];
    ce_id = "";
    ce_published = GdataDate.epoch;
    ce_updated = GdataDate.epoch;
    ce_links = [];
    ce_title = GdataAtom.empty_text;
    ce_category = GdataAtom.empty_category;
    ce_extensions = []
  }

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
    cf_extensions : GdataCore.xml_data_model list
  }

  let empty_commentFeed = {
    cf_etag = "";
    cf_authors = [];
    cf_contributors = [];
    cf_generator = GdataAtom.empty_generator;
    cf_id = "";
    cf_updated = GdataDate.epoch;
    cf_entries = [];
    cf_links = [];
    cf_title = GdataAtom.empty_text;
    cf_category = GdataAtom.empty_category;
    cf_itemsPerPage = 0;
    cf_startIndex = 0;
    cf_totalResults = 0;
    cf_extensions = []
  }

  type comments = {
    c_countHint : int;
    c_href : string;
    c_readOnly : bool;
    c_rel : string;
    c_commentFeed : commentFeed
  }

  let empty_comments = {
    c_countHint = 0;
    c_href = "";
    c_readOnly = false;
    c_rel = "";
    c_commentFeed = empty_commentFeed
  }
  (* END Comment data types *)


  (* Comment feed: parsing *)
  let parse_entry entry tree =
    match tree with
        GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "etag"; `Namespace ns],
           GdataCore.Value.String v) when ns = GdataAtom.ns_gd ->
          { entry with ce_etag = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "author"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_author
            GdataAtom.empty_author
            (fun author -> { entry with ce_authors =
                               author :: entry.ce_authors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "content"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_content
            GdataAtom.empty_content
            (fun content -> { entry with ce_content = content })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "contributor"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_author
            GdataAtom.empty_author
            (fun contributor -> { entry with ce_contributors =
                                    contributor :: entry.ce_contributors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "id"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { entry with ce_id = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "published"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { entry with ce_published = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "updated"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { entry with ce_updated = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "link"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            Link.of_xml_data_model
            Link.empty
            (fun link -> { entry with ce_links = link :: entry.ce_links })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_text
            GdataAtom.empty_text
            (fun title -> { entry with ce_title = title })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_category
            GdataAtom.empty_category
            (fun category -> { entry with ce_category = category })
            cs
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          entry
      | extension ->
          let extensions = extension :: entry.ce_extensions in
            { entry with ce_extensions = extensions }

  let parse_feed feed tree =
    match tree with
        GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "etag"; `Namespace ns],
           GdataCore.Value.String v) when ns = GdataAtom.ns_gd ->
          { feed with cf_etag = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "author"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_author
            GdataAtom.empty_author
            (fun author -> { feed with cf_authors = author :: feed.cf_authors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "contributor"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_author
            GdataAtom.empty_author
            (fun contributor -> { feed with cf_contributors =
                                    contributor :: feed.cf_contributors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "generator"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_generator
            GdataAtom.empty_generator
            (fun generator -> { feed with cf_generator = generator })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "id"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { feed with cf_id = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "updated"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { feed with cf_updated = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "entry"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            parse_entry
            empty_commentEntry
            (fun entry -> { feed with cf_entries = entry :: feed.cf_entries })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "link"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            Link.of_xml_data_model
            Link.empty
            (fun link -> { feed with cf_links = link :: feed.cf_links })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_text
            GdataAtom.empty_text
            (fun title -> { feed with cf_title = title })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "itemsPerPage"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
          { feed with cf_itemsPerPage = int_of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "startIndex"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
          { feed with cf_startIndex = int_of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "totalResults"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
          { feed with cf_totalResults = int_of_string v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          feed
      | extension ->
          let extensions = extension :: feed.cf_extensions in
            { feed with cf_extensions = extensions }

  let parse_commentsFeedLink link tree =
    match tree with
        GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "countHint"; `Namespace ns],
           GdataCore.Value.String v) when ns = "" ->
          { link with c_countHint = int_of_string v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "href"; `Namespace ns],
           GdataCore.Value.String v) when ns = "" ->
          { link with c_href = v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "readOnly"; `Namespace ns],
           GdataCore.Value.String v) when ns = "" ->
          { link with c_readOnly = bool_of_string v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "rel"; `Namespace ns],
           GdataCore.Value.String v) when ns = "" ->
          { link with c_rel = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feed"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            parse_feed
            empty_commentFeed
            (fun title -> { link with c_commentFeed = title })
            cs
      | e ->
          GdataUtils.unexpected e

  let parse_comments comments tree =
    match tree with
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feedLink"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
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
  (* END Comment feed: parsing *)


  (* Comment: rendering *)
  let render_entry entry =
    GdataAtom.render_element GdataAtom.ns_atom "entry"
      [GdataAtom.render_element_list (GdataAtom.render_author "author") entry.ce_authors;
       GdataAtom.render_content entry.ce_content;
       GdataAtom.render_element_list (GdataAtom.render_author "contributor") entry.ce_contributors;
       GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.ce_id;
       GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.ce_published;
       GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.ce_updated;
       GdataAtom.render_element_list Link.to_xml_data_model entry.ce_links;
       GdataAtom.render_text_construct "title" entry.ce_title;
       GdataAtom.render_category entry.ce_category;
       entry.ce_extensions]

  let render_commentsFeedLink link =
    let render_feed feed =
      GdataAtom.render_element GdataAtom.ns_atom "feed"
        [GdataAtom.render_attribute GdataAtom.ns_gd "etag" feed.cf_etag;
         GdataAtom.render_element_list (GdataAtom.render_author "author") feed.cf_authors;
         GdataAtom.render_element_list (GdataAtom.render_author "contributor") feed.cf_contributors;
         GdataAtom.render_generator feed.cf_generator;
         GdataAtom.render_text_element GdataAtom.ns_atom "id" feed.cf_id;
         GdataAtom.render_date_element GdataAtom.ns_atom "updated" feed.cf_updated;
         GdataAtom.render_element_list render_entry feed.cf_entries;
         GdataAtom.render_element_list Link.to_xml_data_model feed.cf_links;
         GdataAtom.render_text_construct "title" feed.cf_title;
         GdataAtom.render_int_value GdataAtom.ns_openSearch "itemsPerPage" feed.cf_itemsPerPage;
         GdataAtom.render_int_value GdataAtom.ns_openSearch "startIndex" feed.cf_startIndex;
         GdataAtom.render_int_value GdataAtom.ns_openSearch "totalResults" feed.cf_totalResults]
    in
      GdataAtom.render_element GdataAtom.ns_gd "feedLink"
        [GdataAtom.render_int_attribute "" "countHint" link.c_countHint;
         GdataAtom.render_attribute "" "href" link.c_href;
         GdataAtom.render_bool_attribute "" "readOnly" link.c_readOnly;
         GdataAtom.render_attribute "" "rel" link.c_rel;
         render_feed link.c_commentFeed]

  let render_comments comments =
    GdataAtom.render_element GdataAtom.ns_gd "comments"
      [render_commentsFeedLink comments]

  let comment_entry_to_data_model entry =
    let entry_element =
      GdataAtom.render_element GdataAtom.ns_atom "entry"
        [GdataAtom.render_attribute Xmlm.ns_xmlns "xmlns" GdataAtom.ns_atom;
         GdataAtom.render_attribute Xmlm.ns_xmlns "gd" GdataAtom.ns_gd;
         GdataAtom.render_attribute Xmlm.ns_xmlns "app" GdataAtom.ns_app;
         (* TODO:
         GdataAtom.render_attribute Xmlm.ns_xmlns "gCal" GdataCalendar.ns_gCal;
          *)
         render_entry entry]
    in
      List.hd entry_element
  (* END Calendar comment: rendering *)
end

