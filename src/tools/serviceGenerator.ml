open GapiUtils.Infix
open GapiLens.Infix
open GapiDiscovery

let base_path = "tools/"


(* Download service description document *)

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
  let file_name = base_path ^ api ^ "." ^ version ^ ".json" in
    if not (Sys.file_exists file_name) || nocache then begin
      Printf.printf "Downloading %s %s service description to file %s...%!"
        api version file_name;
      let document =
        do_request
          (fun session ->
             GapiDiscoveryService.ApisResource.getRest
               ~api
               ~version
               session
             |> fst) in
      let () = print_endline "Done" in
      let tree = RestDescription.to_data_model document in
      let json = GapiJson.data_model_to_json tree in
      let () = Json_io.save_json file_name json in
        document
    end else begin
      Printf.printf "Reusing %s %s service description file %s\n%!"
        api version file_name;
      let json = Json_io.load_json file_name in
      let tree = GapiJson.json_to_data_model json in
        RestDescription.of_data_model tree
    end


(* Generate OCaml source files *)

(* Parameters and properties *)

module Name =
struct
  type t = {
    original_name : string;
    ocaml_name : string
  }

  let keywords = ["type"; "method"; "private"; "end"; "ref"; "object"]

  let create name =
    let ocaml_name =
      if List.mem name keywords then
        "_" ^ name
      else
        name
    in
      { original_name = name;
        ocaml_name
      }

end

module ScalarType =
struct
  type format_t =
      NoFormat
    | DateTimeFormat
    | DateFormat
    | TimeFormat
    | Int32Format
    | Int64Format
    | OtherFormat of string

  let format_of_string = function
      "" -> NoFormat
    | "date-time" -> DateTimeFormat
    | "date" -> DateFormat
    | "time" -> TimeFormat
    | "int32" -> Int32Format
    | "int64" -> Int64Format
    | s -> OtherFormat s

  type location_t =
      NoLocation
    | Query
    | Path

  let location_of_string = function
      "" -> NoLocation
    | "query" -> Query
    | "path" -> Path
    | s -> failwith ("Unexpected location " ^ s)

  let is_scalar json_schema =
    match json_schema.JsonSchema._type with
        "string"
      | "boolean"
      | "integer" -> true
      | _ -> false

  type data_t =
      String
    | Boolean
    | Integer
    | DateTime
    | Date

  let data_type_to_string = function
      String -> "string"
    | Boolean -> "bool"
    | Integer -> "int"
    | DateTime
    | Date -> "GapiDate.t"

  type t = {
    original_type : string;
    description : string;
    default : string;
    required : bool;
    format : format_t;
    pattern : string;
    minimum : string;
    maximum : string;
    enum : string list;
    enumDescriptions : string list;
    repeated : bool;
    location : location_t;
    data_type : data_t;
    empty_value : string;
  }

  let create json_schema =
    let get_data_type original_type format =
      match original_type with
          "boolean" -> Boolean
        | "integer" -> Integer
        | "string" ->
            begin match format with
                DateTimeFormat -> DateTime
              | DateFormat -> Date
              | _ -> String
            end
        | _ ->
            failwith ("Unexpected original type: " ^ original_type)
    in

    let get_empty_value = function
        String -> "\"\""
      | Boolean -> "false"
      | Integer -> "0"
      | DateTime
      | Date -> "GapiDate.epoch"
    in

    let format = format_of_string json_schema.JsonSchema.format in
    let data_type = get_data_type json_schema.JsonSchema._type format in
    let empty_value = get_empty_value data_type in
      if not (is_scalar json_schema) then
        failwith ("Unexpected non-scalar type: " ^ json_schema.JsonSchema._type)
      else
        { original_type = json_schema.JsonSchema._type;
          description = json_schema.JsonSchema.description;
          default = json_schema.JsonSchema.default;
          required = json_schema.JsonSchema.required;
          format;
          pattern = json_schema.JsonSchema.pattern;
          minimum = json_schema.JsonSchema.minimum;
          maximum = json_schema.JsonSchema.maximum;
          enum = json_schema.JsonSchema.enum;
          enumDescriptions = json_schema.JsonSchema.enumDescriptions;
          repeated = json_schema.JsonSchema.repeated;
          location = location_of_string json_schema.JsonSchema.location;
          data_type;
          empty_value;
        }

  let get_render_template = function
      String ->
        ["GapiJson.render_string_value"; "x."; ""]
    | Boolean ->
        ["GapiJson.render_bool_value"; "x."; ""]
    | Integer ->
        ["GapiJson.render_int_value"; "x."; ""]
    | DateTime
    | Date ->
        ["GapiJson.render_date_value"; "x."; ""]

