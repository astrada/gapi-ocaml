open OUnit

let json_tree_to_string tree =
  let join _ = String.concat "," in
    GapiCore.AnnotatedTree.fold
      (fun m xs ->
         match m.GapiJson.data_type with
             GapiJson.Object ->
               Printf.sprintf "%a{%a}"
                 (fun _ n ->
                    if n <> "" then "\"" ^ n ^ "\":" else "") m.GapiJson.name
                 join xs
           | GapiJson.Array ->
               Printf.sprintf "\"%s\":[%a]" m.GapiJson.name join xs
           | _ -> assert false)
      (fun m value ->
         let s = Json_type.Browse.describe value in
           Printf.sprintf "\"%s\":%s" m.GapiJson.name s)
      tree

let test_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (calendar_list, session) =
         GapiCalendarService.calendar_list
           session
       in
         assert_equal
           "calendar#calendarList"
           calendar_list.GapiCalendar.CalendarListList.kind;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_parse_list () =
  let calendar_list_json =
    Json_io.load_json "test/data/test_calendar_list.json" in
  let tree = GapiJson.json_to_data_model calendar_list_json in
  let calendarListList = GapiCalendar.CalendarListList.parse tree in
  let tree' = GapiCalendar.CalendarListList.render calendarListList in
    assert_equal
      ~printer:json_tree_to_string
      tree
      tree'

let suite = "Calendar List (v3) test" >:::
  ["test_list" >:: test_list;
   "test_parse_list" >:: test_parse_list
  ]

