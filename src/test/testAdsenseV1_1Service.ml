open OUnit
open GapiUtils.Infix
open GapiLens.Infix
open GapiAdsenseV1_1Model
open GapiAdsenseV1_1Service

let get_account_id session =
  let (accounts, session') =
    AccountsResource.list
      session in
  let account_id =
    if (List.length accounts.Accounts.items) > 0 then
      Some (accounts.Accounts.items |> List.hd |. Account.id)
    else
      None
  in
    (account_id, session)

let get_adclient_id session =
  let (adclients, session') =
    AdclientsResource.list
      session in
  let adclient_id =
    if (List.length adclients.AdClients.items) > 0 then
      Some (adclients.AdClients.items |> List.hd |. AdClient.id)
    else
      None
  in
    (adclient_id, session)

let get_adclient_id_in_account session =
  let (account_id, session') = get_account_id session in
    GapiUtils.option_map_default
      (fun accountId ->
         let (adclients, session'') =
           AccountsResource.Adclients.list
             ~accountId
             session' in
         let adclient_id =
           if (List.length adclients.AdClients.items) > 0 then
             Some (adclients.AdClients.items |> List.hd |. AdClient.id)
           else
             None
         in
           (account_id, adclient_id, session''))
      (None, None, session')
      account_id

let get_adunit_id_in_account session =
  let (account_id, adclient_id, session') =
    get_adclient_id_in_account session
  in
    GapiUtils.option_map_default
      (fun adClientId ->
         let accountId = Option.get account_id in
         let (adunits, session'') =
           AccountsResource.Adunits.list
             ~accountId
             ~adClientId
             session in
         let adunit_id =
           if (List.length adunits.AdUnits.items) > 0 then
             Some (adunits.AdUnits.items |> List.hd |. AdUnit.id)
           else
             None
         in
           (account_id, adclient_id, adunit_id, session'')
      )
      (None, None, None, session')
      adclient_id

let get_adunit_id_in_adclient session =
  let (adclient_id, session') =
    get_adclient_id session
  in
    GapiUtils.option_map_default
      (fun adClientId ->
         let (adunits, session'') =
           AdunitsResource.list
             ~adClientId
             session in
         let adunit_id =
           if (List.length adunits.AdUnits.items) > 0 then
             Some (adunits.AdUnits.items |> List.hd |. AdUnit.id)
           else
             None
         in
           (adclient_id, adunit_id, session'')
      )
      (None, None, session')
      adclient_id

let get_customchannel_id_in_account session =
  let (account_id, adclient_id, session') =
    get_adclient_id_in_account session
  in
    GapiUtils.option_map_default
      (fun adClientId ->
         let accountId = Option.get account_id in
         let (customchannels, session'') =
           AccountsResource.Customchannels.list
             ~accountId
             ~adClientId
             session in
         let customchannel_id =
           if (List.length customchannels.CustomChannels.items) > 0 then
             Some (customchannels.CustomChannels.items
                     |> List.hd
                     |. CustomChannel.id)
           else
             None
         in
           (account_id, adclient_id, customchannel_id, session'')
      )
      (None, None, None, session')
      adclient_id

let get_customchannel_id_in_adclient session =
  let (adclient_id, session') =
    get_adclient_id session
  in
    GapiUtils.option_map_default
      (fun adClientId ->
         let (customchannels, session'') =
           CustomchannelsResource.list
             ~adClientId
             session in
         let customchannel_id =
           if (List.length customchannels.CustomChannels.items) > 0 then
             Some (customchannels.CustomChannels.items
                     |> List.hd
                     |. CustomChannel.id)
           else
             None
         in
           (adclient_id, customchannel_id, session'')
      )
      (None, None, session')
      adclient_id

let test_list_accounts () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (accounts, _) =
         AccountsResource.list
           session
       in
         assert_equal
           "adsense#accounts"
           accounts.Accounts.kind;
         List.iter
           (fun item ->
              TestHelper.assert_not_empty
                "Account ID should not be empty"
                item.Account.id)
           accounts.Accounts.items)

let test_get_account () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (account_id, session) = get_account_id session in
         Option.iter
           (fun accountId ->
              let (account, _) =
                AccountsResource.get
                  ~accountId
                  session
              in
                assert_equal
                  "adsense#account"
                  account.Account.kind;
                assert_equal
                  accountId
                  account.Account.id)
           account_id)

let test_list_adclients_in_account () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (account_id, session) = get_account_id session in
         Option.iter
           (fun accountId ->
              let (adclients, _) =
                AccountsResource.Adclients.list
                  ~accountId
                  session
              in
                assert_equal
                  "adsense#adClients"
                  adclients.AdClients.kind;
                List.iter
                  (fun item ->
                     TestHelper.assert_not_empty
                       "Ad client ID should not be empty"
                       item.AdClient.id)
                  adclients.AdClients.items)
           account_id)

let test_generate_report_in_account () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (account_id, session) = get_account_id session in
         Option.iter
           (fun aid ->
              let (report, _) =
                ReportsResource.generate
                  ~metric:["PAGE_VIEWS";"CLICKS"]
                  ~accountId:[aid]
                  ~startDate:"2012-04-01"
                  ~endDate:"2012-04-05"
                  session
              in
                assert_equal
                  "adsense#report"
                  report.AdsenseReportsGenerateResponse.kind;
                assert_equal
                  2
                  (List.length report.AdsenseReportsGenerateResponse.headers))
           account_id)

let test_list_adunits_in_account () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (account_id, adclient_id, session) =
         get_adclient_id_in_account session
       in
         Option.iter
           (fun adClientId ->
              let accountId = Option.get account_id in
              let (adunits, _) =
                AccountsResource.Adunits.list
                  ~accountId
                  ~adClientId
                  session
              in
                assert_equal
                  "adsense#adUnits"
                  adunits.AdUnits.kind;
                List.iter
                  (fun item ->
                     TestHelper.assert_not_empty
                       "Ad unit ID should not be empty"
                       item.AdUnit.id)
                  adunits.AdUnits.items)
           adclient_id)

let test_get_adunit_in_account () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (account_id, adclient_id, adunit_id, session) =
         get_adunit_id_in_account session in
       Option.iter
         (fun adUnitId ->
            let accountId = Option.get account_id in
            let adClientId = Option.get adclient_id in
            let (adunit, _) =
              AccountsResource.Adunits.get
                ~accountId
                ~adClientId
                ~adUnitId
                session
            in
              assert_equal
                "adsense#adUnit"
                adunit.AdUnit.kind;
              assert_equal
                adUnitId
                adunit.AdUnit.id)
         adunit_id)

let test_list_customchannels_in_adunit () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (account_id, adclient_id, adunit_id, session) =
         get_adunit_id_in_account session in
       Option.iter
         (fun adUnitId ->
            let accountId = Option.get account_id in
            let adClientId = Option.get adclient_id in
            let (customchannels, _) =
              AccountsResource.Adunits.Customchannels.list
                ~accountId
                ~adClientId
                ~adUnitId
                session
            in
              assert_equal
                "adsense#customChannels"
                customchannels.CustomChannels.kind;
              List.iter
                (fun item ->
                   TestHelper.assert_not_empty
                     "Custom channel ID should not be empty"
                     item.CustomChannel.id)
                customchannels.CustomChannels.items)
         adunit_id)

let test_get_adunit_in_adclient () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (adclient_id, adunit_id, session) =
         get_adunit_id_in_adclient session in
       Option.iter
         (fun adUnitId ->
            let adClientId = Option.get adclient_id in
            let (adunit, _) =
              AdunitsResource.get
                ~adClientId
                ~adUnitId
                session
            in
              assert_equal
                "adsense#adUnit"
                adunit.AdUnit.kind;
              assert_equal
                adUnitId
                adunit.AdUnit.id)
         adunit_id)

let test_list_customchannels_in_account () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (account_id, adclient_id, session) =
         get_adclient_id_in_account session
       in
         Option.iter
           (fun adClientId ->
              let accountId = Option.get account_id in
              let (customchannels, _) =
                AccountsResource.Customchannels.list
                  ~accountId
                  ~adClientId
                  session
              in
                assert_equal
                  "adsense#customChannels"
                  customchannels.CustomChannels.kind;
                List.iter
                  (fun item ->
                     TestHelper.assert_not_empty
                       "Custom channel ID should not be empty"
                       item.CustomChannel.id)
                  customchannels.CustomChannels.items)
           adclient_id)

let test_list_urlchannels_in_account () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (account_id, adclient_id, session) =
         get_adclient_id_in_account session
       in
         Option.iter
           (fun adClientId ->
              let accountId = Option.get account_id in
              let (urlchannels, _) =
                AccountsResource.Urlchannels.list
                  ~accountId
                  ~adClientId
                  session
              in
                assert_equal
                  "adsense#urlChannels"
                  urlchannels.UrlChannels.kind;
                List.iter
                  (fun item ->
                     TestHelper.assert_not_empty
                       "Custom channel ID should not be empty"
                       item.UrlChannel.id)
                  urlchannels.UrlChannels.items)
           adclient_id)

let test_get_customchannel_in_account () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (account_id, adclient_id, customchannel_id, session) =
         get_customchannel_id_in_account session in
       Option.iter
         (fun customChannelId ->
            let accountId = Option.get account_id in
            let adClientId = Option.get adclient_id in
            let (customchannel, _) =
              AccountsResource.Customchannels.get
                ~accountId
                ~adClientId
                ~customChannelId
                session
            in
              assert_equal
                "adsense#customChannel"
                customchannel.CustomChannel.kind;
              assert_equal
                customChannelId
                customchannel.CustomChannel.id)
         customchannel_id)

let test_list_adunits_in_customchannel () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (account_id, adclient_id, customchannel_id, session) =
         get_customchannel_id_in_account session in
       Option.iter
         (fun customChannelId ->
            let accountId = Option.get account_id in
            let adClientId = Option.get adclient_id in
            let (adunits, _) =
              AccountsResource.Customchannels.Adunits.list
                ~accountId
                ~adClientId
                ~customChannelId
                session
            in
              assert_equal
                "adsense#adUnits"
                adunits.AdUnits.kind;
              List.iter
                (fun item ->
                   TestHelper.assert_not_empty
                     "Ad unit ID should not be empty"
                     item.AdUnit.id)
                adunits.AdUnits.items)
         customchannel_id)

