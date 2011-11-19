open OUnit

(* Collect the tests of different modules into one test suite *)
let suite = "Google API Ocaml client test suite" >::: 
  [(*TestCalendarModel.suite;
   TestDate.suite;
   TestAuth.suite;
   TestCalendarService.suite;
   TestMonadic.suite;*)
   TestCalendarList.suite;
   ]

let _ =
  OUnit.run_test_tt_main suite

