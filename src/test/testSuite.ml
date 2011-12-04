open OUnit

(* Collect the tests of different modules into one test suite *)
let suite = "Google API OCaml client test suite" >::: 
  [(*TestCalendarModel.suite;
   TestDate.suite;
   TestAuth.suite;
   TestCalendarService.suite;
   TestMonadic.suite;
   TestCalendars.suite;
   TestCalendarServiceV3.suite;*)
   TestCalendarModelV3.suite;
  ]

let _ =
  OUnit.run_test_tt_main suite