let test_list_adclients () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (adclients, _) =
         AdclientsResource.list
           session
       in
         assert_equal
           "adsense#adClients"
           adclients.AdClients.kind;
         List.iter
           (fun item ->
              TestHelper.assert_not_empty
                "Ad client ID should not be empty"
                item.AdClient.id)
           adclients.AdClients.items)

let test_list_adunits_in_adclient () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (adclient_id, session) =
         get_adclient_id session
       in
         Option.iter
           (fun adClientId ->
              let (adunits, _) =
                AdunitsResource.list
                  ~adClientId
                  session
              in
                assert_equal
                  "adsense#adUnits"
                  adunits.AdUnits.kind;
                List.iter
                  (fun item ->
                     TestHelper.assert_not_empty
                       "Ad unit ID should not be empty"
                       item.AdUnit.id)
                  adunits.AdUnits.items)
           adclient_id)

let test_list_customchannels_in_adclient () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (adclient_id, session) =
         get_adclient_id session
       in
         Option.iter
           (fun adClientId ->
              let (customchannels, _) =
                CustomchannelsResource.list
                  ~adClientId
                  session
              in
                assert_equal
                  "adsense#customChannels"
                  customchannels.CustomChannels.kind;
                List.iter
                  (fun item ->
                     TestHelper.assert_not_empty
                       "Custom channel ID should not be empty"
                       item.CustomChannel.id)
                  customchannels.CustomChannels.items)
           adclient_id)

