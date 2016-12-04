type destination =
    TargetFile of string
  | StringBuffer of Buffer.t
  | ArrayBuffer of (char,
                    Bigarray.int8_unsigned_elt,
                    Bigarray.c_layout) Bigarray.Array1.t

type download = {
  destination : destination;
  range_spec : string;
}

val destination : (download, destination) GapiLens.t
val range_spec : (download, string) GapiLens.t

val create_out_channel :
  download -> Netchannels.out_obj_channel

val create_in_channel :
  ?discard_on_close:bool -> download -> Netchannels.in_obj_channel

val generate_download_headers :
  download -> GapiCore.Header.t list

val generate_range_spec :
  (int64 option * int64 option) list -> string

type source =
    File of string
  | String of string
  | Buffer of (char,
               Bigarray.int8_unsigned_elt,
               Bigarray.c_layout) Bigarray.Array1.t

type t = {
  source : source;
  name : string;
  content_type : string;
  content_length : int64;
}

val source : (t, source) GapiLens.t
val name : (t, string) GapiLens.t
val content_type : (t, string) GapiLens.t
val content_length : (t, int64) GapiLens.t

type state =
    Request
  | Uploading
  | Done
  | Error

type upload_state = {
  state : state;
  resource : t;
  chunk_size : int;
  current_offset : int64;
}

val state : (upload_state, state) GapiLens.t
val resource : (upload_state, t) GapiLens.t
val chunk_size : (upload_state, int) GapiLens.t
val current_offset : (upload_state, int64) GapiLens.t

val create_file_resource :
  string -> t

val setup_upload :
  ?chunk_size:int -> t -> upload_state

val setup_file_upload :
  ?chunk_size:int -> string -> upload_state

val generate_upload_headers :
  GapiCore.HttpMethod.t -> upload_state -> GapiCore.Header.t list

val update_upload_state :
  string -> upload_state -> upload_state

val get_post_data :
  upload_state -> GapiCore.PostData.t

