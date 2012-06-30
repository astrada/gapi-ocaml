open OUnit

let test_client_login () =
  TestHelper.test_request_noauth
    (fun test_config session ->
       let get = Config.get test_config in
       let email = get "cl_user" in
       let password = get "cl_pass" in
       let (auth_token, _) =
         GapiClientLogin.get_auth_token
           ~email
           ~password
           ~source:"GdataOcamlSample-ClientLogin"
           ~service:GapiClientLogin.Service.Calendar
           session
       in
         match auth_token with
             GapiAuthResponse.ClientLoginAuthToken token ->
               TestHelper.assert_not_empty
                 "Client login auth token should not be empty"
                 token
           | _ -> failwith "Not supported auth response")

let test_oauth1_request_token () =
  TestHelper.test_request_noauth
    (fun test_config session ->
       let get = Config.get test_config in
       let xoauth_displayname = get "oa1_displayname" in
       let consumer_secret = get "oa1_cons_secret" in
       let oauth_consumer_key = get "oa1_cons_key" in
       let oauth_callback = get "oa1_callback" in
       let (response, _) =
         GapiOAuth1.get_request_token
           ~xoauth_displayname
           ~consumer_secret
           ~oauth_consumer_key
           ~scope:"http://www.google.com/calendar/feeds"
           ~oauth_callback
           session
       in
         match response with
             GapiAuthResponse.OAuth1RequestToken token ->
               TestHelper.assert_not_empty
                 "OAuth1 request token should not be empty"
                 token.GapiAuthResponse.OAuth1.request_token;
               TestHelper.assert_not_empty
                 "OAuth1 request token secret should not be empty"
                 token.GapiAuthResponse.OAuth1.request_token_secret;
               assert_bool
                 "OAuth1 callback should be confirmed"
                 token.GapiAuthResponse.OAuth1.callback_confirmed;
           | _ -> failwith "Not supported OAuth1 response")

let test_oauth1_authorize_url () =
  let url = GapiOAuth1.authorize_token_url
              ~hd:"default"
              ~hl:"en"
              "dummy_request_token" in
    assert_equal
      "https://www.google.com/accounts/OAuthAuthorizeToken?oauth_token=dummy_request_token&hl=en&hd=default"
      url

let test_invalid_oauth1_access_token () =
  TestHelper.test_request_noauth
    (fun test_config session ->
       let get = Config.get test_config in
       let consumer_secret = get "oa1_cons_secret" in
       let oauth_consumer_key = get "oa1_cons_key" in
       assert_raises
         (Failure "Error: The token is invalid. (HTTP response code: 400)")
         (fun () ->
            GapiOAuth1.get_access_token
              ~consumer_secret
              ~oauth_consumer_key
              ~oauth_token:"dummy access token"
              ~oauth_verifier:"dummy verifier"
              ~oauth_secret:"dummy access token secret"
              session))

let test_oauth1_token_info () =
  TestHelper.test_request_noauth
    (fun test_config session ->
       let get = Config.get test_config in
       let consumer_secret = get "oa1_cons_secret" in
       let oauth_consumer_key = get "oa1_cons_key" in
       let oauth_token = get "oa1_token" in
       let oauth_secret = get "oa1_secret" in
       let (response, _) =
         GapiOAuth1.get_token_info
           ~consumer_secret
           ~oauth_consumer_key
           ~oauth_token
           ~oauth_secret
           session
       in
         match response with
             GapiAuthResponse.AuthSubTokenInfo info ->
               TestHelper.assert_not_empty
                 "OAuth1 target info should not be empty"
                 info.GapiAuthResponse.AuthSub.target;
               TestHelper.assert_not_empty
                 "OAuth1 scope info should not be empty"
                 info.GapiAuthResponse.AuthSub.scope;
               assert_bool
                 "OAuth1 token should be secure"
                 info.GapiAuthResponse.AuthSub.secure;
           | _ -> failwith "Not supported AuthSub response")