let test_get_customchannel_in_adclient () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (adclient_id, customchannel_id, session) =
         get_customchannel_id_in_adclient session in
       Option.iter
         (fun customChannelId ->
            let adClientId = Option.get adclient_id in
            let (customchannel, _) =
              CustomchannelsResource.get
                ~adClientId
                ~customChannelId
                session
            in
              assert_equal
                "adsense#customChannel"
                customchannel.CustomChannel.kind;
              assert_equal
                customChannelId
                customchannel.CustomChannel.id)
         customchannel_id)

let test_list_urlchannels_in_adclient () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (adclient_id, session) =
         get_adclient_id session
       in
         Option.iter
           (fun adClientId ->
              let (urlchannels, _) =
                UrlchannelsResource.list
                  ~adClientId
                  session
              in
                assert_equal
                  "adsense#urlChannels"
                  urlchannels.UrlChannels.kind;
                List.iter
                  (fun item ->
                     TestHelper.assert_not_empty
                       "Custom channel ID should not be empty"
                       item.UrlChannel.id)
                  urlchannels.UrlChannels.items)
           adclient_id)

let test_list_customchannels_in_adunit_in_adclient () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (adclient_id, adunit_id, session) =
         get_adunit_id_in_adclient session in
       Option.iter
         (fun adUnitId ->
            let adClientId = Option.get adclient_id in
            let (customchannels, _) =
              AdunitsResource.Customchannels.list
                ~adClientId
                ~adUnitId
                session
            in
              assert_equal
                "adsense#customChannels"
                customchannels.CustomChannels.kind;
              List.iter
                (fun item ->
                   TestHelper.assert_not_empty
                     "Custom channel ID should not be empty"
                     item.CustomChannel.id)
                customchannels.CustomChannels.items)
         adunit_id)

