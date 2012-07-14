open GapiUtils.Infix
open GapiLens.Infix
open GapiLens.StateInfix
open GapiDiscoveryV1Model
open ServiceGeneratorState

(* Configuration *)

let output_path = ref "generated/"
let no_overwrite = ref false

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
             GapiDiscoveryV1Service.ApisResource.getRest
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

  let render_render_function formatter fields =
    let rec render_curried_function formatter
          (name, prefix, field_type) =
      match field_type.ComplexType.data_type with
          ComplexType.Scalar scalar ->
            begin match scalar.ScalarType.data_type with
                ScalarType.String ->
                  Format.fprintf formatter
                    "GapiJson.render_string_value"
              | ScalarType.Boolean ->
                  Format.fprintf formatter
                    "GapiJson.render_bool_value"
              | ScalarType.Integer ->
                  Format.fprintf formatter
                    "GapiJson.render_int_value"
              | ScalarType.Int64 ->
                  Format.fprintf formatter
                    "GapiJson.render_int64_value"
              | ScalarType.Float ->
                  Format.fprintf formatter
                    "GapiJson.render_float_value"
              | ScalarType.DateTime
              | ScalarType.Date ->
                  Format.fprintf formatter
                    "GapiJson.render_date_value"
            end;
            Format.fprintf formatter " %s" name
        | ComplexType.Array { ComplexType.data_type =
                                ComplexType.Reference _; _ }
        | ComplexType.Array { ComplexType.data_type =
                                ComplexType.AnonymousObject _; _ } ->
            Format.fprintf formatter
              "GapiJson.render_array %s %srender"
              name prefix
        | ComplexType.Array inner_type ->
            Format.fprintf formatter
              "GapiJson.render_array %s (%a)"
              name
              render_curried_function ("\"\"", prefix, inner_type)
        | ComplexType.Dictionary
            ({ ComplexType.data_type = ComplexType.Reference _; _ }
               as inner_type)
        | ComplexType.Dictionary
            ({ ComplexType.data_type = ComplexType.AnonymousObject _; _ }
               as inner_type) ->
            Format.fprintf formatter
              "GapiJson.render_collection %s GapiJson.Object (fun (id, v) -> %a v)"
              name
              render_curried_function ("id", prefix, inner_type)
        | ComplexType.Dictionary inner_type ->
            Format.fprintf formatter
              "GapiJson.render_collection %s GapiJson.Object (fun (id, v) -> %a v)"
              name
              render_curried_function ("id", prefix, inner_type)
        | ComplexType.Reference _
        | ComplexType.AnonymousObject _ ->
            Format.fprintf formatter
              "(fun v -> GapiJson.render_object %s (%srender_content v))"
              name prefix
        | _ ->
            failwith "Unexpected complex type in render_curried_function"
    in
      Format.fprintf formatter
        "@,@[<v 2>let rec render_content x = @,@[<v 2> [@,";
      List.iter
        (fun { Field.ocaml_name;
               original_name;
               ocaml_type_module;
               field_type;
               is_recursive;
               is_option; _ } ->
           let name = "\"" ^ original_name ^ "\"" in
           let prefix =
             if is_recursive || is_option then ""
             else ocaml_type_module ^ "."
           in
             match field_type.ComplexType.data_type with
                 ComplexType.Reference _
               | ComplexType.AnonymousObject _ when is_option ->
                   Format.fprintf formatter
                     "Option.map_default (fun v -> GapiJson.render_object \"%s\" (render_content v)) [] x.%s;@,"
                     original_name
                     ocaml_name;
               | _ ->
                   Format.fprintf formatter
                     "%a x.%s;@,"
                     render_curried_function (name, prefix, field_type)
                     ocaml_name)
        fields;
      Format.fprintf formatter "@]@,@]]@,";
      Format.fprintf formatter
        "@[<v 2>and render x = @,@[<v 2>GapiJson.render_object \"\" (render_content x)@]@]@,"
  in

  let render_parse_function formatter fields container_name module_name =
    let render_pattern formatter (name, field_type) =
      match field_type.ComplexType.data_type with
          ComplexType.Scalar scalar ->
            Format.fprintf formatter
              "| @[<hv 2>GapiCore.AnnotatedTree.Leaf@ ({ GapiJson.name = %s; data_type = GapiJson.Scalar },@ Json_type.%s v) ->@]@,"
              name (ScalarType.get_json_type scalar.ScalarType.data_type)
        | ComplexType.Array _ ->
            Format.fprintf formatter
              "| @[<hv 2>GapiCore.AnnotatedTree.Node@ ({ GapiJson.name = %s; data_type = GapiJson.Array },@ cs) ->@]@,"
              name
        | ComplexType.Reference _
        | ComplexType.AnonymousObject _
        | ComplexType.Dictionary _ ->
            Format.fprintf formatter
              "| @[<hv 2>GapiCore.AnnotatedTree.Node@ ({ GapiJson.name = %s; data_type = GapiJson.Object },@ cs) ->@]@,"
              name
        | _ ->
            failwith "Unexpected complex type in render_pattern"
    in

    let render_empty formatter (prefix, field_type) =
      match field_type.ComplexType.data_type with
          ComplexType.Reference _
        | ComplexType.AnonymousObject _ ->
            Format.fprintf formatter "%sempty" prefix
        | ComplexType.Array _
        | ComplexType.Dictionary _ ->
            Format.fprintf formatter "[]"
        | ComplexType.Scalar scalar ->
            Format.fprintf formatter "%s" scalar.ScalarType.empty_value
        | _ ->
            failwith "Unexpected complex type in render_empty"
    in

    let rec render_nested_parse formatter (name, prefix, field_type) =
      match field_type.ComplexType.data_type with
          ComplexType.Reference _
        | ComplexType.AnonymousObject _ ->
            Format.fprintf formatter "%sparse" prefix
        | ComplexType.Array inner_type ->
            Format.fprintf formatter
              "@[<hv 2>(fun x' -> function@,%a@[<hv 2>| e ->@ GapiJson.unexpected \"%s.%s.parse.parse_collection\" e x')@]@]"
              render_parse_element (name, prefix, inner_type, "v")
              container_name
              module_name
        | ComplexType.Dictionary inner_type ->
            Format.fprintf formatter
              "@[<hv 2>(fun x' -> function@,%a@[<hv 2>| e ->@ GapiJson.unexpected \"%s.%s.parse.parse_dictionary\" e x')@]@]"
              render_parse_element ("n", prefix, inner_type, "(n, v)")
              container_name
              module_name
        | ComplexType.Scalar scalar ->
            Format.fprintf formatter
              "@[<hv 2>(fun x' -> function@,%a@[<hv 2>| e ->@ GapiJson.unexpected \"%s.%s.parse.parse_scalar\" e x')@]@]"
              render_parse_element (name, prefix, field_type, "v")
              container_name
              module_name
        | _ ->
            failwith "Unexpected complex type in render_nested_parse"

    and render_parse_element formatter (name, prefix, field_type, cont) =
      match field_type.ComplexType.data_type with
          ComplexType.Scalar scalar ->
            Format.fprintf formatter
              "@[<v 2>%a%s@]@,"
              render_pattern (name, field_type)
              cont
        | ComplexType.Array inner_type ->
            Format.fprintf formatter
              "@[<v 2>%a@[<hv 2>GapiJson.parse_collection@ %a@ %a@ (fun v -> %s)@ cs@]@]@,"
              render_pattern (name, field_type)
              render_nested_parse ("\"\"", prefix, field_type)
              render_empty (prefix, inner_type)
              cont
        | ComplexType.Dictionary inner_type ->
            Format.fprintf formatter
              "@[<v 2>%a@[<hv 2>GapiJson.parse_collection@ %a@ (\"\", %a)@ (fun v -> %s)@ cs@]@]@,"
              render_pattern (name, field_type)
              render_nested_parse (name, prefix, field_type)
              render_empty (prefix, inner_type)
              cont
        | ComplexType.Reference _
        | ComplexType.AnonymousObject _ ->
            Format.fprintf formatter
              "@[<v 2>%a@[<hv 2>GapiJson.parse_children@ %sparse@ %sempty@ (fun v -> %s)@ cs@]@]@,"
              render_pattern (name, field_type)
              prefix
              prefix
              cont
        | _ ->
            failwith "Unexpected complex type in render_parse_element"
    in

    Format.fprintf formatter "@,@[<v 2>let rec parse x = function@,";
    List.iter
      (fun { Field.ocaml_name;
             original_name;
             ocaml_type_module;
             field_type;
             is_recursive;
             is_option; _ } ->
         let name = "\"" ^ original_name ^ "\"" in
         let prefix =
           if is_recursive || is_option then ""
           else ocaml_type_module ^ "."
         in
           match field_type.ComplexType.data_type with
             | ComplexType.Scalar scalar ->
                 render_parse_element formatter
                   (name,
                    prefix,
                    field_type,
                    "{ x with " ^ ocaml_name ^ " = "
                    ^ (ScalarType.get_convert_function
                         scalar.ScalarType.data_type) ^ "v }");
                 if scalar.ScalarType.data_type = ScalarType.Float then begin
                   (* Float type includes integral literals *)
                   (* TODO: remove when upgrading to Yojson *)
                   render_parse_element formatter
                     (name,
                      prefix,
                      field_type
                        |> ComplexType.data_type
                        ^= ComplexType.Scalar (
                          scalar
                            |> ScalarType.data_type
                            ^= ScalarType.Integer),
                      "{ x with " ^ ocaml_name ^ " = float_of_int v }");
                 end;
             | _ when is_option ->
                 render_parse_element formatter
                   (name,
                    prefix,
                    field_type,
                    "{ x with " ^ ocaml_name ^ " = Some v }")
             | ComplexType.Reference _
             | ComplexType.AnonymousObject _
             | ComplexType.Array _
             | ComplexType.Dictionary _ ->
                 render_parse_element formatter
                   (name,
                    prefix,
                    field_type,
                    "{ x with " ^ ocaml_name ^ " = v }")
             | _ ->
                 failwith "Unexpected complex type rendering parse function")
        fields;
      Format.fprintf formatter
        "@[<v 2>| GapiCore.AnnotatedTree.Node@,({ GapiJson.name = \"\"; data_type = GapiJson.Object },@,cs) ->@,@[<hv 2>GapiJson.parse_children@ parse@ empty@ (fun x -> x)@ cs@]@]@,";
      Format.fprintf formatter
        "@[<v 2>| e ->@,GapiJson.unexpected \"%s.%s.parse\" e x@]@]"
        container_name
        module_name;
  in

  let render_footer formatter is_nested =
    (* Render footer (to_data_model and of_data_model) *)
    if not is_nested then begin
      Format.fprintf formatter
        "@,@,let to_data_model = GapiJson.render_root render@,@,let of_data_model = GapiJson.parse_root parse empty";
    end;
    Format.fprintf formatter "@,";
    Format.fprintf formatter "@]@\nend@\n@\n"
  in

  let rec render_inner_module
        formatter container_name module_name is_nested inner_module_lens =
    perform
      type_t <-- GapiLens.get_state (inner_module_lens
                                       |-- InnerSchemaModule.type_t);

      inner_module <-- GapiLens.get_state inner_module_lens;

      lift_io (
        match type_t with
            InnerSchemaModule.Alias alias_name ->
              Format.fprintf formatter
                "module %s = %s@\n\n"
                inner_module.InnerSchemaModule.ocaml_name
                alias_name
          | _ ->
              Format.fprintf formatter
                "module %s =@\n@[<v 2>struct@,"
                inner_module.InnerSchemaModule.ocaml_name);

      let inner_modules = inner_module.InnerSchemaModule.inner_modules in
      mapM_
        (fun (id, inner_module) ->
           render_inner_module formatter container_name id true
             (inner_module_lens
                |-- InnerSchemaModule.get_inner_module_lens id))
        inner_modules;

      lift_io (
        match type_t with
            InnerSchemaModule.Record record ->
              let fields = record |. Record.field_list in
                render_type_t formatter fields;
                render_lenses formatter fields;
                render_empty formatter fields;
                render_render_function formatter fields;
                render_parse_function formatter fields container_name module_name;
                render_footer formatter is_nested
          | InnerSchemaModule.List inner_module ->
              (* type t *)
              Format.fprintf formatter "type t = %s.t list@\n@\n"
                inner_module.InnerSchemaModule.ocaml_name;

              (* empty *)
              Format.fprintf formatter "let empty = []@\n@\n";

              (* render *)
              Format.fprintf formatter
                "@[<v 2>let rec render x = @,GapiJson.render_array \"\" %s.render x@]@\n@\n"
                inner_module.InnerSchemaModule.ocaml_name;

              (* parse *)
              Format.fprintf formatter "@[<v 2>let rec parse x = function@,";
              Format.fprintf formatter
                "@[<v 2>| @[<hv 2>GapiCore.AnnotatedTree.Node@ ({ GapiJson.name = \"\"; data_type = GapiJson.Array },@ cs) ->@]@,@[<hv 2>GapiJson.parse_collection@ %s.parse@ %s.empty@ (fun xs -> xs )@ cs@]@]@,"
                inner_module.InnerSchemaModule.ocaml_name
                inner_module.InnerSchemaModule.ocaml_name;
              Format.fprintf formatter
                "@[<v 2>| e ->@,GapiJson.unexpected \"%s.%s.parse\" e x@]@]"
                container_name
                module_name;

              (* footer *)
              render_footer formatter false
          | _ -> ());

  in

  let module_name =
    OCamlName.get_ocaml_name ModuleName complex_type.ComplexType.id in
  let inner_module =
    InnerSchemaModule.create complex_type module_name in
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
      render_inner_module
        formatter container_name module_name false inner_module_lens

