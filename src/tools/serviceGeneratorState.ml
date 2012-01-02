open GapiUtils.Infix
open GapiDiscovery
open GapiLens.Infix
open GapiLens.StateInfix

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

  let get_empty_value = function
      String -> "\"\""
    | Boolean -> "false"
    | Integer -> "0"
    | DateTime
    | Date -> "GapiDate.epoch"

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

  let get_default scalar =
    if scalar.default = "" then
      get_empty_value scalar.data_type
    else
      match scalar.data_type with
          String -> "\"" ^ scalar.default ^ "\""
        | Boolean
        | Integer
        | DateTime
        | Date -> scalar.default

  let get_to_string_function scalar =
    match scalar.data_type with
        String -> "Std.identity"
      | Boolean -> "string_of_bool"
      | Integer -> "string_of_int"
      | DateTime
      | Date -> "GapiDate.to_string"

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

  let create (original_name, property) =
    let ocaml_name = OCamlName.get_ocaml_name FieldName original_name in
      { original_name;
        ocaml_name;
        field_type = property
      }

  let get_default field =
    match field.field_type.ComplexType.data_type with
        ComplexType.Scalar scalar -> ScalarType.get_default scalar
      | _ -> failwith "Default not supported for complex types"

  let get_to_string_function field =
    match field.field_type.ComplexType.data_type with
        ComplexType.Scalar scalar -> ScalarType.get_to_string_function scalar
      | _ -> failwith "to_string function not supported for complex types"

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

(* Method description *)

module Method =
struct
  type t = {
    original_name : string;
    ocaml_name : string;
    parameters : (string * Field.t) list;
    request : Field.t option;
    response : Field.t option;
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

  let create
        original_name
        rest_parameters
        request_ref
        response_ref
        type_table =
    let get_field_from_ref reference =
      if request_ref = "" then None
      else
        let id = OCamlName.get_ocaml_name ParameterName reference in
        let complex_type = Hashtbl.find type_table reference in
          Some (Field.create (id, complex_type))
    in

    let ocaml_name = OCamlName.get_ocaml_name ValueName original_name in
    let parameters = List.map
                       (fun (id, rest_parameter) ->
                          let complex_type = ComplexType.create
                                               rest_parameter in
                            (id, Field.create (id, complex_type)))
                       rest_parameters in
    let request = get_field_from_ref request_ref in
    let response = get_field_from_ref response_ref in
      { original_name;
        ocaml_name;
        parameters;
        request;
        response;
      }

end

(* END Method description *)

(* Inner module description *)

module InnerModule =
struct
  type t = {
    original_name : string;
    ocaml_name : string;
    record : Record.t option;
    values : (string * Method.t) list;
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

let get_full_path output_path file_name =
  if ExtString.String.ends_with output_path "/" then
    output_path ^ file_name
  else
    output_path ^ "/" ^ file_name

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
    service_version : string;
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
	let service_version = {
		GapiLens.get = (fun x -> x.service_version);
		GapiLens.set = (fun v x -> { x with service_version = v })
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

  let create service_name service_version output_path file_type =
    let base_name = service_name ^ (String.capitalize service_version) in
    let ocaml_name = OCamlName.get_ocaml_name ModuleName base_name in
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
      get_full_path output_path ((String.uncapitalize module_name) ^ extension)
    in
      { file_type;
        service_name;
        service_version;
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

  (* TODO: Topological sort: see http://stackoverflow.com/questions/4653914/topological-sort-in-ocaml *)
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
    schema_module : Module.t option;
    service_module : Module.t option;
    type_table : TypeTable.t;
    sorted_types : ComplexType.t list;
    referenced_types : StringSet.t;
    parameters_module_name : string;
  }

  let service = {
		GapiLens.get = (fun x -> x.service);
		GapiLens.set = (fun v x -> { x with service = v })
  }
	let files = {
		GapiLens.get = (fun x -> x.files);
		GapiLens.set = (fun v x -> { x with files = v })
	}
	let schema_module = {
		GapiLens.get = (fun x -> x.schema_module);
		GapiLens.set = (fun v x -> { x with schema_module = v })
	}
	let service_module = {
		GapiLens.get = (fun x -> x.service_module);
		GapiLens.set = (fun v x -> { x with service_module = v })
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
	let parameters_module_name = {
		GapiLens.get = (fun x -> x.parameters_module_name);
		GapiLens.set = (fun v x -> { x with parameters_module_name = v })
	}
  let file file_type = GapiLens.for_hash file_type

  let get_schema_module_lens =
    schema_module |-- GapiLens.option_get

  let get_service_module =
    service_module |-- GapiLens.option_get

  let get_file_lens file_type =
    files |-- file file_type |-- GapiLens.option_get

  let create service = {
    service;
    files = Hashtbl.create 4;
    schema_module = None;
    service_module = None;
    type_table = TypeTable.create ();
    sorted_types = [];
    referenced_types = StringSet.empty;
    parameters_module_name = "";
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

  let find_inner_schema_module id state =
    if id = "" then
      (None, state)
    else
      let inner_module = state
        |. get_schema_module_lens
        |. Module.get_inner_module_lens id
      in
        (Some inner_module, state)

end

(* END Generator state *)

