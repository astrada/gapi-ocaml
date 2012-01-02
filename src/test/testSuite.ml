open OUnit

let model_tests =
  [TestCalendarModel.suite;
   TestDate.suite;
   TestCalendarModelV3.suite;
   TestPlusModel.suite;
   TestTasksModel.suite;
   TestDiscoveryModel.suite;
  ]

let service_tests = 
  [TestAuth.suite;
   TestCalendarService.suite;
   TestMonadic.suite;
   TestCalendarServiceV3.suite;
   TestPlusService.suite;
   TestTasksService.suite;
   TestDiscoveryService.suite;
   TestUrlshortenerService.suite;
  ]

let build_service_test_list service =
  let service_suite =
    match service with
        "calendar" -> [TestCalendarService.suite;
                       TestMonadic.suite]
      | "calendar-v3" -> [TestCalendarServiceV3.suite]
      | "plus" -> [TestPlusService.suite]
      | "tasks" -> [TestTasksService.suite]
      | "discovery" -> [TestDiscoveryService.suite]
      | "urlshortener" -> [TestUrlshortenerService.suite]
      | _ -> failwith ("Service not supported: " ^ service)
  in
    model_tests @ service_suite

let build_suite_from_list test_list =
  "Google API OCaml client test suite" >::: 
    test_list

let _ =
  let test_list = ref model_tests in
  let ounit_specs =
    ["-verbose",
       Arg.Unit (fun _ -> ()),
       "See oUnit doc";
     "-only-test",
       Arg.String (fun _ -> ()),
       "See oUnit doc";
     "-list-test",
       Arg.String (fun _ -> ()),
       "See oUnit doc"] in
  let arg_specs =
    Arg.align (
      ["-service",
         Arg.String (fun service ->
                       test_list := build_service_test_list service),
         "svc Google service to test (calendar, calendar-v3, plus, tasks, discovery, urlshortener)";
       "-all",
         Arg.Unit (fun () -> test_list := model_tests @ service_tests),
         " Run all tests"]) in
  let _ =
    Arg.parse
      (arg_specs @ ounit_specs)
      (fun _ -> ())
      ("Usage: " ^ Sys.argv.(0) ^ " [-service svc] [-all] [oUnit arguments]") in
  let _ =
    (* Reset argument counter, to let OUnit reparse arguments *)
    Arg.current := 0 in
  let suite = build_suite_from_list !test_list in
    OUnit.run_test_tt_main ~arg_specs suite

