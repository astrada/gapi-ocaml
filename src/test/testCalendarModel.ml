open OUnit

let test_parse_personal_settings () =
  let ch = open_in "test/data/settings.xml" in
  let settings = GdataRequest.parse_xml
                   (fun () -> input_byte ch)
                   GdataCalendar.parse_personal_settings in
  let country = Hashtbl.find settings "country" in
  let customCalMode = Hashtbl.find settings "customCalMode" in
    assert_equal ~msg:"country setting" "EH" country;
    assert_equal ~msg:"customCalMode setting" "custom,14" customCalMode

let test_parse_calendar_feed () =
  let ch = open_in "test/data/all_calendars.xml" in
  let feed = GdataRequest.parse_xml
               (fun () -> input_byte ch)
               GdataCalendar.Feed.parse_feed in
    assert_equal ~msg:"feed author"
      "Coach"
      (List.hd feed.GdataCalendar.Feed.authors).GdataAtom.Author.name;
    assert_equal ~msg:"feed title"
      "Coach's Calendar List"
      feed.GdataCalendar.Feed.title.GdataAtom.Title.value

let test_parse_calendar_entry () =
  let ch = open_in "test/data/calendar_entry.xml" in
  let entry = GdataRequest.parse_xml
                (fun () -> input_byte ch)
                GdataCalendar.parse_calendar_entry in
    assert_equal ~msg:"entry title"
      "Little League Schedule"
      entry.GdataCalendar.ce_title.GdataAtom.Title.value;
    assert_equal ~msg:"entry timezone"
      "America/Los_Angeles"
      entry.GdataCalendar.ce_timezone

let test_parse_calendar_entry_with_extensions () =
  let ch = open_in "test/data/calendar_entry_with_extensions.xml" in
  let entry = GdataRequest.parse_xml
                (fun () -> input_byte ch)
                GdataCalendar.parse_calendar_entry in
    assert_equal
      ~printer:(fun xs ->
                  List.fold_left
                    (fun s x ->
                       s ^ (TestHelper.string_of_xml_data_model x))
                    ""
                    xs)
      [GdataCore.AnnotatedTree.Node
         ([`Element;
           `Name "new-element";
           `Namespace "http://schemas.google.com/g/2005"],
          [GdataCore.AnnotatedTree.Leaf
             ([`Attribute;
               `Name "value";
               `Namespace ""],
              GdataCore.Value.String "value");
           GdataCore.AnnotatedTree.Node
             ([`Element;
               `Name "new-child";
               `Namespace "http://schemas.google.com/g/2005"],
              [GdataCore.AnnotatedTree.Leaf
                 ([`Text],
                  GdataCore.Value.String "text")
              ])
          ])
      ]
      entry.GdataCalendar.ce_extensions

let test_calendar_entry_to_data_model () =
  let entry =
    { GdataCalendar.empty_entry with
          GdataCalendar.ce_id = "id";
          GdataCalendar.ce_authors = [
            { GdataAtom.Author.lang = "en-US";
              GdataAtom.Author.email = "author1@test.com";
              GdataAtom.Author.name = "author1";
              GdataAtom.Author.uri = "urn:uri";
            };
            { GdataAtom.Author.empty with
                  GdataAtom.Author.email = "author2@test.com";
                  GdataAtom.Author.name = "author2";
            };
          ];
          GdataCalendar.ce_categories = [
            { GdataAtom.Category.label = "label";
              GdataAtom.Category.scheme = "scheme";
              GdataAtom.Category.term = "term";
              GdataAtom.Category.lang = "en-US";
            };
            { GdataAtom.Category.empty with
                  GdataAtom.Category.scheme = "scheme2";
                  GdataAtom.Category.term = "term2";
            }
          ];
          GdataCalendar.ce_contributors = [
            { GdataAtom.Contributor.lang = "en-US";
              GdataAtom.Contributor.email = "contributor1@test.com";
              GdataAtom.Contributor.name = "contributor1";
              GdataAtom.Contributor.uri = "urn:uri";
            };
            { GdataAtom.Contributor.empty with
                  GdataAtom.Contributor.email = "contributor2@test.com";
                  GdataAtom.Contributor.name = "contributor2";
            };
          ];
          GdataCalendar.ce_content =
            { GdataAtom.Content.empty with
                  GdataAtom.Content.src = "src";
            };
          GdataCalendar.ce_published = GdataDate.of_string "2010-05-15T20:00:00.000Z";
          GdataCalendar.ce_updated = GdataDate.of_string "2011-08-16T12:00:00.000Z";
          GdataCalendar.ce_edited = GdataDate.of_string "2011-06-06T15:00:00.000Z";
          GdataCalendar.ce_accesslevel = "accesslevel";
          GdataCalendar.ce_links = [
            { GdataCalendar.Link.empty with
                  GdataCalendar.Link.href = "http://href";
                  GdataCalendar.Link.rel = "self";
                  GdataCalendar.Link.ltype = "application/atom+xml";
            };
            { GdataCalendar.Link.href = "http://href2";
              GdataCalendar.Link.length = Int64.of_int 10;
              GdataCalendar.Link.rel = "alternate";
              GdataCalendar.Link.title = "title";
              GdataCalendar.Link.ltype = "application/atom+xml";
              GdataCalendar.Link.webContent =
                { GdataCalendar.wc_height = 100;
                  GdataCalendar.wc_url = "http://webcontent";
                  GdataCalendar.wc_width = 200;
                  GdataCalendar.wc_webContentGadgetPrefs = [
                    { GdataCalendar.wcgp_name = "name";
                      GdataCalendar.wcgp_value = "value";
                    };
                    { GdataCalendar.wcgp_name = "name2";
                      GdataCalendar.wcgp_value = "value2";
                    };
                  ];
                };
            };
          ];
          GdataCalendar.ce_where = [
            "where1";
            "where2";
          ];
          GdataCalendar.ce_color = "#5A6986";
          GdataCalendar.ce_hidden = true;
          GdataCalendar.ce_selected = true;
          GdataCalendar.ce_timezone = "America/Los_Angeles";
          GdataCalendar.ce_timesCleaned = 1;
          GdataCalendar.ce_summary =
            { GdataAtom.Summary.src = "src";
              GdataAtom.Summary.ctype = "type";
              GdataAtom.Summary.lang = "en-US";
              GdataAtom.Summary.value = "summary";
            };
          GdataCalendar.ce_title =
            { GdataAtom.Title.empty with
                  GdataAtom.Title.value = "title";
            };
    } in
  let tree = GdataCalendar.calendar_entry_to_data_model entry in
    TestHelper.assert_equal_file
      "test/data/test_calendar_entry_to_data_model.xml"
      (GdataRequest.data_to_xml_string tree)

