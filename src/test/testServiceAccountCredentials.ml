open OUnit

let test_parse_file () =
  let service_account_credentials =
    GapiServiceAccountCredentials.parse_json_file
      "test_data/testServiceAccountCredentials.json"
  in
  assert_equal ~printer:TestHelper.id "service_account"
    service_account_credentials.GapiServiceAccountCredentials._type;
  assert_equal ~printer:TestHelper.id "abc-123"
    service_account_credentials.GapiServiceAccountCredentials.project_id;
  assert_equal ~printer:TestHelper.id "aaaaaaaaaaaa"
    service_account_credentials.GapiServiceAccountCredentials.private_key_id;
  assert_equal ~printer:TestHelper.id "test@api-abc-123.iam.gserviceaccount.com"
    service_account_credentials.GapiServiceAccountCredentials.client_email;
  assert_equal ~printer:TestHelper.id "111111111111111111111"
    service_account_credentials.GapiServiceAccountCredentials.client_id

let suite =
  "Service account credentials test"
  >::: [ "test_parse_file" >:: test_parse_file ]
