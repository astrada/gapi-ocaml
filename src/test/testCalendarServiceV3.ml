open OUnit

let test_colors_get () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (colors, session) =
         GapiCalendarService.Colors.get
           session
       in
         assert_equal
           "calendar#colors"
           colors.GapiCalendar.ColorList.kind;
         assert_bool
           "There should be at least 1 calendar color"
           (List.length colors.GapiCalendar.ColorList.calendar >= 1))

let test_settings_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (settings, _) =
         GapiCalendarService.Settings.list
           session
       in
         assert_equal
           "calendar#settings"
           settings.GapiCalendar.SettingsList.kind;
         assert_bool
           "There should be at least 1 setting"
           (List.length settings.GapiCalendar.SettingsList.items >= 1))

let test_free_busy_query () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (calendar, session) =
         GapiCalendarService.Calendars.get
           "primary"
           session in
       let params =
         { GapiCalendar.FreeBusyParameters.empty with
               GapiCalendar.FreeBusyParameters.timeMin =
                 GapiDate.of_string "2011-11-10";
               GapiCalendar.FreeBusyParameters.timeMax =
                 GapiDate.of_string "2011-12-01";
               GapiCalendar.FreeBusyParameters.items =
                 [ calendar.GapiCalendar.CalendarsResource.id ]
         } in
       let (freeBusy, _) =
         GapiCalendarService.FreeBusy.query
           params
           session
       in
         assert_equal
           "calendar#freeBusy"
           freeBusy.GapiCalendar.FreeBusyResource.kind;
         assert_bool
           "There should be at least 1 calendar in free/busy resource"
           (List.length freeBusy.GapiCalendar.FreeBusyResource.calendars >= 1))

let suite = "Calendar services (v3) test" >:::
  [(*"test_colors_get" >:: test_colors_get;
   "test_settings_list" >:: test_settings_list;
   "test_settings_get" >:: test_settings_get;*)
   "test_free_busy_query" >:: test_free_busy_query;
   ]

