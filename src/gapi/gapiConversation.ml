open GapiUtils.Infix

let debug_print start_time curl info_type info =
  let time = Unix.gettimeofday () in
  let timestamp = time -. start_time in
  let nl = if info.[String.length info - 1] = '\n' then "" else "\n" in
    Printf.printf "[%f] curl: %s: %s%s"
      timestamp
      (GapiCurl.string_of_curl_info_type info_type)
      info
      nl

module Session =
struct
  type oauth1_context = {
    token : string;
    secret : string;
  }

	let token = {
		GapiLens.get = (fun x -> x.token);
		GapiLens.set = (fun v x -> { x with token = v })
	}
	let secret = {
		GapiLens.get = (fun x -> x.secret);
		GapiLens.set = (fun v x -> { x with secret = v })
	}

  type oauth2_context = {
    oauth2_token: string;
    refresh_token : string;
  }

  let oauth2_token = {
		GapiLens.get = (fun x -> x.oauth2_token);
		GapiLens.set = (fun v x -> { x with oauth2_token = v })
	}
	let refresh_token = {
		GapiLens.get = (fun x -> x.refresh_token);
		GapiLens.set = (fun v x -> { x with refresh_token = v })
	}

  type auth_context =
      NoAuth
    | ClientLogin of string
    | OAuth1 of oauth1_context
    | OAuth2 of oauth2_context

  let no_auth = {
		GapiLens.get = (function NoAuth -> Some () | _ -> None);
		GapiLens.set = (fun _ _ -> NoAuth)
  }
  let client_login = {
		GapiLens.get = (function ClientLogin v -> Some v | _ -> None);
		GapiLens.set = (fun v _ -> ClientLogin (Option.get v))
  }
  let oauth1 = {
		GapiLens.get = (function OAuth1 v -> Some v | _ -> None);
		GapiLens.set = (fun v _ -> OAuth1 (Option.get v))
  }
  let oauth2 = {
		GapiLens.get = (function OAuth2 v -> Some v | _ -> None);
		GapiLens.set = (fun v _ -> OAuth2 (Option.get v))
  }

  type t = {
    curl : [`Created] GapiCurl.t;
    config : GapiConfig.t;
    auth : auth_context;
    cookies : string list;
    etag : string;
  }

	let curl = {
		GapiLens.get = (fun x -> x.curl);
		GapiLens.set = (fun v x -> { x with curl = v })
	}
	let config = {
		GapiLens.get = (fun x -> x.config);
		GapiLens.set = (fun v x -> { x with config = v })
	}
	let auth = {
		GapiLens.get = (fun x -> x.auth);
		GapiLens.set = (fun v x -> { x with auth = v })
	}
	let cookies = {
		GapiLens.get = (fun x -> x.cookies);
		GapiLens.set = (fun v x -> { x with cookies = v })
	}
	let etag = {
		GapiLens.get = (fun x -> x.etag);
		GapiLens.set = (fun v x -> { x with etag = v })
	}

end

let update_session headers session =
  let cookies =
    List.fold_left
      (fun cs header ->
         match header with
             GapiCore.Header.KeyValueHeader (k, v) when k = "Set-Cookie" ->
               GapiCore.Header.to_string header :: cs
           | _ -> cs)
      []
      headers in
  let etag = List.fold_left
               (fun e h ->
                  match h with
                      GapiCore.Header.ETag v -> v
                    | _ -> e)
               ""
               headers
  in
    { session with
          Session.cookies;
          etag }

let request
      ?header_list
      ?post_data
      http_method
      session
      url
      parse_response =
  let header_queue = Queue.create () in
  let parse_header data =
    Queue.add data header_queue;
    String.length data in
  let pipe = GapiPipe.OcamlnetPipe.create () in
  let writer data =
    GapiPipe.OcamlnetPipe.write_string pipe data;
    String.length data in
  let user_agent_header =
    Printf.sprintf "%s gapi-ocaml/%s/%s"
      session.Session.config.GapiConfig.application_name
      GapiCore.library_version
      Sys.os_type in
  let request_headers =
    let hl = Option.default [] header_list in
      match post_data with
          Some (GapiCore.PostData.Body (_, content_type)) ->
            GapiCore.Header.ContentType content_type :: hl
        | _ -> hl
  in
    GapiCurl.set_headerfunction parse_header session.Session.curl;
    GapiCurl.set_writefunction writer session.Session.curl;
    begin match http_method with
        GapiCore.HttpMethod.GET ->
          GapiCurl.set_httpget true session.Session.curl
      | GapiCore.HttpMethod.POST ->
          GapiCurl.set_post true session.Session.curl
      | GapiCore.HttpMethod.PUT
      | GapiCore.HttpMethod.PATCH ->
          GapiCurl.set_upload true session.Session.curl
      | GapiCore.HttpMethod.DELETE ->
          GapiCurl.set_upload false session.Session.curl;
          GapiCurl.set_nobody true session.Session.curl
    end;
    begin match http_method with
        GapiCore.HttpMethod.PATCH
      | GapiCore.HttpMethod.DELETE ->
          GapiCurl.set_customrequest
            (GapiCore.HttpMethod.to_string http_method) session.Session.curl
      | _ ->
          (* FIXME: reset curl custom request *)
          GapiCurl.set_customrequest
            (GapiCore.HttpMethod.to_string http_method) session.Session.curl
    end;
    begin match post_data with
        Some (GapiCore.PostData.Fields key_value_list) ->
          GapiCurl.set_postfields key_value_list session.Session.curl
      | Some (GapiCore.PostData.Body (body, _)) ->
          GapiCurl.set_httpbody body session.Session.curl
      | None ->
          match http_method with
              GapiCore.HttpMethod.POST ->
                GapiCurl.set_postfields [] session.Session.curl
            | _ -> ()
    end;
    GapiCurl.set_useragent user_agent_header session.Session.curl;
    GapiCurl.set_httpheader request_headers session.Session.curl;
    GapiCurl.set_cookies session.Session.cookies session.Session.curl;
    try
      GapiCurl.perform url session.Session.curl;
      GapiPipe.OcamlnetPipe.end_writing pipe;
      let response_code = GapiCurl.get_responsecode session.Session.curl in
      let response_headers = List.rev
                               (Queue.fold
                                  (fun l h -> GapiCore.Header.parse h :: l)
                                  []
                                  header_queue) in
      let new_session = update_session response_headers session in
      let result = parse_response
                     pipe response_code response_headers new_session in
        GapiPipe.OcamlnetPipe.end_reading pipe;
        (result, new_session)
    with
        Curl.CurlException (_, code, desc) ->
          GapiPipe.OcamlnetPipe.end_reading pipe;
          failwith (Printf.sprintf
                      "Code: %d, Description: %s, ErrorBuffer: %s\n"
                      code desc
                      (GapiCurl.get_error_buffer session.Session.curl))
      | e ->
          GapiPipe.OcamlnetPipe.end_reading pipe;
          raise e

let with_session
      ?(auth_context = Session.NoAuth)
      config
      curl_state
      interact =
  let debug_function = 
    Option.map
      (fun df ->
         match df with
             GapiConfig.Standard -> debug_print (Unix.gettimeofday ())
           | GapiConfig.Custom f -> f)
      config.GapiConfig.debug in
  let timeout = config.GapiConfig.timeout in
  let connect_timeout = config.GapiConfig.connect_timeout in
  let compress = config.GapiConfig.compress in
  let curl_session = GapiCurl.init
                       ?debug_function
                       ?timeout
                       ?connect_timeout
                       ~compress
                       curl_state in
  let session =
    { Session.curl = curl_session;
      config = config;
      cookies = [];
      auth = auth_context;
      etag = "" }
  in
    try
      let result = interact session in
        ignore (GapiCurl.cleanup curl_session);
        result
    with e ->
      ignore (GapiCurl.cleanup curl_session);
      raise e

let read_all pipe =
  let buffer = Buffer.create 16 in
    try
      while true do
        Buffer.add_string buffer (GapiPipe.OcamlnetPipe.read_line pipe)
      done;
      assert false
    with End_of_file ->
      Buffer.contents buffer

let parse_error pipe response_code =
  let error_message = read_all pipe in
    failwith (Printf.sprintf "Error: %s (HTTP response code: %d)"
                error_message
                response_code)

exception ConversationException of string

type ('i, 'o) iter =
    Done of 'o
  | Continue of ('i -> ('i, 'o) iter)
  | Error of string

let rec loop continue input =
  let iter = continue input in
    match iter with
        Done output ->
          output
      | Error message ->
          raise (ConversationException message)
      | Continue k ->
          loop k input

