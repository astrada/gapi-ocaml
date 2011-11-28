open OUnit
open GapiCalendar
open GapiLens.Infix
open GapiUtils.Infix

let test_parse_calendar_list () =
  let calendar_list_json =
    Json_io.load_json "test/data/test_calendar_list.json" in
  let tree = GapiJson.json_to_data_model calendar_list_json in
  let calendarListList = CalendarListList.of_data_model tree in
  let tree' = CalendarListList.to_data_model calendarListList in
    assert_equal
      ~printer:TestHelper.string_of_json_data_model
      tree
      tree'

let items_0_timeZone =
  CalendarListList.items
    >>| GapiLens.for_list 0
    >>| CalendarListResource.timeZone
let items_1_summary =
  CalendarListList.items
    >>| GapiLens.for_list 1
    >>| CalendarListResource.summary
let items_1_defaultReminders_0_minutes =
  CalendarListList.items
    >>| GapiLens.for_list 1
    >>| CalendarListResource.defaultReminders
    >>| GapiLens.for_list 0
    >>| Reminder.minutes

let load_calendar_list () =
  let calendar_list_json =
    Json_io.load_json "test/data/test_calendar_list.json" in
  let tree = GapiJson.json_to_data_model calendar_list_json in
    CalendarListList.of_data_model tree

let test_lenses_get () =
  let calendar_list = load_calendar_list () in
  let tz = calendar_list |> items_0_timeZone.GapiLens.get in
  let summ = calendar_list |. items_1_summary in
  let min = calendar_list |. items_1_defaultReminders_0_minutes in
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
    |> items_0_timeZone.GapiLens.set "New TZ"
    |> items_1_summary ^= "New Summary"
    |> items_1_defaultReminders_0_minutes += 10 in
  let tz = calendar_list' |. items_0_timeZone in
  let summ = calendar_list' |. items_1_summary in
  let min = calendar_list' |. items_1_defaultReminders_0_minutes in
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
    ^%= CalendarListResource.summary
    ^= "Updated Summary" in
  let summ = calendar_list'
    |. CalendarListList.items
    |. GapiLens.for_list 1
    |. CalendarListResource.summary
  in
    assert_equal
      ~printer:Std.identity
      "Updated Summary"
      summ

let suite = "Calendar (v3) Data Model test" >:::
  ["test_parse_calendar_list" >:: test_parse_calendar_list;
   "test_lenses_get" >:: test_lenses_get;
   "test_lenses_set" >:: test_lenses_set;
   "test_lenses_modify" >:: test_lenses_modify;
  ]

