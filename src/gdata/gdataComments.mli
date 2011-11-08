module type COMMENTS =
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
    GdataAtom.FEED
      with type entry_t = Entry.t
        and type link_t = link_t

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

module Make :
  functor (Link : GdataCore.DATA) ->
  COMMENTS
    with type link_t = Link.t

