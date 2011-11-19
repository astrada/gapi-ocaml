open OUnit

type json_data_type =
    Object
  | Array
  | Scalar

type json_metadata =
    { name : string;
      data_type : json_data_type;
    }

type json_data_model = (json_metadata, Json_type.t) GapiCore.AnnotatedTree.t

let json_tree_to_string tree =
  let join _ = String.concat "," in
    GapiCore.AnnotatedTree.fold
      (fun m xs ->
         match m.data_type with
             Object ->
               Printf.sprintf "%a{%a}"
                 (fun _ n -> if n <> "" then "\"" ^ n ^ "\":" else "") m.name
                 join xs
           | Array ->
               Printf.sprintf "\"%s\":[%a]" m.name join xs
           | _ -> assert false)
      (fun m value ->
         let s = Json_type.Browse.describe value in
           Printf.sprintf "\"%s\":%s" m.name s)
      tree

let json_to_data_model json_value =
  let rec map (name, value) =
    match value with
        Json_type.Object xs ->
          GapiCore.AnnotatedTree.Node (
            { name = name;
              data_type = Object },
            List.map map xs)
      | Json_type.Array xs ->
          GapiCore.AnnotatedTree.Node (
            { name = name;
              data_type = Array
            },
            List.map (fun x -> map ("", x)) xs)
      | _ ->
          GapiCore.AnnotatedTree.Leaf (
            { name = name;
              data_type = Scalar
            },
            value)
  in
    map ("", json_value)

let test_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (response, session) =
         GapiService.query
           "https://www.googleapis.com/calendar/v3/users/me/calendarList"
           GapiConversation.read_all
           session
       in
         TestHelper.assert_not_empty
           "Response should not be empty"
           response;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_parse_list () =
  let calendar_list_json =
    Json_io.load_json "test/data/test_calendar_list.json" in
  let tree = json_to_data_model calendar_list_json in
  let s = json_tree_to_string tree in
    print_endline s
    (*
  let table = Json_type.Browse.make_table
                (Json_type.Browse.objekt calendar_list_json) in
  let kind = Json_type.Browse.string (Json_type.Browse.field table "kind") in
  let etag = Json_type.Browse.string (Json_type.Browse.field table "etag") in
  let nextPageToken = Json_type.Browse.string (Json_type.Browse.field table "nextPageToken") in
  let items = Json_type.Browse.array (Json_type.Browse.field table "items") in
    assert_equal "calendar#calendarList" kind;
    assert_equal "calendarListEtag" etag;
    assert_equal "nextPageToken" nextPageToken;
    assert_equal 2 (List.length items)
     *)

let suite = "Calendar List (v3) test" >:::
  [(*"test_list" >:: test_list;*)
   "test_parse_list" >:: test_parse_list
  ]

