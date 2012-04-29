open GapiUtils.Infix
open GdataAtom

module FeedLink =
struct
  type t = {
    countHint : int;
    href : string;
    readOnly : bool;
    rel : string;
    (*
    feed : Feed.t
     *)
  }

  let empty = {
    countHint = 0;
    href = "";
    readOnly = false;
    rel = "";
    (*
    feed = Feed.empty
     *)
  }

  let to_xml_data_model link =
    render_element ns_gd "feedLink"
      [render_int_attribute "" "countHint" link.countHint;
       render_attribute "" "href" link.href;
       render_bool_attribute "" "readOnly" link.readOnly;
       render_attribute "" "rel" link.rel;
       (*
       Feed.to_xml_data_model link.feed
        *)]

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
            (*
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "feed"; `Namespace ns],
           cs) when ns = ns_atom ->
          parse_children
            Feed.of_xml_data_model
            Feed.empty
            (fun feed -> { link with feed })
            cs
             *)
      | e ->
          GdataUtils.unexpected e

end