let test_oauth1_revoke_invalid_token () =
  TestHelper.test_request_noauth
    (fun test_config session ->
       let get = Config.get test_config in
       let consumer_secret = get "oa1_cons_secret" in
       let oauth_consumer_key = get "oa1_cons_key" in
         assert_raises
           (Failure "Error: <HTML><HEAD><TITLE>Invalid token: Cannot parse AuthSub token: dummy token</TITLE></HEAD><BODY BGCOLOR=\"#FFFFFF\" TEXT=\"#000000\"><H1>Invalid token: Cannot parse AuthSub token: dummy token</H1><H2>Error 403</H2></BODY></HTML> (HTTP response code: 403)")
           (fun () ->
              GapiOAuth1.revoke_token
                ~consumer_secret
                ~oauth_consumer_key
                ~oauth_token:"dummy token"
                ~oauth_secret:"dummy secret"
               session))

let test_oauth2_authorization_url () =
  let url = GapiOAuth2.authorization_code_url
              ~redirect_uri:"urn:ietf:wg:oauth:2.0:oob"
              ~scope:[GapiCalendarV3Service.Scope.calendar]
              ~state:"abcde12345"
              ~response_type:"code"
              "dummy key" in
    assert_equal
      ~printer:(fun x -> x)
      "https://accounts.google.com/o/oauth2/auth?client_id=dummy+key&redirect_uri=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar&response_type=code&access_type=offline&approval_prompt=force&state=abcde12345"
      url

let test_invalid_oauth2_access_token () =
  TestHelper.test_request_noauth
    (fun test_config session ->
       let get = Config.get test_config in
       let client_id = get "oa2_id" in
       let client_secret = get "oa2_secret" in
       let redirect_uri = get "oa2_uri" in
         assert_raises
           (Failure "OAuth2 error: invalid_grant (HTTP response code: 400)")
           (fun () ->
              GapiOAuth2.get_access_token
                ~client_id
                ~client_secret
                ~code:"dummy code"
                ~redirect_uri
                session))

let test_oauth2_refresh_token () =
  TestHelper.test_request_noauth
    (fun test_config session ->
       let get = Config.get test_config in
       let client_id = get "oa2_id" in
       let client_secret = get "oa2_secret" in
       let refresh_token = get "oa2_refresh" in
       let (response, _) =
         GapiOAuth2.refresh_access_token
           ~client_id
           ~client_secret
           ~refresh_token
           session
       in
         match response with
             GapiAuthResponse.OAuth2AccessToken token ->
               TestHelper.assert_not_empty
                 "OAuth2 access token should not be empty"
                 token.GapiAuthResponse.OAuth2.access_token;
               TestHelper.assert_not_empty
                 "OAuth2 token type should not be empty"
                 token.GapiAuthResponse.OAuth2.token_type;
               assert_bool
                 "OAuth2 token expiration should be greater than 0"
                 (token.GapiAuthResponse.OAuth2.expires_in > 0);
               assert_bool
                 "OAuth2 refresh token should be empty"
                 (token.GapiAuthResponse.OAuth2.refresh_token = "");
           | _ -> failwith "Not supported OAuth2 response")

let test_oauth2_revoke_invalid_token () =
  TestHelper.test_request_noauth
    (fun _ session ->
       assert_raises
         (Failure "OAuth2 error: invalid_token (HTTP response code: 400)")
         (fun () ->
           GapiOAuth2.revoke_token
             ~refresh_token:"123456789abcdefg"
             session))

let suite = "Auth Service test" >:::
  [(* "test_client_login" >:: test_client_login;
      disabled to avoid creating too many long-lived tokens *)
   "test_oauth1_request_token" >:: test_oauth1_request_token;
   "test_oauth1_authorize_url" >:: test_oauth1_authorize_url;
   "test_invalid_oauth1_access_token" >:: test_invalid_oauth1_access_token;
   "test_oauth1_token_info" >:: test_oauth1_token_info;
   "test_oauth1_revoke_invalid_token" >:: test_oauth1_revoke_invalid_token;
   "test_oauth2_authorization_url" >:: test_oauth2_authorization_url;
   "test_invalid_oauth2_access_token" >:: test_invalid_oauth2_access_token;
   "test_oauth2_refresh_token" >:: test_oauth2_refresh_token;
   "test_oauth2_revoke_invalid_token" >:: test_oauth2_revoke_invalid_token]

