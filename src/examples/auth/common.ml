let do_request interact =
  let state = GdataCurl.global_init () in
    GdataConversation.with_session
      GdataConfig.default
      state
      interact;
    ignore (GdataCurl.global_cleanup state)

let start_netplex callback =
  let process_compat
        process
        (cgi : Netcgi1_compat.Netcgi_types.cgi_activation) =
    let cgi' = Netcgi1_compat.Netcgi_types.of_compat_activation cgi in
      process cgi' in
  let handler_data =
    { Nethttpd_services.dyn_handler =
        (fun _ -> process_compat callback);
      dyn_activation =
        Nethttpd_services.std_activation `Std_activation_buffered;
      dyn_uri = None;
      dyn_translator = (fun _ -> "");
      dyn_accept_all_conditionals = false;
    } in
  let nethttpd_factory =
    Nethttpd_plex.nethttpd_factory
      ~handlers:["oauth1callback", handler_data;
                 "oauth2callback", handler_data]
      () in
  let cmdline_cfg =
    Netplex_main.create
      ~config_filename:"examples/auth/netplex.config" 
      ~foreground:true () in
  let parallelizer = Netplex_mp.mp () in
    Netplex_main.startup
      parallelizer
      Netplex_log.logger_factories
      Netplex_workload.workload_manager_factories
      [nethttpd_factory]
      cmdline_cfg

let output_page title h1 body (cgi : Netcgi.cgi_activation) =
  cgi#out_channel#output_string "<html><title>";
  cgi#out_channel#output_string title;
  cgi#out_channel#output_string "</title><body><h1>";
  cgi#out_channel#output_string h1;
  cgi#out_channel#output_string "</h1>";
  cgi#out_channel#output_string body;
  cgi#out_channel#output_string "</body></html>";
  cgi#out_channel#commit_work ()

let output_error_page title error (cgi : Netcgi.cgi_activation) =
  output_page title "Error" error cgi

