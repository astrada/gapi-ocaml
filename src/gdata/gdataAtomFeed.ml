module Make
  (Entry : GdataCore.DATA)
  (Link : GdataCore.DATA) =
struct
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

  let empty_feed = {
    f_etag = "";
    f_kind = "";
    f_authors = [];
    f_categories = [];
    f_contributors = [];
    f_generator = GdataAtom.empty_generator;
    f_icon = "";
    f_id = "";
    f_updated = GdataDate.epoch;
    f_entries = [];
    f_links = [];
    f_logo = "";
    f_rights = GdataAtom.empty_text;
    f_subtitle = GdataAtom.empty_text;
    f_title = GdataAtom.empty_text;
    f_totalResults = 0;
    f_itemsPerPage = 0;
    f_startIndex = 0;
    f_extensions = []
  }

  let parse_feed feed tree =
    match tree with
        GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "etag"; `Namespace ns],
           GdataCore.Value.String v) when ns = GdataAtom.ns_gd ->
          { feed with f_etag = v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "kind"; `Namespace ns],
           GdataCore.Value.String v) when ns = GdataAtom.ns_gd ->
          { feed with f_kind = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "author"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_author
            GdataAtom.empty_author
            (fun author -> { feed with f_authors = author :: feed.f_authors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_category
            GdataAtom.empty_category
            (fun category -> { feed with f_categories = category :: feed.f_categories })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "contributor"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_author
            GdataAtom.empty_author
            (fun contributor -> { feed with f_contributors =
                                    contributor :: feed.f_contributors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "generator"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_generator
            GdataAtom.empty_generator
            (fun generator -> { feed with f_generator = generator })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "icon"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { feed with f_icon = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "id"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { feed with f_id = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "updated"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { feed with f_updated = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "entry"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            Entry.of_xml_data_model
            Entry.empty
            (fun entry -> { feed with f_entries = entry :: feed.f_entries })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "link"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            Link.of_xml_data_model
            Link.empty
            (fun link -> { feed with f_links = link :: feed.f_links })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "logo"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { feed with f_logo = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "rights"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_text
            GdataAtom.empty_text
            (fun rights -> { feed with f_rights = rights })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "subtitle"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_text
            GdataAtom.empty_text
            (fun subtitle -> { feed with f_subtitle = subtitle })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_text
            GdataAtom.empty_text
            (fun title -> { feed with f_title = title })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "totalResults"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
          { feed with f_totalResults = int_of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "itemsPerPage"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
          { feed with f_itemsPerPage = int_of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "startIndex"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
          { feed with f_startIndex = int_of_string v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          feed
      | extension ->
          let extensions = extension :: feed.f_extensions in
            { feed with f_extensions = extensions }

  let render_feed feed =
    GdataAtom.render_element GdataAtom.ns_atom "feed"
      [GdataAtom.render_attribute Xmlm.ns_xmlns "xmlns" GdataAtom.ns_atom;
       (* TODO: GdataAtom.render_attribute Xmlm.ns_xmlns "gCal" ns_gCal;*)
       GdataAtom.render_attribute Xmlm.ns_xmlns "gd" GdataAtom.ns_gd;
       GdataAtom.render_attribute Xmlm.ns_xmlns "app" GdataAtom.ns_app;
       GdataAtom.render_attribute GdataAtom.ns_gd "etag" feed.f_etag;
       GdataAtom.render_attribute GdataAtom.ns_gd "kind" feed.f_kind;
       GdataAtom.render_element_list (GdataAtom.render_author "author") feed.f_authors;
       GdataAtom.render_element_list GdataAtom.render_category feed.f_categories;
       GdataAtom.render_element_list (GdataAtom.render_author "contributor") feed.f_contributors;
       GdataAtom.render_generator feed.f_generator;
       GdataAtom.render_text_element GdataAtom.ns_atom "icon" feed.f_icon;
       GdataAtom.render_text_element GdataAtom.ns_atom "id" feed.f_id;
       GdataAtom.render_date_element GdataAtom.ns_atom "updated" feed.f_updated;
       GdataAtom.render_element_list Entry.to_xml_data_model feed.f_entries;
       GdataAtom.render_element_list Link.to_xml_data_model feed.f_links;
       GdataAtom.render_text_element GdataAtom.ns_atom "logo" feed.f_logo;
       GdataAtom.render_text_construct "rights" feed.f_rights;
       GdataAtom.render_text_construct "title" feed.f_title;
       GdataAtom.render_text_construct "subtitle" feed.f_subtitle;
       GdataAtom.render_int_element GdataAtom.ns_openSearch "totalResults" feed.f_totalResults;
       GdataAtom.render_int_element GdataAtom.ns_openSearch "itemsPerPage" feed.f_itemsPerPage;
       GdataAtom.render_int_element GdataAtom.ns_openSearch "startIndex" feed.f_startIndex;
       feed.f_extensions]

end

