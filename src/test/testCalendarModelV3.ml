open OUnit

let test_parse_calendar_list () =
  let calendar_list_json =
    Json_io.load_json "test/data/test_calendar_list.json" in
  let tree = GapiJson.json_to_data_model calendar_list_json in
  let calendarListList = GapiCalendar.CalendarListList.of_data_model tree in
  let tree' = GapiCalendar.CalendarListList.to_data_model calendarListList in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree'

let suite = "Calendar (v3) Data Model test" >:::
  ["test_parse_calendar_list" >:: test_parse_calendar_list;
  ]

