open GapiUtils.Infix
module Option = GapiOption

type destination =
  | TargetFile of string
  | StringBuffer of Buffer.t
  | ArrayBuffer of
      (char, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t

type download = { destination : destination; range_spec : string }

let destination =
  {
    GapiLens.get = (fun x -> x.destination);
    GapiLens.set = (fun v x -> { x with destination = v });
  }

let range_spec =
  {
    GapiLens.get = (fun x -> x.range_spec);
    GapiLens.set = (fun v x -> { x with range_spec = v });
  }

let create_out_channel download =
  match download.destination with
  | TargetFile filename -> new Netchannels.output_channel (open_out filename)
  | StringBuffer buf -> new Netchannels.output_buffer buf
  | ArrayBuffer arr -> new GapiUtils.bigarray_out_obj_channel arr

let create_in_channel ?(discard_on_close = true) download =
  match download.destination with
  | TargetFile filename ->
      let onclose =
        if discard_on_close then
          Some
            (fun () ->
              if Sys.file_exists filename then
                try Sys.remove filename with _ -> ())
        else None
      in
      new Netchannels.input_channel ?onclose (open_in filename)
  | StringBuffer buf -> new Netchannels.input_string (Buffer.contents buf)
  | ArrayBuffer arr -> new GapiUtils.bigarray_in_obj_channel arr

let generate_download_headers download =
  match download.range_spec with
  | "" -> []
  | spec -> [ GapiCore.Header.Range spec ]

let generate_range_spec ranges =
  let n_to_s = GapiUtils.option_map_default Int64.to_string "" in
  let range_strings =
    List.map
      (fun (range_start, range_end) ->
        n_to_s range_start ^ "-" ^ n_to_s range_end)
      ranges
  in
  let range_string = String.concat "," range_strings in
  "bytes=" ^ range_string

type source =
  | File of string
  | String of string
  | Buffer of
      (char, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t

type t = {
  source : source;
  name : string;
  content_type : string;
  content_length : int64;
}

let source =
  {
    GapiLens.get = (fun x -> x.source);
    GapiLens.set = (fun v x -> { x with source = v });
  }

let name =
  {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }

let content_type =
  {
    GapiLens.get = (fun x -> x.content_type);
    GapiLens.set = (fun v x -> { x with content_type = v });
  }

let content_length =
  {
    GapiLens.get = (fun x -> x.content_length);
    GapiLens.set = (fun v x -> { x with content_length = v });
  }

type state = Request | Uploading | Done | Error

type upload_state = {
  state : state;
  resource : t;
  chunk_size : int;
  current_offset : int64;
}

let state =
  {
    GapiLens.get = (fun x -> x.state);
    GapiLens.set = (fun v x -> { x with state = v });
  }

let resource =
  {
    GapiLens.get = (fun x -> x.resource);
    GapiLens.set = (fun v x -> { x with resource = v });
  }

let chunk_size =
  {
    GapiLens.get = (fun x -> x.chunk_size);
    GapiLens.set = (fun v x -> { x with chunk_size = v });
  }

let current_offset =
  {
    GapiLens.get = (fun x -> x.current_offset);
    GapiLens.set = (fun v x -> { x with current_offset = v });
  }

let get_basename filename =
  try GapiUtils.string_after_char Filename.dir_sep.[0] filename
  with Not_found -> filename

let get_resource_length = function
  | File filename -> (
      let ch = open_in_bin filename in
      try
        let result = LargeFile.in_channel_length ch in
        close_in ch;
        result
      with e ->
        close_in ch;
        raise e )
  | String str -> str |> String.length |> Int64.of_int
  | Buffer arr -> arr |> Bigarray.Array1.dim |> Int64.of_int

let get_content_type filename =
  let extension =
    try GapiUtils.string_after_char '.' filename |> String.lowercase_ascii [@warning "-3"]
    with Not_found -> ""
  in
  match extension with
  | "csv" -> "text/csv"
  | "tab" -> "text/tab-separated-values"
  | "tsv" -> "text/tab-separated-values"
  | "txt" -> "text/plain"
  | "html" -> "text/html"
  | "htm" -> "text/html"
  | "doc" -> "application/msword"
  | "docx" ->
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
  | "ods" -> "application/x-vnd.oasis.opendocument.spreadsheet"
  | "odt" -> "application/vnd.oasis.opendocument.text"
  | "rtf" -> "application/rtf"
  | "sxw" -> "application/vnd.sun.xml.writer"
  | "xlsx" ->
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  | "xls" -> "application/vnd.ms-excel"
  | "ppt" -> "application/vnd.ms-powerpoint"
  | "pps" -> "application/vnd.ms-powerpoint"
  | "pdf" -> "application/pdf"
  | "pptx" ->
      "application/vnd.openxmlformats-officedocument.presentationml.presentation"
  | _ -> "application/octect-stream"

let create_file_resource ?content_type filename =
  let source = File filename in
  {
    source;
    name = get_basename filename;
    content_type =
      Option.value ~default:(get_content_type filename) content_type;
    content_length = get_resource_length source;
  }

let setup_upload ?(chunk_size = 524288) resource =
  { state = Request; resource; chunk_size; current_offset = 0L }

let setup_file_upload ?chunk_size filename =
  let resource = create_file_resource filename in
  setup_upload ?chunk_size resource

let generate_x_upload_headers upload_state =
  let upload_content_type =
    GapiCore.Header.UploadContentType upload_state.resource.content_type
  in
  let upload_content_length =
    GapiCore.Header.UploadContentLength
      (Int64.to_string upload_state.resource.content_length)
  in
  [ upload_content_type; upload_content_length ]

let generate_upload_chunk_headers upload_state =
  let next_chunk =
    Int64.add upload_state.current_offset (Int64.of_int upload_state.chunk_size)
  in
  let next_offset = min upload_state.resource.content_length next_chunk in
  let current_block_end = Int64.sub next_offset 1L in
  let content_range =
    Printf.sprintf "bytes %Ld-%Ld/%Ld" upload_state.current_offset
      current_block_end upload_state.resource.content_length
  in
  [
    GapiCore.Header.ContentType upload_state.resource.content_type;
    GapiCore.Header.ContentRange content_range;
  ]

let generate_resume_put_headers upload_state =
  let content_range =
    Printf.sprintf "bytes */%Ld" upload_state.resource.content_length
  in
  [ GapiCore.Header.ContentRange content_range ]

let generate_upload_headers http_method upload_state =
  match upload_state.state with
  | Request -> (
      match http_method with
      | GapiCore.HttpMethod.POST | GapiCore.HttpMethod.PUT
      | GapiCore.HttpMethod.PATCH ->
          generate_x_upload_headers upload_state
      | _ ->
          failwith
            "Cannot generate upload headers if the HTTP method is not POST or \
             PUT" )
  | Uploading -> generate_upload_chunk_headers upload_state
  | Error -> generate_resume_put_headers upload_state
  | Done -> []

let update_upload_state range_header upload_state =
  let current_offset =
    try
      GapiUtils.string_after_char '-' range_header
      |> Int64.of_string |> Int64.succ
    with Not_found -> 0L
  in
  if current_offset >= upload_state.resource.content_length then
    failwith
      (Printf.sprintf
         "Cannot updata upload state: new offset %Ld is beyond EOF (content \
          length %Ld)"
         current_offset upload_state.resource.content_length)
  else { upload_state with state = Uploading; current_offset }

let get_post_data upload_state =
  let body =
    match upload_state.resource.source with
    | File filename ->
        GapiCore.PostData.File
          (filename, upload_state.chunk_size, upload_state.current_offset)
    | String content -> GapiCore.PostData.String content
    | Buffer buffer -> GapiCore.PostData.Buffer buffer
  in
  GapiCore.PostData.Body (body, upload_state.resource.content_type)
