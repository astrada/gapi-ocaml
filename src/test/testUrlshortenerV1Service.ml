open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiUrlshortenerV1Model
open GapiUrlshortenerV1Service

let google_url_id = "http://goo.gl/fbsS"

let test_get_url () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, _) =
         UrlResource.get
           ~projection:UrlResource.Projection.ANALYTICS_CLICKS
           ~shortUrl:google_url_id
           session
       in
         assert_equal
           "urlshortener#url"
           entry.Url.kind;
         assert_equal
           "http://www.google.com/"
           entry.Url.longUrl;
         assert_equal
           google_url_id
           entry.Url.id;
         assert_bool
           "All time long url clicks should be greater than 0"
           (entry.Url.analytics.AnalyticsSummary.allTime.AnalyticsSnapshot.longUrlClicks > 0L))

let new_url = {
  Url.empty with
    Url.longUrl = "http://www.google.com/"
}

let test_insert_url () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         UrlResource.insert
           new_url
           session
       in
         TestHelper.assert_not_empty
           "Url id should not be empty"
           new_entry.Url.id)

let test_list_url () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (urls, _) =
         UrlResource.list
           session
       in
         assert_equal
           "urlshortener#urlHistory"
           urls.UrlHistory.kind)

let suite = "Urlshortener services test" >:::
  ["test_get_url" >:: test_get_url;
   "test_list_url" >:: test_list_url;
   "test_insert_url" >:: test_insert_url]

