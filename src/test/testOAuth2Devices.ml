open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiDriveV3Model
open GapiDriveV3Service

let request_code client_id session =
  let scope = ["https://www.googleapis.com/auth/drive.file"] in
  GapiOAuth2Devices.request_code
    ~client_id
    ~scope
    session |> fst

let test_request_code () =
  TestHelper.test_request
    TestHelper.build_oauth2_devices_auth
    (fun session ->
       let auth =
         session |.
         GapiConversation.Session.config |.
         GapiConfig.auth in
       let client_id =
         match auth with
         | GapiConfig.OAuth2 c -> c |. GapiConfig.client_id
         | _ -> assert false
       in
       let authorization_code = request_code client_id session in
       let open GapiOAuth2Devices.AuthorizationCode in
       assert_bool
         "device_code should not be empty"
         (authorization_code.device_code <> "");
       assert_bool
         "user_code should not be empty"
         (authorization_code.user_code <> "");
       assert_bool
         "verification_url should not be empty"
         (authorization_code.verification_url <> "");
       assert_equal
         ~printer:string_of_int
         1800 
         authorization_code.expires_in;
       assert_equal
         ~printer:string_of_int
         5
         authorization_code.GapiOAuth2Devices.AuthorizationCode.interval
    )

let test_get_access_token () =
  TestHelper.test_request
    TestHelper.build_oauth2_devices_auth
    (fun session ->
       let auth =
         session |.
         GapiConversation.Session.config |.
         GapiConfig.auth in
       let (client_id, client_secret) =
         match auth with
         | GapiConfig.OAuth2 c ->
           (c |. GapiConfig.client_id, c |. GapiConfig.client_secret)
         | _ -> assert false
       in
       let authorization_code = request_code client_id session in
       let device_code =
         authorization_code.GapiOAuth2Devices.AuthorizationCode.device_code in
       assert_raises
         (GapiOAuth2Devices.AuthorizationPending session)
         (fun () ->
            GapiOAuth2Devices.get_access_token
              ~client_id
              ~client_secret
              ~device_code
              session)
    )

let suite = "OAuth2 for devices test" >:::
  ["test_request_code" >:: test_request_code;
   "test_get_access_token" >:: test_get_access_token;
  ]