(* END Generate schema inner modules *)

(* Generate service inner modules *)

module FieldSet =
struct
  include Set.Make(struct
                     type t = string * Field.t

                     let compare (id1, _) (id2, _) = compare id1 id2
                   end)

  let add_parameters_list xs s =
    List.fold_left
      (fun s' (id, parameter) ->
         let complex_type = ComplexType.create id parameter in
         let field = Field.create (id, complex_type) in
           add (id, field) s')
      s
      xs

end

let generate_enum_module formatter
      inner_module_lens (id, { Field.field_type; _ }) =
  let enum_module_lens =
    inner_module_lens |-- InnerServiceModule.get_enum_lens id in
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
          enum_module.EnumModule.ocaml_name)

let filter_parameters source methods_lens cond =
  let parameters =
    let open GapiMonad.ListM in
      perform
        rest_method <-- source
          |. methods_lens |. GapiLens.list_map GapiLens.second;
        parameter <-- rest_method |. RestMethod.parameters;
        let json_schema = snd parameter in
        guard (cond json_schema);
        return parameter;
  in
    FieldSet.add_parameters_list parameters FieldSet.empty

let filter_resource_parameters resource cond =
  filter_parameters resource RestResource.methods cond

let generate_enum_modules
      formatter inner_module_lens filter source =
  let enum_parameters_set =
    filter source
      (fun json_schema -> json_schema.JsonSchema.enum != [])
  in
    perform
      mapM_
        (fun parameter ->
           generate_enum_module formatter inner_module_lens parameter)
        (FieldSet.elements enum_parameters_set)

