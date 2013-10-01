open GapiUtils.Infix
open GapiLens.Infix

exception Redirect of string * GapiConversation.Session.t
exception NotModified of GapiConversation.Session.t
exception Unauthorized of GapiConversation.Session.t
exception PermissionDenied of GapiConversation.Session.t
exception Forbidden of GapiConversation.Session.t
exception NotFound of GapiConversation.Session.t
exception RequestTimeout of GapiConversation.Session.t
exception Conflict of GapiConversation.Session.t
exception Gone of GapiConversation.Session.t
exception PreconditionFailed of GapiConversation.Session.t
exception ResumeIncomplete of string * string * GapiConversation.Session.t
exception StartUpload of string * GapiConversation.Session.t
exception ServiceUnavailable of GapiConversation.Session.t
exception RefreshTokenFailed of GapiConversation.Session.t

type request_type =
    Query
  | Create
  | Update
  | Patch
  | Delete
  | QueryMeta

let parse_empty_response _ =
  ()

let parse_response
      parse_output
      parse_error
      pipe
      response_code
      headers
      session =
  let get_location () =
    List.fold_left
      (fun u h ->
         match h with
             GapiCore.Header.Location value -> value
           | _ -> u)
      ""
      headers in
  let get_reason_phrase () =
    List.fold_left
      (fun u h ->
         match h with
             GapiCore.Header.HttpStatus (_, _, reason) -> reason
           | _ -> u)
      ""
      headers
  in
    match response_code with
        200 (* OK *) ->
          let location = get_location () in
            if location = "" then
              parse_output pipe headers
            else
              raise (StartUpload (location, session))
      | 201 (* Created *)
      | 204 (* No Content *)
      | 206 (* Partial Content *) ->
          parse_output pipe headers
      | 302 (* Found *) ->
          let url = get_location () in
            raise (Redirect (url, session))
      | 304 (* Not Modified *) ->
          raise (NotModified session)
      | 308 (* Resume Incomplete *) ->
          let (range, url) =
            List.fold_left
              (fun ((r, u) as accu) h ->
                 match h with
                     GapiCore.Header.Location value -> (r, value)
                   | GapiCore.Header.Range value -> (value, u)
                   | _ -> accu)
              ("", "")
              headers
          in
            raise (ResumeIncomplete (range, url, session))
      | 401 (* Unauthorized *) ->
          let reason_phrase = get_reason_phrase () in
            begin match reason_phrase with
                "Permission denied" ->
                  (* Documents List API may return a Permission denied reason
                   * phrase, when a document cannot be accessed by the current
                   * user. *)
                  raise (PermissionDenied session)
              | _ ->
                  raise (Unauthorized session)
            end
      | 403 (* Forbidden *) ->
          raise (Forbidden session)
      | 404 (* Not Found *) ->
          raise (NotFound session)
      | 408 (* Request Timeout *) ->
          raise (RequestTimeout session)
      | 409 (* Conflict *) ->
          raise (Conflict session)
      | 410 (* Gone *) ->
          raise (Gone session)
      | 412 (* Precondition Failed *) ->
          raise (PreconditionFailed session)
      | 503 (* Service Unavailable *) ->
          raise (ServiceUnavailable session)
      | _ ->
          parse_error pipe response_code

let build_auth_data session =
  match session.GapiConversation.Session.config.GapiConfig.auth with
      GapiConfig.NoAuth ->
        GapiAuth.NoAuth
    | GapiConfig.ClientLogin _ ->
        let token = session
          |. GapiConversation.Session.auth
          |. GapiConversation.Session.client_login
          |. GapiLens.option_get
        in
          GapiAuth.ClientLogin token
    | GapiConfig.OAuth1 { GapiConfig.signature_method;
                          consumer_key;
                          consumer_secret } ->
        let { GapiConversation.Session.token;
                secret } = session
          |. GapiConversation.Session.auth
          |. GapiConversation.Session.oauth1
          |. GapiLens.option_get
        in
          GapiAuth.OAuth1 { GapiAuth.signature_method;
                            consumer_key;
                            consumer_secret;
                            token;
                            secret }
    | GapiConfig.OAuth2 { GapiConfig.client_id;
                          client_secret } ->
        let { GapiConversation.Session.oauth2_token;
                refresh_token } = session
          |. GapiConversation.Session.auth
          |. GapiConversation.Session.oauth2
          |. GapiLens.option_get
        in
          GapiAuth.OAuth2 { GapiAuth.client_id;
                            client_secret;
                            oauth2_token;
                            refresh_token }

