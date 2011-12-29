open GapiUtils.Infix
open GapiDiscovery

(* Configuration *)

let base_path = "generated/"

(* END Configuration *)
                  
(* Symbol name generation *)

type name_type =
    ModuleName
  | TypeName
  | ValueName
  | ParameterName
  | FieldName
  | ConstructorName

module OCamlName =
struct
  let keywords = ["type"; "method"; "private"; "end"; "ref"; "object"]

  let replace_invalid_characters s =
    ExtString.String.map
      (fun c ->
         match c with
             'a'..'z'
           | 'A'..'Z'
           | '0'..'9'
           | '_' -> c
           | _ -> '_'
      ) s

  let get_ocaml_name name_type name =
    let name_without_invalid_characters = replace_invalid_characters name in
    let name_with_proper_first_letter_case =
      match name_type with
          ModuleName
        | ConstructorName ->
            String.capitalize name_without_invalid_characters
        | TypeName
        | ValueName
        | ParameterName
        | FieldName ->
            String.uncapitalize name_without_invalid_characters
    in
      if List.mem name_with_proper_first_letter_case keywords then
        "_" ^ name_with_proper_first_letter_case
      else
        name_with_proper_first_letter_case

end

(* END Symbol name generation *)

(* Parameters and properties *)

module Name =
struct
  type t = {
    original_name : string;
    ocaml_name : string
  }

  let create name =
    let ocaml_name =
      OCamlName.get_ocaml_name FieldName name
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

  let get_json_type = function
      String
    | DateTime
    | Date -> "String"
    | Boolean -> "Bool"
    | Integer -> "Int"

  let get_convert_function = function
    | DateTime
    | Date -> "GapiDate.of_string "
    | String
    | Boolean
    | Integer -> ""

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

  let get_content arr =
    match arr.data_type with
        Reference type_name -> type_name
      | _ ->
          failwith "Unsupported type in ComplexType.get_content"

end

(* Field description *)

module Field =
struct
  type t = {
    original_name : string;
    ocaml_name : string;
    field_type : ComplexType.t;
  }


end

(* END Field description *)

(* Record description *)

module Record =
struct
  type t = {
    original_name : string;
    ocaml_name : string;
    fields : Field.t list;
  }


end

(* END Record description *)

(* Value description *)

module Value =
struct
  type t = {
    original_name : string;
    ocaml_name : string;
    parameters : Field.t list;
  }


end

(* END Value description *)

(* Inner module description *)

module InnerModule =
struct
  type t = {
    original_name : string;
    ocaml_name : string;
    records : Record.t list;
    values : Value.t list;
    inner_modules : t list;
  }


end

(* END Inner module description *)

(* File description *)

type file_type =
    SchemaModule
  | SchemaModuleInterface
  | ServiceModule
  | ServiceModuleInterface

let string_of_file_type = function
    SchemaModule -> "schema module"
  | SchemaModuleInterface -> "schema module interface"
  | ServiceModule -> "service module"
  | ServiceModuleInterface -> "service module interface"

module File =
struct
  type t = {
    file_type : file_type;
    service_name : string;
    module_name : string;
    file_name : string;
    inner_modules : (string * InnerModule.t) list
  }

  let create service_name file_type =
    let ocaml_name = OCamlName.get_ocaml_name ModuleName service_name in
    let module_base_name = "Gapi" ^ ocaml_name in
    let module_name =
      match file_type with
          SchemaModule
        | SchemaModuleInterface -> module_base_name ^ "Schema"
        | ServiceModule
        | ServiceModuleInterface -> module_base_name ^ "Service" in
    let extension =
      match file_type with
          SchemaModule
        | ServiceModule -> ".ml"
        | SchemaModuleInterface
        | ServiceModuleInterface -> ".mli" in
    let file_name =
      base_path ^ (String.uncapitalize module_name) ^ extension
    in
      { file_type;
        service_name;
        module_name;
        file_name;
        inner_modules = []
      }

end

(* END File description *)

(* Generator state *)

module State =
struct
  type t = (file_type * File.t) list

end