let generate_parameters_module filter_parameters formatter
      inner_module_lens resource_id resource =
  let render_type_t formatter parameters =
    Format.fprintf formatter
      "@[<v 2>type t = {@,(* Standard query parameters *)@,fields : string;@,prettyPrint : bool;@,quotaUser : string;@,userIp : string;@,key : string;@,(* %s-specific query parameters *)@,"
      resource_id;
    FieldSet.iter
      (fun (id, { Field.ocaml_name;
                  ocaml_type;
                  field_type; _ }) ->
         let list_type =
           if ComplexType.is_repeated field_type then " list"
           else ""
         in
           Format.fprintf formatter
             "%s : %s%s;@,"
             ocaml_name
             ocaml_type
             list_type)
      parameters;
    Format.fprintf formatter "@]@,}@,"
  in

  let render_default formatter parameters =
    Format.fprintf formatter "@,@[<v 2>let default = {@,fields = \"\";@,prettyPrint = true;@,quotaUser = \"\";@,userIp = \"\";@,key = \"\";@,";
    FieldSet.iter
      (fun (id, { Field.ocaml_name;
                  default;
                  field_type; _ }) ->
         if ComplexType.is_repeated field_type then begin
           Format.fprintf formatter
             "%s = [];@,"
             ocaml_name
         end else begin
           Format.fprintf formatter
             "%s = %s;@,"
             ocaml_name
             default
         end)
      parameters;
    Format.fprintf formatter "@]@,}@,"
  in

  let render_to_key_value_list formatter parameters =
    Format.fprintf formatter "@,@[<v 2>let to_key_value_list qp =@,@[<hov 2>let param get_value to_string name =@,GapiService.build_param default qp get_value to_string name in@] [@,param (fun p -> p.fields) (fun x -> x) \"fields\";@,param (fun p -> p.prettyPrint) string_of_bool \"prettyPrint\";@,param (fun p -> p.quotaUser) (fun x -> x) \"quotaUser\";@,param (fun p -> p.userIp) (fun x -> x) \"userIp\";@,param (fun p -> p.key) (fun x -> x) \"key\";@,";
    FieldSet.iter
      (fun (id, { Field.original_name;
                  ocaml_name;
                  to_string_function;
                  field_type; _ }) ->
         let build_param_fun =
           if ComplexType.is_repeated field_type then
             "GapiService.build_params qp"
           else "param"
         in
           Format.fprintf formatter
             "%s (fun p -> p.%s) %s \"%s\";@,"
             build_param_fun
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
    Format.fprintf formatter "() =@]@,@[<v 2>let parameters = {@,fields = standard_parameters.GapiService.StandardParameters.fields;@,prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;@,quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;@,userIp = standard_parameters.GapiService.StandardParameters.userIp;@,key = standard_parameters.GapiService.StandardParameters.key;@,";
    FieldSet.iter
      (fun (id, field) ->
         Format.fprintf formatter
           "%s;@,"
           field.Field.ocaml_name)
      parameters;
    Format.fprintf formatter "@]@,} in@,if parameters = default then None else Some parameters@]@,"
  in

  let parameters =
    filter_parameters resource
      (fun json_schema -> json_schema.JsonSchema.location = "query") in
  let module_name =
    if parameters = FieldSet.empty then
      "GapiService.StandardParameters"
    else
      OCamlName.get_ocaml_name ModuleName (resource_id ^ "Parameters")
  in
    perform
      (inner_module_lens
         |-- InnerServiceModule.parameters_module_name) ^=! module_name;

      lift_io (
        if parameters <> FieldSet.empty then begin
          Format.fprintf formatter "module %s =@\n@[<v 2>struct@," module_name;
          render_type_t formatter parameters;
          render_default formatter parameters;
          render_to_key_value_list formatter parameters;
          render_merge_parameters formatter parameters;
          Format.fprintf formatter "@]@\nend@\n@\n"
        end)

let generate_rest_method formatter inner_module_lens (id, rest_method) =
  let generate_method_body methd =
      perform
        parameters_module_name <--
          GapiLens.get_state (inner_module_lens
                                |-- InnerServiceModule.parameters_module_name);

        (* Build complete url *)
        let build_path_to_add path =
          let splitted_path =
            ExtString.String.nsplit path "/"
          in
            List.map
              (fun p ->
                 if ExtString.String.starts_with p "{" then
                   let id = String.sub p 1 (String.length p - 2) in
                   let { Field.ocaml_name; to_string_function; _ } =
                     methd |. Method.get_parameter_lens id
                   in
                     Printf.sprintf "(%s %s)" to_string_function ocaml_name
                 else
                   "\"" ^ p ^ "\"")
              splitted_path
        in
        let print_path_list formatter pl =
          List.iter
            (fun p ->
               if p == List.hd pl then
                 Format.fprintf formatter "%s" p
               else
                 Format.fprintf formatter ";@ %s" p)
            pl in
        lift_io (
          let base_path_list = build_path_to_add rest_method.RestMethod.path in
          if rest_method.RestMethod.supportsMediaUpload then
            let media_path = rest_method
              |. RestMethod.mediaUpload
              |. RestMethod.MediaUpload.protocols
              |. RestMethod.MediaUpload.Protocols.resumable
              |. RestMethod.MediaUpload.Protocols.Resumable.path in
            let media_path_list = build_path_to_add media_path in
            Format.fprintf formatter
              "@[<hov 2>let base_path =@ [%a]@ in@]@\n\
               @[<hov 2>let media_path =@ [%a]@ in@]@\n\
               @[<hov 2>let path_to_add =@ if Option.is_some media_source then media_path@ else base_path@ in@]@\n\
               @[<hov 2>let full_url =@ GapiUtils.add_path_to_url@ path_to_add@ base_url@ in@]@\n"
              print_path_list base_path_list
              print_path_list media_path_list;
          else
            Format.fprintf formatter
              "@[<hov 2>let full_url =@ GapiUtils.add_path_to_url@ [%a]@ base_url@ in@]@\n"
              print_path_list base_path_list;
        );

        let request_parameter = methd.Method.request in
        request_module <--
          State.find_inner_schema_module
            RestMethod.(rest_method.request.Request._ref);
        response_module <--
          State.find_inner_schema_module
            RestMethod.(rest_method.response.Response._ref);

        (* Get etag *)
        let is_etag_present =
          Option.map_default
            (fun { Field.field_type; _ } ->
               match field_type.ComplexType.data_type with
                   ComplexType.Object properties ->
                     List.exists (fun (id, _) -> id = "etag") properties
                 | _ ->
                     false)
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
            "@[<hov 2>let params =@ %s.merge_parameters@ ?standard_parameters:std_params@ "
            parameters_module_name;
          List.iter
            (fun (id, json_schema) ->
               let parameter = methd |. Method.get_parameter_lens id in
                 if json_schema.JsonSchema.location = "query" then
                   Format.fprintf formatter "%s%s@ "
                     (if json_schema.JsonSchema.required
                          || json_schema.JsonSchema.default <> "" then
                        "~" else "?")
                     parameter.Field.ocaml_name)
            rest_method.RestMethod.parameters;
          Format.fprintf formatter
            "()@ in@]@\n@[<hov 2>let query_parameters =@ Option.map@ %s.to_key_value_list@ params@ in@]@\n"
            parameters_module_name);

        (* Invoke service function *)
        let function_to_call =
          String.lowercase rest_method.RestMethod.httpMethod in

        (* Use put' or patch' if request type is different from response type *)
        let apostrophe =
          if (rest_method.RestMethod.httpMethod = "PUT"
                || rest_method.RestMethod.httpMethod = "PATCH") &&
             request_module <> response_module then "'"
          else "" in

        lift_io (
          Format.fprintf formatter
            "@[<hov 2>GapiService.%s%s@ ?query_parameters@ "
            function_to_call apostrophe;
          if is_etag_present || id = "get" then begin
            Format.fprintf formatter "?etag@ ";
          end;
          if rest_method.RestMethod.supportsMediaUpload then begin
            Format.fprintf formatter "?media_source@ ";
          end;
          if Option.is_some request_parameter then begin
            Format.fprintf formatter
              "~data_to_post:(GapiJson.render_json %s.to_data_model)@ ~data:%s@ "
              (request_module |. GapiLens.option_get |. InnerSchemaModule.ocaml_name)
              (request_parameter |. GapiLens.option_get |. Field.ocaml_name);
          end else if rest_method.RestMethod.httpMethod = "POST" then begin
            if Option.is_some response_module then
              Format.fprintf formatter
                "~data:%s.empty@ "
                (response_module |. GapiLens.option_get |. InnerSchemaModule.ocaml_name)
            else
              Format.fprintf formatter "~data:()@ "
          end);
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

  let method_lens = inner_module_lens
    |-- InnerServiceModule.get_method_lens id in

  let render_parameters formatter method_lens =
    let render_optional_parameters with_default render =
      let optional_parameters =
        let test_default =
          if with_default then (fun d -> d <> "") else (fun d -> d = "")
        in
          List.filter
            (fun (_, param) -> not param.JsonSchema.required &&
                               param.JsonSchema.location = "query" &&
                               test_default param.JsonSchema.default)
            rest_method.RestMethod.parameters
      in
        perform
          methd <-- GapiLens.get_state method_lens;
          (method_lens
             |-- Method.parameter_order) @=! List.map fst optional_parameters;

          lift_io $
            List.iter
              (fun (id, _) ->
                 let parameter = methd |. Method.get_parameter_lens id in
                   render parameter)
              optional_parameters
    in
      perform
        (* Optional parameters with default *)
        render_optional_parameters true
          (fun { Field.ocaml_name; default; _ } ->
             Format.fprintf formatter "?(%s = %s)@ "
               ocaml_name
               default);
        (* Optional parameters without default *)
        render_optional_parameters false
          (fun parameter ->
             Format.fprintf formatter "?%s@ " parameter.Field.ocaml_name);
        (* Required parameters *)
        methd <-- GapiLens.get_state method_lens;
        (method_lens
           |-- Method.parameter_order) @=! rest_method.RestMethod.parameterOrder;
        lift_io (
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
          Format.fprintf formatter "session =@]@\n")
  in
    perform
      type_table <-- GapiLens.get_state State.type_table;
      let methd = Method.create id
                    rest_method.RestMethod.parameters
                    rest_method.RestMethod.description
                    RestMethod.(rest_method.request.Request._ref)
                    RestMethod.(rest_method.response.Response._ref)
                    rest_method.RestMethod.supportsMediaUpload
                    type_table in
      method_lens ^=! methd;

      base_url <-- GapiLens.get_state
                     (State.service |-- RestDescription.baseUrl);
      lift_io (
        Format.fprintf formatter
          "@[<v 2>let @[<hv 2>%s@ ?(base_url = \"%s\")@ "
          methd.Method.ocaml_name
          base_url;
        if id = "get" then begin
          Format.fprintf formatter "?etag@ ";
        end;
        Format.fprintf formatter "?std_params@ ";
        if rest_method.RestMethod.supportsMediaUpload then begin
          Format.fprintf formatter "?media_source@ ";
        end);

      render_parameters formatter method_lens;

      generate_method_body methd;

      lift_io $ Format.fprintf formatter "@]@\n"

