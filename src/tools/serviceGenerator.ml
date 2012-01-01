open GapiUtils.Infix
open GapiDiscovery
open GapiLens.Infix
open GapiLens.StateInfix

(* Configuration *)

let output_path = "generated/"

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

	let original_type = {
		GapiLens.get = (fun x -> x.original_type);
		GapiLens.set = (fun v x -> { x with original_type = v })
	}
	let description = {
		GapiLens.get = (fun x -> x.description);
		GapiLens.set = (fun v x -> { x with description = v })
	}
	let default = {
		GapiLens.get = (fun x -> x.default);
		GapiLens.set = (fun v x -> { x with default = v })
	}
	let required = {
		GapiLens.get = (fun x -> x.required);
		GapiLens.set = (fun v x -> { x with required = v })
	}
	let format = {
		GapiLens.get = (fun x -> x.format);
		GapiLens.set = (fun v x -> { x with format = v })
	}
	let pattern = {
		GapiLens.get = (fun x -> x.pattern);
		GapiLens.set = (fun v x -> { x with pattern = v })
	}
	let minimum = {
		GapiLens.get = (fun x -> x.minimum);
		GapiLens.set = (fun v x -> { x with minimum = v })
	}
	let maximum = {
		GapiLens.get = (fun x -> x.maximum);
		GapiLens.set = (fun v x -> { x with maximum = v })
	}
	let enum = {
		GapiLens.get = (fun x -> x.enum);
		GapiLens.set = (fun v x -> { x with enum = v })
	}
	let enumDescriptions = {
		GapiLens.get = (fun x -> x.enumDescriptions);
		GapiLens.set = (fun v x -> { x with enumDescriptions = v })
	}
	let repeated = {
		GapiLens.get = (fun x -> x.repeated);
		GapiLens.set = (fun v x -> { x with repeated = v })
	}
	let location = {
		GapiLens.get = (fun x -> x.location);
		GapiLens.set = (fun v x -> { x with location = v })
	}
	let data_type = {
		GapiLens.get = (fun x -> x.data_type);
		GapiLens.set = (fun v x -> { x with data_type = v })
	}
	let empty_value = {
		GapiLens.get = (fun x -> x.empty_value);
		GapiLens.set = (fun v x -> { x with empty_value = v })
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
    | Object of (string * t) list
    | Array of t
    | Reference of string
    | Dynamic of t
  and t = {
    id : string;
    data_type : data_t;
    original_type : string;
    description : string;
  }

	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let data_type = {
		GapiLens.get = (fun x -> x.data_type);
		GapiLens.set = (fun v x -> { x with data_type = v })
	}
	let original_type = {
		GapiLens.get = (fun x -> x.original_type);
		GapiLens.set = (fun v x -> { x with original_type = v })
	}
	let description = {
		GapiLens.get = (fun x -> x.description);
		GapiLens.set = (fun v x -> { x with description = v })
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
                            (fun (id, v) -> (id, create v))
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

	let original_name = {
		GapiLens.get = (fun x -> x.original_name);
		GapiLens.set = (fun v x -> { x with original_name = v })
	}
	let ocaml_name = {
		GapiLens.get = (fun x -> x.ocaml_name);
		GapiLens.set = (fun v x -> { x with ocaml_name = v })
	}
	let field_type = {
		GapiLens.get = (fun x -> x.field_type);
		GapiLens.set = (fun v x -> { x with field_type = v })
	}

  let get_default field =
    match field.field_type.ComplexType.data_type with
        ComplexType.Scalar scalar -> scalar.ScalarType.default
      | _ -> failwith "Default not supported for complex types"

  let create (original_name, property) =
    let ocaml_name = OCamlName.get_ocaml_name FieldName original_name in
      { original_name;
        ocaml_name;
        field_type = property
      }

end

(* END Field description *)

(* Record description *)

module Record =
struct
  type t = {
    ocaml_name : string;
    fields : (string * Field.t) list;
  }

	let ocaml_name = {
		GapiLens.get = (fun x -> x.ocaml_name);
		GapiLens.set = (fun v x -> { x with ocaml_name = v })
	}
	let fields = {
		GapiLens.get = (fun x -> x.fields);
		GapiLens.set = (fun v x -> { x with fields = v })
	}
  let field id = GapiLens.for_assoc id
  let field_list = fields |-- GapiLens.list_map GapiLens.second

  let get_field id =
    fields |-- field id |-- GapiLens.option_get

  let create properties =
    let fields = List.map
                   (function (id, _) as property -> (id, Field.create property))
                   properties in
      { ocaml_name = "t";
        fields;
      }

end

(* END Record description *)

(* Value description *)

module Value =
struct
  type t = {
    original_name : string;
    ocaml_name : string;
    parameters : (string * Field.t) list;
  }

	let original_name = {
		GapiLens.get = (fun x -> x.original_name);
		GapiLens.set = (fun v x -> { x with original_name = v })
	}
	let ocaml_name = {
		GapiLens.get = (fun x -> x.ocaml_name);
		GapiLens.set = (fun v x -> { x with ocaml_name = v })
	}
	let parameters = {
		GapiLens.get = (fun x -> x.parameters);
		GapiLens.set = (fun v x -> { x with parameters = v })
	}
  let parameter id = GapiLens.for_assoc id

  let get_parameter_lens id =
    parameters |-- parameter id |-- GapiLens.option_get

  let create original_name rest_parameters =
    let ocaml_name = OCamlName.get_ocaml_name ValueName original_name in
    let parameters = List.map
                       (fun (id, rest_paramter) ->
                          let complex_type = ComplexType.create rest_paramter in
                            (id, Field.create (id, complex_type)))
                       rest_parameters
    in
      { original_name;
        ocaml_name;
        parameters
      }

end

(* END Value description *)

(* Inner module description *)

module InnerModule =
struct
  type t = {
    original_name : string;
    ocaml_name : string;
    record : Record.t option;
    values : (string * Value.t) list;
    inner_modules : (string * t) list;
  }

	let original_name = {
		GapiLens.get = (fun x -> x.original_name);
		GapiLens.set = (fun v x -> { x with original_name = v })
	}
	let ocaml_name = {
		GapiLens.get = (fun x -> x.ocaml_name);
		GapiLens.set = (fun v x -> { x with ocaml_name = v })
	}
	let record = {
		GapiLens.get = (fun x -> x.record);
		GapiLens.set = (fun v x -> { x with record = v })
	}
	let values = {
		GapiLens.get = (fun x -> x.values);
		GapiLens.set = (fun v x -> { x with values = v })
	}
	let inner_modules = {
		GapiLens.get = (fun x -> x.inner_modules);
		GapiLens.set = (fun v x -> { x with inner_modules = v })
	}
  let inner_module id = GapiLens.for_assoc id
  let value id = GapiLens.for_assoc id

  let get_value_lens id =
    values |-- value id |-- GapiLens.option_get

  let create original_name ocaml_name =
    { original_name;
      ocaml_name;
      record = None;
      values = [];
      inner_modules = [];
    }

end

(* END Inner module description *)

(* Module description *)

module Module =
struct
  type t = {
    ocaml_name : string;
    inner_modules : (string * InnerModule.t) list;
  }
    
	let ocaml_name = {
		GapiLens.get = (fun x -> x.ocaml_name);
		GapiLens.set = (fun v x -> { x with ocaml_name = v })
	}
	let inner_modules = {
		GapiLens.get = (fun x -> x.inner_modules);
		GapiLens.set = (fun v x -> { x with inner_modules = v })
	}
  let inner_module id = GapiLens.for_assoc id
  let get_inner_module_lens id =
    inner_modules |-- inner_module id |-- GapiLens.option_get

  let create name =
    { ocaml_name = name;
      inner_modules = [];
    }

end

(* END Module description *)

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
    formatter : Format.formatter;
  }

	let file_type = {
		GapiLens.get = (fun x -> x.file_type);
		GapiLens.set = (fun v x -> { x with file_type = v })
	}
	let service_name = {
		GapiLens.get = (fun x -> x.service_name);
		GapiLens.set = (fun v x -> { x with service_name = v })
	}
	let module_name = {
		GapiLens.get = (fun x -> x.module_name);
		GapiLens.set = (fun v x -> { x with module_name = v })
	}
	let file_name = {
		GapiLens.get = (fun x -> x.file_name);
		GapiLens.set = (fun v x -> { x with file_name = v })
	}
	let formatter = {
		GapiLens.get = (fun x -> x.formatter);
		GapiLens.set = (fun v x -> { x with formatter = v })
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
      output_path ^ (String.uncapitalize module_name) ^ extension
    in
      { file_type;
        service_name;
        module_name;
        file_name;
        formatter = Format.std_formatter;
      }

end

(* END File description *)

(* Type table *)

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
  type t = (string, ComplexType.t) Hashtbl.t

  let create () =
    Hashtbl.create 64

  let fold f v table =
    Hashtbl.fold f table v

  (* Topological sort: see http://stackoverflow.com/questions/4653914/topological-sort-in-ocaml *)
  let toposort graph = 
    let dfs graph visited start_node = 
      let rec explore path visited node = 
        (*if List.mem node path    then raise (CycleFound path) else*)
        if List.mem node visited then visited else     
          let new_path = node :: path in 
          let edges    = List.assoc node graph in
          let visited  = List.fold_left (explore new_path) visited edges in
            node :: visited
      in
        explore [] visited start_node
    in
      List.fold_left (fun visited (node,_) -> dfs graph visited node) [] graph

  let build complex_types =
    let table = Hashtbl.create 64 in
      List.iter
        (fun complex_type ->
           if not (ComplexType.is_anonymous complex_type) then
             Hashtbl.add table complex_type.ComplexType.id complex_type)
        complex_types;
      table

  let sort table =
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
      List.rev_map snd complex_types

end

(* END Type table *)

(* Generator state *)

module State =
struct
  type t = {
    service : RestDescription.t;
    files : (file_type, File.t) Hashtbl.t;
    modules : (string, Module.t) Hashtbl.t;
    type_table : TypeTable.t;
    sorted_types : ComplexType.t list;
    referenced_types : StringSet.t;
  }

  let service = {
		GapiLens.get = (fun x -> x.service);
		GapiLens.set = (fun v x -> { x with service = v })
  }
	let files = {
		GapiLens.get = (fun x -> x.files);
		GapiLens.set = (fun v x -> { x with files = v })
	}
	let modules = {
		GapiLens.get = (fun x -> x.modules);
		GapiLens.set = (fun v x -> { x with modules = v })
	}
	let type_table = {
		GapiLens.get = (fun x -> x.type_table);
		GapiLens.set = (fun v x -> { x with type_table = v })
	}
	let sorted_types = {
		GapiLens.get = (fun x -> x.sorted_types);
		GapiLens.set = (fun v x -> { x with sorted_types = v })
	}
	let referenced_types = {
		GapiLens.get = (fun x -> x.referenced_types);
		GapiLens.set = (fun v x -> { x with referenced_types = v })
	}
  let file file_type = GapiLens.for_hash file_type
  let _module name = GapiLens.for_hash name

  let get_file_lens file_type =
    files |-- file file_type |-- GapiLens.option_get

  let get_module_lens module_name =
    modules |-- _module module_name |-- GapiLens.option_get

  let create service = {
    service;
    files = Hashtbl.create 4;
    modules = Hashtbl.create 2;
    type_table = TypeTable.create ();
    sorted_types = [];
    referenced_types = StringSet.empty;
  }
                    
  let build_type_table state =
    let complex_types =
      List.map
        (fun (_, s) -> ComplexType.create s)
        state.service.RestDescription.schemas in
    let table = 
      TypeTable.build complex_types
    in
      state |> type_table ^=! table

  let build_sorted_types state =
    let sorted =
      TypeTable.sort state.type_table
    in
      state |> sorted_types ^=! sorted

  let build_referenced_types state =
    let referenced =
      TypeTable.fold
        (fun _ complex_type referenced ->
           let references = ComplexType.get_direct_references complex_type in
             StringSet.add_list references referenced)
        state.referenced_types
        state.type_table
    in
      state |> referenced_types ^=! referenced

  let is_type_referenced type_id state =
    (StringSet.mem type_id state.referenced_types, state)

end

module GeneratorStateMonad =
  GapiMonad.MakeStateMonad(struct type s = State.t end)

module GeneratorM =
struct
  include GeneratorStateMonad

  include GapiMonad.MakeMonadCombinators(GeneratorStateMonad)

end

open GeneratorM

(* END Generator state *)

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
  let file_name = output_path ^ api ^ "." ^ version ^ ".json" in
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

let open_file file_name =
  let oc = open_out file_name in
  let formatter = Format.formatter_of_out_channel oc in
    (oc, formatter)

let close_file oc formatter =
  Format.fprintf formatter "@?";
  close_out oc

let build_schema_inner_module file_lens complex_type =
  let render_type_t formatter fields =
    Format.fprintf formatter "@[<v 2>type t = {@,";
    List.iter
      (fun ({ Field.ocaml_name; field_type; _ }) ->
         Format.fprintf formatter
           "%s : %s;@,"
           ocaml_name
           (ComplexType.data_type_to_string
              field_type.ComplexType.data_type))
      fields;
    Format.fprintf formatter "@]@,}@,"
  in

  let render_lenses formatter fields =
    List.iter
      (fun ({ Field.ocaml_name; field_type; _ }) ->
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
      (fun ({ Field.ocaml_name; field_type; _ }) ->
         Format.fprintf formatter
           "%s = %s;@,"
           ocaml_name
           (ComplexType.get_empty_value
              field_type.ComplexType.data_type))
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
      (fun ({ Field.ocaml_name; original_name; field_type}) ->
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
      (fun ({ Field.ocaml_name; original_name; field_type }) ->
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
  (* TODO: append "Schema" to module names? *)
  let module_name =
    OCamlName.get_ocaml_name ModuleName complex_type.ComplexType.id in
  let inner_module =
    { InnerModule.create complex_type.ComplexType.id module_name with
          InnerModule.record = Some record
    }
  in
    perform
      file <-- GapiLens.get_state file_lens;
      let formatter = file.File.formatter in
      let container_name = file.File.module_name in

      (* Insert inner module into state *)
      let inner_module_lens =
        State.get_module_lens file.File.module_name
          |-- Module.get_inner_module_lens module_name in
      inner_module_lens ^=! inner_module;

      lift_io $
        Format.fprintf formatter
          "module %s =@\n@[<v 2>struct@,"
        inner_module.InnerModule.ocaml_name;

      let field_list_lens = inner_module_lens
        |-- InnerModule.record
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

let generate_rest_method formatter inner_module_lens (id, rest_method) =
  let value = Value.create id rest_method.RestMethod.parameters in

  let generate_method_body =
    let function_to_call = String.lowercase rest_method.RestMethod.httpMethod in
      perform
        (* FIXME: remove this get, inserted to force evaluation order *)
        get;
        (* TODO: build url *)
        lift_io (
          Format.fprintf formatter "@[<hov 2>let url' =@ base_url@ in@]@\n";
        (* TODO: get etag *)
        (* TODO: build parameters *)
          Format.fprintf formatter
            "@[<hov 2>let query_parameters =@ Option.map@ GapiService.StandardParameters.to_key_value_list@ parameters@ in@]@\n";
          Format.fprintf formatter
            "@[<hov 2>GapiService.%s@ ?query_parameters@ "
            function_to_call);
        lift_io (
          if rest_method.RestMethod.request <> RefData.empty then begin
            Format.fprintf formatter
              "~data_to_post:(GapiJson.render_json %s.to_data_model)@ ~data:%s@ "
              rest_method.RestMethod.request.RefData._ref
              (String.uncapitalize rest_method.RestMethod.request.RefData._ref);
          end else if rest_method.RestMethod.httpMethod = "POST" then begin
            Format.fprintf formatter
              "~data:%s.empty@ "
              rest_method.RestMethod.response.RefData._ref;
          end);
        lift_io (
          Format.fprintf formatter
            "url'@ (GapiJson.parse_json_response %s.of_data_model)@ "
            rest_method.RestMethod.response.RefData._ref;
          Format.fprintf formatter "session@ @]@\n")
  in

  let render_parameters formatter =
    let render_optional_parameters with_default printer =
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
             let parameter = value |. Value.get_parameter_lens id in
               printer parameter)
          optional_parameters
    in
      (* Optional parameters with default *)
      render_optional_parameters true
        (fun parameter ->
           let default = Field.get_default parameter in
             Format.fprintf formatter "?(%s = %S)@ "
               parameter.Field.ocaml_name
               default);
      (* Optional parameters without default *)
      render_optional_parameters false
        (fun parameter ->
           Format.fprintf formatter "?%s@ " parameter.Field.ocaml_name);
      (* Required parameters *)
      List.iter
        (fun id ->
           let parameter = value |. Value.get_parameter_lens id in
             Format.fprintf formatter "~%s@ " parameter.Field.ocaml_name)
        rest_method.RestMethod.parameterOrder;
      (* Request parameter *)
      if rest_method.RestMethod.request <> RefData.empty then begin
        let request_parameter = OCamlName.get_ocaml_name ParameterName
                                  rest_method.RestMethod.request.RefData._ref
        in
          Format.fprintf formatter "%s@ " request_parameter;
      end;
      Format.fprintf formatter "session =@]@\n"
  in

    perform
      let value_lens = inner_module_lens
        |-- InnerModule.get_value_lens id in
      value_lens ^=! value;

      base_url <-- GapiLens.get_state
                     (State.service |-- RestDescription.basePath);
      let url = base_url ^ rest_method.RestMethod.path in
      lift_io $
        Format.fprintf formatter
          "@[<v 2>let @[<hv 2>%s@ ?(base_url = \"%s\")@ ?parameters@ "
          value.Value.ocaml_name url;

      lift_io $ render_parameters formatter;

      generate_method_body;

      lift_io $ Format.fprintf formatter "@]@\n"

let build_service_inner_module file_lens (resource_id, resource) =
  let module_name =
    OCamlName.get_ocaml_name ModuleName (resource_id ^ "Resource") in
  let inner_module =
    InnerModule.create resource_id module_name
  in
    perform
      file <-- GapiLens.get_state file_lens;
      let inner_module_lens =
        State.get_module_lens file.File.module_name
          |-- Module.get_inner_module_lens module_name in
      inner_module_lens ^=! inner_module;
      let formatter = file.File.formatter in
      lift_io $
        Format.fprintf formatter "module %s =@\n@[<v 2>struct@," module_name;
      mapM_
        (fun rest_method ->
           generate_rest_method formatter inner_module_lens rest_method)
        resource.RestResource.methods;
      lift_io $ Format.fprintf formatter "@]@\nend@\n@\n"

let build_module file_type generate_body =
  let file_lens = State.get_file_lens file_type in
  let formatter_lens = file_lens |-- File.formatter in
    perform
      service_name <-- GapiLens.get_state
                         (State.service |-- RestDescription.name);
      let file =
        File.create service_name file_type in
      file_lens ^=! file;
      let _module =
        Module.create file.File.module_name in
      let module_lens = State.get_module_lens file.File.module_name in
      module_lens ^=! _module;
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
      sorted_types <-- GapiLens.get_state State.sorted_types;
      mapM_
        (fun complex_type ->
           build_schema_inner_module file_lens complex_type)
        sorted_types;
  in
    build_module SchemaModule generate_body

let build_service_module =
  let generate_scope formatter (value, _) =
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
       lift_io $
         Format.fprintf formatter "let scope%s = \"%s\"@\n@\n" suffix value;
  in

  let generate_header file_lens =
    perform
      formatter <-- GapiLens.get_state (file_lens |-- File.formatter);
      schema_module_name <-- GapiLens.get_state
                               (State.get_file_lens SchemaModule
                                  |-- File.module_name);
      lift_io $ Format.fprintf formatter "open %s@\n@\n" schema_module_name;
      (* TODO: parameters module *)
      scopes <-- GapiLens.get_state (State.service
                                       |-- RestDescription.auth
                                       |-- Oauth2Data.scopes);
      mapM_ (generate_scope formatter) scopes;
  in

  let generate_body file_lens =
    perform
      generate_header file_lens;
      resources <-- GapiLens.get_state (State.service
                                          |-- RestDescription.resources);
      mapM_
        (fun resource ->
           build_service_inner_module file_lens resource)
        resources;
  in
    build_module ServiceModule generate_body

let build_schema_module_interface state =
  (* TODO *)
  ((), state)

let build_service_module_interface state =
  (* TODO *)
  ((), state)

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

