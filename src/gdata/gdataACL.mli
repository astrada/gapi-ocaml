(** Google Data Protocol ACLs data model.
  *)

val ns_gAcl : string

module RoleWithKey :
sig
  type t = {
    key : string;
    role : string
  }

  val key : (t, string) GapiLens.t
  val role : (t, string) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

module Scope :
sig
  type t = {
    _type : string;
    value : string
  }

  val _type : (t, string) GapiLens.t
  val value : (t, string) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

module Entry :
sig
  type t = {
    common : GdataAtom.BasicEntry.t;
    scope : Scope.t;
    role : string;
    additionalRole : string;
    withKey : RoleWithKey.t;
    batch : GdataBatch.BatchExtensions.t;
  }

  val common : (t, GdataAtom.BasicEntry.t) GapiLens.t
  val scope : (t, Scope.t) GapiLens.t
  val role : (t, string) GapiLens.t
  val additionalRole : (t, string) GapiLens.t
  val withKey : (t, RoleWithKey.t) GapiLens.t
  val batch : (t, GdataBatch.BatchExtensions.t) GapiLens.t

  val etag : (t, string) GapiLens.t
  val id : (t, GdataAtom.atom_id) GapiLens.t
  val links : (t, GdataAtom.Link.t list) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

val parse_entry : GdataCore.xml_data_model -> Entry.t

val entry_to_data_model : Entry.t -> GdataCore.xml_data_model

module Feed : GdataAtom.Feed
  with type entry_t = Entry.t
    and type link_t = GdataAtom.Link.t

val parse_feed : GdataCore.xml_data_model -> Feed.t

val feed_to_data_model : Feed.t -> GdataCore.xml_data_model

module Rel :
sig
  type t =
    [ `Acl
    | GdataExtensions.Rel.t ]

  val to_string : [> t] -> string

end

val find_url : Rel.t -> GdataAtom.Link.t list -> string

val get_acl_prefix : string -> string

