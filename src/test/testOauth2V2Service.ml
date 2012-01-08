open OUnit
open GapiUtils.Infix
open GapiOauth2V2Model
open GapiOauth2V2Service

let test_get_userinfo () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (userinfo, session) =
         UserinfoResource.get session
       in
         TestHelper.assert_not_empty
           "User ID should not be empty"
           userinfo.Userinfo.id)

let test_get_me () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (userinfo, session) =
         UserinfoResource.V2.Me.get session
       in
         TestHelper.assert_not_empty
           "User ID should not be empty"
           userinfo.Userinfo.id)

let suite = "OAuth2 service test" >:::
  ["test_get_userinfo" >:: test_get_userinfo;
   "test_get_me" >:: test_get_me;
   ]

