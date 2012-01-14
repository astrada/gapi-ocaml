let test_config = Config.parse ()
let get = Config.get test_config
let client_id = get "oa2_id"
let client_secret = get "oa2_secret"
let redirect_uri = get "oa2_uri"

let get_access_token code (cgi : Netcgi.cgi_activation) =
  Common.do_request
    (fun session ->
       let (response, _) =
         GapiOAuth2.get_access_token
           ~client_id
           ~client_secret
           ~code
           ~redirect_uri
           session in
       let (access_token, token_type, expires_in, refresh_token) =
         match response with
             GapiAuthResponse.OAuth2AccessToken token ->
               (token.GapiAuthResponse.OAuth2.access_token,
                token.GapiAuthResponse.OAuth2.token_type,
                token.GapiAuthResponse.OAuth2.expires_in,
                token.GapiAuthResponse.OAuth2.refresh_token)
           | _ -> failwith "Not supported OAuth2 response" in
       let output =
         Printf.sprintf
           "<form method=\"post\" action=\"\">\
              <fieldset>\
                <legend>OAuth2 tokens:</legend>\
                oa2_token: <input type=\"text\" name=\"oa2_token\" value=\"%s\" size=\"50\" /><br />\
                oa2_refresh: <input type=\"text\" name=\"oa2_refresh\" value=\"%s\" size=\"50\" /><br />\
                <input type=\"submit\" name=\"save\" value=\"Save\" />\
              </fieldset>\
            </form>\
            <p>token_type: %s</p>\
            <p>expires_in: %d</p>"
           access_token refresh_token token_type expires_in
       in
         Common.output_page "OAuth2 Flow" "Success" output cgi)

let save (cgi : Netcgi.cgi_activation) =
  let oa2_token = cgi#argument_value "oa2_token" in
  let oa2_refresh = cgi#argument_value "oa2_refresh" in
  let filename = "/tmp/auth.config" in
    Config.set test_config "oa2_token" oa2_token;
    Config.set test_config "oa2_refresh" oa2_refresh;
    Config.save ~filename test_config;
    Common.output_page "OAuth2 Flow" "Success"
      ("<p>OAuth2 token saved to " ^ filename ^ "</p>")
      cgi

let error (cgi : Netcgi.cgi_activation) =
  let error = cgi#argument_value "error" in
    Common.output_error_page "OAuth2 Flow" error cgi

let oauth2_callback (cgi : Netcgi.cgi_activation) =
  if cgi#argument_value "save" <> "" then
    save cgi
  else if cgi#argument_value "error" <> "" then
    error cgi
  else
    let code = cgi#argument_value "code" in
      get_access_token code cgi

let main () =
  let url = GapiOAuth2.authorization_code_url
              ~redirect_uri
              ~scope:[GapiCalendarV3Service.scope;
                      GapiPlusV1Service.scope_me;
                      GapiPlusV1Service.scope_email;
                      GapiTasksV1Service.scope;
                      GapiUrlshortenerV1Service.scope]
              ~response_type:"code"
              client_id in
    print_endline ("Open this URL in a web browser:\n" ^ url);
    Common.start_netplex oauth2_callback

let _ =
  Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
  main ()