end

module ComplexType =
struct
  let is_reference json_schema =
    json_schema.JsonSchema._ref <> ""

  let is_complex json_schema =
    match json_schema.JsonSchema._type with
        "object"
      | "array" -> true
      | _ -> false

  type data_t =
      Scalar of ScalarType.t
    | Object of (Name.t * t) list
    | Array of t
    | Reference of string
    | Dynamic of t
  and t = {
    id : string;
    data_type : data_t;
    original_type : string;
    description : string;
  }

  let rec data_type_to_string = function
      Scalar scalar ->
        scalar.ScalarType.data_type |> ScalarType.data_type_to_string
    | Reference type_name ->
        type_name ^ ".t"
    | Array inner_type ->
        (data_type_to_string inner_type.data_type) ^ " list"
    | _ ->
        failwith "Unsupported type in ComplexType.data_type_to_string"

  let get_references complex_type =
    let merge xs ys =
      List.fold_left
        (fun zs x ->
           if List.mem x zs then
             zs
           else
             x :: zs)
        ys
        xs
    in

    let rec loop complex_type' accu =
      match complex_type'.data_type with
        | Reference type_name ->
            type_name :: accu
        | Array inner_type ->
            loop inner_type accu
        | Object properties ->
            List.fold_left
              (fun a (_, prop) ->
                 let refs = loop prop accu in
                   merge a refs)
              accu
              properties
        | Scalar _
        | _ ->
            accu
    in
      loop complex_type []

  (* TODO: refactor *)
  let get_direct_references complex_type =
    let merge xs ys =
      List.fold_left
        (fun zs x ->
           if List.mem x zs then
             zs
           else
             x :: zs)
        ys
        xs
    in

    let rec loop complex_type' accu =
      match complex_type'.data_type with
        | Reference type_name ->
            type_name :: accu
        | Object properties ->
            List.fold_left
              (fun a (_, prop) ->
                 let refs = loop prop accu in
                   merge a refs)
              accu
              properties
        | Array _
        | Scalar _
        | _ ->
            accu
    in
      loop complex_type []

  let is_anonymous complex_type =
    complex_type.id = ""

  let get_empty_value = function
      Scalar scalar ->
        scalar.ScalarType.empty_value
    | Reference type_name ->
        type_name ^ ".empty"
    | Array inner_type ->
        "[]"
    | _ ->
        failwith "Unsupported type in ComplexType.get_empty_value"

  let rec create json_schema =
    let create_object () =
      match json_schema.JsonSchema.additionalProperties with
          None -> Object (List.map
                            (fun (n, v) -> (Name.create n, create v))
                            json_schema.JsonSchema.properties)
            | Some p -> Dynamic (create p)
    in

    let create_array () =
      Array (json_schema.JsonSchema.items
               |> Option.get
               |> create)
    in

    let create_complex () =
      match json_schema.JsonSchema._type with
          "object" -> create_object ()
        | "array" -> create_array ()
        | _ ->
            failwith ("Unexpected complex type: "
                      ^ json_schema.JsonSchema._type)
    in

    let create_reference () =
      Reference json_schema.JsonSchema._ref
    in

    let create_scalar () =
        Scalar (ScalarType.create json_schema)
    in

    let data_type =
      if is_reference json_schema then
        create_reference ()
      else if is_complex json_schema then
        create_complex ()
      else
        create_scalar ()
    in
      { id = json_schema.JsonSchema.id;
        data_type;
        original_type = json_schema.JsonSchema._type;
        description = json_schema.JsonSchema.description;
      }

  let get_render_template t =
    match t.data_type with
        Scalar scalar ->
          ScalarType.get_render_template scalar.ScalarType.data_type
      (*| Object _ ->
          "GapiJson.render_object"*)
      | Reference type_name ->
          ["GapiJson.render_object"; "(" ^ type_name ^ ".render x."; ")"]
      | Array { data_type = Reference type_name; _ } ->
          ["GapiJson.render_array"; type_name ^ ".render x."; ""]
      | _ ->
          failwith "Unexpected complex type in ComplexType.get_render_template."

