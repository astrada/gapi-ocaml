open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiCustomsearchV1Model
open GapiCustomsearchV1Service

let test_list_cse () =
  TestHelper.test_request_noauth
    (fun test_config session ->
       let std_params = {
         GapiService.StandardParameters.default with
             GapiService.StandardParameters.key =
               Config.get test_config "key"
       } in
       let (search, session) =
         CseResource.list
           ~std_params
           ~q:"calendar"
           ~cref:"http://code.google.com/cse/googlecode-context.xml"
           session
       in
         assert_equal
           "customsearch#search"
           search.Search.kind;
         assert_bool
           "There should be at least 1 item in search results"
           (List.length search.Search.items >= 1))

let suite = "Custom Search services test" >:::
  ["test_list_cse" >:: test_list_cse]

