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
      [GapiCore.Header.Slug "test.pdf";
       GapiCore.Header.UploadContentType "application/pdf";
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

let suite = "Media resource test" >:::
  ["test_setup_upload" >:: test_setup_upload;
   "test_generate_upload_request_post_headers"
     >:: test_generate_upload_request_post_headers;
   "test_generate_upload_request_put_headers"
     >:: test_generate_upload_request_put_headers;
   "test_generate_upload_chunk_headers" >:: test_generate_upload_chunk_headers;
   "test_generate_resume_put_headers" >:: test_generate_resume_put_headers;
   "test_update_upload_state" >:: test_update_upload_state;
  ]

