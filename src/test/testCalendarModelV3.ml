open OUnit
open GapiCalendar
open GapiACL
open GapiLens.Infix
open GapiUtils.Infix

let first_item_timeZone =
  CalendarListList.items
    |-- GapiLens.head
      |-- CalendarListResource.timeZone
let second_item_summary =
  CalendarListList.items
    |-- GapiLens.tail
      |-- GapiLens.head
        |-- CalendarListResource.summary
let second_item_first_defaultReminder_minutes =
  CalendarListList.items
    |-- GapiLens.for_list 1
      |-- CalendarListResource.defaultReminders
        |-- GapiLens.head
          |-- Reminder.minutes

let load_calendar_list () =
  let calendar_list_json =
    Json_io.load_json "test/data/test_calendar_list.json" in
  let tree = GapiJson.json_to_data_model calendar_list_json in
    CalendarListList.of_data_model tree

let test_lenses_get () =
  let calendar_list = load_calendar_list () in
  let tz = calendar_list |> first_item_timeZone.GapiLens.get in
  let summ = calendar_list |. second_item_summary in
  let min = calendar_list |. second_item_first_defaultReminder_minutes in
    assert_equal
      ~printer:Std.identity
      "America/Los_Angeles"
      tz;
    assert_equal
      ~printer:Std.identity
      "calendarListEntrySummary"
      summ;
    assert_equal
      ~printer:string_of_int
      10
      min

let test_lenses_set () =
  let calendar_list = load_calendar_list () in
  let calendar_list' = calendar_list
    |> first_item_timeZone.GapiLens.set "New TZ"
    |> second_item_summary ^= "New Summary"
    |> second_item_first_defaultReminder_minutes += 10 in
  let tz = calendar_list' |. first_item_timeZone in
  let summ = calendar_list' |. second_item_summary in
  let min = calendar_list' |. second_item_first_defaultReminder_minutes in
    assert_equal
      ~printer:Std.identity
      "New TZ"
      tz;
    assert_equal
      ~printer:Std.identity
      "New Summary"
      summ;
    assert_equal
      ~printer:string_of_int
      20
      min

let test_lenses_modify () =
  let calendar_list = load_calendar_list () in
  let calendar_list' = calendar_list
    |> CalendarListList.items
    ^%= GapiLens.for_list 1
    ^%= CalendarListResource.summary ^= "Updated Summary" in
  let summ = calendar_list'
    |. CalendarListList.items
    |. GapiLens.for_list 1
    |. CalendarListResource.summary
  in
    assert_equal
      ~printer:Std.identity
      "Updated Summary"
      summ

let test_parse_calendar_list () =
  let calendar_list_json =
    Json_io.load_json "test/data/test_calendar_list.json" in
  let tree = GapiJson.json_to_data_model calendar_list_json in
  let calendarListList = CalendarListList.of_data_model tree in
  let tree' = CalendarListList.to_data_model calendarListList in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      calendar_list_json
      json

let test_parse_calendar_acl () =
  let calendar_acl_json =
    Json_io.load_json "test/data/test_calendar_acl.json" in
  let tree = GapiJson.json_to_data_model calendar_acl_json in
  let acl_list = ACLList.of_data_model tree in
  let tree' = ACLList.to_data_model acl_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      calendar_acl_json
      json

let test_parse_calendars () =
  let calendars_json =
    Json_io.load_json "test/data/test_calendars.json" in
  let tree = GapiJson.json_to_data_model calendars_json in
  let calendars = CalendarsResource.of_data_model tree in
  let tree' = CalendarsResource.to_data_model calendars in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      calendars_json
      json

let test_parse_colors () =
  let colors_json =
    Json_io.load_json "test/data/test_calendar_colors.json" in
  let tree = GapiJson.json_to_data_model colors_json in
  let colors = ColorList.of_data_model tree in
  let tree' = ColorList.to_data_model colors in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      colors_json
      json

let test_parse_settings () =
  let settings_json =
    Json_io.load_json "test/data/test_calendar_settings.json" in
  let tree = GapiJson.json_to_data_model settings_json in
  let settings = SettingsList.of_data_model tree in
  let tree' = SettingsList.to_data_model settings in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Json_io.string_of_json
      settings_json
      json

let suite = "Calendar (v3) Data Model test" >:::
  ["test_lenses_get" >:: test_lenses_get;
   "test_lenses_set" >:: test_lenses_set;
   "test_lenses_modify" >:: test_lenses_modify;
   "test_parse_calendar_list" >:: test_parse_calendar_list;
   "test_parse_calendar_acl" >:: test_parse_calendar_acl;
   "test_parse_calendars" >:: test_parse_calendars;
   "test_parse_colors" >:: test_parse_colors;
   "test_parse_settings" >:: test_parse_settings;
  ]

