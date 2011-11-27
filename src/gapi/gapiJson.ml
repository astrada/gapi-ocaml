open GapiCore
open GapiUtils.Op

type json_data_type =
    Object
  | Array
  | Scalar

let json_data_type_to_string = function
    Object -> "Object"
  | Array -> "Array"
  | Scalar -> "Scalar"

type json_metadata =
    { name : string;
      data_type : json_data_type;
    }

let metadata_description { name = n; data_type = dt } =
  Printf.sprintf "name=%s data_type=%s" n (json_data_type_to_string dt)

type json_data_model = (json_metadata, Json_type.t) AnnotatedTree.t

let unexpected r e =
  match e with
      AnnotatedTree.Leaf (metadata, _) ->
        failwith ("Unexpected leaf: "
                  ^ (metadata_description metadata)
                  ^ " in " ^ r)
    | AnnotatedTree.Node (metadata, _) ->
        failwith ("Unexpected node: "
                  ^ (metadata_description metadata)
                  ^ " in " ^ r)

let render_value name default value =
  if value <> default then
    [AnnotatedTree.Leaf (
      { name = name; data_type = Scalar },
      value)]
  else
    []

let render_string_value ?(default = "") name value =
  render_value name (Json_type.String default) (Json_type.String value)

let render_int_value ?(default = 0) name value =
  render_value name (Json_type.Int default) (Json_type.Int value)

let render_bool_value ?(default = false) name value =
  render_value name (Json_type.Bool default) (Json_type.Bool value)

let render_struct name data_type xs =
  let xs' = List.concat xs in
    if xs' <> [] then
      [AnnotatedTree.Node (
        { name = name; data_type = data_type },
        xs')]
    else
      []

let render_object name xs =
  render_struct name Object xs

let render_array name render xs =
  let xs' = List.map render xs in
    render_struct name Array xs'

let parse_children parse_child empty_element update cs =
  let element = List.fold_left
                  parse_child
                  empty_element
                  cs
  in
    update element

let parse_array parse_child empty_element update cs =
  let xs = List.fold_right
                  (fun x xs' -> parse_child empty_element x :: xs')
                  cs
                  []
  in
    update xs

let json_to_data_model json_value =
  let rec map (name, value) =
    match value with
        Json_type.Object xs ->
          AnnotatedTree.Node (
            { name = name;
              data_type = Object },
            List.map map xs)
      | Json_type.Array xs ->
          AnnotatedTree.Node (
            { name = name;
              data_type = Array
            },
            List.map (fun x -> map ("", x)) xs)
      | _ ->
          AnnotatedTree.Leaf (
            { name = name;
              data_type = Scalar
            },
            value)
  in
    map ("", json_value)

let data_model_to_json tree =
  AnnotatedTree.fold
    (fun m xs ->
       match m.data_type with
           Object ->
             (m.name, Json_type.Object xs)
         | Array ->
             let xs' = List.map snd xs in
               (m.name, Json_type.Array xs')
         | _ -> failwith "Unexpected scalar JSON value in AnnotatedTree.Node"
    )
    (fun m x -> (m.name, x))
    tree
    |> snd

let parse_json_response parse pipe =
  let json_string = GapiConversation.read_all pipe in
  let json = Json_io.json_of_string json_string in
  let tree = json_to_data_model json in
    parse tree

let default_content_type = "application/json"

let render_json render_data_model data =
  let tree = render_data_model data in
  let json = data_model_to_json tree in
  let json_string = Json_io.string_of_json ~compact:true json in
    GapiCore.PostData.Body (json_string, default_content_type)

