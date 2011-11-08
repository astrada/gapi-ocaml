open GdataUtils.Op

module type COMMENTS =
sig
  type link_t

  module Entry :
  sig
    type t = {
      ce_etag : string;
      ce_kind : string;
      ce_authors : GdataAtom.Author.t list;
      ce_content : GdataAtom.Content.t;
      ce_contributors : GdataAtom.Contributor.t list;
      ce_id : GdataAtom.atom_id;
      ce_published : GdataAtom.atom_published;
      ce_updated : GdataAtom.atom_updated;
      ce_links : link_t list;
      ce_title : GdataAtom.Title.t;
      ce_category : GdataAtom.Category.t;
      ce_extensions : GdataCore.xml_data_model list
    }

    val empty : t

    val of_xml_data_model : t -> GdataCore.xml_data_model -> t

    val to_xml_data_model : t -> GdataCore.xml_data_model list

  end

  module Feed :
  sig
    include GdataAtom.FEED
      with type entry_t = Entry.t
        and type link_t = link_t

  end

  type t = {
    c_countHint : int;
    c_href : string;
    c_readOnly : bool;
    c_rel : string;
    c_commentFeed : Feed.t;
  }

  val empty : t

  val of_xml_data_model :
    t ->
    GdataCore.xml_data_model ->
    t

  val to_xml_data_model :
    t ->
    GdataCore.xml_data_model list

  val parse_comment_entry :
    GdataCore.xml_data_model ->
    Entry.t

  val comment_entry_to_data_model :
    Entry.t ->
    GdataCore.xml_data_model

end

module Make(Link : GdataCore.DATA) =
struct
  type link_t = Link.t

  (* Comment data types *)
  module Entry =
  struct
    type t = {
      ce_etag : string;
      ce_kind : string;
      ce_authors : GdataAtom.Author.t list;
      ce_content : GdataAtom.Content.t;
      ce_contributors : GdataAtom.Contributor.t list;
      ce_id : GdataAtom.atom_id;
      ce_published : GdataAtom.atom_published;
      ce_updated : GdataAtom.atom_updated;
      ce_links : Link.t list;
      ce_title : GdataAtom.Title.t;
      ce_category : GdataAtom.Category.t;
      ce_extensions : GdataCore.xml_data_model list
    }

    let empty = {
      ce_etag = "";
      ce_kind = "";
      ce_authors = [];
      ce_content = GdataAtom.Content.empty;
      ce_contributors = [];
      ce_id = "";
      ce_published = GdataDate.epoch;
      ce_updated = GdataDate.epoch;
      ce_links = [];
      ce_title = GdataAtom.Title.empty;
      ce_category = GdataAtom.Category.empty;
      ce_extensions = []
    }

    let to_xml_data_model entry =
      GdataAtom.render_element GdataAtom.ns_atom "entry"
        [GdataAtom.render_attribute GdataAtom.ns_gd "etag" entry.ce_etag;
         GdataAtom.render_attribute GdataAtom.ns_gd "kind" entry.ce_kind;
         GdataAtom.render_element_list GdataAtom.Author.to_xml_data_model entry.ce_authors;
         GdataAtom.Content.to_xml_data_model entry.ce_content;
         GdataAtom.render_element_list GdataAtom.Contributor.to_xml_data_model entry.ce_contributors;
         GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.ce_id;
         GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.ce_published;
         GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.ce_updated;
         GdataAtom.render_element_list Link.to_xml_data_model entry.ce_links;
         GdataAtom.Title.to_xml_data_model entry.ce_title;
         GdataAtom.Category.to_xml_data_model entry.ce_category;
         entry.ce_extensions]

    let of_xml_data_model entry tree =
      match tree with
          GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "etag"; `Namespace ns],
             v) when ns = GdataAtom.ns_gd ->
            { entry with ce_etag = v }
        | GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "kind"; `Namespace ns],
             v) when ns = GdataAtom.ns_gd ->
            { entry with ce_kind = v }
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "author"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Author.of_xml_data_model
              GdataAtom.Author.empty
              (fun author -> { entry with ce_authors =
                                 author :: entry.ce_authors })
              cs
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "content"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Content.of_xml_data_model
              GdataAtom.Content.empty
              (fun content -> { entry with ce_content = content })
              cs
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "contributor"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Contributor.of_xml_data_model
              GdataAtom.Contributor.empty
              (fun contributor -> { entry with ce_contributors =
                                      contributor :: entry.ce_contributors })
              cs
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "id"; `Namespace ns],
             [GdataCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_atom ->
            { entry with ce_id = v }
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "published"; `Namespace ns],
             [GdataCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_atom ->
            { entry with ce_published = GdataDate.of_string v }
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "updated"; `Namespace ns],
             [GdataCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_atom ->
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
            GdataAtom.Title.of_xml_data_model
            GdataAtom.Title.empty
            (fun title -> { entry with ce_title = title })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Category.of_xml_data_model
            GdataAtom.Category.empty
            (fun category -> { entry with ce_category = category })
            cs
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          entry
      | extension ->
          let extensions = extension :: entry.ce_extensions in
            { entry with ce_extensions = extensions }

  end

  module Feed = GdataAtom.MakeFeed(Entry)(Link)

  type t = {
    c_countHint : int;
    c_href : string;
    c_readOnly : bool;
    c_rel : string;
    c_commentFeed : Feed.t
  }

  let empty = {
    c_countHint = 0;
    c_href = "";
    c_readOnly = false;
    c_rel = "";
    c_commentFeed = Feed.empty
  }

  let to_xml_data_model comments =
    let render_commentsFeedLink link =
      GdataAtom.render_element GdataAtom.ns_gd "feedLink"
        [GdataAtom.render_int_attribute "" "countHint" link.c_countHint;
         GdataAtom.render_attribute "" "href" link.c_href;
         GdataAtom.render_bool_attribute "" "readOnly" link.c_readOnly;
         GdataAtom.render_attribute "" "rel" link.c_rel;
         Feed.to_xml_data_model link.c_commentFeed]
    in
      GdataAtom.render_element GdataAtom.ns_gd "comments"
        [render_commentsFeedLink comments]

  let of_xml_data_model comments tree =
    let parse_commentsFeedLink link tree =
      match tree with
          GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "countHint"; `Namespace ns],
             v) when ns = "" ->
            { link with c_countHint = int_of_string v }
        | GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "href"; `Namespace ns],
             v) when ns = "" ->
            { link with c_href = v }
        | GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "readOnly"; `Namespace ns],
             v) when ns = "" ->
            { link with c_readOnly = bool_of_string v }
        | GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "rel"; `Namespace ns],
             v) when ns = "" ->
            { link with c_rel = v }
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "feed"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              Feed.of_xml_data_model
              Feed.empty
              (fun feed -> { link with c_commentFeed = feed })
              cs
        | e ->
            GdataUtils.unexpected e
    in
      match tree with
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "feedLink"; `Namespace ns],
             cs) when ns = GdataAtom.ns_gd ->
            GdataAtom.parse_children
              parse_commentsFeedLink
              empty
              Std.identity
              cs
        | e ->
            GdataUtils.unexpected e
  (* END Comment data types *)

  (* Comment feed: parsing *)
  let parse_comment_entry =
    GdataAtom.data_model_to_entry Entry.of_xml_data_model Entry.empty
  (* END Comment feed: parsing *)

  (* Comment: rendering *)
  let comment_entry_to_data_model =
    GdataAtom.element_to_data_model
      GdataAtom.get_standard_prefix
      Entry.to_xml_data_model
  (* END Calendar comment: rendering *)
end

