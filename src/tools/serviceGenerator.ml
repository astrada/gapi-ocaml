open GapiUtils.Infix
open GapiDiscovery
open GapiLens.Infix
open GapiLens.StateInfix
open ServiceGeneratorState

(* Configuration *)

let output_path = ref "generated/"
let no_overwrite = ref false
let google_endpoint = "https://www.googleapis.com"

(* END Configuration *)

(* State monad implementation *)

module GeneratorStateMonad =
  GapiMonad.MakeStateMonad(struct type s = State.t end)

module GeneratorM =
struct
  include GeneratorStateMonad

  include GapiMonad.MakeMonadCombinators(GeneratorStateMonad)

end

open GeneratorM

(* END State monad implementation *)

(* Monad helpers *)

let ($) f x = f x

let lift_io () =
  perform
   return ()

(* END Monad helpers *)

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
  let file_name = get_full_path !output_path (api ^ "." ^ version ^ ".json") in
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

(* END Download service description document *)

(* File opening and closing *)

let open_file file_name =
  let () =
    if (Sys.file_exists file_name) && !no_overwrite then begin
      Printf.fprintf stderr "\nError: File %s already exists.\n" file_name;
      exit 1
    end in
  let oc = open_out file_name in
  let formatter = Format.formatter_of_out_channel oc in
    (oc, formatter)

let close_file oc formatter =
  Format.fprintf formatter "@?";
  close_out oc

(* END File opening and closing *)

(* Generate schema inner modules *)

