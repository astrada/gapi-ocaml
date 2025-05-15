(* do_request: (GapiConversation.Session.t -> 'a) -> unit

 * Factors service interaction:
 * [do_request interact] run [interact] function in the context of a request.
 * [interact] receives the initial session state, the return value is ignored.
 *)
let do_request interact =
  (* Initialize Ocurl wrapper *)
  let state = GapiCurl.global_init () in

  (* Start the session using default configuration *)
  GapiConversation.with_session GapiConfig.default state interact;

  (* Cleanup Ocurl wrapper *)
  ignore (GapiCurl.global_cleanup state)
