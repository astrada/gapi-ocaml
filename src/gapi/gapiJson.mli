(** Utilities to manipulate JSON documents.
  *)

type json_data_type =
    Object
  | Array
  | Scalar

val json_data_type_to_string : json_data_type -> string

type json_metadata = {
  name : string;
  data_type : json_data_type
}

val metadata_description : json_metadata -> string

type json_data_model =
  (json_metadata, Yojson.Safe.json) GapiCore.AnnotatedTree.t

val unexpected : string -> json_data_model -> 'a -> 'a

val render_value :
  string ->
  Yojson.Safe.json ->
  Yojson.Safe.json ->
  json_data_model list

val render_string_value :
  ?default:string ->
  string ->
  string ->
  json_data_model list

val render_int_value :
  ?default:int ->
  string ->
  int ->
  json_data_model list

val render_int64_value :
  ?default:int64 ->
  string ->
  int64 ->
  json_data_model list

val render_bool_value :
  ?default:bool ->
  string ->
  bool ->
  json_data_model list

val render_float_value :
  ?default:float ->
  string ->
  float ->
  json_data_model list

val render_date_value :
  ?time:bool ->
  ?default:GapiDate.t ->
  string ->
  GapiDate.t ->
  json_data_model list

val render_struct :
  string ->
  json_data_type ->
  json_data_model list list ->
  json_data_model list

val render_object :
  string ->
  json_data_model list list ->
  json_data_model list

val render_collection :
  string ->
  json_data_type ->
  ('a -> json_data_model list) ->
  'a list ->
  json_data_model list

val render_array :
  string ->
  ('a -> json_data_model list) ->
  'a list ->
  json_data_model list

val render_root :
  ('a -> json_data_model list) ->
  'a ->
  json_data_model

val parse_children :
  ('a -> json_data_model -> 'a) ->
  'a ->
  ('a -> 'b) ->
  json_data_model list ->
  'b

val parse_collection :
  ('a -> json_data_model -> 'a) ->
  'a ->
  ('a list -> 'b) ->
  json_data_model list ->
  'b

val parse_root :
  ('a -> json_data_model -> 'a) ->
  'a ->
  json_data_model ->
  'a

val parse_string_element :
  string ->
  json_data_model ->
  string

val parse_dictionary_entry :
  (string * string) ->
  json_data_model ->
  (string * string)

val json_to_data_model :
  Yojson.Safe.json ->
  json_data_model

val data_model_to_json :
  json_data_model ->
  Yojson.Safe.json

val parse_json_response :
  (json_data_model -> 'a) ->
  GapiPipe.OcamlnetPipe.t ->
  'a

val default_content_type : string

val render_json :
  ('a -> json_data_model) ->
  'a ->
  GapiCore.PostData.t

module StringDictionary :
sig
  type t = (string * string) list
  
  val empty : t
  
  val render : t -> json_data_model list
  
  val render_content : t -> json_data_model list list

  val parse : t -> json_data_model -> t
  
  val to_data_model : t -> json_data_model
  
  val of_data_model : json_data_model -> t
  
end

