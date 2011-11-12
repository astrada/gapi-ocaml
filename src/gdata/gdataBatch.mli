module Operation :
sig
  type t =
      None
    | Query
    | Insert
    | Update
    | Delete

  val to_string : t -> string

  val of_string : string -> t

end

module Status :
sig
  type t = {
    code : int;
    reason : string;
    content_type : string;
    content : string
  }

  val empty : t

  val to_xml_data_model : t -> GdataCore.xml_data_model list

  val of_xml_data_model : t -> GdataCore.xml_data_model -> t

end