let single_request
      ?post_data
      ?version
      ?etag
      ?upload_state
      ?media_download
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
      | Delete -> GapiCore.HttpMethod.DELETE
      | QueryMeta -> GapiCore.HttpMethod.HEAD in
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
                      Query
                    | QueryMeta ->
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
  let headers = [authorization_header; version_header; etag_header]
    |> List.filter Option.is_some
    |> List.map Option.get in
  let upload_headers =
    Option.map_default
      (GapiMediaResource.generate_upload_headers http_method)
      []
      upload_state in
  let download_headers =
    Option.map_default
      GapiMediaResource.generate_download_headers
      []
      media_download in
  let header_list =
    headers @ upload_headers @ download_headers
  in
    GapiConversation.request
      ~header_list
      ?post_data
      ?media_download
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
          if client_id = "" || client_secret = "" || refresh_token = "" then
            raise (RefreshTokenFailed session);
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
            new_session
              |> GapiConversation.Session.auth
              ^%= GapiConversation.Session.oauth2
              ^%= GapiLens.option_get
              ^%= GapiConversation.Session.oauth2_token ^= access_token
      | _ ->
          failwith "Bug: refresh_oauth2_token"

let gapi_request
      ?post_data
      ?version
      ?etag
      ?media_source
      ?media_download
      ?(parse_error = GapiConversation.parse_error)
      request_type
      url
      parse_output
      session =
  let rec request_loop
        ?post_data
        ?current_upload_state
        request_type
        request_number
        url
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
          ?upload_state:current_upload_state
          ?media_download
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
              request_type
              (succ request_number)
              target
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
                ?current_upload_state
                request_type
                (succ request_number)
                url
                refreshed_session
      | ResumeIncomplete (range, location, new_session) ->
          let target = if location = "" then url else location in
          let upload_state = Option.get current_upload_state in
          let new_upload_state = GapiMediaResource.update_upload_state
                                   range
                                   upload_state in
          let new_post_data =
            GapiMediaResource.get_post_data new_upload_state
          in
            request_loop
              ~post_data:new_post_data
              ~current_upload_state:new_upload_state
              Update
              0
              target
              new_session
      | StartUpload (location, new_session) ->
          let target = if location = "" then url else location in
          let upload_state = Option.get current_upload_state in
          let new_upload_state = upload_state
            |> GapiMediaResource.state ^= GapiMediaResource.Uploading in
          let new_post_data =
            GapiMediaResource.get_post_data upload_state
          in
            request_loop
              ~post_data:new_post_data
              ~current_upload_state:new_upload_state
              Update
              0
              target
              new_session
      | (ServiceUnavailable new_session) as e->
          if request_number > 4 then
            raise e
          else
            let new_upload_state =
              Option.map
                (fun upload_state -> upload_state
                   |> GapiMediaResource.state ^= GapiMediaResource.Error)
                current_upload_state in
            let new_post_data =
              if Option.is_some new_upload_state then None
              else post_data
            in
              GapiUtils.wait_exponential_backoff request_number;
              request_loop
                ?post_data:new_post_data
                ?current_upload_state:new_upload_state
                request_type
                (succ request_number)
                url
                new_session
  in

  let current_upload_state =
    Option.map
      (fun resource ->
         let chunk_size = session
           |. GapiConversation.Session.config
           |. GapiConfig.upload_chunk_size
         in
           GapiMediaResource.setup_upload
             ~chunk_size
           resource)
      media_source
  in
    request_loop
      ?post_data
      ?current_upload_state
      request_type
      0
      url
      session

