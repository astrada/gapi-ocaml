val ns_batch : string

module LastModifiedBy : GdataAtom.PersonConstruct

module type FeedLink =
sig
  type feed_t

  type t = {
    countHint : int;
    href : string;
    readOnly : bool;
    rel : string;
    feed : feed_t;
  }

  val countHint : (t, int) GapiLens.t
  val href : (t, string) GapiLens.t
  val readOnly : (t, bool) GapiLens.t
  val rel : (t, string) GapiLens.t
  val feed : (t, feed_t) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

module MakeFeedLink :
  functor (Feed : GdataAtom.Feed) ->
sig
  type feed_t = Feed.t

  type t = {
    countHint : int;
    href : string;
    readOnly : bool;
    rel : string;
    feed : feed_t;
  }

  val countHint : (t, int) GapiLens.t
  val href : (t, string) GapiLens.t
  val readOnly : (t, bool) GapiLens.t
  val rel : (t, string) GapiLens.t
  val feed : (t, feed_t) GapiLens.t

  include GdataAtom.AtomData with type t := t

end

module Rel :
sig
  type t =
    [ `Alternate
    | `Batch
    | `Edit
    | `EditMedia
    | `Feed
    | `Post
    | `ResumableCreateMedia
    | `ResumableEditMedia
    | `Self ]

  val to_string : [> t] -> string

end

val get_extensions_prefix : string -> string

