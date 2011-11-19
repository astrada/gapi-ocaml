let test_config = Config.parse "examples/auth/auth.config"
let get = Config.get test_config
let email = get "cl_user"
let password = get "cl_pass"

let _ =
  Common.do_request
    (fun session ->
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
               Printf.printf "token=%s\n" token
           | _ -> failwith "Not supported auth response")