let test_parse_calendar_event_entry () =
  let ch = open_in "test/data/event_entry.xml" in
  let entry = GdataRequest.parse_xml
                (fun () -> input_byte ch)
                GdataCalendarEvent.parse_calendar_event_entry in
  let tree = GdataCalendarEvent.calendar_event_entry_to_data_model entry in
    TestHelper.assert_equal_file
      "test/data/test_parse_calendar_event_entry.xml"
      (GdataRequest.data_to_xml_string tree)

let test_parse_calendar_event_feed () =
  let ch = open_in "test/data/event_feed.xml" in
  let feed = GdataRequest.parse_xml
               (fun () -> input_byte ch)
               GdataCalendarEvent.Feed.parse_feed in
    assert_equal ~msg:"feed author"
      "Jo March"
      (List.hd feed.GdataCalendarEvent.Feed.authors).GdataAtom.Author.name;
    assert_equal ~msg:"feed title"
      "Jo March"
      feed.GdataCalendarEvent.Feed.title.GdataAtom.Title.value;
    assert_equal ~msg:"entry count"
      1
      (List.length feed.GdataCalendarEvent.Feed.entries)

let test_parse_acl_feed () =
  let ch = open_in "test/data/acl_feed.xml" in
  let feed = GdataRequest.parse_xml
               (fun () -> input_byte ch)
               GdataACL.Feed.parse_feed in
  let entry = List.nth feed.GdataACL.Feed.entries 1 in
    assert_equal ~msg:"feed title"
      "Elizabeth Bennet's access control list"
      feed.GdataACL.Feed.title.GdataAtom.Title.value;
    assert_equal ~msg:"entry count"
      2
      (List.length feed.GdataACL.Feed.entries);
    assert_equal ~msg:"entry scope type"
      "user"
      (entry.GdataACL.ae_scope.GdataACL.Scope.stype);
    assert_equal ~msg:"entry scope value"
      "liz@gmail.com"
      (entry.GdataACL.ae_scope.GdataACL.Scope.value)

let test_acl_entry_to_data_model () =
  let ch = open_in "test/data/acl_feed.xml" in
  let feed = GdataRequest.parse_xml
               (fun () -> input_byte ch)
               GdataACL.Feed.parse_feed in
  let entry = List.nth feed.GdataACL.Feed.entries 1 in
  let tree = GdataACL.acl_entry_to_data_model entry in
    TestHelper.assert_equal_file
      "test/data/test_acl_entry_to_data_model.xml"
      (GdataRequest.data_to_xml_string tree)

let suite = "Calendar Model test" >:::
  ["test_parse_personal_settings" >:: test_parse_personal_settings;
   "test_parse_calendar_feed" >:: test_parse_calendar_feed;
   "test_parse_calendar_entry" >:: test_parse_calendar_entry;
   "test_parse_calendar_entry_with_extensions"
     >:: test_parse_calendar_entry_with_extensions;
   "test_calendar_entry_to_data_model" >:: test_calendar_entry_to_data_model;
   "test_parse_calendar_event_entry" >:: test_parse_calendar_event_entry;
   "test_parse_calendar_event_feed" >:: test_parse_calendar_event_feed;
   "test_parse_acl_feed" >:: test_parse_acl_feed;
   "test_acl_entry_to_data_model" >:: test_acl_entry_to_data_model]

