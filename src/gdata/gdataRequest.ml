open GdataUtils.Op

exception Redirect of string * GdataConversation.Session.t
exception Unauthorized of GdataConversation.Session.t
exception NotModified of GdataConversation.Session.t

type request_type =
    Query
  | Create
  | Update
  | Delete

let render_xml buffer tree =
  let output = Xmlm.make_output (`Buffer buffer) in
  let rec frag_of_node node =
    match node with
        GdataCore.AnnotatedTree.Leaf ([`Text], d)
      | GdataCore.AnnotatedTree.Leaf ([`Cdata], d) ->
          `Data d
      | GdataCore.AnnotatedTree.Node ([`Element;
                                       `Name name;
                                       `Namespace namespace],
                                      children) ->
          let attributes = List.fold_left
                             (fun attrs e ->
                                match e with
                                    GdataCore.AnnotatedTree.Leaf ([`Attribute;
                                                                   `Name n;
                                                                   `Namespace ns],
                                                                  d) ->
                                      ((ns, n), d) :: attrs
                                  | _ -> attrs)
                             []
                             children in
          let elements =
            List.filter
              (fun e ->
                 match e with
                     GdataCore.AnnotatedTree.Leaf (m, _)
                   | GdataCore.AnnotatedTree.Node (m, _) ->
                       match GdataCore.Metadata.node_type m with
                           `Attribute -> false
                         | _ -> true) children
          in
            `El (((namespace, name), attributes), elements)
      | _ -> assert false
  in
    Xmlm.output_doc_tree frag_of_node output (None, tree)

let data_to_xml_string ?(buffer_size = 512) tree =
  let buffer = Buffer.create buffer_size in
  let () = render_xml buffer tree in
  let result = Buffer.contents buffer in
    (* Replace new-line character after xml declaration, because it causes a
     * server-side error *)
    String.fill result 38 1 ' ';
    result

let parse_xml next_byte parse_tree =
  let input = Xmlm.make_input ~strip:true (`Fun next_byte) in 
  let el tag children =
    let ((namespace, name), attribute_list) = tag in
    let attrs = List.map
                  (fun ((ns, n), d) ->
                     GdataCore.AnnotatedTree.Leaf (
                       [`Attribute;
                        `Name n;
                        `Namespace ns],
                       d)
                  )
                  attribute_list in
      GdataCore.AnnotatedTree.Node (
        [`Element;
         `Name name;
         `Namespace namespace],
        attrs @ children) in
  let data d =
    GdataCore.AnnotatedTree.Leaf (
      [`Text],
      d) in
  let (_, tree) = Xmlm.input_doc_tree ~el ~data input in
    parse_tree tree

let parse_xml_response parse_xml_tree pipe =
  parse_xml
    (fun () -> GdataPipe.OcamlnetPipe.read_byte pipe)
    parse_xml_tree

let parse_empty_response _ =
  ()

let parse_response parse_output pipe response_code headers session =
  match response_code with
      200 (* OK *)
    | 201 (* Created *) ->
        parse_output pipe
    | 302 (* Found *) ->
        let url = List.fold_left
                    (fun u h ->
                       match h with
                           GdataCore.Header.Location value -> value
                         | _ -> u)
                    ""
                    headers
        in
          raise (Redirect (url, session))
    | 401 (* Unauthorized *) ->
        raise (Unauthorized session)
    | 304 (* Not modified *)
    | 412 (* Precondition failed *) ->
        raise (NotModified session)
    | _ ->
        GdataConversation.parse_error pipe response_code

