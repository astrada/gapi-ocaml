type oauth1_data =
    { signature_method : GapiCore.SignatureMethod.t;
      consumer_key : string;
      consumer_secret : string;
      token : string;
      secret : string }

type oauth1_params =
    { http_method : GapiCore.HttpMethod.t;
      url : string;
      post_fields_to_sign : (string * string) list }

type oauth2_data =
    { client_id : string;
      client_secret : string;
      oauth2_token : string;
      refresh_token : string }

type authentication =
    NoAuth
  | ClientLogin of string
  | OAuth1 of oauth1_data
  | OAuth2 of oauth2_data


let generate_authorization_header
      ?oauth1_params
      auth_data =
  match auth_data with
    | NoAuth ->
        None
    | ClientLogin auth ->
        Some ("GoogleLogin auth=" ^ auth)
    | OAuth1 { signature_method = signature_method;
               consumer_key = consumer_key;
               consumer_secret = consumer_secret;
               token = token;
               secret = secret } ->
        let params = Option.get oauth1_params in
        let oauth_fields_to_sign = GdataOAuth1.build_oauth_fields_to_sign
                                     ~oauth_token:token
                                     consumer_key
                                     signature_method in
        let neturl = Neturl.parse_url params.url in
        let get_fields_to_sign =
          try
            Netencoding.Url.dest_url_encoded_parameters
              (Neturl.url_query ~encoded:true neturl)
          with Not_found -> [] in
        let base_neturl = Neturl.remove_from_url ~query:true neturl in
        let base_url = Neturl.string_of_url base_neturl in
        let signature = GdataOAuth1.generate_signature
                          params.http_method
                          base_url
                          (oauth_fields_to_sign
                           @ get_fields_to_sign
                           @ params.post_fields_to_sign)
                          signature_method
                          consumer_secret
                          secret
        in
          Some (GdataOAuth1.generate_oauth_header
                  oauth_fields_to_sign
                  signature)
    | OAuth2 { oauth2_token = token } ->
        Some ("OAuth " ^ token)

