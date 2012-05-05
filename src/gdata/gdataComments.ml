open GapiUtils.Infix

module type Comments =
sig
  type link_t

  module Entry :
  sig
    type t = {
      etag : string;
      kind : string;
      authors : GdataAtom.Author.t list;
      content : GdataAtom.Content.t;
      contributors : GdataAtom.Contributor.t list;
      id : GdataAtom.atom_id;
      published : GdataAtom.atom_published;
      updated : GdataAtom.atom_updated;
      links : link_t list;
      title : GdataAtom.Title.t;
      category : GdataAtom.Category.t;
      extensions : GdataCore.xml_data_model list
    }

    val empty : t

    val of_xml_data_model : t -> GdataCore.xml_data_model -> t

    val to_xml_data_model : t -> GdataCore.xml_data_model list

  end

  module Feed :
  sig
    include GdataAtom.Feed
      with type entry_t = Entry.t
        and type link_t = link_t

  end

  type t = {
    countHint : int;
    href : string;
    readOnly : bool;
    rel : string;
    commentFeed : Feed.t;
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

module Make(Link : GdataAtom.AtomData) =
struct
  type link_t = Link.t

  (* Comment data types *)
  module Entry =
  struct
    type t = {
      etag : string;
      kind : string;
      authors : GdataAtom.Author.t list;
      content : GdataAtom.Content.t;
      contributors : GdataAtom.Contributor.t list;
      id : GdataAtom.atom_id;
      published : GdataAtom.atom_published;
      updated : GdataAtom.atom_updated;
      links : Link.t list;
      title : GdataAtom.Title.t;
      category : GdataAtom.Category.t;
      extensions : GdataCore.xml_data_model list
    }

    let empty = {
      etag = "";
      kind = "";
      authors = [];
      content = GdataAtom.Content.empty;
      contributors = [];
      id = "";
      published = GapiDate.epoch;
      updated = GapiDate.epoch;
      links = [];
      title = GdataAtom.Title.empty;
      category = GdataAtom.Category.empty;
      extensions = []
    }

    let to_xml_data_model entry =
      GdataAtom.render_element GdataAtom.ns_atom "entry"
        [GdataAtom.render_attribute GdataAtom.ns_gd "etag" entry.etag;
         GdataAtom.render_attribute GdataAtom.ns_gd "kind" entry.kind;
         GdataAtom.render_element_list GdataAtom.Author.to_xml_data_model entry.authors;
         GdataAtom.Content.to_xml_data_model entry.content;
         GdataAtom.render_element_list GdataAtom.Contributor.to_xml_data_model entry.contributors;
         GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.id;
         GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.published;
         GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.updated;
         GdataAtom.render_element_list Link.to_xml_data_model entry.links;
         GdataAtom.Title.to_xml_data_model entry.title;
         GdataAtom.Category.to_xml_data_model entry.category;
         entry.extensions]

    let of_xml_data_model entry tree =
      match tree with
          GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "etag"; `Namespace ns],
             v) when ns = GdataAtom.ns_gd ->
            { entry with etag = v }
        | GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "kind"; `Namespace ns],
             v) when ns = GdataAtom.ns_gd ->
            { entry with kind = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "author"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Author.of_xml_data_model
              GdataAtom.Author.empty
              (fun author -> { entry with authors =
                                 author :: entry.authors })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "content"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Content.of_xml_data_model
              GdataAtom.Content.empty
              (fun content -> { entry with content })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "contributor"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Contributor.of_xml_data_model
              GdataAtom.Contributor.empty
              (fun contributor -> { entry with contributors =
                                      contributor :: entry.contributors })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "id"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_atom ->
            { entry with id = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "published"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_atom ->
            { entry with published = GapiDate.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "updated"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_atom ->
            { entry with updated = GapiDate.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "link"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
            Link.of_xml_data_model
            Link.empty
            (fun link -> { entry with links = link :: entry.links })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Title.of_xml_data_model
            GdataAtom.Title.empty
            (fun title -> { entry with title })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Category.of_xml_data_model
            GdataAtom.Category.empty
            (fun category -> { entry with category })
            cs
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          entry
      | extension ->
          let extensions = extension :: entry.extensions in
            { entry with extensions }

  end

  module Feed =
    GdataAtom.MakeFeed(Entry)(Link)(GdataAtom.GenericExtensions)

  type t = {
    countHint : int;
    href : string;
    readOnly : bool;
    rel : string;
    commentFeed : Feed.t
  }

  let empty = {
    countHint = 0;
    href = "";
    readOnly = false;
    rel = "";
    commentFeed = Feed.empty
  }

  let to_xml_data_model comments =
    let render_commentsFeedLink link =
      GdataAtom.render_element GdataAtom.ns_gd "feedLink"
        [GdataAtom.render_int_attribute "" "countHint" link.countHint;
         GdataAtom.render_attribute "" "href" link.href;
         GdataAtom.render_bool_attribute "" "readOnly" link.readOnly;
         GdataAtom.render_attribute "" "rel" link.rel;
         Feed.to_xml_data_model link.commentFeed]
    in
      GdataAtom.render_element GdataAtom.ns_gd "comments"
        [render_commentsFeedLink comments]

  let of_xml_data_model comments tree =
    let parse_commentsFeedLink link tree =
      match tree with
          GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "countHint"; `Namespace ns],
             v) when ns = "" ->
            { link with countHint = int_of_string v }
        | GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "href"; `Namespace ns],
             v) when ns = "" ->
            { link with href = v }
        | GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "readOnly"; `Namespace ns],
             v) when ns = "" ->
            { link with readOnly = bool_of_string v }
        | GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "rel"; `Namespace ns],
             v) when ns = "" ->
            { link with rel = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "feed"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              Feed.of_xml_data_model
              Feed.empty
              (fun feed -> { link with commentFeed = feed })
              cs
        | e ->
            GdataUtils.unexpected e
    in
      match tree with
        | GapiCore.AnnotatedTree.Node
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

