open GapiUtils.Infix
open GdataAtom

let ns_batch = "http://schemas.google.com/gdata/batch"

module LastModifiedBy =
  GdataAtom.MakePersonConstruct(struct
                                  let element_ns = GdataAtom.ns_gd
                                  let element_name = "lastModifiedBy"
                                end)

module type FeedLink =
sig
  type feed_t

  type t = {
    countHint : int;
    href : string;
    readOnly : bool;
    rel : string;
    feed : feed_t
  }

  val empty : t

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

end

module MakeFeedLink
  (Feed : GdataAtom.Feed) =
struct
  type feed_t = Feed.t

  type t = {
    countHint : int;
    href : string;
    readOnly : bool;
    rel : string;
    feed : feed_t
  }

  let empty = {
    countHint = 0;
    href = "";
    readOnly = false;
    rel = "";
    feed = Feed.empty
  }

  let to_xml_data_model link =
    render_element GdataAtom.ns_gd "feedLink"
      [render_int_attribute "" "countHint" link.countHint;
       render_attribute "" "href" link.href;
       render_bool_attribute "" "readOnly" link.readOnly;
       render_attribute "" "rel" link.rel;
       Feed.to_xml_data_model link.feed]

  let of_xml_data_model link tree =
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
           cs) when ns = ns_atom ->
          parse_children
            Feed.of_xml_data_model
            Feed.empty
            (fun feed -> { link with feed })
            cs
      | e ->
          GdataUtils.unexpected e

end

module Rel =
struct
  type t =
    [ `Feed
    | `Post
    | `Batch
    | `ResumableCreateMedia
    | `ResumableEditMedia
    | GdataAtom.Rel.t ]

  let to_string l  =
    match l with
        `Feed -> GdataAtom.ns_gd ^ "#feed"
      | `Post -> GdataAtom.ns_gd ^ "#post"
      | `Batch -> GdataAtom.ns_gd ^ "#batch"
      | `ResumableCreateMedia -> GdataAtom.ns_gd ^ "#resumable-create-media"
      | `ResumableEditMedia -> GdataAtom.ns_gd ^ "#resumable-edit-media"
      | #GdataAtom.Rel.t -> GdataAtom.Rel.to_string l
      | _ -> failwith "BUG: Unexpected Rel value (GdataExtensions)"

end

let get_extensions_prefix namespace =
  if namespace = GdataAtom.ns_gd then "gd"
  else if namespace = ns_batch then "batch"
  else GdataAtom.get_standard_prefix namespace

