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

