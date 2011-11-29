open OUnit

let acl_test_resource = {
  GapiACL.ACLResource.empty with
      GapiACL.ACLResource.kind = "calendar#acl";
      GapiACL.ACLResource.scope = {
        GapiACL.Scope._type = "user";
        GapiACL.Scope.value = "test@example.com"
      };
      GapiACL.ACLResource.role = "reader"
}

let test_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (acl, session) =
         GapiCalendarService.ACL.list
           session
       in
         assert_equal
           "calendar#acl"
           acl.GapiACL.ACLList.kind;
         assert_bool
           "There should be at least 1 ACL"
           (List.length acl.GapiACL.ACLList.items >= 1);
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_insert () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (new_entry, session) =
         GapiCalendarService.ACL.insert
           acl_test_resource
           session
       in
         ignore (GapiCalendarService.ACL.delete
                   new_entry
                   session);
         TestHelper.assert_not_empty
           "ACL id should not be empty"
           new_entry.GapiACL.ACLResource.id)

let test_get () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.ACL.insert
           acl_test_resource
           session in
       let (entry', session) =
         GapiCalendarService.ACL.get
           entry.GapiACL.ACLResource.id
           session
       in
         ignore (GapiCalendarService.ACL.delete
                   entry
                   session);
         assert_equal
           entry.GapiACL.ACLResource.id
           entry'.GapiACL.ACLResource.id)

let test_update () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.ACL.insert
           acl_test_resource
           session in
       let entry = { entry with
                         GapiACL.ACLResource.role = "freeBusyReader" } in
       let (entry, session) =
         GapiCalendarService.ACL.update
           entry
           session in
         ignore (GapiCalendarService.ACL.delete
                   entry
                   session);
         assert_equal
           "freeBusyReader"
           entry.GapiACL.ACLResource.role)

let test_delete () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (entry, session) =
         GapiCalendarService.ACL.insert
           acl_test_resource
           session in
       let (acl, session) =
         GapiCalendarService.ACL.list
           session in
       let ((), session) =
         GapiCalendarService.ACL.delete
           entry
           session in
       let (acl', _) =
         GapiCalendarService.ACL.list
           session
       in
         TestHelper.assert_exists
           "acl should contain new acl"
           (fun e ->
              e.GapiACL.ACLResource.id = entry.GapiACL.ACLResource.id)
           acl.GapiACL.ACLList.items;
         TestHelper.assert_not_exists
           "acl' should not contain new acl"
           (fun e ->
              e.GapiACL.ACLResource.id = entry.GapiACL.ACLResource.id)
           acl'.GapiACL.ACLList.items)

let suite = "Calendar ACL (v3) test" >:::
  ["test_list" >:: test_list;
   "test_insert" >:: test_insert;
   "test_get" >:: test_get;
   "test_update" >:: test_update;
   "test_delete" >:: test_delete]

