module Make :
  functor (Link : GdataCore.DATA) ->
sig
  module Entry :
  sig
    type t = {
      ce_etag : string;
      ce_authors : GdataAtom.atom_author list;
      ce_content : GdataAtom.atom_content;
      ce_contributors : GdataAtom.atom_contributor list;
      ce_id : GdataAtom.atom_id;
      ce_published : GdataAtom.atom_published;
      ce_updated : GdataAtom.atom_updated;
      ce_links : Link.t list;
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
    type t = GdataAtom.MakeFeed(Entry)(Link).t = {
      etag : string;
      kind : string;
      authors : GdataAtom.atom_author list;
      categories : GdataAtom.atom_category list;
      contributors : GdataAtom.atom_contributor list;
      generator : GdataAtom.atom_generator;
      icon : GdataAtom.atom_icon;
      id : GdataAtom.atom_id;
      updated : GdataAtom.atom_updated;
      entries : Entry.t list;
      links : Link.t list;
      logo : GdataAtom.atom_logo;
      rights : GdataAtom.atom_textConstruct;
      subtitle : GdataAtom.atom_textConstruct;
      title : GdataAtom.atom_textConstruct;
      totalResults : GdataAtom.opensearch_totalResults;
      itemsPerPage : GdataAtom.opensearch_itemsPerPage;
      startIndex : GdataAtom.opensearch_startIndex;
      extensions : GdataCore.xml_data_model list
    }

    val empty : t

    val of_xml_data_model : t -> GdataCore.xml_data_model -> t

    val to_xml_data_model : t -> GdataCore.xml_data_model list

    val parse_feed : GdataCore.xml_data_model -> t

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