let test_list_adunits_in_customchannel_in_adclient () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (adclient_id, customchannel_id, session) =
         get_customchannel_id_in_adclient session in
       Option.iter
         (fun customChannelId ->
            let adClientId = Option.get adclient_id in
            let (adunits, _) =
              CustomchannelsResource.Adunits.list
                ~adClientId
                ~customChannelId
                session
            in
              assert_equal
                "adsense#adUnits"
                adunits.AdUnits.kind;
              List.iter
                (fun item ->
                   TestHelper.assert_not_empty
                     "Ad unit ID should not be empty"
                     item.AdUnit.id)
                adunits.AdUnits.items)
         customchannel_id)

let test_generate_report () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (report, _) =
         ReportsResource.generate
           ~metric:["PAGE_VIEWS";"CLICKS"]
           ~startDate:"2012-04-01"
           ~endDate:"2012-04-05"
           session
       in
         assert_equal
           "adsense#report"
           report.AdsenseReportsGenerateResponse.kind;
         assert_equal
           2
           (List.length report.AdsenseReportsGenerateResponse.headers))

let suite = "AdSense services test" >:::
  ["test_list_accounts" >:: test_list_accounts;
   "test_get_account" >:: test_get_account;
   "test_list_adclients_in_account" >:: test_list_adclients_in_account;
   "test_generate_report_in_account" >:: test_generate_report_in_account;
   "test_list_adunits_in_account" >:: test_list_adunits_in_account;
   "test_get_adunit_in_account" >:: test_get_adunit_in_account;
   "test_list_customchannels_in_adunit" >:: test_list_customchannels_in_adunit;
   "test_list_urlchannels_in_account" >:: test_list_urlchannels_in_account;
   "test_list_customchannels_in_account"
     >:: test_list_customchannels_in_account;
   "test_get_customchannel_in_account" >:: test_get_customchannel_in_account;
   "test_list_adunits_in_customchannel" >:: test_list_adunits_in_customchannel;
   "test_list_adclients" >:: test_list_adclients;
   "test_list_adunits_in_adclient" >:: test_list_adunits_in_adclient;
   "test_get_adunit_in_adclient" >:: test_get_adunit_in_adclient;
   "test_list_customchannels_in_adclient"
     >:: test_list_customchannels_in_adclient;
   "test_get_customchannel_in_adclient" >:: test_get_customchannel_in_adclient;
   "test_list_urlchannels_in_adclient" >:: test_list_urlchannels_in_adclient;
   "test_list_customchannels_in_adunit_in_adclient"
     >:: test_list_customchannels_in_adunit_in_adclient;
   "test_list_adunits_in_customchannel_in_adclient"
     >:: test_list_adunits_in_customchannel_in_adclient;
   "test_generate_report" >:: test_generate_report]

