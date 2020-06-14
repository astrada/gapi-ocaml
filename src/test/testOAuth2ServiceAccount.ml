open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiDriveV3Model
open GapiDriveV3Service

let test_get_about_drive_v3 () =
  TestHelper.test_request TestHelper.build_oauth2_service_account_auth
    (fun session ->
      let std_params =
        {
          GapiService.StandardParameters.default with
          GapiService.StandardParameters.fields = "kind";
        }
      in
      let about, session = AboutResource.get ~std_params session in
      assert_equal "drive#about" about.About.kind)

let suite =
  "OAuth2 for service accounts test"
  >::: [ "test_get_about_drive_v3" >:: test_get_about_drive_v3 ]
