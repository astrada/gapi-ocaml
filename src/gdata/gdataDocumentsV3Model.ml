open GapiUtils.Infix

(* Document data types *)
let ns_docs = "http://schemas.google.com/docs/2007"

(* TODO:
 * fix GdataExtensions.FeedLink
 * move to GdataExtensions all elements not in atom namespace
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

      (* change entry data *)
      deleted : bool;
      removed : bool;
      changestamp : string;

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
      removed = false;
      deleted = false;
      changestamp = "";
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
         GdataAtom.render_bool_empty_element ns_docs "removed" entry.removed;
         GdataAtom.render_bool_empty_element ns_docs "deleted" entry.deleted;
         GdataAtom.render_value ns_docs "changestamp" entry.changestamp;
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
            ([`Element; `Name "edited"; `Namespace ns],
             [_; GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_app ->
            (* parse <app:edited xmlns:app="...">...</app:edited> *)
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
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "removed"; `Namespace ns],
             []) when ns = ns_docs ->
            { entry with removed = true }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "deleted"; `Namespace ns],
             []) when ns = GdataAtom.ns_gd ->
            { entry with deleted = true }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "changestamp"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Attribute; `Name "value"; `Namespace ""],
                 v)]) when ns = ns_docs ->
            { entry with changestamp = v }
        | GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name _; `Namespace ns],
             _) when ns = Xmlm.ns_xmlns ->
            entry
        | extension ->
            let extensions = extension :: entry.extensions in
              { entry with extensions }

  end

  module Feed = GdataAtom.MakeFeed(Entry)(GdataAtom.Link)

  let get_largest_changestamp feed =
    List.fold_left
      (fun r e ->
         match e with
           | GapiCore.AnnotatedTree.Node
               ([`Element; `Name "largestChangestamp"; `Namespace ns],
                [GapiCore.AnnotatedTree.Leaf
                   ([`Attribute; `Name "value"; `Namespace ""],
                    v)]) when ns = ns_docs ->
               v
           | _ -> r
      )
      ""
      feed.Feed.extensions

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

(* Metadata data types *)
module type DocumentFormat =
sig
  type t = {
    source : string;
    target : string;
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

module MakeDocumentFormat
  (M : sig val element_name : string end) =
struct
  type t = {
    source : string;
    target : string;
  }

  let empty = {
    source = "";
    target = "";
  }

  let to_xml_data_model fmt =
    GdataAtom.render_element ns_docs M.element_name
      [GdataAtom.render_attribute "" "source" fmt.source;
       GdataAtom.render_attribute "" "target" fmt.target]

  let of_xml_data_model fmt tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "source"; `Namespace ns],
           v) when ns = "" ->
          { fmt with source = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "target"; `Namespace ns],
           v) when ns = "" ->
          { fmt with target = v }
      | e ->
          GdataUtils.unexpected e

end

module ImportFormat =
  MakeDocumentFormat(struct let element_name = "importFormat" end)

module ExportFormat =
  MakeDocumentFormat(struct let element_name = "exportFormat" end)

