module Op = struct
  let (|>) x f = f x

  let (<<<) f g x = f (g x)

  let (>>>) f g x = g (f x)

end

let is_weak_etag etag =
  if String.length etag > 2 then
    String.sub etag 0 2 = "W/"
  else
    false

let merge_query_string parameters url =
  let neturl = Neturl.parse_url url in
  let fields =
    try
      Netencoding.Url.dest_url_encoded_parameters
        (Neturl.url_query ~encoded:true neturl)
    with Not_found -> [] in
  let query_string = Netencoding.Url.mk_url_encoded_parameters
                       (fields @ parameters) in
  let new_neturl = Neturl.modify_url
                     ~encoded:true
                     ~query:query_string
                     neturl in
    Neturl.string_of_url new_neturl

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

