open OUnit
open GapiUtils.Infix
open GapiDiscoveryV1Model

let test_list_apis () =
  TestHelper.test_request
    TestHelper.build_no_auth
    (fun session ->
       let (apis, session) =
         GapiDiscoveryService.ApisResource.list
           ~name:"discovery"
           session
       in
         assert_equal
           "discovery#directoryList"
           apis.DirectoryList.kind;
         assert_bool
           "There should be at least 1 discovery api"
           (List.length apis.DirectoryList.items >= 1))

let test_get_rest () =
  TestHelper.test_request
    TestHelper.build_no_auth
    (fun session ->
       let (api, session) =
         GapiDiscoveryService.ApisResource.getRest
           ~api:"discovery"
           ~version:"v1"
           session
       in
         assert_equal
           "discovery#restDescription"
           api.RestDescription.kind;
         assert_bool
           "There should be at least 1 parameter"
           (List.length api.RestDescription.parameters >= 1);
         assert_bool
           "There should be at least 1 schema"
           (List.length api.RestDescription.schemas >= 1);
         assert_bool
           "There should be at least 1 resource"
           (List.length api.RestDescription.resources >= 1))

let suite = "Discovery service test" >:::
  ["test_list_apis" >:: test_list_apis;
   "test_get_rest" >:: test_get_rest]

