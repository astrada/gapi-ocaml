open GapiUtils.Infix
open GapiLens.Infix

(* Document data types *)
let ns_docs = "http://schemas.google.com/docs/2007"

module AclFeedLink = GdataExtensions.MakeFeedLink(GdataACL.Feed)

let get_documents_prefix namespace =
  if namespace = ns_docs then "docs"
  else GdataACL.get_acl_prefix namespace

module Revision =
struct
  module Entry =
  struct
    type t = {
      common : GdataAtom.BasicEntry.t;
      publish : bool;
      publishAuto : bool;
      publishOutsideDomain : bool;
      extensions : GdataAtom.GenericExtensions.t
    }

    let common = {
      GapiLens.get = (fun x -> x.common);
      GapiLens.set = (fun v x -> { x with common = v })
    }
    let publish = {
      GapiLens.get = (fun x -> x.publish);
      GapiLens.set = (fun v x -> { x with publish = v })
    }
    let publishAuto = {
      GapiLens.get = (fun x -> x.publishAuto);
      GapiLens.set = (fun v x -> { x with publishAuto = v })
    }
    let publishOutsideDomain = {
      GapiLens.get = (fun x -> x.publishOutsideDomain);
      GapiLens.set = (fun v x -> { x with publishOutsideDomain = v })
    }
    let extensions = {
      GapiLens.get = (fun x -> x.extensions);
      GapiLens.set = (fun v x -> { x with extensions = v })
    }

    let empty = {
      common = GdataAtom.BasicEntry.empty;
      publish = false;
      publishAuto = false;
      publishOutsideDomain = false;
      extensions = GdataAtom.GenericExtensions.empty
    }

    let to_xml_data_model entry =
      GdataAtom.render_element GdataAtom.ns_atom "entry"
        [GdataAtom.BasicEntry.to_xml_data_model entry.common;
         GdataAtom.render_bool_value ns_docs "publish" entry.publish;
         GdataAtom.render_bool_value ns_docs "publishAuto" entry.publishAuto;
         GdataAtom.render_bool_value ns_docs "publishOutsideDomain" entry.publishOutsideDomain;
         GdataAtom.GenericExtensions.to_xml_data_model entry.extensions]

    let of_xml_data_model entry tree =
      match tree with
          GapiCore.AnnotatedTree.Node
            ([_; `Name n; `Namespace ns],
             _)
        | GapiCore.AnnotatedTree.Leaf
            ([_; `Name n; `Namespace ns],
             _) when GdataAtom.BasicEntry.node_matches (n, ns) ->
            let common =
              GdataAtom.BasicEntry.of_xml_data_model entry.common tree
            in
              { entry with common }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "publish"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Attribute; `Name "value"; `Namespace ""],
                 v)]) when ns = ns_docs ->
            { entry with publish = bool_of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "publishAuto"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Attribute; `Name "value"; `Namespace ""],
                 v)]) when ns = ns_docs ->
            { entry with publishAuto = bool_of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "publishOutsideDomain"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Attribute; `Name "value"; `Namespace ""],
                 v)]) when ns = ns_docs ->
            { entry with publishOutsideDomain = bool_of_string v }
        | GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name _; `Namespace ns],
             _) when ns = Xmlm.ns_xmlns ->
            entry
        | extension ->
            let extensions =
              GdataAtom.GenericExtensions.of_xml_data_model
                entry.extensions
                extension
            in
              { entry with extensions }

  end

  module Feed =
    GdataAtom.MakeFeed(Entry)(GdataAtom.Link)(GdataAtom.GenericExtensions)

  let revisions_feed_to_data_model =
    GdataAtom.element_to_data_model get_documents_prefix Feed.to_xml_data_model

end

module RevisionsFeedLink = GdataExtensions.MakeFeedLink(Revision.Feed)

module Document =
struct
  module Entry =
  struct
    type t = {
      common : GdataAtom.BasicEntry.t;
      description : string;
      resourceId : string;
      lastModifiedBy : GdataExtensions.LastModifiedBy.t;
      lastViewed : GapiDate.t;
      aclFeedLink : AclFeedLink.t;
      revisionsFeedLink : RevisionsFeedLink.t; 
      quotaBytesUsed : int;
      writersCanInvite : bool;
      md5Checksum : string;
      filename : string;
      suggestedFilename : string;

      (* change entry data *)
      deleted : bool;
      removed : bool;
      changestamp : int;

      batch : GdataBatch.BatchExtensions.t;
    }

    let common = {
      GapiLens.get = (fun x -> x.common);
      GapiLens.set = (fun v x -> { x with common = v })
    }
    let description = {
      GapiLens.get = (fun x -> x.description);
      GapiLens.set = (fun v x -> { x with description = v })
    }
    let resourceId = {
      GapiLens.get = (fun x -> x.resourceId);
      GapiLens.set = (fun v x -> { x with resourceId = v })
    }
    let lastModifiedBy = {
      GapiLens.get = (fun x -> x.lastModifiedBy);
      GapiLens.set = (fun v x -> { x with lastModifiedBy = v })
    }
    let lastViewed = {
      GapiLens.get = (fun x -> x.lastViewed);
      GapiLens.set = (fun v x -> { x with lastViewed = v })
    }
    let aclFeedLink = {
      GapiLens.get = (fun x -> x.aclFeedLink);
      GapiLens.set = (fun v x -> { x with aclFeedLink = v })
    }
    let revisionsFeedLink = {
      GapiLens.get = (fun x -> x.revisionsFeedLink);
      GapiLens.set = (fun v x -> { x with revisionsFeedLink = v })
    }
    let quotaBytesUsed = {
      GapiLens.get = (fun x -> x.quotaBytesUsed);
      GapiLens.set = (fun v x -> { x with quotaBytesUsed = v })
    }
    let writersCanInvite = {
      GapiLens.get = (fun x -> x.writersCanInvite);
      GapiLens.set = (fun v x -> { x with writersCanInvite = v })
    }
    let md5Checksum = {
      GapiLens.get = (fun x -> x.md5Checksum);
      GapiLens.set = (fun v x -> { x with md5Checksum = v })
    }
    let filename = {
      GapiLens.get = (fun x -> x.filename);
      GapiLens.set = (fun v x -> { x with filename = v })
    }
    let suggestedFilename = {
      GapiLens.get = (fun x -> x.suggestedFilename);
      GapiLens.set = (fun v x -> { x with suggestedFilename = v })
    }
    let deleted = {
      GapiLens.get = (fun x -> x.deleted);
      GapiLens.set = (fun v x -> { x with deleted = v })
    }
    let removed = {
      GapiLens.get = (fun x -> x.removed);
      GapiLens.set = (fun v x -> { x with removed = v })
    }
    let changestamp = {
      GapiLens.get = (fun x -> x.changestamp);
      GapiLens.set = (fun v x -> { x with changestamp = v })
    }
    let batch = {
      GapiLens.get = (fun x -> x.batch);
      GapiLens.set = (fun v x -> { x with batch = v })
    }

    let empty = {
      common = GdataAtom.BasicEntry.empty;
      description = "";
      resourceId = "";
      lastModifiedBy = GdataExtensions.LastModifiedBy.empty;
      lastViewed = GapiDate.epoch;
      aclFeedLink = AclFeedLink.empty;
      revisionsFeedLink = RevisionsFeedLink.empty;
      quotaBytesUsed = 0;
      writersCanInvite = false;
      md5Checksum = "";
      filename = "";
      suggestedFilename = "";
      removed = false;
      deleted = false;
      changestamp = 0;
      batch = GdataBatch.BatchExtensions.empty;
    }

    let to_xml_data_model entry =
      GdataAtom.render_element GdataAtom.ns_atom "entry"
        [GdataAtom.BasicEntry.to_xml_data_model entry.common;
         GdataAtom.render_text_element ns_docs "description" entry.description;
         GdataAtom.render_text_element GdataAtom.ns_gd "resourceId" entry.resourceId;
         GdataExtensions.LastModifiedBy.to_xml_data_model entry.lastModifiedBy;
         GdataAtom.render_date_element GdataAtom.ns_gd "lastViewed" entry.lastViewed;
         AclFeedLink.to_xml_data_model entry.aclFeedLink;
         RevisionsFeedLink.to_xml_data_model entry.revisionsFeedLink;
         GdataAtom.render_int_element GdataAtom.ns_gd "quotaBytesUsed" entry.quotaBytesUsed;
         GdataAtom.render_bool_value ns_docs "writersCanInvite" entry.writersCanInvite;
         GdataAtom.render_text_element ns_docs "md5Checksum" entry.md5Checksum;
         GdataAtom.render_text_element ns_docs "filename" entry.filename;
         GdataAtom.render_text_element ns_docs "suggestedFilename" entry.suggestedFilename;
         GdataAtom.render_bool_empty_element ns_docs "removed" entry.removed;
         GdataAtom.render_bool_empty_element ns_docs "deleted" entry.deleted;
         GdataAtom.render_int_value ns_docs "changestamp" entry.changestamp;
         GdataBatch.BatchExtensions.to_xml_data_model entry.batch]

    let of_xml_data_model entry tree =
      match tree with
          GapiCore.AnnotatedTree.Node
            ([_; `Name n; `Namespace ns],
             _)
        | GapiCore.AnnotatedTree.Leaf
            ([_; `Name n; `Namespace ns],
             _) when GdataAtom.BasicEntry.node_matches (n, ns) ->
            let common =
              GdataAtom.BasicEntry.of_xml_data_model entry.common tree
            in
              { entry with common }
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
            ([`Element; `Name "lastModifiedBy"; `Namespace ns],
             cs) when ns = GdataAtom.ns_gd ->
            GdataAtom.parse_children
              GdataExtensions.LastModifiedBy.of_xml_data_model
              GdataExtensions.LastModifiedBy.empty
              (fun lastModifiedBy -> { entry with lastModifiedBy })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "lastViewed"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_gd ->
            { entry with lastViewed = GapiDate.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "feedLink"; `Namespace ns],
             (GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "rel"; `Namespace ""],
               "http://schemas.google.com/acl/2007#accessControlList")
              :: _ as cs)) when ns = GdataAtom.ns_gd ->
            GdataAtom.parse_children
              AclFeedLink.of_xml_data_model
              AclFeedLink.empty
              (fun link -> { entry with aclFeedLink = link })
              cs
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "feedLink"; `Namespace ns],
             (GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "rel"; `Namespace ""],
               "http://schemas.google.com/docs/2007/revisions")
              :: _ as cs)) when ns = GdataAtom.ns_gd ->
            GdataAtom.parse_children
              RevisionsFeedLink.of_xml_data_model
              RevisionsFeedLink.empty
              (fun link -> { entry with revisionsFeedLink = link })
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
            { entry with changestamp = int_of_string v }
        | GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name _; `Namespace ns],
             _) when ns = Xmlm.ns_xmlns ->
            entry
        | e ->
            let batch =
              GdataBatch.BatchExtensions.of_xml_data_model entry.batch e
            in
              { entry with batch }

  end

  module DocumentFeedExtensions =
  struct
    type t = {
      quotaBytesTotal : int64;
      quotaBytesUsed : int64;
      quotaBytesUsedInTrash : int64;
      largestChangestamp : int;
      extensions : GdataAtom.GenericExtensions.t;
    }

    let quotaBytesTotal = {
      GapiLens.get = (fun x -> x.quotaBytesTotal);
      GapiLens.set = (fun v x -> { x with quotaBytesTotal = v })
    }
    let quotaBytesUsed = {
      GapiLens.get = (fun x -> x.quotaBytesUsed);
      GapiLens.set = (fun v x -> { x with quotaBytesUsed = v })
    }
    let quotaBytesUsedInTrash = {
      GapiLens.get = (fun x -> x.quotaBytesUsedInTrash);
      GapiLens.set = (fun v x -> { x with quotaBytesUsedInTrash = v })
    }
    let largestChangestamp = {
      GapiLens.get = (fun x -> x.largestChangestamp);
      GapiLens.set = (fun v x -> { x with largestChangestamp = v })
    }
    let extensions = {
      GapiLens.get = (fun x -> x.extensions);
      GapiLens.set = (fun v x -> { x with extensions = v })
    }

    let empty = {
      quotaBytesTotal = 0L;
      quotaBytesUsed = 0L;
      quotaBytesUsedInTrash = 0L;
      largestChangestamp = 0;
      extensions = GdataAtom.GenericExtensions.empty;
    }

    let to_xml_data_model ext =
      List.concat
        [GdataAtom.render_int64_element GdataAtom.ns_gd "quotaBytesTotal" ext.quotaBytesTotal;
         GdataAtom.render_int64_element GdataAtom.ns_gd "quotaBytesUsed" ext.quotaBytesUsed;
         GdataAtom.render_int64_element ns_docs "quotaBytesUsedInTrash" ext.quotaBytesUsedInTrash;
         GdataAtom.render_int_value ns_docs "largestChangestamp" ext.largestChangestamp;
         GdataAtom.GenericExtensions.to_xml_data_model ext.extensions]

    let of_xml_data_model ext tree =
      match tree with
          GapiCore.AnnotatedTree.Node
            ([`Element; `Name "quotaBytesTotal"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_gd ->
            { ext with quotaBytesTotal = Int64.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "quotaBytesUsed"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = GdataAtom.ns_gd ->
            { ext with quotaBytesUsed = Int64.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "quotaBytesUsedInTrash"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Text], v)]) when ns = ns_docs ->
            { ext with quotaBytesUsedInTrash = Int64.of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "largestChangestamp"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Attribute; `Name "value"; `Namespace ""],
                 v)]) when ns = ns_docs ->
            { ext with largestChangestamp = int_of_string v }
        | extension ->
            let extensions =
              GdataAtom.GenericExtensions.of_xml_data_model
                ext.extensions
                extension
            in
              { ext with extensions }

  end

  module Feed =
    GdataAtom.MakeFeed(Entry)(GdataAtom.Link)(DocumentFeedExtensions)

  let largestChangestamp =
    Feed.extensions |-- DocumentFeedExtensions.largestChangestamp

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

  val source : (t, string) GapiLens.t
  val target : (t, string) GapiLens.t

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

	let source = {
		GapiLens.get = (fun x -> x.source);
		GapiLens.set = (fun v x -> { x with source = v })
	}
	let target = {
		GapiLens.get = (fun x -> x.target);
		GapiLens.set = (fun v x -> { x with target = v })
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

	let featureName = {
		GapiLens.get = (fun x -> x.featureName);
		GapiLens.set = (fun v x -> { x with featureName = v })
	}
	let featureRate = {
		GapiLens.get = (fun x -> x.featureRate);
		GapiLens.set = (fun v x -> { x with featureRate = v })
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

	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let value = {
		GapiLens.get = (fun x -> x.value);
		GapiLens.set = (fun v x -> { x with value = v })
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

	let primaryRole = {
		GapiLens.get = (fun x -> x.primaryRole);
		GapiLens.set = (fun v x -> { x with primaryRole = v })
	}
	let additionalRoles = {
		GapiLens.get = (fun x -> x.additionalRoles);
		GapiLens.set = (fun v x -> { x with additionalRoles = v })
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

	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let additionalRoleSets = {
		GapiLens.get = (fun x -> x.additionalRoleSets);
		GapiLens.set = (fun v x -> { x with additionalRoleSets = v })
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
      common : GdataAtom.BasicEntry.t;
      largestChangestamp : int;
      remainingChangestamps : int;
      quotaBytesTotal : int64;
      quotaBytesUsed : int64;
      quotaBytesUsedInTrash : int64;
      domainSharingPolicy : string;
      importFormats : ImportFormat.t list;
      exportFormats : ExportFormat.t list;
      features : Feature.t list;
      maxUploadSizes : MaxUploadSize.t list;
      additionalRoleInfos : AdditionalRoleInfo.t list;
      extensions : GdataAtom.GenericExtensions.t
    }

    let common = {
      GapiLens.get = (fun x -> x.common);
      GapiLens.set = (fun v x -> { x with common = v })
    }
    let largestChangestamp = {
      GapiLens.get = (fun x -> x.largestChangestamp);
      GapiLens.set = (fun v x -> { x with largestChangestamp = v })
    }
    let remainingChangestamps = {
      GapiLens.get = (fun x -> x.remainingChangestamps);
      GapiLens.set = (fun v x -> { x with remainingChangestamps = v })
    }
    let quotaBytesTotal = {
      GapiLens.get = (fun x -> x.quotaBytesTotal);
      GapiLens.set = (fun v x -> { x with quotaBytesTotal = v })
    }
    let quotaBytesUsed = {
      GapiLens.get = (fun x -> x.quotaBytesUsed);
      GapiLens.set = (fun v x -> { x with quotaBytesUsed = v })
    }
    let quotaBytesUsedInTrash = {
      GapiLens.get = (fun x -> x.quotaBytesUsedInTrash);
      GapiLens.set = (fun v x -> { x with quotaBytesUsedInTrash = v })
    }
    let domainSharingPolicy = {
      GapiLens.get = (fun x -> x.domainSharingPolicy);
      GapiLens.set = (fun v x -> { x with domainSharingPolicy = v })
    }
    let importFormats = {
      GapiLens.get = (fun x -> x.importFormats);
      GapiLens.set = (fun v x -> { x with importFormats = v })
    }
    let exportFormats = {
      GapiLens.get = (fun x -> x.exportFormats);
      GapiLens.set = (fun v x -> { x with exportFormats = v })
    }
    let features = {
      GapiLens.get = (fun x -> x.features);
      GapiLens.set = (fun v x -> { x with features = v })
    }
    let maxUploadSizes = {
      GapiLens.get = (fun x -> x.maxUploadSizes);
      GapiLens.set = (fun v x -> { x with maxUploadSizes = v })
    }
    let additionalRoleInfos = {
      GapiLens.get = (fun x -> x.additionalRoleInfos);
      GapiLens.set = (fun v x -> { x with additionalRoleInfos = v })
    }
    let extensions = {
      GapiLens.get = (fun x -> x.extensions);
      GapiLens.set = (fun v x -> { x with extensions = v })
    }

    let empty = {
      common = GdataAtom.BasicEntry.empty;
      largestChangestamp = 0;
      remainingChangestamps = 0;
      quotaBytesTotal = 0L;
      quotaBytesUsed = 0L;
      quotaBytesUsedInTrash = 0L;
      domainSharingPolicy = "";
      importFormats = [];
      exportFormats = [];
      features = [];
      maxUploadSizes = [];
      additionalRoleInfos = [];
      extensions = GdataAtom.GenericExtensions.empty
    }

    let to_xml_data_model entry =
      GdataAtom.render_element GdataAtom.ns_atom "entry"
        [GdataAtom.BasicEntry.to_xml_data_model entry.common;
         GdataAtom.render_int_element ns_docs "largestChangestamp" entry.largestChangestamp;
         GdataAtom.render_int_element ns_docs "remainingChangestamps" entry.remainingChangestamps;
         GdataAtom.render_int64_element GdataAtom.ns_gd "quotaBytesTotal" entry.quotaBytesTotal;
         GdataAtom.render_int64_element GdataAtom.ns_gd "quotaBytesUsed" entry.quotaBytesUsed;
         GdataAtom.render_int64_element ns_docs "quotaBytesUsedInTrash" entry.quotaBytesUsedInTrash;
         GdataAtom.render_text_element ns_docs "domainSharingPolicy" entry.domainSharingPolicy;
         GdataAtom.render_element_list ImportFormat.to_xml_data_model entry.importFormats;
         GdataAtom.render_element_list ExportFormat.to_xml_data_model entry.exportFormats;
         GdataAtom.render_element_list Feature.to_xml_data_model entry.features;
         GdataAtom.render_element_list MaxUploadSize.to_xml_data_model entry.maxUploadSizes;
         GdataAtom.render_element_list AdditionalRoleInfo.to_xml_data_model entry.additionalRoleInfos;
         GdataAtom.GenericExtensions.to_xml_data_model entry.extensions]

    let of_xml_data_model entry tree =
      match tree with
          GapiCore.AnnotatedTree.Node
            ([_; `Name n; `Namespace ns],
             _)
        | GapiCore.AnnotatedTree.Leaf
            ([_; `Name n; `Namespace ns],
             _) when GdataAtom.BasicEntry.node_matches (n, ns) ->
            let common =
              GdataAtom.BasicEntry.of_xml_data_model entry.common tree
            in
              { entry with common }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "largestChangestamp"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Attribute; `Name "value"; `Namespace ""],
                 v)]) when ns = ns_docs ->
            { entry with largestChangestamp = int_of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "remainingChangestamps"; `Namespace ns],
             [GapiCore.AnnotatedTree.Leaf
                ([`Attribute; `Name "value"; `Namespace ""],
                 v)]) when ns = ns_docs ->
            { entry with remainingChangestamps = int_of_string v }
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
            let extensions =
              GdataAtom.GenericExtensions.of_xml_data_model
                entry.extensions
                extension
            in
              { entry with extensions }

  end

  let parse_metadata_entry =
    GdataAtom.data_model_to_entry Entry.of_xml_data_model Entry.empty

  let metadata_entry_to_data_model =
    GdataAtom.element_to_data_model get_documents_prefix Entry.to_xml_data_model

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
      | _ -> failwith "BUG: Unexpected Rel value (GdataDocumentsV3Model)"

end

let find_url rel links =
  GdataAtom.find_url_generic
    (module Rel : GdataAtom.LinkRelation with type t = Rel.t) rel links

(* END Utilities *)

