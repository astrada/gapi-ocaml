module Metadata = struct
  type xml_node_type =
      [ `Element
      | `Attribute
      | `Text
      | `Cdata ]

  type xml =
      [ `Name of string
      | `Namespace of string
      | `Prefix of string
      | xml_node_type ] list

  (* TODO: use Set/Hashtbl/record instead of list? *)
  let name metadata =
    let name_element =
      List.find
        (fun element ->
           match element with
               `Name _ -> true
             | _ -> false)
        metadata
    in
      match name_element with
          `Name n -> n
        | _ -> assert false

  let prefix metadata =
    let prefix_element =
      List.find
        (fun element ->
           match element with
               `Prefix _ -> true
             | _ -> false)
        metadata
    in
      match prefix_element with
          `Prefix p -> p
        | _ -> assert false

  let namespace metadata =
    let namespace_element =
      List.find
        (fun element ->
           match element with
               `Namespace _ -> true
             | _ -> false)
        metadata
    in
      match namespace_element with
          `Namespace ns -> ns
        | _ -> assert false

  let node_type metadata =
    List.find
      (fun element ->
         match element with
             `Element
           | `Attribute
           | `Text
           | `Cdata -> true
           | _ -> false)
      metadata

  let description metadata =
    let n = try name metadata with Not_found -> "" in
    let p = try prefix metadata with Not_found -> "" in
    let ns = try namespace metadata with Not_found -> "" in
    let nt =
      try
        match node_type metadata with
            `Element -> "Element"
          | `Attribute -> "Attribute"
          | `Text -> "Text"
          | `Cdata -> "CData"
          | _ -> assert false
      with Not_found -> "" 
    in
      Printf.sprintf "type=%s name=%s prefix=%s namespace=%s" nt n p ns

end

let default_content_type = "application/atom+xml; charset=UTF-8"

type xml_data_model = (Metadata.xml, string) GapiCore.AnnotatedTree.t

