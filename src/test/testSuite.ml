open OUnit

(* Collect the tests of different modules into one test suite *)
let suite = "Google API OCaml client test suite" >::: 
  [(*TestCalendarModel.suite;
   TestDate.suite;
   TestAuth.suite;
   TestCalendarService.suite;
   TestMonadic.suite;
   TestCalendarServiceV3.suite;
   TestPlusService.suite;
   TestTasksService.suite;*)
   TestCalendarModelV3.suite;
   TestPlusModel.suite;
   TestTasksModel.suite;
  ]

let _ =
  OUnit.run_test_tt_main suite

