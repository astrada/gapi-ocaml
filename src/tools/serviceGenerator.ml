open GapiUtils.Infix
open GapiLens.Infix
open GapiDiscovery

let do_request interact =
  let state = GapiCurl.global_init () in
  let result =
    GapiConversation.with_session
      GapiConfig.default
      state
      interact
  in
    ignore (GapiCurl.global_cleanup state);
    result

let get_service_description api version nocache =
  let file_name = api ^ "." ^ version ^ ".json" in
    if not (Sys.file_exists file_name) || nocache then
      let document =
        do_request
          (fun session ->
             GapiDiscoveryService.ApisResource.getRest
               ~api
               ~version
               session
             |> fst) in
      let tree = RestDescription.to_data_model document in
      let json = GapiJson.data_model_to_json tree in
      let () = Json_io.save_json file_name json in
        document
    else
      let json = Json_io.load_json file_name in
      let tree = GapiJson.json_to_data_model json in
        RestDescription.of_data_model tree

type file_type =
    SchemaModule
  | SchemaModuleInterface
  | ServiceModule
  | ServiceModuleInterface

let build_module_name service_name file_type =
  let module_base_name =
    "Gapi" ^ (String.capitalize service_name) in
  let module_name =
    match file_type with
        SchemaModule
      | SchemaModuleInterface -> module_base_name
      | ServiceModule
      | ServiceModuleInterface -> module_base_name ^ "Service" in
  let extension =
    match file_type with
        SchemaModule
      | ServiceModule -> ".ml"
      | SchemaModuleInterface
      | ServiceModuleInterface -> ".mli" in
  let file_name =
    (String.uncapitalize module_name) ^ extension
  in
    (module_name, file_name)

let open_file file_name =
  let oc = open_out file_name in
  let formatter = Format.formatter_of_out_channel oc in
    (oc, formatter)

let close_file oc formatter =
  Format.fprintf formatter "@?";
  close_out oc

let build_schema_inner_module (name, schema) formatter =
  Format.fprintf formatter "module %s =@\n@[<v 2>struct@,@[<v 2>type t = {@," name;
  List.iter
    (fun (name, property) ->
       Format.fprintf formatter "%s : %s;@," name property.JsonSchema._type)
    schema.JsonSchema.properties;
  Format.fprintf formatter "@]@,}@,";
  Format.fprintf formatter "@]@\nend@\n@\n"

let build_schema_module service =
  let (module_name, file_name) =
    build_module_name service.RestDescription.name SchemaModule in
  let (oc, formatter) = open_file file_name in
    List.iter
      (fun schema -> build_schema_inner_module schema formatter)
      service.RestDescription.schemas;
    close_file oc formatter

let build_schema_module_interface service =
  ()

let build_service_module service =
  ()

let build_service_module_interface service =
  ()

let _ =
  let api = ref "" in
  let version = ref "" in
  let nocache = ref false in
  let usage =
    "Usage: " ^ Sys.executable_name ^ " -api apiname -version apiver [-nocache]" in
  let arg_specs =
    Arg.align (
      ["-api",
       Arg.Set_string api,
       "apiname The name of the API.";
       "-version",
       Arg.Set_string version,
       "apiver The version of the API.";
       "-nocache",
       Arg.Set nocache,
       " Downloads the service description, ignoring locally saved versions"
      ]) in
  let () =
    Arg.parse
      arg_specs
      (fun s -> raise (Arg.Bad ("Unexpected argument: " ^ s)))
      usage in

  (* Test *)
  let _ =
    api := "urlshortener";
    version := "v1"
  in

  let _ =
    if !api = "" || !version = "" then begin
      prerr_endline "API name and version are required.";
      prerr_endline usage;
      exit 1
    end
  in
  let service = get_service_description !api !version !nocache in
    build_schema_module service;
    build_schema_module_interface service;
    build_service_module service;
    build_service_module_interface service

