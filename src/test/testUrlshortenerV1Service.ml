open OUnit
open GapiUtils.Infix
open GapiLens.Infix

let google_url_id = "http://goo.gl/fbsS"

let test_get_url () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, _) =
         GapiUrlshortenerV1Service.UrlResource.get
           ~projection:GapiUrlshortenerV1Service.Projection.ANALYTICS_CLICKS
           ~shortUrl:google_url_id
           session
       in
         assert_equal
           "urlshortener#url"
           entry.GapiUrlshortenerV1Schema.Url.kind;
         assert_equal
           "http://www.google.com/"
           entry.GapiUrlshortenerV1Schema.Url.longUrl;
         assert_equal
           google_url_id
           entry.GapiUrlshortenerV1Schema.Url.id;
         assert_bool
           "All time long url clicks should be greater than 0"
           GapiUrlshortenerV1Schema.(int_of_string entry.Url.analytics.AnalyticsSummary.allTime.AnalyticsSnapshot.longUrlClicks > 0))

let new_url = {
  GapiUrlshortenerV1Schema.Url.empty with
    GapiUrlshortenerV1Schema.Url.longUrl = "http://www.google.com/"
}

let test_insert_url () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiUrlshortenerV1Service.UrlResource.insert
           new_url
           session
       in
         TestHelper.assert_not_empty
           "Url id should not be empty"
           new_entry.GapiUrlshortenerV1Schema.Url.id)

let test_list_url () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (urls, _) =
         GapiUrlshortenerV1Service.UrlResource.list
           session
       in
         assert_equal
           "urlshortener#urlHistory"
           urls.GapiUrlshortenerV1Schema.UrlHistory.kind)

let suite = "Urlshortener services test" >:::
  ["test_get_url" >:: test_get_url;
   "test_list_url" >:: test_list_url;
   "test_insert_url" >:: test_insert_url]

