open OUnit
open GapiUtils.Infix
open GapiLens.Infix

let test_setup_upload () =
  let upload_state =
    GapiMediaResource.setup_file_upload "test_data/test.pdf"
  in
    assert_equal
      { GapiMediaResource.state = GapiMediaResource.Request;
        resource = {
          GapiMediaResource.source =
            GapiMediaResource.File "test_data/test.pdf";
          name = "test.pdf";
          content_type = "application/pdf";
          content_length = 3908L;
        };
        chunk_size = 524288;
        current_offset = 0L;
      }
      upload_state

let test_generate_upload_request_post_headers () =
  let upload_state =
    GapiMediaResource.setup_file_upload "test_data/test.pdf" in
  let headers =
    GapiMediaResource.generate_upload_headers
      GapiCore.HttpMethod.POST
      upload_state
  in
    assert_equal
      [GapiCore.Header.UploadContentType "application/pdf";
       GapiCore.Header.UploadContentLength "3908"]
      headers

let test_generate_upload_request_put_headers () =
  let upload_state =
    GapiMediaResource.setup_file_upload "test_data/test.pdf" in
  let headers =
    GapiMediaResource.generate_upload_headers
      GapiCore.HttpMethod.PUT
      upload_state
  in
    assert_equal
      [GapiCore.Header.UploadContentType "application/pdf";
       GapiCore.Header.UploadContentLength "3908"]
      headers

let test_generate_upload_chunk_headers () =
  let upload_state =
    GapiMediaResource.setup_file_upload ~chunk_size:1000 "test_data/test.pdf" in
  let upload_state = upload_state
    |> GapiMediaResource.state ^= GapiMediaResource.Uploading in
  let headers_start =
    GapiMediaResource.generate_upload_headers
      GapiCore.HttpMethod.PUT
      upload_state in
  let headers_cont =
    GapiMediaResource.generate_upload_headers
      GapiCore.HttpMethod.PUT
      { upload_state with GapiMediaResource.current_offset = 1000L } in
  let headers_last =
    GapiMediaResource.generate_upload_headers
      GapiCore.HttpMethod.PUT
      { upload_state with GapiMediaResource.current_offset = 3000L }
  in
    assert_equal
      [GapiCore.Header.ContentType "application/pdf";
       GapiCore.Header.ContentRange "bytes 0-999/3908"]
      headers_start;
    assert_equal
      [GapiCore.Header.ContentType "application/pdf";
       GapiCore.Header.ContentRange "bytes 1000-1999/3908"]
      headers_cont;
    assert_equal
      [GapiCore.Header.ContentType "application/pdf";
       GapiCore.Header.ContentRange "bytes 3000-3907/3908"]
      headers_last

let test_generate_resume_put_headers () =
  let upload_state =
    GapiMediaResource.setup_file_upload "test_data/test.pdf" in
  let upload_state = upload_state
    |> GapiMediaResource.state ^= GapiMediaResource.Error in
  let headers =
    GapiMediaResource.generate_upload_headers
      GapiCore.HttpMethod.PUT
      upload_state
  in
    assert_equal
      [GapiCore.Header.ContentRange "bytes */3908"]
      headers

let test_update_upload_state () =
  let upload_state =
    GapiMediaResource.setup_file_upload "test_data/test.pdf" in
  let upload_state' =
    GapiMediaResource.update_upload_state "bytes 0-999" upload_state
  in
    assert_equal
      1000L
      upload_state'.GapiMediaResource.current_offset

let test_generate_range_spec () =
  assert_equal
    "bytes=-500"
    (GapiMediaResource.generate_range_spec [(None, Some 500L)]);
  assert_equal
    "bytes=9500-"
    (GapiMediaResource.generate_range_spec [(Some 9500L, None)]);
  assert_equal
    "bytes=0-0,-1"
    (GapiMediaResource.generate_range_spec [(Some 0L, Some 0L);
                                            (None, Some 1L)]);
  assert_equal
    "bytes=500-600,601-999"
    (GapiMediaResource.generate_range_spec [(Some 500L, Some 600L);
                                            (Some 601L, Some 999L)]);
  assert_equal
    "bytes=500-700,601-999"
    (GapiMediaResource.generate_range_spec [(Some 500L, Some 700L);
                                            (Some 601L, Some 999L)])

let test_generate_download_headers () =
  let range_spec =
    GapiMediaResource.generate_range_spec [(Some 5L, Some 12L)] in
  let download = {
    GapiMediaResource.destination =
      GapiMediaResource.TargetFile "/tmp/test.pdf";
    range_spec;
  } in
  let headers =
    GapiMediaResource.generate_download_headers download
  in
    assert_equal
      [GapiCore.Header.Range "bytes=5-12"]
      headers

let test_create_out_channel_bigarray _ =
  let buffer =
    Bigarray.Array1.create Bigarray.char Bigarray.c_layout 3 in
  let media_destination = GapiMediaResource.ArrayBuffer buffer in
  let download = {
    GapiMediaResource.destination = media_destination;
    range_spec = ""
  } in
  let out_channel = GapiMediaResource.create_out_channel download in
  let pipe = GapiPipe.OcamlnetPipe.create ~out_channel () in
  GapiPipe.OcamlnetPipe.write_string pipe "abc";
  GapiPipe.OcamlnetPipe.end_writing pipe;
  out_channel#close_out ();
  assert_equal 'a' (Bigarray.Array1.get buffer 0);
  assert_equal 'b' (Bigarray.Array1.get buffer 1);
  assert_equal 'c' (Bigarray.Array1.get buffer 2)

let suite = "Media resource test" >:::
  ["test_setup_upload" >:: test_setup_upload;
   "test_generate_upload_request_post_headers"
     >:: test_generate_upload_request_post_headers;
   "test_generate_upload_request_put_headers"
     >:: test_generate_upload_request_put_headers;
   "test_generate_upload_chunk_headers" >:: test_generate_upload_chunk_headers;
   "test_generate_resume_put_headers" >:: test_generate_resume_put_headers;
   "test_update_upload_state" >:: test_update_upload_state;
   "test_generate_range_spec" >:: test_generate_range_spec;
   "test_generate_download_headers" >:: test_generate_download_headers;
   "test_create_out_channel_bigarray" >:: test_create_out_channel_bigarray]