let build_schema_inner_module file_lens complex_type =
  let render_type_t formatter fields =
    Format.fprintf formatter "@[<v 2>type t = {@,";
    List.iter
      (fun { Field.ocaml_name; ocaml_type; field_type; _ } ->
         Format.fprintf formatter
           "%s : %s;@,"
           ocaml_name
           ocaml_type)
      fields;
    Format.fprintf formatter "@]@,}@,"
  in

  let render_lenses formatter fields =
    List.iter
      (fun { Field.ocaml_name; field_type; _ } ->
         Format.fprintf formatter
           "@,@[<v 2>let %s = {@," ocaml_name;
         Format.fprintf formatter
           "GapiLens.get = (fun x -> x.%s);@," ocaml_name;
         Format.fprintf formatter
           "GapiLens.set = (fun v x -> { x with %s = v });" ocaml_name;
         Format.fprintf formatter "@]@,}")
      fields
  in

  let render_empty formatter fields =
    Format.fprintf formatter "@,@,@[<v 2>let empty = {@,";
    List.iter
      (fun { Field.ocaml_name; field_type; empty_value; _ } ->
         Format.fprintf formatter
           "%s = %s;@,"
           ocaml_name
           empty_value)
      fields;
    Format.fprintf formatter "@]@,}@,"
  in

  let render_render_function formatter fields is_referenced =
    Format.fprintf formatter "@,@[<v 2>let render x = @,";
    if not is_referenced then
      Format.fprintf formatter "@[<v 2>GapiJson.render_object \"\" [@,"
    else
      Format.fprintf formatter "@[<v 2> [@,";
    List.iter
      (fun { Field.ocaml_name; original_name; field_type} ->
         match field_type.ComplexType.data_type with
             ComplexType.Scalar scalar ->
               let render_value =
                 match scalar.ScalarType.data_type with
                     ScalarType.String ->
                       "GapiJson.render_string_value"
                   | ScalarType.Boolean ->
                       "GapiJson.render_bool_value"
                   | ScalarType.Integer ->
                       "GapiJson.render_int_value"
                   | ScalarType.DateTime
                   | ScalarType.Date ->
                       "GapiJson.render_date_value" in
                 Format.fprintf formatter
                   "%s \"%s\" x.%s;@,"
                   render_value
                   original_name
                   ocaml_name;
           (*| Object _ ->
            "GapiJson.render_object"*)
           | ComplexType.Reference type_name ->
               Format.fprintf formatter
                 "GapiJson.render_object \"%s\" (%s.render x.%s);@,"
                 original_name
                 type_name
                 ocaml_name;
           | ComplexType.Array { ComplexType.data_type =
                                   ComplexType.Reference type_name; _ } ->
               Format.fprintf formatter
                 "GapiJson.render_array \"%s\" %s.render x.%s;@,"
                 original_name
                 type_name
                 ocaml_name;
           | _ ->
               failwith "Unexpected complex type rendering render function")
      fields;
    Format.fprintf formatter "@]@,@]]@,"
  in

  let render_parse_function
        formatter
        fields
        is_recursive
        container_name
        module_name =
    Format.fprintf formatter "@,@[<v 2>let %sparse x = function@,"
      (if is_recursive then "rec " else "");
    List.iter
      (fun { Field.ocaml_name; original_name; field_type } ->
         match field_type.ComplexType.data_type with
             ComplexType.Scalar scalar ->
               Format.fprintf formatter
                 "@[<v 2>| @[<hv 2>GapiCore.AnnotatedTree.Leaf@ ({ GapiJson.name = \"%s\"; data_type = GapiJson.Scalar },@ Json_type.%s v) ->@]@,{ x with %s = %sv }@]@,"
                 original_name
                 (ScalarType.get_json_type scalar.ScalarType.data_type)
                 ocaml_name
                 (ScalarType.get_convert_function scalar.ScalarType.data_type)
           | ComplexType.Array arr ->
               let content_module_name = ComplexType.get_content arr in
                 Format.fprintf formatter
                   "@[<v 2>| @[<hv 2>GapiCore.AnnotatedTree.Node@ ({ GapiJson.name = \"%s\"; data_type = GapiJson.Array },@ cs) ->@]@,@[<hv 2>GapiJson.parse_collection@ %s.parse@ %s.empty@ (fun xs -> { x with %s = xs })@ cs@]@]@,"
                   original_name
                   content_module_name
                   content_module_name
                   ocaml_name
           | ComplexType.Reference module_name ->
               Format.fprintf formatter
                 "@[<v 2>| @[<hv 2>GapiCore.AnnotatedTree.Node@ ({ GapiJson.name = \"%s\"; data_type = GapiJson.Object },@ cs) ->@]@,@[<hv 2>GapiJson.parse_children@ %s.parse@ %s.empty@ (fun v -> { x with %s = v })@ cs@]@]@,"
                 original_name
                 module_name
                 module_name
                 ocaml_name
           | _ -> ()
      )
      fields;
    if is_recursive then begin
      Format.fprintf formatter
        "@[<v 2>| GapiCore.AnnotatedTree.Node@,({ GapiJson.name = \"\"; data_type = GapiJson.Object },@,cs) ->@,@[<hv 2>GapiJson.parse_children@ parse@ empty@ Std.identity@ cs@]@]@,"
    end;
    Format.fprintf formatter
      "@[<v 2>| e ->@,GapiJson.unexpected \"%s.%s.parse\" e@]@]"
      container_name
      module_name;
  in

  let render_footer formatter is_recursive =
    (* Render footer (to_data_model and of_data_model) *)
    if is_recursive then begin
      Format.fprintf formatter
        "@,@,let to_data_model = GapiJson.render_root render@,@,let of_data_model = GapiJson.parse_root parse empty";
    end;
    Format.fprintf formatter "@,";
    Format.fprintf formatter "@]@\nend@\n@\n"
  in

  let properties =
    match complex_type.ComplexType.data_type with
        ComplexType.Object properties -> properties
      | _ ->
        failwith ("Unexpected root (must be an Object): "
                  ^ complex_type.ComplexType.id) in
  let record = Record.create properties in
  let module_name =
    OCamlName.get_ocaml_name ModuleName complex_type.ComplexType.id in
  let inner_module =
    { InnerSchemaModule.create complex_type.ComplexType.id module_name with
          InnerSchemaModule.record = Some record
    } in
  let inner_module_lens =
    State.get_schema_module_lens
      |-- SchemaModule.get_inner_module_lens module_name
  in
    perform
      (* Insert inner module into state *)
      inner_module_lens ^=! inner_module;

      file <-- GapiLens.get_state file_lens;
      let formatter = file.File.formatter in
      let container_name = file.File.module_name in

      lift_io $
        Format.fprintf formatter
          "module %s =@\n@[<v 2>struct@,"
        inner_module.InnerSchemaModule.ocaml_name;

      let field_list_lens = inner_module_lens
        |-- InnerSchemaModule.record
        |-- GapiLens.option_get
        |-- Record.field_list in
      fields <-- GapiLens.get_state field_list_lens;

      lift_io $ render_type_t formatter fields;
      lift_io $ render_lenses formatter fields;
      lift_io $ render_empty formatter fields;
      is_referenced <-- State.is_type_referenced complex_type.ComplexType.id;
      lift_io $ render_render_function formatter fields is_referenced;
      let is_recursive = not is_referenced in
      lift_io $ render_parse_function
        formatter fields is_recursive container_name module_name;
      lift_io $ render_footer formatter is_recursive

