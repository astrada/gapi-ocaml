open GapiUtils.Infix

(* Documents data types *)
let ns_docs = "http://schemas.google.com/docs/2007"

(*
 * TODO:
 * add metadata attributes to document entry
 * fix GdataExtensions.FeedLink
 * move to GdataExtensions all elements not in atom namespace
 *

type gdata_deleted = bool

type docs_removed = bool

type gdata_quotaBytesUsed = int

type docs_changestamp = int
 *)

module Document =
struct

  module Entry =
  struct
    type t = {
      etag : string;
      id : GdataAtom.atom_id;
      title : GdataAtom.Title.t;
      description : string;
      resourceId : string;
      published : GdataAtom.atom_published;
      authors : GdataAtom.Author.t list;
      updated : GdataAtom.atom_updated;
      edited : GdataAtom.app_edited;
      lastModifiedBy : GdataAtom.LastModifiedBy.t;
      lastViewed : GapiDate.t;
      categories : GdataAtom.Category.t list;
      content : GdataAtom.Content.t;
      links : GdataAtom.Link.t list;
      feedLinks : GdataExtensions.FeedLink.t list;
      quotaBytesUsed : int;
      writersCanInvite : bool;
      md5Checksum : string;
      filename : string;
      suggestedFilename : string;
      extensions : GdataCore.xml_data_model list
    }

    let empty = {
      etag = "";
      id = "";
      title = GdataAtom.Title.empty;
      description = "";
      resourceId = "";
      published = GapiDate.epoch;
      authors = [];
      updated = GapiDate.epoch;
      edited = GapiDate.epoch;
      lastModifiedBy = GdataAtom.LastModifiedBy.empty;
      lastViewed = GapiDate.epoch;
      categories = [];
      content = GdataAtom.Content.empty;
      links = [];
      feedLinks = [];
      quotaBytesUsed = 0;
      writersCanInvite = false;
      md5Checksum = "";
      filename = "";
      suggestedFilename = "";
      extensions = []
    }

    let to_xml_data_model entry =
      GdataAtom.render_element GdataAtom.ns_atom "entry"
        [GdataAtom.render_attribute GdataAtom.ns_gd "etag" entry.etag;
         GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.id;
         GdataAtom.Title.to_xml_data_model entry.title;
         GdataAtom.render_text_element ns_docs "description" entry.description;
         GdataAtom.render_text_element GdataAtom.ns_gd "resourceId" entry.resourceId;
         GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.published;
         GdataAtom.render_element_list GdataAtom.Author.to_xml_data_model entry.authors;
         GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.updated;
         GdataAtom.render_date_element GdataAtom.ns_app "edited" entry.edited;
         GdataAtom.LastModifiedBy.to_xml_data_model entry.lastModifiedBy;
         GdataAtom.render_date_element GdataAtom.ns_gd "lastViewed" entry.lastViewed;
         GdataAtom.render_element_list GdataAtom.Category.to_xml_data_model entry.categories;
         GdataAtom.Content.to_xml_data_model entry.content;
         GdataAtom.render_element_list GdataAtom.Link.to_xml_data_model entry.links;
         GdataAtom.render_element_list GdataExtensions.FeedLink.to_xml_data_model entry.feedLinks;
         GdataAtom.render_int_element GdataAtom.ns_gd "quotaBytesUsed" entry.quotaBytesUsed;
         GdataAtom.render_bool_value ns_docs "writersCanInvite" entry.writersCanInvite;
         GdataAtom.render_text_element ns_docs "md5Checksum" entry.md5Checksum;
         GdataAtom.render_text_element ns_docs "filename" entry.filename;
         GdataAtom.render_text_element ns_docs "suggestedFilename" entry.suggestedFilename;
         entry.extensions]

    let of_xml_data_model entry tree =
      match tree with
          GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "etag"; `Namespace ns],
             v) when ns = GdataAtom.ns_gd ->
            { entry with etag = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "id"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_atom ->
            { entry with id = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "title"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Title.of_xml_data_model
              GdataAtom.Title.empty
              (fun title -> { entry with title })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "description"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = ns_docs ->
            { entry with description = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "resourceId"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_gd ->
            { entry with resourceId = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "published"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_atom ->
            { entry with published = GapiDate.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "author"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Author.of_xml_data_model
              GdataAtom.Author.empty
              (fun author -> { entry with authors = author :: entry.authors })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "updated"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_atom ->
            { entry with updated = GapiDate.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "edited"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_app ->
            { entry with edited = GapiDate.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "lastModifiedBy"; `Namespace ns],
             cs) when ns = GdataAtom.ns_gd ->
            GdataAtom.parse_children
              GdataAtom.LastModifiedBy.of_xml_data_model
              GdataAtom.LastModifiedBy.empty
              (fun lastModifiedBy -> { entry with lastModifiedBy })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "lastViewed"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_gd ->
            { entry with lastViewed = GapiDate.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "category"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Category.of_xml_data_model
              GdataAtom.Category.empty
              (fun category -> { entry with categories = category :: entry.categories })
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
            ([`Element; `Name "link"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Link.of_xml_data_model
              GdataAtom.Link.empty
              (fun link -> { entry with links = link :: entry.links })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "feedLink"; `Namespace ns],
             cs) when ns = GdataAtom.ns_gd ->
            GdataAtom.parse_children
              GdataExtensions.FeedLink.of_xml_data_model
              GdataExtensions.FeedLink.empty
              (fun link -> { entry with feedLinks = link :: entry.feedLinks })
              cs
        | GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name _; `Namespace ns],
             _) when ns = Xmlm.ns_xmlns ->
            entry
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "quotaBytesUsed"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_gd ->
            { entry with quotaBytesUsed = int_of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "writersCanInvite"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Attribute; `Name "value"; `Namespace ""],
                 v)]) when ns = ns_docs ->
            { entry with writersCanInvite = bool_of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "md5Checksum"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = ns_docs ->
            { entry with md5Checksum = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "filename"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = ns_docs ->
            { entry with filename = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "suggestedFilename"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = ns_docs ->
            { entry with suggestedFilename = v }
        | extension ->
            let extensions = extension :: entry.extensions in
              { entry with extensions }

  end

  module Feed = GdataAtom.MakeFeed(Entry)(GdataAtom.Link)

  let get_documents_prefix namespace =
    if namespace = ns_docs then "docs"
    else GdataACL.get_acl_prefix namespace

  let parse_document_entry =
    GdataAtom.data_model_to_entry Entry.of_xml_data_model Entry.empty

  let document_entry_to_data_model =
    GdataAtom.element_to_data_model get_documents_prefix Entry.to_xml_data_model

  let document_feed_to_data_model =
    GdataAtom.element_to_data_model get_documents_prefix Feed.to_xml_data_model

end
(* END Documents data types *)

(* Utilities *)
module Rel =
struct
  type t =
    [ `Parent
    | `Thumbnail
    | `Revisions
    | `AltPost
    | `Icon
    | `AltEditMedia
    | GdataACL.Rel.t ]

  let to_string l  =
    match l with
        `Parent -> ns_docs ^ "#parent"
      | `Thumbnail -> ns_docs ^ "#thumbnail"
      | `Revisions -> ns_docs ^ "#revisions"
      | `AltPost -> ns_docs ^ "#alt-post"
      | `Icon -> ns_docs ^ "#icon"
      | `AltEditMedia -> ns_docs ^ "#alt-edit-media"
      | #GdataACL.Rel.t -> GdataACL.Rel.to_string l

end

let find_url rel feedLinks =
  let link = List.find
               (fun link ->
                  link.GdataExtensions.FeedLink.rel = Rel.to_string rel)
               feedLinks
  in
    link.GdataExtensions.FeedLink.href
(* END Utilities *)