let rec build_service_inner_module
      file_lens current_module_lens is_nested (resource_id, resource) =
  let module_name =
    OCamlName.get_ocaml_name ModuleName (if is_nested then resource_id
                                         else resource_id ^ "Resource") in
  let inner_module =
    InnerServiceModule.create resource_id module_name in
  let inner_module_lens =
    if is_nested then
      current_module_lens
        |-- InnerServiceModule.get_inner_module_lens resource_id
    else
      current_module_lens
  in
    perform
      (* Insert inner module *)
      inner_module_lens ^=! inner_module;

      formatter <-- GapiLens.get_state (file_lens |-- File.formatter);

      lift_io $
        Format.fprintf formatter "module %s =@\n@[<v 2>struct@," module_name;

      mapM_
        (fun (id, r) ->
           build_service_inner_module file_lens inner_module_lens true (id, r))
        resource.RestResource.resources;

      generate_enum_modules
        formatter inner_module_lens filter_resource_parameters resource;

      generate_parameters_module filter_resource_parameters formatter
        inner_module_lens resource_id resource;

      mapM_
        (fun rest_method ->
           generate_rest_method formatter inner_module_lens rest_method)
        resource.RestResource.methods;

      lift_io $ Format.fprintf formatter "@]@\nend@\n@\n"