(* END Generate schema inner modules *)

(* Generate service inner modules *)

let generate_rest_method formatter inner_module_lens (id, rest_method) =
  let generate_method_body methd =
    let function_to_call = String.lowercase rest_method.RestMethod.httpMethod in
      perform
        parameters_module_name <-- GapiLens.get_state
                                     State.parameters_module_name;

        (* Build complete url *)
        let path = rest_method.RestMethod.path in
        let splitted_path =
          ExtString.String.nsplit path "/" in
        let path_list =
          List.map
            (fun p ->
               if ExtString.String.starts_with p "{" then
                 String.sub p 1 (String.length p - 2)
               else
                 "\"" ^ p ^ "\"")
            splitted_path in
        let path_string =
          List.fold_left
            (fun s p ->
               if s = "" then p else s ^ "; " ^ p)
            ""
            path_list in
        lift_io $
          Format.fprintf formatter
            "@[<hov 2>let full_url =@ GapiUtils.add_path_to_url@ [%s]@ base_url@ in@]@\n"
            path_string;

        let request_parameter = methd.Method.request in
        request_module <-- State.find_inner_schema_module
                             rest_method.RestMethod.request.RefData._ref;

        (* Get etag *)
        let is_etag_present =
          Option.map_default
            (fun { Field.field_type; _ } ->
               match field_type.ComplexType.data_type with
                   ComplexType.Object properties ->
                     List.exists (fun (id, _) -> id = "etag") properties
                 | _ ->
                     failwith "Only Objects are supported looking for etag field"
            )
            false
            request_parameter in

        lift_io (
          if is_etag_present then begin
            Format.fprintf formatter "@[<hov 2>let etag =@ GapiUtils.etag_option %s.%s.etag@ in@]@\n"
              (request_parameter |. GapiLens.option_get |. Field.ocaml_name)
              (request_module |. GapiLens.option_get |. InnerSchemaModule.ocaml_name)
          end;
          (* Build query parameters *)
          Format.fprintf formatter
            "@[<hov 2>let params =@ %s.merge_parameters@ ?standard_parameters:parameters@ "
            parameters_module_name;
          List.iter
            (fun (id, json_schema) ->
               let parameter = methd |. Method.get_parameter_lens id in
                 if json_schema.JsonSchema.location = "query" then
                   Format.fprintf formatter "%s%s@ "
                     (if json_schema.JsonSchema.required then "~" else "?")
                     parameter.Field.ocaml_name)
            rest_method.RestMethod.parameters;
          Format.fprintf formatter
            "()@ in@]@\n@[<hov 2>let query_parameters =@ Option.map@ %s.to_key_value_list@ params@ in@]@\n"
            parameters_module_name);

        (* Invoke service function *)
        lift_io (
          Format.fprintf formatter
            "@[<hov 2>GapiService.%s@ ?query_parameters@ "
            function_to_call;
          if is_etag_present then begin
            Format.fprintf formatter "?etag@ ";
          end;
          if Option.is_some request_parameter then begin
            Format.fprintf formatter
              "~data_to_post:(GapiJson.render_json %s.to_data_model)@ ~data:%s@ "
              (request_module |. GapiLens.option_get |. InnerSchemaModule.ocaml_name)
              (request_parameter |. GapiLens.option_get |. Field.ocaml_name);
          end else if rest_method.RestMethod.httpMethod = "POST" then begin
            Format.fprintf formatter
              "~data:%s.empty@ "
              (request_module |. GapiLens.option_get |. InnerSchemaModule.ocaml_name)
          end);
        response_module <-- State.find_inner_schema_module
                              rest_method.RestMethod.response.RefData._ref;
        lift_io (
          Format.fprintf formatter "full_url@ ";
          if Option.is_some response_module then begin
            Format.fprintf formatter
              "(GapiJson.parse_json_response %s.of_data_model)@ "
              (response_module |. GapiLens.option_get |. InnerSchemaModule.ocaml_name)
          end else begin
            Format.fprintf formatter
              "GapiRequest.parse_empty_response@ "
          end;
          Format.fprintf formatter "session@ @]@\n")
  in

  let render_parameters formatter methd =
    let render_optional_parameters with_default render =
      let optional_parameters =
        let test_default =
          if with_default then (fun d -> d <> "") else (fun d -> d = "")
        in
          List.filter
            (fun (_, param) -> not param.JsonSchema.required &&
                               test_default param.JsonSchema.default)
            rest_method.RestMethod.parameters
      in
        List.iter
          (fun (id, _) ->
             let parameter = methd |. Method.get_parameter_lens id in
               render parameter)
          optional_parameters
    in
      (* Optional parameters with default *)
      render_optional_parameters true
        (fun { Field.ocaml_name; default; _ } ->
           Format.fprintf formatter "?(%s = %S)@ "
             ocaml_name
             default);
      (* Optional parameters without default *)
      render_optional_parameters false
        (fun parameter ->
           Format.fprintf formatter "?%s@ " parameter.Field.ocaml_name);
      (* Required parameters *)
      List.iter
        (fun id ->
           let parameter = methd |. Method.get_parameter_lens id in
             Format.fprintf formatter "~%s@ " parameter.Field.ocaml_name)
        rest_method.RestMethod.parameterOrder;
      (* Request parameter *)
      if Option.is_some methd.Method.request then begin
        Format.fprintf formatter "%s@ "
          (methd.Method.request |. GapiLens.option_get |. Field.ocaml_name);
      end;
      Format.fprintf formatter "session =@]@\n"
  in

  let method_lens = inner_module_lens
    |-- InnerServiceModule.get_method_lens id
  in
    perform
      type_table <-- GapiLens.get_state State.type_table;
      let methd = Method.create id
                    rest_method.RestMethod.parameters
                    rest_method.RestMethod.description
                    rest_method.RestMethod.request.RefData._ref
                    rest_method.RestMethod.response.RefData._ref
                    type_table in
      method_lens ^=! methd;

      base_path <-- GapiLens.get_state
                      (State.service |-- RestDescription.basePath);
      lift_io $
        Format.fprintf formatter
          "@[<v 2>let @[<hv 2>%s@ ?(base_url = \"%s\")@ ?parameters@ "
          methd.Method.ocaml_name
          (google_endpoint ^ base_path);

      lift_io $ render_parameters formatter methd;

      generate_method_body methd;

      lift_io $ Format.fprintf formatter "@]@\n"

