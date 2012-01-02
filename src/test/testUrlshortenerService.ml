open OUnit
open GapiUtils.Infix
open GapiLens.Infix

let google_url_id = "http://goo.gl/fbsS"

let test_get_url () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, _) =
         GapiUrlshortenerService.UrlResource.get
           ~shortUrl:google_url_id
           session
       in
         assert_equal
           "urlshortener#url"
           entry.GapiUrlshortenerSchema.Url.kind;
         assert_equal
           google_url_id
           entry.GapiUrlshortenerSchema.Url.id)

let new_url = {
  GapiUrlshortenerSchema.Url.empty with
    GapiUrlshortenerSchema.Url.longUrl = "http://www.google.com/"
}

let test_insert_url () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiUrlshortenerService.UrlResource.insert
           new_url
           session
       in
         TestHelper.assert_not_empty
           "Url id should not be empty"
           new_entry.GapiUrlshortenerSchema.Url.id)

let test_list_url () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (urls, _) =
         GapiUrlshortenerService.UrlResource.list
           session
       in
         assert_equal
           "urlshortener#urlHistory"
           urls.GapiUrlshortenerSchema.UrlHistory.kind)

let suite = "Urlshortener services test" >:::
  ["test_get_url" >:: test_get_url;
   "test_list_url" >:: test_list_url;
   "test_insert_url" >:: test_insert_url]

