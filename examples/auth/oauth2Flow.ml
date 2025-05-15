open GapiLens.Infix

(* Load the configuration file and read the OAuth2 values *)
let test_config = Config.parse ()
let get = Config.get test_config
let client_id = get "oa2_id"
let client_secret = get "oa2_secret"
let port = int_of_string (get "oa2_port")
let redirect_uri = Printf.sprintf "http://localhost:%d/oauth2callback" port

let get_access_token code =
  (* Start a new session *)
  Common.do_request (fun session ->
      (* Request the access token *)
      let response, _ =
        GapiOAuth2.get_access_token ~client_id ~client_secret ~code
          ~redirect_uri session
      in

      (* Read the response *)
      let { GapiAuthResponse.OAuth2.access_token; refresh_token } =
        response |. GapiAuthResponse.oauth2_access_token |. GapiLens.option_get
      in

      let filename = LoopbackServer.tmp_filename in
      Config.set test_config "oa2_token" access_token;
      Config.set test_config "oa2_refresh" refresh_token;
      Config.save ~filename test_config)

let main () =
  (* Generate and print out the URL used to obtain the authorization code *)
  let url =
    GapiOAuth2.authorization_code_url ~redirect_uri
      ~scope:
        [
          GapiCalendarV3Service.Scope.calendar;
          GapiPlusV1Service.Scope.plus_me;
          GapiTasksV1Service.Scope.tasks;
          GapiUrlshortenerV1Service.Scope.urlshortener;
          GapiAnalyticsV3Service.Scope.analytics_readonly;
          GapiBloggerV2Service.Scope.blogger;
          GapiSiteVerificationV1Service.Scope.siteverification;
          GapiAdsenseV1_1Service.Scope.adsense;
          GapiBigqueryV2Service.Scope.bigquery;
          GapiDriveV2Service.Scope.drive;
          GapiSheetsV4Service.Scope.spreadsheets_readonly;
        ]
      ~response_type:"code" client_id
  in
  print_endline ("Open this URL in a web browser:\n" ^ url);

  (* Start the web server and wait for the Google callback *)
  LoopbackServer.start port get_access_token

let _ =
  (* Start the OAuth2 flow *)
  main ()
