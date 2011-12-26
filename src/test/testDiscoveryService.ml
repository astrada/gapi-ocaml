open OUnit
open GapiUtils.Infix

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
           apis.GapiDiscovery.DirectoryList.kind;
         assert_bool
           "There should be at least 1 discovery api"
           (List.length apis.GapiDiscovery.DirectoryList.items >= 1))

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
           api.GapiDiscovery.RestDescription.kind;
         assert_bool
           "There should be at least 1 parameter"
           (List.length api.GapiDiscovery.RestDescription.parameters >= 1);
         assert_bool
           "There should be at least 1 schema"
           (List.length api.GapiDiscovery.RestDescription.schemas >= 1);
         assert_bool
           "There should be at least 1 resource"
           (List.length api.GapiDiscovery.RestDescription.resources >= 1))

let suite = "Discovery service test" >:::
  ["test_list_apis" >:: test_list_apis;
   "test_get_rest" >:: test_get_rest]

