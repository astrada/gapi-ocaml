open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiPagespeedonlineV1Model
open GapiPagespeedonlineV1Service

let test_runpagespeed () =
  TestHelper.test_request_noauth (fun test_config session ->
      let std_params =
        {
          GapiService.StandardParameters.default with
          GapiService.StandardParameters.key = Config.get test_config "key";
        }
      in
      let result, session =
        PagespeedapiResource.runpagespeed ~std_params
          ~url:"http://www.google.com" session
      in
      assert_equal "pagespeedonline#result" result.Result.kind;
      TestHelper.assert_not_empty "Result ID should not be empty"
        result.Result.id)

let suite =
  "Page Speed Online services test"
  >::: [ "test_runpagespeed" >:: test_runpagespeed ]