let build_service_inner_module file_lens (resource_id, resource) =
  let module_name =
    OCamlName.get_ocaml_name ModuleName (resource_id ^ "Resource") in
  let inner_module =
    InnerServiceModule.create resource_id module_name in
  let inner_module_lens =
    State.get_service_module
      |-- ServiceModule.get_inner_module_lens module_name
  in
    perform
      (* Insert inner module *)
      inner_module_lens ^=! inner_module;

      file <-- GapiLens.get_state file_lens;

      let formatter = file.File.formatter in
      lift_io $
        Format.fprintf formatter "module %s =@\n@[<v 2>struct@," module_name;
      mapM_
        (fun rest_method ->
           generate_rest_method formatter inner_module_lens rest_method)
        resource.RestResource.methods;
      lift_io $ Format.fprintf formatter "@]@\nend@\n@\n"

(* END Generate service inner modules *)

(* Generate main modules *)

let build_module file_type generate_body =
  let file_lens = State.get_file_lens file_type in
  let formatter_lens = file_lens |-- File.formatter in
    perform
      service <-- GapiLens.get_state State.service;
      let service_name = service.RestDescription.name in
      let service_version = service.RestDescription.version in
      let file =
        File.create service_name service_version !output_path file_type in
      file_lens ^=! file;
      lift_io $
        Printf.printf "Building %s %s (%s)...%!"
          (string_of_file_type file_type)
          file.File.module_name
          file.File.file_name;
      let (oc, formatter) = open_file file.File.file_name in
      formatter_lens ^=! formatter;
      lift_io $ Format.fprintf formatter
        "(* Warning! This file is generated. Modify at your own risk. *)@\n@\n";
      generate_body file_lens;
      return (close_file oc formatter; print_endline "Done")

let build_schema_module =
  let generate_body file_lens =
    perform
      file <-- GapiLens.get_state file_lens;

      (* Insert schema module *)
      let schema_module =
        SchemaModule.create file.File.module_name in
      State.get_schema_module_lens ^=! schema_module;

      sorted_types <-- GapiLens.get_state State.sorted_types;
      mapM_
        (fun complex_type ->
           build_schema_inner_module file_lens complex_type)
        sorted_types;
  in
    build_module SchemaModule generate_body