let filter_service_parameters rest cond =
  filter_parameters rest RestDescription.methods cond

let rec build_api_level_service_module file_lens =
  let api_level_module_lens =
    State.get_service_module |-- ServiceModule.get_api_level_module
  in
    perform
      name <-- GapiLens.get_state (State.service |-- RestDescription.name);

      let ocaml_name = OCamlName.get_ocaml_name ModuleName name in
      (* Insert API-level service module *)
      api_level_module_lens ^=! InnerServiceModule.create name ocaml_name;

      service <-- GapiLens.get_state State.service;
      formatter <-- GapiLens.get_state (file_lens |-- File.formatter);
      generate_enum_modules
        formatter api_level_module_lens filter_service_parameters service;

      generate_parameters_module filter_service_parameters formatter
        api_level_module_lens name service;

      methods <-- GapiLens.get_state
                    (State.service |-- RestDescription.methods);
      mapM_
        (fun rest_method ->
           generate_rest_method formatter api_level_module_lens rest_method)
        methods

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
      let last_slash_position = String.rindex value '/' in
      let suffix =
        if last_slash_position > 0 then
          (Str.string_after value (last_slash_position + 1))
        else value in
      let scope_id = OCamlName.get_ocaml_name ValueName suffix in
      lift_io $
        Format.fprintf formatter "let %s = \"%s\"@\n@\n" scope_id value;
      let scope_lens = State.get_service_module
        |-- ServiceModule.get_scope_lens scope_id in
      scope_lens ^=! scope.RestDescription.Auth.Oauth2.Scopes.description;
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

      scopes <-- GapiLens.get_state
                   RestDescription.(State.service
                                      |-- auth
                                      |-- Auth.oauth2
                                      |-- Auth.Oauth2.scopes);
      lift_io (
        if List.length scopes > 0 then
          Format.fprintf formatter "module Scope =@\n@[<v 2>struct@\n");
      mapM_ (generate_scope formatter) scopes;
      lift_io (
        if List.length scopes > 0 then
          Format.fprintf formatter "@]@,end@\n@\n");
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
        (fun (resource_id, resource) ->
           build_service_inner_module file_lens
             (State.get_service_module
                |-- ServiceModule.get_inner_module_lens resource_id)
             false (resource_id, resource))
        resources;

      build_api_level_service_module file_lens
  in
    build_module ServiceModule generate_body

