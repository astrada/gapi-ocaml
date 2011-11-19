module Operation =
struct
  type t =
      None
    | Query
    | Insert
    | Update
    | Delete

  let to_string operation =
    match operation with
        None -> ""
      | Query -> "query"
      | Insert -> "insert"
      | Update -> "update"
      | Delete -> "delete"

  let of_string operation =
    match operation with
        "" -> None
      | "query" -> Query
      | "insert" -> Insert
      | "update" -> Update
      | "delete" -> Delete
      | _ -> failwith ("Batch operation " ^ operation ^ " unsupported")

end

module Status =
struct
  type t = {
    code : int;
    reason : string;
    content_type : string;
    content : string
  }

  let empty =  {
    code = 0;
    reason = "";
    content_type = "";
    content = ""
  }

  let to_xml_data_model status =
    GdataAtom.render_element GdataAtom.ns_batch "status"
      [GdataAtom.render_int_attribute "" "code" status.code;
       GdataAtom.render_attribute "" "reason" status.reason;
       GdataAtom.render_attribute "" "content-type" status.content_type;
       GdataAtom.render_text status.content]

  let of_xml_data_model status tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "code"; `Namespace ""],
           v) ->
          { status with code = int_of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "reason"; `Namespace ""],
           v) ->
          { status with reason = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "content-type"; `Namespace ""],
           v) ->
          { status with content_type = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Text],
           v) ->
          { status with content = v }
      | e ->
          GdataUtils.unexpected e

end