let build_service_module =
  let generate_scope formatter (value, scope) =
    perform
      (* Gets the string following the last dot in scope URL (e.g.
       * 'https://www.googleapis.com/auth/tasks.readonly' -> readonly)
       *)
      let suffix =
        let last_dot_position = String.rindex value '.' in
        let last_slash_position = String.rindex value '/' in
          if last_slash_position > last_dot_position then
            ""
          else
            "_" ^ (Str.string_after value (last_dot_position + 1))
         in
      let scope_id = "scope" ^ suffix in
      lift_io $
        Format.fprintf formatter "let %s = \"%s\"@\n@\n" scope_id value;
      let scope_lens = State.get_service_module
        |-- ServiceModule.get_scope_lens scope_id in
      scope_lens ^=! scope.ScopesData.description;
  in

  let module FieldSet =
  struct
    include Set.Make(struct
                       type t = string * Field.t

                       let compare (id1, _) (id2, _) = compare id1 id2
                     end)

    let add_parameters_list xs s =
      List.fold_left
        (fun s' (id, parameter) ->
           let complex_type = ComplexType.create parameter in
           let field = Field.create (id, complex_type) in
             add (id, field) s')
        s
        xs

  end in

  let filter_parameters service cond =
    List.fold_left
      (fun qp (_, resource) ->
         let parameters =
           let open GapiMonad.ListM in
             perform
               rest_method <-- resource
                 |. RestResource.methods |. GapiLens.list_map GapiLens.second;
               parameter <-- rest_method
                 |. RestMethod.parameters;
               let json_schema = snd parameter in
               guard (cond json_schema);
               return parameter;
         in
           FieldSet.add_parameters_list parameters qp
      )
      FieldSet.empty
      service.RestDescription.resources
  in

  let get_enum_parameters_set service =
    filter_parameters service
      (fun json_schema ->
         json_schema.JsonSchema.enum != [])
  in

  let generate_enum_module formatter (id, { Field.field_type; _ }) =
    let enum_module_lens =
      State.get_service_module |-- ServiceModule.get_enum_lens id in
    let scalar =
      match field_type.ComplexType.data_type with
          ComplexType.Scalar s -> s
        | _ -> failwith "Complex type not supported in generate_enum_module" in
    let enum_module = EnumModule.create id
                        scalar.ScalarType.enum
                        scalar.ScalarType.enumDescriptions
    in
      perform
        enum_module_lens ^=! enum_module;

        lift_io (
          Format.fprintf formatter
            "module %s =@\n@[<v 2>struct@,@[<v 2>type t =@,| Default@,"
            enum_module.EnumModule.ocaml_name;
          List.iter
            (fun (_, { EnumModule.constructor; _ }) ->
               Format.fprintf formatter
                 "| %s@,"
                 constructor)
            enum_module.EnumModule.values;
          Format.fprintf formatter "@]@\n@[<v 2>let to_string = function@,| Default -> \"\"@,";
          List.iter
            (fun (_, { EnumModule.constructor; value; _ }) ->
               Format.fprintf formatter
                 "| %s -> \"%s\"@,"
                 constructor value)
            enum_module.EnumModule.values;
          Format.fprintf formatter "@]@\n@[<v 2>let of_string = function@,| \"\" -> Default@,";
          List.iter
            (fun (_, { EnumModule.constructor; value; _ }) ->
               Format.fprintf formatter
                 "| \"%s\" -> %s@,"
                 value constructor)
            enum_module.EnumModule.values;
          Format.fprintf formatter
            "| s -> failwith (\"Unexpected value for %s:\" ^ s)@]@]@\n@\nend@\n@\n"
            enum_module.EnumModule.ocaml_name;
        )

  in

  let generate_enum_modules formatter =
    perform
      service <-- GapiLens.get_state State.service;

      let parameters = get_enum_parameters_set service in
      mapM_
        (fun parameter ->
           generate_enum_module formatter parameter)
        (FieldSet.elements parameters);
  in

  let get_query_parameters_set service =
    filter_parameters service
      (fun json_schema ->
         json_schema.JsonSchema.location = "query")
  in

  let render_type_t formatter parameters service_name =
    Format.fprintf formatter
      "@[<v 2>type t = {@,(* Standard query parameters *)@,fields : string;@,prettyPrint : bool;@,quotaUser : string;@,userIp : string;@,(* %s-specific query parameters *)@,"
      service_name;
    FieldSet.iter
      (fun (id, field) ->
         Format.fprintf formatter
           "%s : %s;@,"
           field.Field.ocaml_name
           field.Field.ocaml_type)
      parameters;
    Format.fprintf formatter "@]@,}@,"
  in

  let render_default formatter parameters =
    Format.fprintf formatter "@,@[<v 2>let default = {@,fields = \"\";@,prettyPrint = true;@,quotaUser = \"\";@,userIp = \"\";@,";
    FieldSet.iter
      (fun (id, { Field.ocaml_name; default; _ }) ->
         Format.fprintf formatter
           "%s = %s;@,"
           ocaml_name
           default)
      parameters;
    Format.fprintf formatter "@]@,}@,"
  in

  let render_to_key_value_list formatter parameters =
    Format.fprintf formatter "@,@[<v 2>let to_key_value_list qp =@,@[<hov 2>let param get_value to_string name =@,GapiService.build_param default qp get_value to_string name in@] [@,param (fun p -> p.fields) Std.identity \"fields\";@,param (fun p -> p.prettyPrint) string_of_bool \"prettyPrint\";@,param (fun p -> p.quotaUser) Std.identity \"quotaUser\";@,param (fun p -> p.userIp) Std.identity \"userIp\";@,";
    FieldSet.iter
      (fun (id, { Field.original_name; ocaml_name; to_string_function; _ }) ->
         Format.fprintf formatter
           "param (fun p -> p.%s) %s \"%s\";@,"
           ocaml_name
           to_string_function
           original_name)
      parameters;
    Format.fprintf formatter "@]@,] |> List.concat@,"
  in

  let render_merge_parameters formatter parameters =
    Format.fprintf formatter "@,@[<v 2>@[<hv 4>let merge_parameters@,?(standard_parameters = GapiService.StandardParameters.default)@,";
    FieldSet.iter
      (fun (id, field) ->
         Format.fprintf formatter
           "?(%s = default.%s)@,"
           field.Field.ocaml_name
           field.Field.ocaml_name)
      parameters;
    Format.fprintf formatter "() =@]@,@[<v 2>let parameters = {@,fields = standard_parameters.GapiService.StandardParameters.fields;@,prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;@,quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;@,userIp = standard_parameters.GapiService.StandardParameters.userIp;@,";
    FieldSet.iter
      (fun (id, field) ->
         Format.fprintf formatter
           "%s;@,"
           field.Field.ocaml_name)
      parameters;
    Format.fprintf formatter "@]@,} in@,if parameters = default then None else Some parameters@]@,"
    
  in

  let generate_parameters_module formatter =
    perform
      service <-- GapiLens.get_state State.service;
      let service_name = service.RestDescription.name in
      let module_name =
        OCamlName.get_ocaml_name ModuleName (service_name ^ "Parameters") in
      State.parameters_module_name ^=! module_name;
      lift_io (
        Format.fprintf formatter "module %s =@\n@[<v 2>struct@," module_name;
        let parameters = get_query_parameters_set service in
          render_type_t formatter parameters service_name;
          render_default formatter parameters;
          render_to_key_value_list formatter parameters;
          render_merge_parameters formatter parameters;
          Format.fprintf formatter "@]@\nend@\n@\n")
  in

  let generate_header file_lens =
    perform
      formatter <-- GapiLens.get_state (file_lens |-- File.formatter);

      schema_module_name <-- GapiLens.get_state
                               (State.get_file_lens SchemaModule
                                  |-- File.module_name);
      lift_io $
        Format.fprintf formatter
        "open GapiUtils.Infix@\nopen %s@\n@\n" schema_module_name;

      scopes <-- GapiLens.get_state (State.service
                                       |-- RestDescription.auth
                                       |-- Oauth2Data.scopes);
      mapM_ (generate_scope formatter) scopes;

      generate_enum_modules formatter;

      generate_parameters_module formatter;
  in

  let generate_body file_lens =
    perform
      file <-- GapiLens.get_state file_lens;

      (* Insert service module *)
      let service_module =
        ServiceModule.create file.File.module_name in
      State.get_service_module ^=! service_module;

      generate_header file_lens;

      resources <-- GapiLens.get_state (State.service
                                          |-- RestDescription.resources);
      mapM_
        (fun resource ->
           build_service_inner_module file_lens resource)
        resources;
  in
    build_module ServiceModule generate_body

(* END Generate main modules *)

(* Generate schema module interface *)

let generate_schema_module_signature formatter schema_module =
  let fields = schema_module
    |. InnerSchemaModule.record
    |. GapiLens.option_get
    |. Record.fields
  in
    perform
      is_referenced <-- State.is_type_referenced
                          schema_module.InnerSchemaModule.original_name;
      lift_io (
        (* Type t *)
        Format.fprintf formatter
          "module %s :@\n@[<v 2>sig@,@[<v 2>type t = {@,"
          schema_module.InnerSchemaModule.ocaml_name;
        List.iter
          (fun (_, { Field.ocaml_name; ocaml_type; field_type; _ }) ->
             Format.fprintf formatter
               "%s : %s;@,(** %s *)@,"
               ocaml_name
               ocaml_type
               (ComplexType.get_description field_type))
          fields;
        Format.fprintf formatter
          "@]@,}@\n@\n";

        (* Lenses *)
        List.iter
          (fun (_, { Field.ocaml_name; ocaml_type; field_type; _ }) ->
             Format.fprintf formatter
               "val %s : (t, %s) GapiLens.t@,"
               ocaml_name
               ocaml_type)
          fields;

        if is_referenced then begin
          (* TODO: review render return type (list list) *)
          (* empty, render, parse *)
          Format.fprintf formatter
            "@,val empty : t@,@,val render : t -> GapiJson.json_data_model list list@,@,val parse : t -> GapiJson.json_data_model -> t@,";
        end else begin
          (* empty, render, parse *)
          Format.fprintf formatter
            "@,val empty : t@,@,val render : t -> GapiJson.json_data_model list@,@,val parse : t -> GapiJson.json_data_model -> t@,";

          (* of_data_model, to_data_model *)
          Format.fprintf formatter
            "@,val to_data_model : t -> GapiJson.json_data_model@,@,val of_data_model : GapiJson.json_data_model -> t@,";
        end;
        (* module end *)
        Format.fprintf formatter
          "@]\nend@\n@\n")

let build_schema_module_interface =
  let generate_body file_lens =
    perform
      formatter <-- GapiLens.get_state (file_lens
                                          |-- File.formatter);
      service <-- GapiLens.get_state State.service;

      (* Generate opening comment *)
      lift_io $
        Format.fprintf formatter
"@[<hov 2>(** Data definition for %s (%s).@\n@\nFor@ more@ information@ about@ this@ data@ model,@ see@ the@ {{:%s}API Documentation}.@\n*)@]@\n@\n"
          service.RestDescription.title
          service.RestDescription.version
          service.RestDescription.documentationLink;

      (* Schema modules are stored in reverse order *)
      schema_modules <-- GapiLens.get_state
                           (State.get_schema_module_lens
                              |-- SchemaModule.inner_modules);
      mapM_
        (fun (_, schema_module) ->
           generate_schema_module_signature formatter schema_module)
        (List.rev schema_modules);

  in
    build_module SchemaModuleInterface generate_body

(* END Generate schema module interface *)

(* Generate service module interface *)

let generate_service_module_signature formatter service_module =
  let render_method formatter methd =
    let request_ref =
      Option.map_default
        (fun f -> f.Field.field_type.ComplexType.id)
        "" methd.Method.request in
    let response_ref =
      Option.map_default
        (fun f -> f.Field.field_type.ComplexType.id)
        "" methd.Method.response
    in
      perform
        base_path <-- GapiLens.get_state
                        (State.service |-- RestDescription.basePath);
        schema_module <-- GapiLens.get_state State.get_schema_module_lens;
        request_module <-- State.find_inner_schema_module request_ref;
        response_module <-- State.find_inner_schema_module response_ref;

        lift_io (
          (* Documentation *)
          Format.fprintf formatter
            "@[<hov 2>(** %s@\n@\n@@param base_url Service endpoint base URL (defaults to [\"%s\"]).@\n@@param parameters Optional standard parameters.@\n"
            methd.Method.description
            (google_endpoint ^ base_path);
          List.iter
            (fun (_, { Field.ocaml_name; field_type; _ }) ->
               Format.fprintf formatter
                 "@@param %s %s@\n"
                 ocaml_name
                 (ComplexType.get_description field_type))
            methd.Method.parameters;
          Format.fprintf formatter "*)@]@\n";
          (* Declaration *)
          Format.fprintf formatter
            "@[<hv 2>val %s :@ ?base_url:string ->@ ?parameters:GapiService.StandardParameters.t ->@ "
            methd.Method.ocaml_name;
          (* Parameters *)
          List.iter
            (fun (_, { Field.ocaml_name; ocaml_type; field_type; _ }) ->
               Format.fprintf formatter
                 "%s%s:%s ->@,"
                 (if ComplexType.is_required field_type then "" else "?")
                 ocaml_name
                 ocaml_type)
            methd.Method.parameters);

        lift_io (
          (* Request *)
          if Option.is_some request_module then begin
            Format.fprintf formatter "%s.%s.t ->@,"
              schema_module.SchemaModule.ocaml_name
              (request_module |. GapiLens.option_get |. InnerSchemaModule.ocaml_name);
          end;
          (* Session *)
          Format.fprintf formatter
            "GapiConversation.Session.t ->@,";
          (* Response *)
          if Option.is_some response_module then begin
            Format.fprintf formatter "%s.%s.t"
              schema_module.SchemaModule.ocaml_name
              (response_module |. GapiLens.option_get |. InnerSchemaModule.ocaml_name);
          end else begin
            Format.fprintf formatter "unit";
          end;
          Format.fprintf formatter " * GapiConversation.Session.t@]@\n@\n")
  in

  let render_scope formatter scopes =
    List.iter
      (fun (id, scope) ->
         Format.fprintf formatter
           "(** %s *)@\nval %s : string@\n"
           scope id)
      scopes
  in

  let render_enum_module formatter enum_module =
    Format.fprintf formatter
      "@\nmodule %s :@\n@[<v 2>sig@,@[<v 2>type t =@,| Default@,"
      enum_module.EnumModule.ocaml_name;
    List.iter
      (fun (_, { EnumModule.constructor; _ }) ->
         Format.fprintf formatter
           "| %s@,"
           constructor)
      enum_module.EnumModule.values;
    Format.fprintf formatter "@]@,val to_string : t -> string@,@,val of_string : string -> t@,@]@\nend@\n";
  in

  let render_enum_modules formatter enum_modules =
    List.iter
      (fun (id, enum_module) ->
         render_enum_module formatter enum_module)
      enum_modules
  in

  let methods = service_module
   |. InnerServiceModule.methods
  in
    perform
      scopes <-- GapiLens.get_state (State.get_service_module
                                       |-- ServiceModule.scopes);
      lift_io $ render_scope formatter scopes;

      enum_modules <-- GapiLens.get_state (State.get_service_module
                                             |-- ServiceModule.enums);
      lift_io $ render_enum_modules formatter enum_modules;

      lift_io $
        Format.fprintf formatter
          "@\nmodule %s :@\nsig@,@[<v 2>@,"
          service_module.InnerServiceModule.ocaml_name;
      mapM_
        (fun (_, methd) ->
           render_method formatter methd)
        methods;
      (* module end *)
      lift_io $
        Format.fprintf formatter
          "@]\nend@\n@\n"

let build_service_module_interface =
  let generate_body file_lens =
    perform
      formatter <-- GapiLens.get_state (file_lens
                                          |-- File.formatter);
      service <-- GapiLens.get_state State.service;

      (* Generate opening comment *)
      lift_io $
        Format.fprintf formatter
          "@[<hov 2>(** Service definition for %s (%s).@\n@\n%s.@\n@\nFor@ more@ information@ about@ this@ service,@ see@ the@ {{:%s}API Documentation}.@\n*)@]@\n@\n"
          service.RestDescription.title
          service.RestDescription.version
          service.RestDescription.description
          service.RestDescription.documentationLink;

      (* Schema modules are stored in reverse order *)
      service_modules <-- GapiLens.get_state
                            (State.get_service_module
                               |-- ServiceModule.inner_modules);
      mapM_
        (fun (_, service_module) ->
           generate_service_module_signature formatter service_module)
        (List.rev service_modules);

  in
    build_module ServiceModuleInterface generate_body

(* END Generate service module interface *)

(* Main program *)

let generate_code service =
  let build_all =
    perform
      State.build_type_table;
      State.build_sorted_types;
      State.build_referenced_types;
      build_schema_module;
      build_service_module;
      build_schema_module_interface;
      build_service_module_interface;
  in

  let initial_state = State.create service in
    build_all initial_state

(* Argument parsing and program entry point *)

let _ =
  let api = ref "" in
  let version = ref "" in
  let nocache = ref false in
  let usage =
    "Usage: " ^ Sys.executable_name ^ " -api <apiname> -version <apiver> [-nocache] [-nooverwrite] [-outdir <path>]" in
  let arg_specs =
    Arg.align (
      ["-api",
       Arg.Set_string api,
       "<apiname> The name of the API.";
       "-version",
       Arg.Set_string version,
       "<apiver> The version of the API.";
       "-nocache",
       Arg.Set nocache,
       " Downloads the service description, ignoring locally saved versions.";
       "-nooverwrite",
       Arg.Set no_overwrite,
       " Refuse to overwrite previously generated files.";
       "-outdir",
       Arg.Set_string output_path,
       "<path> Place the generated files into <path> (defaults to: \"./generated/\")."
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

(* END Main program *)

