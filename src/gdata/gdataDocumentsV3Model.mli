(** Google Documents List API (v3) data definitions.
  *)

val ns_docs : string

module AclFeedLink : GdataExtensions.FeedLink
  with type feed_t = GdataACL.Feed.t

module Revision :
sig
  module Entry :
  sig
    type t = {
      common : GdataAtom.BasicEntry.t;
      publish : bool;
      publishAuto : bool;
      publishOutsideDomain : bool;
      extensions : GdataAtom.GenericExtensions.t;
    }

    val common : (t, GdataAtom.BasicEntry.t) GapiLens.t
    val publish : (t, bool) GapiLens.t
    val publishAuto : (t, bool) GapiLens.t
    val publishOutsideDomain : (t, bool) GapiLens.t
    val extensions : (t, GdataAtom.GenericExtensions.t) GapiLens.t

    include GdataAtom.AtomData with type t := t

  end

  module Feed : GdataAtom.Feed
    with type entry_t = Entry.t
      and type link_t = GdataAtom.Link.t
      and type extensions_t = GdataAtom.GenericExtensions.t

end

module RevisionsFeedLink : GdataExtensions.FeedLink
  with type feed_t = Revision.Feed.t

module Document :
sig
  module Entry :
  sig
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
      deleted : bool;
      removed : bool;
      changestamp : int;
      extensions : GdataAtom.GenericExtensions.t;
    }

    val common : (t, GdataAtom.BasicEntry.t) GapiLens.t
    val description : (t, string) GapiLens.t
    val resourceId : (t, string) GapiLens.t
    val lastModifiedBy : (t, GdataExtensions.LastModifiedBy.t) GapiLens.t
    val lastViewed : (t, GapiDate.t) GapiLens.t
    val aclFeedLink : (t, AclFeedLink.t) GapiLens.t
    val revisionsFeedLink : (t, RevisionsFeedLink.t) GapiLens.t
    val quotaBytesUsed : (t, int) GapiLens.t
    val writersCanInvite : (t, bool) GapiLens.t
    val md5Checksum : (t, string) GapiLens.t
    val filename : (t, string) GapiLens.t
    val suggestedFilename : (t, string) GapiLens.t
    val deleted : (t, bool) GapiLens.t
    val removed : (t, bool) GapiLens.t
    val changestamp : (t, int) GapiLens.t
    val extensions : (t, GdataAtom.GenericExtensions.t) GapiLens.t

    include GdataAtom.AtomData with type t := t

  end

  module DocumentFeedExtensions :
  sig
    type t = {
      quotaBytesTotal : int64;
      quotaBytesUsed : int64;
      quotaBytesUsedInTrash : int64;
      largestChangestamp : int;
      extensions : GdataAtom.GenericExtensions.t;
    }

    val quotaBytesTotal : (t, int64) GapiLens.t
    val quotaBytesUsed : (t, int64) GapiLens.t
    val quotaBytesUsedInTrash : (t, int64) GapiLens.t
    val largestChangestamp : (t, int) GapiLens.t
    val extensions : (t, GdataAtom.GenericExtensions.t) GapiLens.t

    include GdataAtom.AtomData with type t := t

  end

  module Feed : GdataAtom.Feed
    with type entry_t = Entry.t
      and type link_t = GdataAtom.Link.t
      and type extensions_t = DocumentFeedExtensions.t

  val largestChangestamp : (Feed.t, int) GapiLens.t

  val get_documents_prefix : string -> string

  val parse_document_entry : GdataCore.xml_data_model -> Entry.t

  val document_entry_to_data_model : Entry.t -> GdataCore.xml_data_model

  val document_feed_to_data_model : Feed.t -> GdataCore.xml_data_model

end

module type DocumentFormat =
sig
  type t = {
    source : string;
    target : string;
  }

  val source : (t, string) GapiLens.t
  val target : (t, string) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

module MakeDocumentFormat :
  functor (M : sig val element_name : string end) -> DocumentFormat

module ImportFormat : DocumentFormat

module ExportFormat : DocumentFormat

module Feature :
sig
  type t = {
    featureName : string;
    featureRate : string;
  }

  val featureName : (t, string) GapiLens.t
  val featureRate : (t, string) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

module MaxUploadSize :
sig
  type t = {
    kind : string;
    value : int64;
  }

  val kind : (t, string) GapiLens.t
  val value : (t, int64) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

module AdditionalRoleSet :
sig
  type t = {
    primaryRole : string;
    additionalRoles : string list;
  }

  val primaryRole : (t, string) GapiLens.t
  val additionalRoles : (t, string list) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

module AdditionalRoleInfo :
sig
  type t = {
    kind : string;
    additionalRoleSets : AdditionalRoleSet.t list;
  }

  val kind : (t, string) GapiLens.t
  val additionalRoleSets : (t, AdditionalRoleSet.t list) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

module Metadata :
sig
  module Entry :
  sig
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
      extensions : GdataAtom.GenericExtensions.t;
    }

    val common : (t, GdataAtom.BasicEntry.t) GapiLens.t
    val largestChangestamp : (t, int) GapiLens.t
    val remainingChangestamps : (t, int) GapiLens.t
    val quotaBytesTotal : (t, int64) GapiLens.t
    val quotaBytesUsed : (t, int64) GapiLens.t
    val quotaBytesUsedInTrash : (t, int64) GapiLens.t
    val domainSharingPolicy : (t, string) GapiLens.t
    val importFormats : (t, ImportFormat.t list) GapiLens.t
    val exportFormats : (t, ExportFormat.t list) GapiLens.t
    val features : (t, Feature.t list) GapiLens.t
    val maxUploadSizes : (t, MaxUploadSize.t list) GapiLens.t
    val additionalRoleInfos : (t, AdditionalRoleInfo.t list) GapiLens.t
    val extensions : (t, GdataAtom.GenericExtensions.t) GapiLens.t

    include GdataAtom.AtomData with type t := t

  end

  val parse_metadata_entry : GdataCore.xml_data_model -> Entry.t

  val metadata_entry_to_data_model : Entry.t -> GdataCore.xml_data_model

end

module Rel :
sig
  type t =
    [ `Parent
    | `Thumbnail
    | `Revisions
    | `AltPost
    | `Icon
    | `AltEditMedia
    | GdataACL.Rel.t ]

  val to_string : [> t] -> string

end

val find_url : Rel.t -> GdataAtom.Link.t list -> string