module GeneratorStateMonad =
  GapiMonad.MakeStateMonad(struct type s = State.t end)

module GeneratorM =
struct
  include GeneratorStateMonad

  include GapiMonad.MakeMonadCombinators(GeneratorStateMonad)

end

(* END Generator state *)

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

let open_file file_name =
  let oc = open_out file_name in
  let formatter = Format.formatter_of_out_channel oc in
    (oc, formatter)

let close_file oc formatter =
  Format.fprintf formatter "@?";
  close_out oc

let build_schema_inner_module
      formatter
      complex_type
      type_table
      container_name =
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
    Format.fprintf formatter "@,@[<v 2>let render x = @,";
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
    Format.fprintf formatter "@]@,@]]@,"
  in

  let render_parse_function () =
    let is_recursive =
      not (TypeTable.is_referenced complex_type.ComplexType.id type_table) in

    Format.fprintf formatter "@,@[<v 2>let %sparse x = function@,"
      (if is_recursive then "rec " else "");
    begin match complex_type.ComplexType.data_type with
        ComplexType.Object properties ->
          List.iter
            (fun ({ Name.ocaml_name; original_name }, property) ->
               match property.ComplexType.data_type with
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
            properties;
          if is_recursive then begin
            Format.fprintf formatter
              "@[<v 2>| GapiCore.AnnotatedTree.Node@,({ GapiJson.name = \"\"; data_type = GapiJson.Object },@,cs) ->@,@[<hv 2>GapiJson.parse_children@ parse@ empty@ Std.identity@ cs@]@]@,"
          end;
          Format.fprintf formatter
            "@[<v 2>| e ->@,GapiJson.unexpected \"%s.%s.parse\" e@]@]"
            container_name
            complex_type.ComplexType.id;
          if is_recursive then begin
            Format.fprintf formatter
              "@,@,let to_data_model = GapiJson.render_root render@,@,let of_data_model = GapiJson.parse_root parse empty";
          end;
      | _ ->
          failwith ("Unexpected root (must be an Object): "
                    ^ complex_type.ComplexType.id)
    end;
    Format.fprintf formatter "@,"
  in

    Format.fprintf formatter
      "module %s =@\n@[<v 2>struct@,"
      complex_type.ComplexType.id;
    render_type_t ();
    render_lenses ();
    render_empty ();
    render_render_function ();
    render_parse_function ();
    Format.fprintf formatter "@]@\nend@\n@\n"

(* TODO: generalize *)
let replace_invalid_characters s =
  ExtString.String.map
    (fun c ->
       match c with
           'a'..'z'
         | 'A'..'Z'
         | '0'..'9'
         | '_' -> c
         | _ -> '_'
    ) s

let generate_rest_method formatter (id, rest_method) base_url type_table =
  let generate_method_body () =
    let function_name = String.lowercase rest_method.RestMethod.httpMethod in
      (* TODO: build url *)
      Format.fprintf formatter
        "@[<hov 2>let url' =@ base_url@ in@]@\n";
      (* TODO: get etag *)
      (* TODO: build parameters *)
      Format.fprintf formatter
        "@[<hov 2>let query_parameters =@ Option.map@ GapiService.StandardParameters.to_key_value_list@ parameters@ in@]@\n";
      Format.fprintf formatter
        "@[<hov 2>GapiService.%s@ ?query_parameters@ "
        function_name;
      if rest_method.RestMethod.request <> RefData.empty then begin
        Format.fprintf formatter
          "~data_to_post:(GapiJson.render_json %s.to_data_model)@ ~data:%s@ "
          rest_method.RestMethod.request.RefData._ref
          (String.uncapitalize rest_method.RestMethod.request.RefData._ref);
      end else if rest_method.RestMethod.httpMethod = "POST" then begin
        Format.fprintf formatter
          "~data:%s.empty@ "
          rest_method.RestMethod.response.RefData._ref;
      end;
      Format.fprintf formatter
        "url'@ (GapiJson.parse_json_response %s.of_data_model)@ "
        rest_method.RestMethod.response.RefData._ref;
      Format.fprintf formatter "session@ @]@\n";
  in

  let url = base_url ^ rest_method.RestMethod.path in
    Format.fprintf formatter
      "@[<v 2>let @[<hv 2>%s@ ?(base_url = \"%s\")@ ?parameters@ "
      id url;
    (* Optional parameters with default *)
    List.iter
      (fun (id, parameter) ->
         Format.fprintf formatter "?(%s = %S)@ "
           (replace_invalid_characters id) parameter.JsonSchema.default)
      (List.filter
         (fun (_, param) ->
            not param.JsonSchema.required && param.JsonSchema.default <> "")
         rest_method.RestMethod.parameters);
    (* Optional parameters without default *)
    List.iter
      (fun (id, _) ->
         Format.fprintf formatter "?%s@ " (replace_invalid_characters id))
      (List.filter
         (fun (_, param) ->
            not param.JsonSchema.required && param.JsonSchema.default = "")
         rest_method.RestMethod.parameters);
    (* Required parameters *)
    List.iter
      (fun id ->
         Format.fprintf formatter "~%s@ " (replace_invalid_characters id))
      rest_method.RestMethod.parameterOrder;
    (* Request *)
    if rest_method.RestMethod.request <> RefData.empty then
    begin
      rest_method.RestMethod.request.RefData._ref
        |> String.uncapitalize
        |> replace_invalid_characters
        |> Format.fprintf formatter "%s@ ";
    end;
    Format.fprintf formatter "session =@]@\n";
    generate_method_body ();
    Format.fprintf formatter "@]@\n"

let build_service_inner_module formatter (resource_id, resource) base_url type_table =
  let module_name =
    (String.capitalize resource_id) ^ "Resource"
  in
    Format.fprintf formatter
      "module %s =@\n@[<v 2>struct@,"
      module_name;
    List.iter
      (fun rest_method ->
         generate_rest_method formatter rest_method base_url type_table)
      resource.RestResource.methods;
    Format.fprintf formatter "@]@\nend@\n@\n"


let build_module file_type service_name generate_body =
  let new_module =
    File.create service_name file_type in
  let () =
    Printf.printf "Building %s %s (%s)...%!"
      (string_of_file_type file_type)
      new_module.File.module_name
      new_module.File.file_name in
  let (oc, formatter) = open_file new_module.File.file_name in
    Format.fprintf formatter "(* Warning! This file is generated. Modify at your own risk. *)@\n@\n";
    generate_body formatter new_module.File.module_name;
    close_file oc formatter;
    print_endline "Done"

let build_schema_module service_name complex_types type_table =
  let generate_body formatter module_name =
    List.iter
      (fun complex_type ->
         build_schema_inner_module
           formatter complex_type type_table module_name)
      complex_types
  in
    build_module SchemaModule service_name generate_body

let build_schema_module_interface service =
  ()

let build_service_module service complex_types type_table =
  let generate_body formatter module_name =
    List.iter
      (fun (value, _) ->
         let suffix =
           let last_dot_position = String.rindex value '.' in
           let last_slash_position = String.rindex value '/' in
             if last_slash_position > last_dot_position then
               ""
             else
               "_" ^ (Str.string_after value (last_dot_position + 1))
            in
         Format.fprintf formatter "let scope%s = \"%s\"@\n@\n" suffix value)
      service.RestDescription.auth.Oauth2Data.scopes;
    (* TODO: parameters *)
    Format.fprintf formatter "open %s@\n@\n" ("Gapi" ^ String.capitalize service.RestDescription.name ^ "Schema"); (* <- FIXME *)
    List.iter
      (fun resource ->
         build_service_inner_module
           formatter resource service.RestDescription.basePath type_table)
      service.RestDescription.resources
  in
    build_module ServiceModule service.RestDescription.name generate_body

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
    TypeTable.sort type_table in
  let service_name = service.RestDescription.name in
    build_schema_module
      service_name
      sorted_complex_types
      type_table;
    build_schema_module_interface service;
    build_service_module
      service
      sorted_complex_types
      type_table;
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

