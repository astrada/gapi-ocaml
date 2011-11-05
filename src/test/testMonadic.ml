open OUnit
open GdataMonad
open GdataMonad.SessionM
open GdataMonad.SessionM.Infix

let test_monadic_session () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let s = { session with
                     GdataConversation.Session.etag =
                       "W/\"D04ASX47eCp7JGA9WhdbEEo." } in
       let go =
         SessionM.put s >>
         GdataCalendarService.own_calendars >>= fun own ->
         GdataCalendarService.all_calendars >>= fun all ->
         SessionM.return (own, all) in
       let ((own, all), new_session) =
         go session
       in
         assert_equal
           ~msg:"Own calendar feed id"
           "http://www.google.com/calendar/feeds/default/owncalendars/full"
           own.GdataCalendar.Feed.id;
         assert_equal
           ~msg:"All calendar feed id"
           "http://www.google.com/calendar/feeds/default/allcalendars/full"
           all.GdataCalendar.Feed.id;
         TestHelper.assert_false
           "Etag should be different"
           (new_session.GdataConversation.Session.etag =
              s.GdataConversation.Session.etag))

let test_monadic_session_perform () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let s = { session with
                     GdataConversation.Session.etag =
                       "W/\"D04ASX47eCp7JGA9WhdbEEo." } in
       let go =
         perform
           put s;
           own <-- GdataCalendarService.own_calendars;
           all <-- GdataCalendarService.all_calendars;
           return (own, all) in
       let ((own, all), new_session) =
         go session
       in
         assert_equal
           ~msg:"Own calendar feed id"
           "http://www.google.com/calendar/feeds/default/owncalendars/full"
           own.GdataCalendar.Feed.id;
         assert_equal
           ~msg:"All calendar feed id"
           "http://www.google.com/calendar/feeds/default/allcalendars/full"
           all.GdataCalendar.Feed.id;
         TestHelper.assert_false
           "Etag"
           (new_session.GdataConversation.Session.etag =
              "W/\"D04ASX47eCp7JGA9WhdbEEo."))

let suite = "Monadic interface test" >:::
  ["test_monadic_session" >:: test_monadic_session;
   "test_monadic_session_perform" >:: test_monadic_session_perform;
   ]

