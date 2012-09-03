(* Analytics service samples
 * Management API: http://code.google.com/apis/analytics/docs/mgmt/v3/mgmtJava.html
 * Core Reporting API: http://code.google.com/apis/analytics/docs/gdata/v3/exportJava.html *)

(*** Setup ***)

open GapiUtils.Infix
open GapiAnalyticsV3Model
open GapiAnalyticsV3Service

(*** How to configure your client and authenticate using OAuth 2.0 for native
   * applications. ***)

let application_name = "YOUR_APPLICATION_NAME"

(* The clientId and clientSecret are copied from the API Access tab on
 * the Google APIs Console *)
let client_id = "YOUR_CLIENT_ID"
let client_secret = "YOUR_CLIENT_SECRET"

let configuration =
  { GapiConfig.default with
        GapiConfig.application_name = application_name;
        GapiConfig.auth = GapiConfig.OAuth2
                            { GapiConfig.client_id;
                              client_secret } }

(* Or your redirect URL for web based applications. *)
let redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
let scope = [GapiAnalyticsV3Service.scope_readonly]

(* Step 1: Authorize --> *)
let authorization_url =
  GapiOAuth2.authorization_code_url
    ~redirect_uri
    ~scope
    ~response_type:"code"
    client_id

(* Point or redirect your user to the authorization_url. *)
let () = print_endline "Go to the following link in your browser:";
         print_endline authorization_url

(* Read the authorization code from the standard input stream. *)
let () = print_endline "What is the authorization code?"
let code = input_line stdin
(* End of Step 1 <-- *)

(* Start a new session *)
let () =
  GapiConversation.with_curl
    configuration
    (fun session ->
       (* Step 2: Exchange --> *)
       let (response, session) =
         GapiOAuth2.get_access_token
           ~client_id
           ~client_secret
           ~code
           ~redirect_uri
           session in

       let (access_token, refresh_token) =
         match response with
             GapiAuthResponse.OAuth2AccessToken token ->
               (token.GapiAuthResponse.OAuth2.access_token,
                token.GapiAuthResponse.OAuth2.refresh_token)
           | _ -> failwith "Not supported OAuth2 response" in
       (* End of Step 2 <-- *)

       (* Update session with OAuth2 tokens *)
       let session = {
         session with
             GapiConversation.Session.auth =
               GapiConversation.Session.OAuth2 {
                 GapiConversation.Session.oauth2_token = access_token;
                 refresh_token
               }
       } in

       (*** Management API ***)

       (*** Working with accounts ***)

       let (accounts, session) =
         ManagementResource.Accounts.list
           session in

       List.iter
         (fun account ->
            Printf.printf "Account ID: %s\n" account.Account.id;
            Printf.printf "Account Name: %s\n" account.Account.name;
            Printf.printf "Account Created: %s\n"
              (GapiDate.to_string account.Account.created);
            Printf.printf "Account Updated: %s\n"
              (GapiDate.to_string account.Account.updated))
         accounts.Accounts.items;

       (*** Working with Web Properties ***)

       (* An application can request a list of the web properties for one of a
        * user's accounts by using the Analytics service object and passing the
        * Account ID to the list method. For example, the following code
        * requests a list of all web properties for the account with ID 12345.
        *)
       let (accounts, session) =
         ManagementResource.Webproperties.list
           ~accountId:"12345"
           session in

       (* The list method for web properties requires an accountId parameter
        * that specifies which account to use when retrieving the list of web
        * properties. To retrieve the web properties for all of the user's
        * accounts, you can use the wildcard ~all as the accountId, as shown in
        * the following code. *)
       let (webproperties, session) =
         ManagementResource.Webproperties.list
           ~accountId:"~all"
           session in

       List.iter
         (fun webproperty ->
            Printf.printf "Account ID: %s\n" webproperty.Webproperty.accountId;
            Printf.printf "Web Property ID: %s\n" webproperty.Webproperty.id;
            Printf.printf "Web Property Name: %s\n"
              webproperty.Webproperty.name;
            Printf.printf "Web Property Internal Id: %s\n"
              webproperty.Webproperty.internalWebPropertyId;
            Printf.printf "Web Property Created: %s\n"
              (GapiDate.to_string webproperty.Webproperty.created);
            Printf.printf "Web Property Updated: %s\n"
              (GapiDate.to_string webproperty.Webproperty.updated))
         webproperties.Webproperties.items;

       (*** Working with Profiles ***)

       (* To request profiles for a particular account and web property, you
        * specify each ID, as shown in the following example code. *)
       let (profiles, session) =
         ManagementResource.Profiles.list
           ~accountId:"12345"
           ~webPropertyId:"UA-12345-1"
           session in

       (* To request the profiles for all the web properties of a particular
        * account, you can use the ~all wildcard in place of the webPropertyId.
        * The result of the following code is a list of Profiles for all the web
        * properties of the account with ID 12345.*)
       let (profiles, session) =
         ManagementResource.Profiles.list
           ~accountId:"12345"
           ~webPropertyId:"~all"
           session in

       (* To request all profiles available to the user, you use the ~all
        * wildcard for both ID parameters. The result of the following code is a
        * list of profiles for all the web properties of all the user's
        * accounts. *)
       let (profiles, session) =
         ManagementResource.Profiles.list
           ~accountId:"~all"
           ~webPropertyId:"~all"
           session in

       (* Note: In all Management API requests, the use of the wildcard ~all is
        * governed by this rule: you cannot specify a particular child ID as a
        * parameter if you used ~all for its parent. For example, the following
        * request is invalid because it passes accountId as the parent of the
        * web property UA-123-1 rather than a specific accountId.

        let (profiles, session) =
          ManagementResource.Profiles.list
            ~accountId:"~all"
            ~webPropertyId:"UA-123-1"
            session in
        *)

       List.iter
         (fun profile ->
            Printf.printf "Account ID: %s\n" profile.Profile.accountId;
            Printf.printf "Web Property ID: %s\n" profile.Profile.webPropertyId;
            Printf.printf "Web Property Internal Id: %s\n"
              profile.Profile.internalWebPropertyId;
            Printf.printf "Profile ID: %s\n" profile.Profile.id;
            Printf.printf "Profile Name: %s\n" profile.Profile.name;

            Printf.printf "Profile defaultPage: %s\n"
              profile.Profile.defaultPage;
            Printf.printf "Profile Exclude Query Parameters: %s\n"
              profile.Profile.excludeQueryParameters;
            Printf.printf "Profile Site Search Query Parameters: %s\n"
              profile.Profile.siteSearchQueryParameters;
            Printf.printf "Profile Site Search Category Parameters: %s\n"
              profile.Profile.siteSearchCategoryParameters;

            Printf.printf "Profile Currency: %s\n" profile.Profile.currency;
            Printf.printf "Profile Timezone: %s\n" profile.Profile.timezone;
            Printf.printf "Profile Created: %s\n"
              (GapiDate.to_string profile.Profile.created);
            Printf.printf "Profile Updated: %s\n"
              (GapiDate.to_string profile.Profile.updated))
         profiles.Profiles.items;

       (*** Working with Goals ***)

       (* To request goals for a single profile, you specify the ID of an
        * account, web property, and profile, as in the following code. *)
       let (goals, session) =
         ManagementResource.Goals.list
           ~accountId:"12345"
           ~webPropertyId:"UA-12345-1"
           ~profileId:"420"
           session in

       (* To request all goals for all profiles for the user, you can use the
        * ~all wildcard, as in the following code. *)
       let (goals, session) =
         ManagementResource.Goals.list
           ~accountId:"~all"
           ~webPropertyId:"~all"
           ~profileId:"~all"
           session in

       (* Note: In all Management API requests, the use of the wildcard ~all is
        * governed by the rule defined in Mixing IDs and wildcard: you cannot
        * specify a particular child ID as a parameter if you used ~all for its
        * parent.
        *
        * For example, the following list request is invalid because it passes
        * the specific profileID 420 but uses the wildcard ~all as the
        * webPropertyId.
        
        let (goals, session) =
         ManagementResource.Goals.list
           ~accountId:"~all"
           ~webPropertyId:"~all"
           ~profileId:"420"
           session in
        *)

       (* URL_DESTINATION Goal *)
       let printGoalUrlDestinationDetails destination =
         let open Goal in
         Printf.printf "Goal URL: %s\n"
           destination.UrlDestinationDetailsData.url;
         Printf.printf "Case Sensitive: %b\n"
           destination.UrlDestinationDetailsData.caseSensitive;
         Printf.printf "Match Type: %s\n"
           destination.UrlDestinationDetailsData.matchType;
         Printf.printf "First Step Required: %b\n"
           destination.UrlDestinationDetailsData.firstStepRequired;
         if destination.UrlDestinationDetailsData.steps <> [] then begin
           print_endline "Goal Steps:";
           List.iter
             (fun step ->
                let open UrlDestinationDetailsData in
                Printf.printf "Step Number: %d\n" step.StepsData.number;
                Printf.printf "Name: %s\n" step.StepsData.name;
                Printf.printf "URL: %s\n" step.StepsData.url;
             )
             destination.UrlDestinationDetailsData.steps
         end else begin
           print_endline "No steps configured";
         end
       in

       (* VISIT_TIME_ON_SITE Goal *)
       let printGoalVisitTimeOnSiteDetails time =
         let open Goal in
         print_endline "Goal type: VISIT_TIME_ON_SITE";
         Printf.printf "VISIT_TIME_ON_SITE - Comparison Type: %s\n"
           time.VisitTimeOnSiteDetailsData.comparisonType;
         Printf.printf "VISIT_TIME_ON_SITE - Comparison Value: %s\n"
           time.VisitTimeOnSiteDetailsData.comparisonValue
       in

       (* VISIT_NUM_PAGES Goal *)
       let printGoalVisitNumPagesDetails pages =
         let open Goal in
         print_endline "Goal type: VISIT_NUM_PAGES";
         Printf.printf "VISIT_NUM_PAGES - Comparison Type: %s\n"
           pages.VisitNumPagesDetailsData.comparisonType;
         Printf.printf "VISIT_NUM_PAGES - Comparison Value: %s\n"
           pages.VisitNumPagesDetailsData.comparisonValue
       in

       (* EVENT Goal *)
       let printGoalEventDetails event =
         let open Goal in
         print_endline "Goal type: EVENT";
         Printf.printf "EVENT - Use Event Value: %b\n"
           event.EventDetailsData.useEventValue;
         if event.EventDetailsData.eventConditions <> [] then begin
           print_endline "Goal Conditions:";
           List.iter
             (fun conditions ->
                let open EventDetailsData in
                Printf.printf "Type: %s\n" conditions.EventConditionsData._type;
                if conditions.EventConditionsData._type = "VALUE" then begin
                  Printf.printf "Comparison Type: %s\n"
                    conditions.EventConditionsData.comparisonType;
                  Printf.printf "Comparison Value: %s\n"
                    conditions.EventConditionsData.comparisonValue;
                end else begin
                  Printf.printf "matchType: %s\n"
                    conditions.EventConditionsData.matchType;
                  Printf.printf "expression: %s\n"
                    conditions.EventConditionsData.expression;
                end)
             event.EventDetailsData.eventConditions
         end
       in

       List.iter
         (fun goal ->
            Printf.printf "Account ID: %s\n" goal.Goal.accountId;
            Printf.printf "Web Property ID: %s\n" goal.Goal.webPropertyId;
            Printf.printf "Web Property Internal Id: %s\n"
              goal.Goal.internalWebPropertyId;
            Printf.printf "Profile ID: %s\n" goal.Goal.profileId;

            Printf.printf "Goal Number: %s\n" goal.Goal.id;
            Printf.printf "Goal Name: %s\n" goal.Goal.name;
            Printf.printf "Goal Active: %b\n" goal.Goal.active;
            Printf.printf "Goal Value: %f\n" goal.Goal.value;
            Printf.printf "Goal Type: %s\n" goal.Goal._type;
            Printf.printf "Goal Created: %s\n"
              (GapiDate.to_string goal.Goal.created);
            Printf.printf "Goal Updated: %s\n"
              (GapiDate.to_string goal.Goal.updated);
            printGoalUrlDestinationDetails goal.Goal.urlDestinationDetails;
            printGoalVisitTimeOnSiteDetails goal.Goal.visitTimeOnSiteDetails;
            printGoalVisitNumPagesDetails goal.Goal.visitNumPagesDetails;
            printGoalEventDetails goal.Goal.eventDetails)
         goals.Goals.items;

       (*** Working with Advanced Segments ***)

       let (segments, session) =
         ManagementResource.Segments.list
           session in

       List.iter
         (fun segment ->
            Printf.printf "Advanced Segment ID: %s\n" segment.Segment.id;
            Printf.printf "Advanced Segment Name: %s\n" segment.Segment.name;
            Printf.printf "Advanced Segment Definition: %s\n"
              segment.Segment.definition;

            if segment.Segment.created <> GapiDate.epoch then begin
              Printf.printf "Advanced Segment Created: %s\n"
                (GapiDate.to_string segment.Segment.created);
              Printf.printf "Advanced Segment Updated: %s\n"
                (GapiDate.to_string segment.Segment.updated)
            end)
         segments.Segments.items;
       
       (*** Retrieving Analytics data ***)

       let (ga_data, session) =
         DataResource.Ga.get
           ~ids:"ga:420" (* "ga:" + Profile ID *)
           ~start_date:"2011-09-01"
           ~end_date:"2011-09-30"
           ~metrics:"ga:visits,ga:pageviews"
           ~dimensions:"ga:source,ga:medium"
           ~filters:"ga:medium==referral"
           ~sort:"-ga:visit"
           ~segment:"gaid::-11"
           ~max_results:50
           session in

       (*** Working with Analytics data ***)

       (* ColumnHeader data *)
       let print_column_header data =
         print_endline "Column Headers:";
         List.iter
           (fun header ->
              let open GaData in
              Printf.printf "Column Name: %s\n" header.ColumnHeadersData.name;
              Printf.printf "Column Type: %s\n"
                header.ColumnHeadersData.columnType;
              Printf.printf "Column Data Type: %s\n"
                header.ColumnHeadersData.dataType)
           data.GaData.columnHeaders;
       in

       (* Row data *)
       let print_table_data data =
         if data.GaData.totalResults > 0 then begin
           print_endline "Data Table:";

           (* Print the column names. *)
           List.iter
             (fun header ->
                let open GaData in
                Printf.printf "%-32s"
                  (header.ColumnHeadersData.name ^ "(" ^
                   header.ColumnHeadersData.dataType ^ ")"))
             data.GaData.columnHeaders;
           print_newline ();

           (* Print the rows of data. *)
           List.iter
             (fun row_values ->
                List.iter
                  (fun value ->
                     Printf.printf "%-32s" value)
                  row_values;
                print_newline())
             data.GaData.rows
         end else begin
           print_endline "No data";
         end
       in

       (* Report information *)
       let print_response_info data =
         print_newline ();
         print_endline "Response:";
         Printf.printf "ID: %s\n" data.GaData.id;
         Printf.printf "Self link: %s\n" data.GaData.selfLink;
         Printf.printf "Kind: %s\n" data.GaData.kind;
         Printf.printf "Contains Sampled Data: %b\n"
           data.GaData.containsSampledData
       in

       (* Profile information *)
       let print_profile_info data =
         let profile_info = data.GaData.profileInfo in

         print_endline "Profile Info";
         let open GaData in
         Printf.printf "Account ID: %s\n"
           profile_info.ProfileInfoData.accountId;
         Printf.printf "Web Property ID: %s\n"
           profile_info.ProfileInfoData.webPropertyId;
         Printf.printf "Internal Web Property ID: %s\n"
           profile_info.ProfileInfoData.internalWebPropertyId;
         Printf.printf "Profile ID: %s\n"
           profile_info.ProfileInfoData.profileId;
         Printf.printf "Profile Name: %s\n"
           profile_info.ProfileInfoData.profileName;
         Printf.printf "Table ID: %s\n"
           profile_info.ProfileInfoData.tableId
       in

       (* Query information *)
       let print_query_info data =
         let query_info = data.GaData.query in

         print_endline "Query Info:";
         let open GaData in
         Printf.printf "Ids: %s\n" query_info.QueryData.ids;
         Printf.printf "Start Date: %s\n" query_info.QueryData.start_date;
         Printf.printf "End Date: %s\n" query_info.QueryData.end_date;
         Printf.printf "Metrics: %s\n"
           (String.concat "," query_info.QueryData.metrics);
         Printf.printf "Dimensions: %s\n" query_info.QueryData.dimensions;
         Printf.printf "Sort: %s\n"
           (String.concat "," query_info.QueryData.sort);
         Printf.printf "Segment: %s\n" query_info.QueryData.segment;
         Printf.printf "Filters: %s\n" query_info.QueryData.filters;
         Printf.printf "Start Index: %d\n" query_info.QueryData.start_index;
         Printf.printf "Max Results: %d\n" query_info.QueryData.max_results
       in

       (* Pagination information *)
       let print_pagination_info data =
         print_endline "Pagination Info:";
         Printf.printf "Previous Link: %s\n" data.GaData.previousLink;
         Printf.printf "Next Link: %s\n" data.GaData.nextLink;
         Printf.printf "Items Per Page: %d\n" data.GaData.itemsPerPage;
         Printf.printf "Total Results: %d\n" data.GaData.totalResults
       in

       (* Totals for all results *)
       let print_totals_for_all_results data =
         print_endline "Metric totals over all results:";
         List.iter
           (fun (key, value) ->
              Printf.printf "%s: %s\n" key value)
           data.GaData.totalsForAllResults
       in

       print_column_header ga_data;
       print_table_data ga_data;
       print_response_info ga_data;
       print_profile_info ga_data;
       print_query_info ga_data;
       print_pagination_info ga_data;
       print_totals_for_all_results ga_data;
 
       (* ... *)

       ()
    )