(* END Generate main modules *)

(* Generate schema module interface *)

let rec generate_schema_module_signature
      formatter_lens schema_module is_nested =
  let type_t = schema_module.InnerSchemaModule.type_t in
    match type_t with
        InnerSchemaModule.Record record ->
          let fields = record.Record.fields in
            perform
              formatter <-- GapiLens.get_state formatter_lens;

              lift_io $
                Format.fprintf formatter
                  "module %s :@\n@[<v 2>sig@,"
                  schema_module.InnerSchemaModule.ocaml_name;

              mapM_
                (fun (_, inner_module) ->
                   generate_schema_module_signature formatter_lens inner_module true)
                schema_module.InnerSchemaModule.inner_modules;

              lift_io (
                (* Type t *)
                Format.fprintf formatter "@[<v 2>type t = {@,";
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

                (* empty, render, parse *)
                Format.fprintf formatter
                  "@,val empty : t@,@,val render : t -> GapiJson.json_data_model list@,@,val parse : t -> GapiJson.json_data_model -> t@,";

                if not is_nested then begin
                  (* of_data_model, to_data_model *)
                  Format.fprintf formatter
                    "@,val to_data_model : t -> GapiJson.json_data_model@,@,val of_data_model : GapiJson.json_data_model -> t@,";
                end;
                (* module end *)
                Format.fprintf formatter "@]@,end@\n@\n")
      | InnerSchemaModule.List inner_module ->
          perform
            formatter <-- GapiLens.get_state formatter_lens;

            lift_io $
              Format.fprintf formatter
                "module %s :@\n@[<v 2>sig@,"
                schema_module.InnerSchemaModule.ocaml_name;

            mapM_
              (fun (_, inner_module) ->
                 generate_schema_module_signature formatter_lens inner_module true)
              schema_module.InnerSchemaModule.inner_modules;

            lift_io (
              (* Type t *)
              Format.fprintf formatter "type t = %s.t list@\n"
                inner_module.InnerSchemaModule.original_name;

              (* empty, render, parse *)
              Format.fprintf formatter
                "@,val empty : t@,@,val render : t -> GapiJson.json_data_model list@,@,val parse : t -> GapiJson.json_data_model -> t@,";

              (* of_data_model, to_data_model *)
              Format.fprintf formatter
                "@,val to_data_model : t -> GapiJson.json_data_model@,@,val of_data_model : GapiJson.json_data_model -> t@,";

              (* module end *)
              Format.fprintf formatter "@]@,end@\n@\n")
      | InnerSchemaModule.Alias alias_name ->
          perform
            formatter <-- GapiLens.get_state formatter_lens;

            lift_io $
              Format.fprintf formatter
                "module %s : module type of %s@\n@\n"
                schema_module.InnerSchemaModule.ocaml_name
                alias_name