end

module StringSet =
struct
  include Set.Make(struct type t = string let compare = compare end)

  let add_list xs s =
    List.fold_left
      (fun s' x -> add x s')
      s
      xs

end

module TypeTable =
struct
  type t = {
    table : (string, ComplexType.t) Hashtbl.t;
    referenced : StringSet.t;
  }

  let create complex_types =
    let table = Hashtbl.create 64 in
      List.iter
        (fun complex_type ->
           if not (ComplexType.is_anonymous complex_type) then
             Hashtbl.add table complex_type.ComplexType.id complex_type)
        complex_types;
      { table; referenced = StringSet.empty }

  let sort { table; referenced } =
    let get_references id complex_type =
      let rec loop id' complex_type' accu =
        let references = ComplexType.get_references complex_type' in
        let full_references =
          List.fold_left
            (fun a r ->
               let referenced_type = Hashtbl.find table r in
                 loop r referenced_type a)
            accu
            references
        in
          (id', complex_type') :: full_references
      in
        loop id complex_type []
    in

    let merge xs ys =
      List.fold_right
        (fun (k, v) zs ->
           if List.mem_assoc k zs then
             zs
           else
             (k, v) :: zs)
        xs
        ys
    in

    let referenced =
      Hashtbl.fold
        (fun _ complex_type referenced' ->
           let references = ComplexType.get_direct_references complex_type in
             StringSet.add_list references referenced')
        table
        referenced
    in

    let complex_types =
      Hashtbl.fold
        (fun id complex_type sorted ->
           if List.mem_assoc id sorted then
             sorted
           else
             let references = get_references id complex_type in
               merge references sorted)
        table
        []
    in
      (List.rev_map snd complex_types, { table; referenced })

  let is_referenced id { referenced; _ } =
    StringSet.mem id referenced

end

module Module =
struct
  type file_type =
      SchemaModule
    | SchemaModuleInterface
    | ServiceModule
    | ServiceModuleInterface

  type t = {
    name : string;
    file_name : string;
    file_type : file_type;
  }

  let create service_name file_type =
    let module_base_name =
      "Gapi" ^ (String.capitalize service_name) in
    let name =
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
      base_path ^ (String.uncapitalize name) ^ extension
    in
      { name; file_name; file_type; }

end

let open_file file_name =
  let oc = open_out file_name in
  let formatter = Format.formatter_of_out_channel oc in
    (oc, formatter)

let close_file oc formatter =
  Format.fprintf formatter "@?";
  close_out oc

let build_schema_inner_module formatter complex_type type_table =
  let render_type_t () =
    Format.fprintf formatter "@[<v 2>type t = {@,";
    begin match complex_type.ComplexType.data_type with
        ComplexType.Object properties ->
          List.iter
            (fun ({ Name.ocaml_name; _ }, property) ->
               Format.fprintf formatter
                 "%s : %s;@,"
                 ocaml_name
                 (ComplexType.data_type_to_string
                    property.ComplexType.data_type))
            properties;
      | _ ->
          failwith ("Unexpected root (must be an Object): "
                    ^ complex_type.ComplexType.id)
    end;
    Format.fprintf formatter "@]@,}@,"
  in

  let render_lenses () =
    match complex_type.ComplexType.data_type with
        ComplexType.Object properties ->
          List.iter
            (fun ({ Name.ocaml_name; _ }, _) ->
               Format.fprintf formatter
                 "@,@[<v 2>let %s = {@," ocaml_name;
               Format.fprintf formatter
                 "GapiLens.get = (fun x -> x.%s);@," ocaml_name;
               Format.fprintf formatter
                 "GapiLens.set = (fun v x -> { x with %s = v });" ocaml_name;
               Format.fprintf formatter "@]@,}")
            properties;
      | _ ->
          failwith ("Unexpected root (must be an Object): "
                    ^ complex_type.ComplexType.id)
  in

  let render_empty () =
    Format.fprintf formatter "@,@,@[<v 2>let empty = {@,";
    begin match complex_type.ComplexType.data_type with
        ComplexType.Object properties ->
          List.iter
            (fun ({ Name.ocaml_name; _ }, property) ->
               Format.fprintf formatter
                 "%s = %s;@,"
                 ocaml_name
                 (ComplexType.get_empty_value
                    property.ComplexType.data_type))
            properties;
      | _ ->
          failwith ("Unexpected root (must be an Object): "
                    ^ complex_type.ComplexType.id)
    end;
    Format.fprintf formatter "@]@,}@,"
  in

  let render_render_function () =
    Format.fprintf formatter "@,@,@[<v 2>let render x = @,";
    if not (TypeTable.is_referenced complex_type.ComplexType.id type_table) then
      Format.fprintf formatter "@[<v 2>GapiJson.render_object \"\" [@,"
    else
      Format.fprintf formatter "@[<v 2> [@,";
    begin match complex_type.ComplexType.data_type with
        ComplexType.Object properties ->
          List.iter
            (fun ({ Name.ocaml_name; original_name }, property) ->
               let render_template =
                 ComplexType.get_render_template property in
               Format.fprintf formatter
                 "%s \"%s\" %s%s%s;@,"
                 (List.nth render_template 0)
                 original_name
                 (List.nth render_template 1)
                 ocaml_name
                 (List.nth render_template 2))
            properties;
      | _ ->
          failwith ("Unexpected root (must be an Object): "
                    ^ complex_type.ComplexType.id)
    end;
    Format.fprintf formatter "@,@]]@]@,"
  in

    Format.fprintf formatter
      "module %s =@\n@[<v 2>struct@,"
      complex_type.ComplexType.id;
    render_type_t ();
    render_lenses ();
    render_empty ();
    render_render_function ();
    Format.fprintf formatter "@,@]@\nend@\n@\n"

let build_schema_module service_name complex_types type_table =
  let new_module =
    Module.create service_name Module.SchemaModule in
  let () =
    Printf.printf "Building schema module %s (%s)...%!"
      new_module.Module.name new_module.Module.file_name in
  let (oc, formatter) = open_file new_module.Module.file_name in
  let () =
    Format.fprintf formatter "(* Warning! This file is generated. Modify at your own risk. *)@\n@\n" in
    List.iter
      (fun complex_type ->
         build_schema_inner_module formatter complex_type type_table)
      complex_types;
    close_file oc formatter;
    print_endline "Done"

let build_schema_module_interface service =
  ()

let build_service_module service =
  ()

let build_service_module_interface service =
  ()

let generate_code service =
  let complex_types =
    List.map
      (fun (_, s) -> ComplexType.create s)
      service.RestDescription.schemas in
  let type_table = 
    TypeTable.create complex_types in
  let (sorted_complex_types, type_table) =
    TypeTable.sort type_table
  in
    build_schema_module
      service.RestDescription.name
      sorted_complex_types
      type_table;
    build_schema_module_interface service;
    build_service_module service;
    build_service_module_interface service

(* Argument parsing and program entry point *)

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
    end in
  let service = get_service_description !api !version !nocache in
    generate_code service

