let string_to_option = function
    "" -> None
  | s -> Some s

let unexpected e =
  match e with
      GapiCore.AnnotatedTree.Leaf (metadata, _) ->
        failwith ("Unexpected leaf: "
                  ^ (GdataCore.Metadata.description metadata))
    | GapiCore.AnnotatedTree.Node (metadata, _) ->
        failwith ("Unexpected node: "
                  ^ (GdataCore.Metadata.description metadata))

let build_namespace_table get_prefix tree =
  let table = Hashtbl.create 16 in
  let add_namespace meta _ =
    let namespace =
      try GdataCore.Metadata.namespace meta with Not_found -> ""
    in
      if namespace <> "" && namespace <> Xmlm.ns_xml then
        let prefix =
          try
            GdataCore.Metadata.prefix meta
          with Not_found -> get_prefix namespace
        in
          Hashtbl.replace table namespace prefix
      else
        ()
  in
    GapiCore.AnnotatedTree.fold
      add_namespace
      add_namespace
      tree;
    Hashtbl.fold
      (fun key value xs -> (key, value) :: xs)
      table
      []

let append_namespaces ns_table tree =
  match tree with
      GapiCore.AnnotatedTree.Node (m, cs) ->
        let attributes =
          List.map
            (fun (ns, p) ->
               GapiCore.AnnotatedTree.Leaf (
                 [`Attribute; `Name p; `Namespace Xmlm.ns_xmlns],
                 ns))
            ns_table
        in
          GapiCore.AnnotatedTree.Node (m, cs @ attributes )
    | GapiCore.AnnotatedTree.Leaf _ ->
        tree

let render_xml buffer tree =
  let output = Xmlm.make_output (`Buffer buffer) in
  let rec frag_of_node node =
    match node with
        GapiCore.AnnotatedTree.Leaf ([`Text], d)
      | GapiCore.AnnotatedTree.Leaf ([`Cdata], d) ->
          `Data d
      | GapiCore.AnnotatedTree.Node ([`Element;
                                       `Name name;
                                       `Namespace namespace],
                                      children) ->
          let attributes = List.fold_left
                             (fun attrs e ->
                                match e with
                                    GapiCore.AnnotatedTree.Leaf ([`Attribute;
                                                                   `Name n;
                                                                   `Namespace ns],
                                                                  d) ->
                                      ((ns, n), d) :: attrs
                                  | _ -> attrs)
                             []
                             children in
          let elements =
            List.filter
              (fun e ->
                 match e with
                     GapiCore.AnnotatedTree.Leaf (m, _)
                   | GapiCore.AnnotatedTree.Node (m, _) ->
                       match GdataCore.Metadata.node_type m with
                           `Attribute -> false
                         | _ -> true) children
          in
            `El (((namespace, name), attributes), elements)
      | _ -> assert false
  in
    Xmlm.output_doc_tree frag_of_node output (None, tree)

let data_to_xml_string ?(buffer_size = 512) tree =
  let buffer = Buffer.create buffer_size in
  let () = render_xml buffer tree in
  let result = Buffer.contents buffer in
    (* Replace new-line character after xml declaration, because it causes a
     * server-side error *)
    String.fill result 38 1 ' ';
    result

let parse_xml next_byte parse_tree =
  let input = Xmlm.make_input ~strip:true (`Fun next_byte) in 
  let el tag children =
    let ((namespace, name), attribute_list) = tag in
    let attrs = List.map
                  (fun ((ns, n), d) ->
                     GapiCore.AnnotatedTree.Leaf (
                       [`Attribute;
                        `Name n;
                        `Namespace ns],
                       d)
                  )
                  attribute_list in
      GapiCore.AnnotatedTree.Node (
        [`Element;
         `Name name;
         `Namespace namespace],
        attrs @ children) in
  let data d =
    GapiCore.AnnotatedTree.Leaf (
      [`Text],
      d) in
  let (_, tree) = Xmlm.input_doc_tree ~el ~data input in
    parse_tree tree

let parse_xml_response parse_xml_tree pipe =
  parse_xml
    (fun () -> GapiPipe.OcamlnetPipe.read_byte pipe)
    parse_xml_tree