let build_schema_module_interface =
  let generate_body file_lens =
    perform
      let formatter_lens = file_lens |-- File.formatter in
      formatter <-- GapiLens.get_state formatter_lens;
      service <-- GapiLens.get_state State.service;

      (* Generate opening comment *)
      lift_io (
        Format.fprintf formatter "@[<hov 2>(** Data definition for %s (%s)."
          service.RestDescription.title
          service.RestDescription.version;
        if service.RestDescription.documentationLink <> "" then begin
          Format.fprintf formatter
            "@\n@\nFor@ more@ information@ about@ this@ data@ model,@ see@ the@ {{:%s}API Documentation}."
            service.RestDescription.documentationLink
        end;
        Format.fprintf formatter "@\n*)@]@\n@\n");

      (* Schema modules are stored in reverse order *)
      schema_modules <-- GapiLens.get_state
                           (State.get_schema_module_lens
                              |-- SchemaModule.inner_modules);
      mapM_
        (fun (_, schema_module) ->
           generate_schema_module_signature formatter_lens schema_module false)
        (List.rev schema_modules);

  in
    build_module SchemaModuleInterface generate_body

(* END Generate schema module interface *)

(* Generate service module interface *)

let rec generate_service_module_signature
      omit_declaration file_lens service_module =
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
        base_url <-- GapiLens.get_state
                       (State.service |-- RestDescription.baseUrl);
        schema_module <-- GapiLens.get_state State.get_schema_module_lens;
        request_module <-- State.find_inner_schema_module request_ref;
        response_module <-- State.find_inner_schema_module response_ref;

        lift_io (
          (* Documentation *)
          Format.fprintf formatter
            "@[<hov 2>(** %s@\n@\n@@param base_url Service endpoint base URL (defaults to [\"%s\"]).@\n"
            methd.Method.description
            base_url;
          if methd.Method.original_name = "get" then begin
            Format.fprintf formatter
              "@@param etag Optional ETag.@\n";
          end;
          Format.fprintf formatter
            "@@param std_params Optional standard parameters.@\n";
          List.iter
            (fun id ->
               let { Field.ocaml_name; field_type; _ } =
                 List.assoc id methd.Method.parameters in
               let description = ComplexType.get_description field_type in
                 if description <> "" then begin
                   Format.fprintf formatter "@@param %s %s@\n"
                     ocaml_name
                     description;
                 end)
            methd.Method.parameter_order;
          Format.fprintf formatter "*)@]@\n";
          (* Declaration *)
          Format.fprintf formatter
            "@[<hv 2>val %s :@ ?base_url:string ->@ "
            methd.Method.ocaml_name;
          if methd.Method.original_name = "get" then begin
            Format.fprintf formatter "?etag:string ->@ ";
          end;
          Format.fprintf formatter
            "?std_params:GapiService.StandardParameters.t ->@ ";
          if methd.Method.supports_media_upload then begin
            Format.fprintf formatter "?media_source:GapiMediaResource.t ->@ ";
          end;
          (* Parameters *)
          List.iter
            (fun id ->
               let { Field.ocaml_name; ocaml_type; field_type; _ } =
                 List.assoc id methd.Method.parameters
               in
                 Format.fprintf formatter
                   "%s%s:%s%s ->@,"
                   (if ComplexType.is_required field_type ||
                       ComplexType.get_location field_type = ScalarType.Path then
                      "" else "?")
                   ocaml_name
                   ocaml_type
                   (if ComplexType.is_repeated field_type then " list" else ""))
            methd.Method.parameter_order);

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

  (* Methods are stored in reverse order *)
  let methods = List.rev (service_module.InnerServiceModule.methods) in
  let enum_modules = service_module.InnerServiceModule.enums in
    perform
      formatter <-- GapiLens.get_state (file_lens
                                          |-- File.formatter);

      (* Module declaration *)
      lift_io (
        if not omit_declaration then begin
          Format.fprintf formatter
            "module %s :@\n@[<v 2>sig@,"
            service_module.InnerServiceModule.ocaml_name
        end);

      mapM_
        (fun (id, m) ->
           generate_service_module_signature false file_lens m)
        service_module.InnerServiceModule.inner_modules;

      lift_io (
        render_enum_modules formatter enum_modules;
        Format.fprintf formatter "@\n");

      mapM_
        (fun (_, methd) -> render_method formatter methd)
        methods;

      (* Module end *)
      lift_io (
        if not omit_declaration then begin
          Format.fprintf formatter "@]@\nend@\n@\n"
        end)

