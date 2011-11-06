module type COMMENTS =
sig
  type link_t

  module Entry :
  sig
    type t = {
      ce_etag : string;
      ce_kind : string;
      ce_authors : GdataAtom.Author.t list;
      ce_content : GdataAtom.atom_content;
      ce_contributors : GdataAtom.Contributor.t list;
      ce_id : GdataAtom.atom_id;
      ce_published : GdataAtom.atom_published;
      ce_updated : GdataAtom.atom_updated;
      ce_links : link_t list;
      ce_title : GdataAtom.atom_textConstruct;
      ce_category : GdataAtom.atom_category;
      ce_extensions : GdataCore.xml_data_model list
    }

    val empty : t

    val of_xml_data_model : t -> GdataCore.xml_data_model -> t

    val to_xml_data_model : t -> GdataCore.xml_data_model list

  end

  module Feed :
  sig
    include GdataAtom.FEED
      with type entry_t = Entry.t
        and type link_t = link_t

  end

  type comments = {
    c_countHint : int;
    c_href : string;
    c_readOnly : bool;
    c_rel : string;
    c_commentFeed : Feed.t;
  }

  val empty_comments : comments

  val parse_comments :
    comments ->
    GdataCore.xml_data_model ->
    comments

  val parse_comment_entry :
    GdataCore.xml_data_model ->
    Entry.t

  val comment_entry_to_data_model :
    Entry.t ->
    GdataCore.xml_data_model

  val render_comments :
    comments ->
    GdataCore.xml_data_model list

end

module Make :
  functor (Link : GdataCore.DATA) ->
sig
  include COMMENTS
    with type link_t = Link.t

end