let build_auth_data session =
  match session.GdataConversation.Session.config.GdataConfig.auth with
      GdataConfig.NoAuth ->
        GdataAuth.NoAuth
    | GdataConfig.ClientLogin _ ->
        begin match session.GdataConversation.Session.auth with
            GdataConversation.Session.ClientLogin token ->
              GdataAuth.ClientLogin token
          | _ ->
              failwith "Unexpected auth context for Client Login"
        end
    | GdataConfig.OAuth1 { GdataConfig.signature_method = signature_method;
                           GdataConfig.consumer_key = consumer_key;
                           GdataConfig.consumer_secret = consumer_secret } ->
        begin match session.GdataConversation.Session.auth with
            GdataConversation.Session.OAuth1
              { GdataConversation.Session.token = token;
                GdataConversation.Session.secret = secret } ->
              GdataAuth.OAuth1 { GdataAuth.signature_method = signature_method;
                                 GdataAuth.consumer_key = consumer_key;
                                 GdataAuth.consumer_secret = consumer_secret;
                                 GdataAuth.token = token;
                                 GdataAuth.secret = secret }
          | _ ->
              failwith "Unexpected auth context for OAuth1"
        end
    | GdataConfig.OAuth2 { GdataConfig.client_id = client_id;
                           GdataConfig.client_secret = client_secret } ->
        begin match session.GdataConversation.Session.auth with
            GdataConversation.Session.OAuth2
              { GdataConversation.Session.oauth2_token = oauth2_token;
                GdataConversation.Session.refresh_token = refresh_token } ->
              GdataAuth.OAuth2 { GdataAuth.client_id = client_id;
                                 GdataAuth.client_secret = client_secret;
                                 GdataAuth.oauth2_token = oauth2_token;
                                 GdataAuth.refresh_token = refresh_token }
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
      session =
  let auth_data = build_auth_data session in
  let http_method =
    match request_type with
        Query ->
          begin match post_data with
              None -> GdataCore.HttpMethod.GET
            | Some _ -> GdataCore.HttpMethod.POST
          end
      | Create -> GdataCore.HttpMethod.POST
      | Update -> GdataCore.HttpMethod.PUT
      | Delete -> GdataCore.HttpMethod.DELETE in
  let oauth1_params =
    match auth_data with
        GdataAuth.NoAuth
      | GdataAuth.ClientLogin _
      | GdataAuth.OAuth2 _ ->
          None
      | GdataAuth.OAuth1 _ ->
          let post_fields =
            match post_data with
                Some (GdataCore.PostData.Fields fields) -> fields
              | _ -> []
          in
            Some { GdataAuth.http_method = http_method;
                   GdataAuth.url = url;
                   GdataAuth.post_fields_to_sign = post_fields } in
  let authorization_header =
    Option.map (fun a -> GdataCore.Header.Authorization a)
      (GdataAuth.generate_authorization_header ?oauth1_params auth_data) in
  let version_header =
    Option.map (fun v -> GdataCore.Header.GdataVersion v) version in
  let etag_header =
    Option.map (fun e ->
                  match request_type with
                      Query ->
                        Some (GdataCore.Header.IfNoneMatch e)
                    | Update
                    | Delete ->
                        if GdataUtils.is_weak_etag e then
                          None
                        else
                          Some (GdataCore.Header.IfMatch e)
                    | Create ->
                        None
    ) etag
      |> Option.default None in
  let header_list = [authorization_header; version_header; etag_header]
    |> List.filter Option.is_some
    |> List.map Option.get
  in
    GdataConversation.request
      ~header_list
      ?post_data
      http_method
      session
      url
      (parse_response parse_output)

let refresh_oauth2_token session =
  let auth_data = build_auth_data session in
    match auth_data with
        GdataAuth.OAuth2 { GdataAuth.client_id = client_id;
                           GdataAuth.client_secret = client_secret;
                           GdataAuth.refresh_token = refresh_token } ->
          let (response, new_session) =
            GdataOAuth2.refresh_access_token
              ~client_id
              ~client_secret
              ~refresh_token
              session in
          let access_token =
            match response with
                GdataAuthResponse.OAuth2AccessToken token ->
                  token.GdataAuthResponse.OAuth2.access_token
              | _ -> failwith "Not supported OAuth2 response" in
          let new_auth_context =
            match new_session.GdataConversation.Session.auth with
                GdataConversation.Session.OAuth2 data ->
                  { data with
                        GdataConversation.Session.oauth2_token = access_token }
              | _ ->
                  failwith "Unexptected OAuth2 auth context"
          in
            { new_session with
                  GdataConversation.Session.auth = GdataConversation.Session.OAuth2
                                                     new_auth_context }
      | _ ->
          failwith "Unauthorized" (* TODO: better error handling *)

let rec gdata_request
      ?post_data
      ?version
      ?etag
      request_type
      url
      parse_output
      session =
  try
    let verified_session =
      match session.GdataConversation.Session.auth with
          GdataConversation.Session.OAuth2 { GdataConversation.Session.oauth2_token = "" } ->
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
        verified_session
  with
      Redirect (target, new_session) ->
        if url <> target then
          gdata_request
            ?post_data
            ?version
            ?etag
            request_type
            target
            parse_output
            new_session
        else
          failwith ("Redirection loop detected: url=" ^ url)
    | Unauthorized new_session ->
        let refreshed_session = refresh_oauth2_token new_session in
          gdata_request
            ?post_data
            ?version
            ?etag
            request_type
            url
            parse_output
            refreshed_session