let build_service_module_interface =
  let render_scope formatter scopes =
    List.iter
      (fun (id, scope) ->
         Format.fprintf formatter
           "val %s : string@\n(** %s *)@\n@\n"
           id scope)
      scopes
  in

  let generate_body file_lens =
    perform
      formatter <-- GapiLens.get_state (file_lens
                                          |-- File.formatter);
      service <-- GapiLens.get_state State.service;

      (* Generate opening comment *)
      lift_io (
        Format.fprintf formatter
          "@[<hov 2>(** Service definition for %s (%s).@\n@\n%s."
          service.RestDescription.title
          service.RestDescription.version
          service.RestDescription.description;
        if service.RestDescription.documentationLink <> "" then begin
          Format.fprintf formatter
            "@\n@\nFor@ more@ information@ about@ this@ service,@ see@ the@ {{:%s}API Documentation}."
            service.RestDescription.documentationLink;
        end;
        Format.fprintf formatter "@\n*)@]@\n@\n");

      scopes <-- GapiLens.get_state (State.get_service_module
                                       |-- ServiceModule.scopes);
      lift_io (
        if List.length scopes > 0 then begin
          Format.fprintf formatter"module Scope :@\n@[<v 2>sig@\n";
          render_scope formatter (List.rev scopes);
          Format.fprintf formatter"@]@,end@\n(** Service Auth Scopes *)@\n@\n"
        end);

      (* Service modules are stored in reverse order *)
      service_modules <-- GapiLens.get_state
                            (State.get_service_module
                               |-- ServiceModule.inner_modules);
      mapM_
        (fun (_, service_module) ->
           generate_service_module_signature false file_lens service_module)
        (List.rev service_modules);

      api_level_module <-- GapiLens.get_state
                             (State.get_service_module
                                |-- ServiceModule.get_api_level_module);
      generate_service_module_signature true file_lens api_level_module

  in
    build_module ServiceModuleInterface generate_body

(* END Generate service module interface *)

(* Main program *)

let generate_code service =
  let build_all =
    perform
      State.build_type_table;
      State.build_sorted_types;
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

  let _ =
    if !api = "" || !version = "" then begin
      prerr_endline "API name and version are required.";
      prerr_endline usage;
      exit 1
    end in
  let service = get_service_description !api !version !nocache in
    generate_code service

(* END Main program *)

