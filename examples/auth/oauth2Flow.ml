open GapiLens.Infix

(* Load the configuration file and read the OAuth2 values *)
let test_config = Config.parse ()
let get = Config.get test_config
let client_id = get "oa2_id"
let client_secret = get "oa2_secret"
let redirect_uri = get "oa2_uri"

(* Obtain an Access Token from the Google Authorization Server *)
let get_access_token code (cgi : Netcgi.cgi_activation) =
  (* Start a new session *)
  Common.do_request
    (fun session ->

       (* Request the access token *)
       let (response, _) =
         GapiOAuth2.get_access_token
           ~client_id
           ~client_secret
           ~code
           ~redirect_uri
           session in

       (* Read the response *)
       let { GapiAuthResponse.OAuth2.access_token;
             token_type;
             expires_in;
             refresh_token } = response
         |. GapiAuthResponse.oauth2_access_token
         |. GapiLens.option_get in

       (* Generate the HTML output page *)
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
  (* Read the values from the request *)
  let oa2_token = cgi#argument_value "oa2_token" in
  let oa2_refresh = cgi#argument_value "oa2_refresh" in

  (* Save the new values to a temporary configuration file *)
  let filename = "/tmp/auth.config" in
    Config.set test_config "oa2_token" oa2_token;
    Config.set test_config "oa2_refresh" oa2_refresh;
    Config.save ~filename test_config;
    (* Acknowledge the user *)
    Common.output_page "OAuth2 Flow" "Success"
      ("<p>OAuth2 token saved to " ^ filename ^ "</p>")
      cgi

let error (cgi : Netcgi.cgi_activation) =
  (* Generate the HTML error page *)
  let error = cgi#argument_value "error" in
    Common.output_error_page "OAuth2 Flow" error cgi

(* Nethttpd handler *)
let oauth2_callback (cgi : Netcgi.cgi_activation) =
  if cgi#argument_value "save" <> "" then
    (* Handle the form submission *)
    save cgi
  else if cgi#argument_value "error" <> "" then
    (* Show the error if present *)
    error cgi
  else
    (* Handle the response from Google authorization endpoint, reading the
     * obtained values from the query string and requesting the access token *)
    let code = cgi#argument_value "code" in
      get_access_token code cgi

let main () =
  (* Generate and print out the URL used to obtain the authorization code *)
  let url = GapiOAuth2.authorization_code_url
              ~redirect_uri
              ~scope:[GapiCalendarV3Service.Scope.calendar;
                      GapiPlusV1Service.Scope.plus_me;
                      GapiTasksV1Service.Scope.tasks;
                      GapiUrlshortenerV1Service.Scope.urlshortener;
                      GapiAnalyticsV3Service.Scope.analytics_readonly;
                      GapiBloggerV2Service.Scope.blogger;
                      GapiSiteVerificationV1Service.Scope.siteverification;
                      GapiAdsenseV1_1Service.Scope.adsense;
                      GapiBigqueryV2Service.Scope.bigquery;
                      GapiDriveV2Service.Scope.drive;
                      GdataDocumentsV3Service.all_scopes]
              ~response_type:"code"
              client_id in
    print_endline ("Open this URL in a web browser:\n" ^ url);

    (* Start the web server and wait for the Google callback *)
    Common.start_netplex oauth2_callback

let _ =
  (* Ignore SIGPIPE (required by nethttpd) *)
  Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
  (* Start the OAuth2 flow *)
  main ()

