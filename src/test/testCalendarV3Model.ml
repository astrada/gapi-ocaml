open OUnit
open GapiCalendarV3Model
open GapiLens.Infix
open GapiUtils.Infix

let first_item_timeZone =
  CalendarList.items
    |-- GapiLens.head
      |-- CalendarListEntry.timeZone
let second_item_summary =
  CalendarList.items
    |-- GapiLens.tail
      |-- GapiLens.head
        |-- CalendarListEntry.summary
let second_item_first_defaultReminder_minutes =
  CalendarList.items
    |-- GapiLens.for_list 1
      |-- CalendarListEntry.defaultReminders
        |-- GapiLens.head
          |-- EventReminder.minutes

let load_calendar_list () =
  let calendar_list_json =
    Yojson.Safe.from_file "test_data/test_calendar_list.json" in
  let tree = GapiJson.json_to_data_model calendar_list_json in
    CalendarList.of_data_model tree

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
    |> CalendarList.items
    ^%= GapiLens.for_list 1
    ^%= CalendarListEntry.summary ^= "Updated Summary" in
  let summ = calendar_list'
    |. CalendarList.items
    |. GapiLens.for_list 1
    |. CalendarListEntry.summary
  in
    assert_equal
      ~printer:Std.identity
      "Updated Summary"
      summ

let test_parse_calendar_list () =
  let calendar_list_json =
    Yojson.Safe.from_file "test_data/test_calendar_list.json" in
  let tree = GapiJson.json_to_data_model calendar_list_json in
  let calendarListList = CalendarList.of_data_model tree in
  let tree' = CalendarList.to_data_model calendarListList in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      calendar_list_json
      json

let test_parse_calendar_acl () =
  let calendar_acl_json =
    Yojson.Safe.from_file "test_data/test_calendar_acl.json" in
  let tree = GapiJson.json_to_data_model calendar_acl_json in
  let acl_list = Acl.of_data_model tree in
  let tree' = Acl.to_data_model acl_list in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      calendar_acl_json
      json

let test_parse_calendars () =
  let calendars_json =
    Yojson.Safe.from_file "test_data/test_calendars.json" in
  let tree = GapiJson.json_to_data_model calendars_json in
  let calendars = Calendar.of_data_model tree in
  let tree' = Calendar.to_data_model calendars in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      calendars_json
      json

let test_parse_colors () =
  let colors_json =
    Yojson.Safe.from_file "test_data/test_calendar_colors.json" in
  let tree = GapiJson.json_to_data_model colors_json in
  let colors = Colors.of_data_model tree in
  let tree' = Colors.to_data_model colors in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      colors_json
      json

let test_parse_settings () =
  let settings_json =
    Yojson.Safe.from_file "test_data/test_calendar_settings.json" in
  let tree = GapiJson.json_to_data_model settings_json in
  let settings = Settings.of_data_model tree in
  let tree' = Settings.to_data_model settings in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      settings_json
      json

let test_render_free_busy_parameters () =
  let params =
    { FreeBusyRequest.empty with
          FreeBusyRequest.timeMin = GapiDate.of_string "2011-11-10";
          timeMax = GapiDate.of_string "2011-12-01";
          items = [{ FreeBusyRequestItem.id = "calendar_id" };
                   { FreeBusyRequestItem.id = "calendar_id_2" }]
    } in
  let tree = FreeBusyRequest.to_data_model params in
  let json = GapiJson.data_model_to_json tree in
    TestHelper.assert_equal_file
      "test_data/test_freebusy_parameters.json"
      (Yojson.Safe.to_string json)

let test_parse_free_busy_resource () =
  let freeBusy_json =
    Yojson.Safe.from_file "test_data/test_freebusy.json" in
  let tree = GapiJson.json_to_data_model freeBusy_json in
  let freeBusy = FreeBusyResponse.of_data_model tree in
  let tree' = FreeBusyResponse.to_data_model freeBusy in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      freeBusy_json
      json

let test_parse_event_resource () =
  let event_json =
    Yojson.Safe.from_file "test_data/test_calendar_event_resource.json" in
  let tree = GapiJson.json_to_data_model event_json in
  let event = Event.of_data_model tree in
  let tree' = Event.to_data_model event in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      event_json
      json

let test_parse_event_list () =
  let event_json =
    Yojson.Safe.from_file "test_data/test_calendar_event_list.json" in
  let tree = GapiJson.json_to_data_model event_json in
  let event = Events.of_data_model tree in
  let tree' = Events.to_data_model event in
  let json = GapiJson.data_model_to_json tree' in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree';
    assert_equal
      ~printer:Yojson.Safe.to_string
      event_json
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
   "test_render_free_busy_parameters" >:: test_render_free_busy_parameters;
   "test_parse_free_busy_resource" >:: test_parse_free_busy_resource;
   "test_parse_event_resource" >:: test_parse_event_resource;
   "test_parse_event_list" >:: test_parse_event_list]