module Feature =
struct
  type t = {
    featureName : string;
    featureRate : string;
  }

  let empty = {
    featureName = "";
    featureRate = "";
  }

  let to_xml_data_model feature =
    GdataAtom.render_element ns_docs "feature"
      [GdataAtom.render_text_element ns_docs "featureName" feature.featureName;
       GdataAtom.render_text_element ns_docs "featureRate" feature.featureRate]

  let of_xml_data_model feature tree =
    match tree with
        GapiCore.AnnotatedTree.Node
          ([`Element; `Name "featureName"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_docs ->
          { feature with featureName = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "featureRate"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = ns_docs ->
          { feature with featureRate = v }
      | e ->
          GdataUtils.unexpected e

end

module MaxUploadSize =
struct
  type t = {
    kind : string;
    value : int64;
  }

  let empty = {
    kind = "";
    value = 0L;
  }

  let to_xml_data_model size =
    GdataAtom.render_element ns_docs "maxUploadSize"
      [GdataAtom.render_attribute "" "kind" size.kind;
       GdataAtom.render_text (Int64.to_string size.value)]

  let of_xml_data_model size tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "kind"; `Namespace ns],
           v) when ns = "" ->
          { size with kind = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Text],
           v) ->
          { size with value = Int64.of_string v }
      | e ->
          GdataUtils.unexpected e

end

module AdditionalRoleSet =
struct
  type t = {
    primaryRole : string;
    additionalRoles : string list;
  }

  let empty = {
    primaryRole = "";
    additionalRoles = [];
  }

  let to_xml_data_model role =
    GdataAtom.render_element ns_docs "additionalRoleSet"
      [GdataAtom.render_attribute "" "primaryRole" role.primaryRole;
       GdataAtom.render_element_list (GdataAtom.render_value GdataACL.ns_gAcl "additionalRole") role.additionalRoles]

  let of_xml_data_model role tree =
    let parse_additionalRole _ tree =
      match tree with
          GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v) ->
            v
        | e ->
            GdataUtils.unexpected e
    in

    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "primaryRole"; `Namespace ns],
           v) when ns = "" ->
          { role with primaryRole = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "additionalRole"; `Namespace ns],
           cs) when ns = GdataACL.ns_gAcl ->
          GdataAtom.parse_children
            parse_additionalRole
            ""
            (fun additionalRole -> { role with additionalRoles = additionalRole :: role.additionalRoles })
            cs
      | e ->
          GdataUtils.unexpected e

end

module AdditionalRoleInfo =
struct
  type t = {
    kind : string;
    additionalRoleSets : AdditionalRoleSet.t list
  }

  let empty = {
    kind = "";
    additionalRoleSets = []
  }

  let to_xml_data_model role =
    GdataAtom.render_element ns_docs "additionalRoleInfo"
      [GdataAtom.render_attribute "" "kind" role.kind;
       GdataAtom.render_element_list AdditionalRoleSet.to_xml_data_model role.additionalRoleSets]

  let of_xml_data_model role tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "kind"; `Namespace ns],
           v) when ns = "" ->
          { role with kind = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "additionalRoleSet"; `Namespace ns],
           cs) when ns = ns_docs ->
          GdataAtom.parse_children
            AdditionalRoleSet.of_xml_data_model
            AdditionalRoleSet.empty
            (fun set -> { role with additionalRoleSets = set :: role.additionalRoleSets })
            cs
      | e ->
          GdataUtils.unexpected e

end

module Metadata =
struct

  module Entry =
  struct
    type t = {
      etag : string;
      id : GdataAtom.atom_id;
      updated : GdataAtom.atom_updated;
      categories : GdataAtom.Category.t list;
      title : GdataAtom.Title.t;
      links : GdataAtom.Link.t list;
      authors : GdataAtom.Author.t list;
      largestChangestamp : string;
      remainingChangestamps : string;
      quotaBytesTotal : int64;
      quotaBytesUsed : int64;
      quotaBytesUsedInTrash : int64;
      domainSharingPolicy : string;
      importFormats : ImportFormat.t list;
      exportFormats : ExportFormat.t list;
      features : Feature.t list;
      maxUploadSizes : MaxUploadSize.t list;
      additionalRoleInfos : AdditionalRoleInfo.t list;
      extensions : GdataCore.xml_data_model list
    }

    let empty = {
      etag = "";
      id = "";
      updated = GapiDate.epoch;
      categories = [];
      title = GdataAtom.Title.empty;
      links = [];
      authors = [];
      largestChangestamp = "";
      remainingChangestamps = "";
      quotaBytesTotal = 0L;
      quotaBytesUsed = 0L;
      quotaBytesUsedInTrash = 0L;
      domainSharingPolicy = "";
      importFormats = [];
      exportFormats = [];
      features = [];
      maxUploadSizes = [];
      additionalRoleInfos = [];
      extensions = []
    }

    let to_xml_data_model entry =
      GdataAtom.render_element GdataAtom.ns_atom "entry"
        [GdataAtom.render_attribute GdataAtom.ns_gd "etag" entry.etag;
         GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.id;
         GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.updated;
         GdataAtom.render_element_list GdataAtom.Category.to_xml_data_model entry.categories;
         GdataAtom.Title.to_xml_data_model entry.title;
         GdataAtom.render_element_list GdataAtom.Link.to_xml_data_model entry.links;
         GdataAtom.render_element_list GdataAtom.Author.to_xml_data_model entry.authors;
         GdataAtom.render_text_element ns_docs "largestChangestamp" entry.largestChangestamp;
         GdataAtom.render_text_element ns_docs "remainingChangestamps" entry.remainingChangestamps;
         GdataAtom.render_int64_element GdataAtom.ns_gd "quotaBytesTotal" entry.quotaBytesTotal;
         GdataAtom.render_int64_element GdataAtom.ns_gd "quotaBytesUsed" entry.quotaBytesUsed;
         GdataAtom.render_int64_element ns_docs "quotaBytesUsedInTrash" entry.quotaBytesUsedInTrash;
         GdataAtom.render_text_element ns_docs "domainSharingPolicy" entry.domainSharingPolicy;
         GdataAtom.render_element_list ImportFormat.to_xml_data_model entry.importFormats;
         GdataAtom.render_element_list ExportFormat.to_xml_data_model entry.exportFormats;
         GdataAtom.render_element_list Feature.to_xml_data_model entry.features;
         GdataAtom.render_element_list MaxUploadSize.to_xml_data_model entry.maxUploadSizes;
         GdataAtom.render_element_list AdditionalRoleInfo.to_xml_data_model entry.additionalRoleInfos;
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
            ([`Element; `Name "updated"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_atom ->
            { entry with updated = GapiDate.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "category"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Category.of_xml_data_model
              GdataAtom.Category.empty
              (fun category -> { entry with categories = category :: entry.categories })
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
            ([`Element; `Name "link"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Link.of_xml_data_model
              GdataAtom.Link.empty
              (fun link -> { entry with links = link :: entry.links })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "author"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.Author.of_xml_data_model
              GdataAtom.Author.empty
              (fun author -> { entry with authors = author :: entry.authors })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "largestChangestamp"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Attribute; `Name "value"; `Namespace ""],
                 v)]) when ns = ns_docs ->
            { entry with largestChangestamp = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "remainingChangestamps"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Attribute; `Name "value"; `Namespace ""],
                 v)]) when ns = ns_docs ->
            { entry with remainingChangestamps = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "quotaBytesTotal"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_gd ->
            { entry with quotaBytesTotal = Int64.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "quotaBytesUsed"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_gd ->
            { entry with quotaBytesUsed = Int64.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "quotaBytesUsedInTrash"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = ns_docs ->
            { entry with quotaBytesUsedInTrash = Int64.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "domainSharingPolicy"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = ns_docs ->
            { entry with domainSharingPolicy = v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "importFormat"; `Namespace ns],
             cs) when ns = ns_docs ->
            GdataAtom.parse_children
              ImportFormat.of_xml_data_model
              ImportFormat.empty
              (fun fmt -> { entry with importFormats = fmt :: entry.importFormats })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "exportFormat"; `Namespace ns],
             cs) when ns = ns_docs ->
            GdataAtom.parse_children
              ExportFormat.of_xml_data_model
              ExportFormat.empty
              (fun fmt -> { entry with exportFormats = fmt :: entry.exportFormats })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "feature"; `Namespace ns],
             cs) when ns = ns_docs ->
            GdataAtom.parse_children
              Feature.of_xml_data_model
              Feature.empty
              (fun feat -> { entry with features = feat :: entry.features })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "maxUploadSize"; `Namespace ns],
             cs) when ns = ns_docs ->
            GdataAtom.parse_children
              MaxUploadSize.of_xml_data_model
              MaxUploadSize.empty
              (fun size -> { entry with maxUploadSizes = size :: entry.maxUploadSizes })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "additionalRoleInfo"; `Namespace ns],
             cs) when ns = ns_docs ->
            GdataAtom.parse_children
              AdditionalRoleInfo.of_xml_data_model
              AdditionalRoleInfo.empty
              (fun role -> { entry with additionalRoleInfos = role :: entry.additionalRoleInfos })
              cs
        | GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name _; `Namespace ns],
             _) when ns = Xmlm.ns_xmlns ->
            entry
        | extension ->
            let extensions = extension :: entry.extensions in
              { entry with extensions }

  end

  let parse_metadata_entry =
    GdataAtom.data_model_to_entry Entry.of_xml_data_model Entry.empty

  let metadata_entry_to_data_model =
    GdataAtom.element_to_data_model Document.get_documents_prefix Entry.to_xml_data_model

end
(* END Metadata data types *)

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

