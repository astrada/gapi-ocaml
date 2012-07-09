open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiSiteVerificationV1Model
open GapiSiteVerificationV1Service

let test_list_webresources () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (webresources, _) =
         WebResourceResource.list
           session
       in
         List.iter
           (fun webresource ->
              TestHelper.assert_not_empty
                "Web resource ID should not be empty"
                webresource.SiteVerificationWebResourceResource.id;
              assert_bool
                "Web resource should have at least 1 owner"
                ((List.length
                    webresource.SiteVerificationWebResourceResource.owners) > 0)
           )
           webresources.SiteVerificationWebResourceListResponse.items)

let test_get_token () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let request =
         SiteVerificationWebResourceGettokenRequest.(
           { verificationMethod = "FILE";
             site = {
               Site.identifier = "http://www.example.com";
               _type = "SITE"
             };
           }) in
       let (token, _) =
         WebResourceResource.getToken
           request
           session
       in
         TestHelper.assert_not_empty
           "Site verification token should not be empty"
           token.SiteVerificationWebResourceGettokenResponse.token;
         assert_equal
           "FILE"
           token.SiteVerificationWebResourceGettokenResponse._method)

let test_insert_webresource () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let request =
         SiteVerificationWebResourceResource.(
           { empty with
                 site = {
                   Site.identifier = "http://www.example.com";
                   _type = "SITE"
                 };
           }) in
         assert_raises
           (GapiService.ServiceError
              { GapiError.RequestError.code = 400;
                errors = [
                  { GapiError.SingleError.empty with
                        GapiError.SingleError.domain = "global";
                        reason = "badRequest";
                        message = "The necessary verification token could not be found on your site.";
                  }
                ];
                message = "The necessary verification token could not be found on your site.";
              })
           (fun () ->
              WebResourceResource.insert
                ~verificationMethod:"FILE"
                request
                session))

let test_get_webresource () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (webresources, session) =
         WebResourceResource.list
           session
       in
         List.iter
           (fun webresource ->
              let (webresource', session) =
                WebResourceResource.get
                  ~id:webresource.SiteVerificationWebResourceResource.id
                  session
              in
                assert_equal
                  webresource
                  webresource')
           webresources.SiteVerificationWebResourceListResponse.items)

let test_update_webresource () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (webresources, session) =
         WebResourceResource.list
           session
       in
         match webresources.SiteVerificationWebResourceListResponse.items with
             [] -> ()
           | webresource :: _ ->
               let owners =
                 "test@example.com" :: webresource.SiteVerificationWebResourceResource.owners in
               let (webresource', session) =
                 WebResourceResource.patch
                   ~id:webresource.SiteVerificationWebResourceResource.id
                   { SiteVerificationWebResourceResource.empty with
                         SiteVerificationWebResourceResource.owners = owners }
                   session in
               let (webresource'', _) =
                 WebResourceResource.update
                   ~id:webresource.SiteVerificationWebResourceResource.id
                   webresource
                   session
               in
                 assert_equal
                   webresource
                   webresource'')

let test_delete_webresource () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       assert_raises
         (Failure "Error:  (HTTP response code: 403)")
         (fun () ->
            WebResourceResource.delete
              ~id:"http://www.example.com"
              session))

let suite = "Urlshortener services test" >:::
  ["test_list_webresources" >:: test_list_webresources;
   "test_get_token" >:: test_get_token;
   "test_get_webresource" >:: test_get_webresource;
   "test_update_webresource" >:: test_update_webresource;
   (* Comment out tests using www.example.com
   "test_insert_webresource" >:: test_insert_webresource;
   "test_delete_webresource" >:: test_delete_webresource
   *)]

