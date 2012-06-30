open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiAnalyticsV3Model
open GapiAnalyticsV3Service

let test_list_segments () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (segments, session) =
         ManagementResource.Segments.list
           session in
         assert_equal
           "analytics#segments"
           segments.Segments.kind)

let test_list_accounts () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (accounts, session) =
         ManagementResource.Accounts.list
           session in
         assert_equal
           "analytics#accounts"
           accounts.Accounts.kind)

let get_account_id session =
  let (accounts, session) =
    ManagementResource.Accounts.list
      session
  in
    accounts
    |. Accounts.items
    |. GapiLens.head
    |. Account.id

let test_list_webproperties () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let accountId = get_account_id session in
       let (webproperties, session) =
         ManagementResource.Webproperties.list
           ~accountId
           session in
         assert_equal
           "analytics#webproperties"
           webproperties.Webproperties.kind)

let test_list_profiles () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let accountId = get_account_id session in
       let (profiles, session) =
         ManagementResource.Profiles.list
           ~accountId
           ~webPropertyId:"~all"
           session in
         assert_equal
           "analytics#profiles"
           profiles.Profiles.kind)

let test_list_goals () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let accountId = get_account_id session in
       let (goals, session) =
         ManagementResource.Goals.list
           ~accountId
           ~webPropertyId:"~all"
           ~profileId:"~all"
           session in
         assert_equal
           "analytics#goals"
           goals.Goals.kind)

let test_get_data () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let accountId = get_account_id session in
       let (profiles, session) =
         ManagementResource.Profiles.list
           ~accountId
           ~webPropertyId:"~all"
           session in
       let profile_id = profiles
         |. Profiles.items
         |. GapiLens.head
         |. Profile.id in
       let (data, session) =
         DataResource.Ga.get
           ~ids:("ga:" ^ profile_id)
           ~start_date:"2012-02-20"
           ~end_date:"2012-02-23"
           ~metrics:"ga:visits"
           session
       in
         assert_equal
           "analytics#gaData"
           data.GaData.kind;
         TestHelper.assert_not_empty
           "Report ID should not be empty"
           data.GaData.id;
         assert_equal
           accountId
           GaData.(data.profileInfo.ProfileInfo.accountId);
         assert_equal
           profile_id
           GaData.(data.profileInfo.ProfileInfo.profileId))

let suite = "Google Analytics services test" >:::
  ["test_list_segments" >:: test_list_segments;
   "test_list_accounts" >:: test_list_accounts;
   "test_list_webproperties" >:: test_list_webproperties;
   "test_list_profiles" >:: test_list_profiles;
   "test_list_goals" >:: test_list_goals;
   "test_get_data" >:: test_get_data]

