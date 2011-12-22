open GapiUtils.Infix

exception Redirect of string * GapiConversation.Session.t
exception Unauthorized of GapiConversation.Session.t
exception NotModified of GapiConversation.Session.t
exception PreconditionFailed of GapiConversation.Session.t

type request_type =
    Query
  | Create
  | Update
  | Patch
  | Delete

let parse_empty_response _ =
  ()

let parse_response
      parse_output
      parse_error
      pipe
      response_code
      headers
      session =
  match response_code with
      200 (* OK *)
    | 201 (* Created *)
    | 204 (* No Content *) ->
        parse_output pipe
    | 302 (* Found *) ->
        let url = List.fold_left
                    (fun u h ->
                       match h with
                           GapiCore.Header.Location value -> value
                         | _ -> u)
                    ""
                    headers
        in
          raise (Redirect (url, session))
    | 401 (* Unauthorized *) ->
        raise (Unauthorized session)
    | 304 (* Not modified *) ->
        raise (NotModified session)
    | 412 (* Precondition failed *) ->
        raise (PreconditionFailed session)
    | _ ->
        parse_error pipe response_code

let build_auth_data session =
  match session.GapiConversation.Session.config.GapiConfig.auth with
      GapiConfig.NoAuth ->
        GapiAuth.NoAuth
    | GapiConfig.ClientLogin _ ->
        begin match session.GapiConversation.Session.auth with
            GapiConversation.Session.ClientLogin token ->
              GapiAuth.ClientLogin token
          | _ ->
              failwith "Unexpected auth context for Client Login"
        end
    | GapiConfig.OAuth1 { GapiConfig.signature_method;
                          consumer_key;
                          consumer_secret } ->
        begin match session.GapiConversation.Session.auth with
            GapiConversation.Session.OAuth1
              { GapiConversation.Session.token;
                secret } ->
              GapiAuth.OAuth1 { GapiAuth.signature_method;
                                consumer_key;
                                consumer_secret;
                                token;
                                secret }
          | _ ->
              failwith "Unexpected auth context for OAuth1"
        end
    | GapiConfig.OAuth2 { GapiConfig.client_id;
                          client_secret } ->
        begin match session.GapiConversation.Session.auth with
            GapiConversation.Session.OAuth2
              { GapiConversation.Session.oauth2_token;
                refresh_token } ->
              GapiAuth.OAuth2 { GapiAuth.client_id;
                                client_secret;
                                oauth2_token;
                                refresh_token }
          | _ ->
              failwith "Unexpected auth context for OAuth2"
        end

let single_request
      ?post_data
      ?version
      ?etag
      request_type
      url
      parse_output
      parse_error
      session =
  let auth_data = build_auth_data session in
  let http_method =
    match request_type with
        Query ->
          begin match post_data with
              None -> GapiCore.HttpMethod.GET
            | Some _ -> GapiCore.HttpMethod.POST
          end
      | Create -> GapiCore.HttpMethod.POST
      | Update -> GapiCore.HttpMethod.PUT
      | Patch -> GapiCore.HttpMethod.PATCH
      | Delete -> GapiCore.HttpMethod.DELETE in
  let oauth1_params =
    match auth_data with
        GapiAuth.NoAuth
      | GapiAuth.ClientLogin _
      | GapiAuth.OAuth2 _ ->
          None
      | GapiAuth.OAuth1 _ ->
          let post_fields_to_sign =
            match post_data with
                Some (GapiCore.PostData.Fields fields) -> fields
              | _ -> []
          in
            Some { GapiAuth.http_method;
                   url;
                   post_fields_to_sign } in
  let authorization_header =
    Option.map (fun a -> GapiCore.Header.Authorization a)
      (GapiAuth.generate_authorization_header ?oauth1_params auth_data) in
  let version_header =
    Option.map (fun v -> GapiCore.Header.GdataVersion v) version in
  let etag_header =
    Option.map (fun e ->
                  match request_type with
                      Query ->
                        Some (GapiCore.Header.IfNoneMatch e)
                    | Update
                    | Patch
                    | Delete ->
                        if GapiUtils.is_weak_etag e then
                          None
                        else
                          Some (GapiCore.Header.IfMatch e)
                    | Create ->
                        None
    ) etag
      |> Option.default None in
  let header_list = [authorization_header; version_header; etag_header]
    |> List.filter Option.is_some
    |> List.map Option.get
  in
    GapiConversation.request
      ~header_list
      ?post_data
      http_method
      session
      url
      (parse_response parse_output parse_error)

let refresh_oauth2_token session =
  let auth_data = build_auth_data session in
    match auth_data with
        GapiAuth.OAuth2 { GapiAuth.client_id;
                           client_secret;
                           refresh_token; _ } ->
          let (response, new_session) =
            GapiOAuth2.refresh_access_token
              ~client_id
              ~client_secret
              ~refresh_token
              session in
          let access_token =
            match response with
                GapiAuthResponse.OAuth2AccessToken token ->
                  token.GapiAuthResponse.OAuth2.access_token
              | _ -> failwith "Not supported OAuth2 response" in
          let new_auth_context =
            match new_session.GapiConversation.Session.auth with
                GapiConversation.Session.OAuth2 data ->
                  { data with
                        GapiConversation.Session.oauth2_token = access_token }
              | _ ->
                  failwith "Unexptected OAuth2 auth context"
          in
            { new_session with
                  GapiConversation.Session.auth = GapiConversation.Session.OAuth2
                                                     new_auth_context }
      | _ ->
          failwith "Unauthorized" (* TODO: better error handling *)

let gapi_request
      ?post_data
      ?version
      ?etag
      ?(parse_error = GapiConversation.parse_error)
      request_type
      url
      parse_output
      session =
  let rec request_loop
        ?post_data
        ?version
        ?etag
        request_type
        request_number
        url
        parse_output
        parse_error
        session =
    try
      let verified_session =
        match session.GapiConversation.Session.auth with
            GapiConversation.Session.OAuth2 {
              GapiConversation.Session.oauth2_token = ""; _
            } ->
              refresh_oauth2_token session
          | _ ->
              session
      in
        single_request
          ?post_data
          ?version
          ?etag
          request_type
          url
          parse_output
          parse_error
          verified_session
    with
        Redirect (target, new_session) ->
          if url <> target then
            request_loop
              ?post_data
              ?version
              ?etag
              request_type
              (succ request_number)
              url
              parse_output
              parse_error
              new_session
          else
            failwith ("Redirection loop detected: url=" ^ url)
      | (Unauthorized new_session) as e->
          if request_number > 1 then
            raise e
          else
            let refreshed_session = refresh_oauth2_token new_session in
              request_loop
                ?post_data
                ?version
                ?etag
                request_type
                (succ request_number)
                url
                parse_output
                parse_error
                refreshed_session
  in
    request_loop
      ?post_data
      ?version
      ?etag
      request_type
      0
      url
      parse_output
      parse_error
      session

