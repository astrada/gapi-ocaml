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

let test_settings_get () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (setting, _) =
         GapiCalendarService.Settings.get
           "country"
           session
       in
         assert_equal
           "calendar#setting"
           setting.GapiCalendar.SettingsResource.kind;
         TestHelper.assert_not_empty
           "country setting should not be empty"
           setting.GapiCalendar.SettingsResource.value)

let suite = "Calendar services (v3) test" >:::
  ["test_colors_get" >:: test_colors_get;
   "test_settings_list" >:: test_settings_list;
   "test_settings_get" >:: test_settings_get;
   ]

