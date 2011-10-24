open OUnit

(* Collect the tests of different modules into one test suite *)
let suite = "Google API Ocaml client test suite" >::: 
  [(*TestAuth.suite;
   TestCalendarService.suite;*)
   TestCalendarModel.suite;
   (*TestMonadic.suite;*)
   TestDate.suite;
   ]

let _ =
  OUnit.run_test_tt_main suite

