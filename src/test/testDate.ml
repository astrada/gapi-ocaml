open OUnit

let test_to_string () =
  let t = {
    GapiDate.epoch with
        Netdate.year = 2011;
        month = 10;
        day = 14;
        hour = 10;
        minute = 30;
        second = 0;
        nanos = 10000000;
        zone = 120;
  } in
  let s = GapiDate.to_string t in
    assert_equal ~printer:Fun.id "2011-10-14T10:30:00.010+02:00" s

let test_to_string_with_one_millisecond () =
  let t = {
    GapiDate.epoch with
        Netdate.year = 2011;
        month = 10;
        day = 14;
        hour = 10;
        minute = 30;
        nanos = 1000000;
        zone = 120;
  } in
  let s = GapiDate.to_string t in
    assert_equal ~printer:Fun.id "2011-10-14T10:30:00.001+02:00" s

let test_of_string () =
  let t = GapiDate.of_string "2011-10-14T10:30:00.000+02:00" in
    assert_equal
      ~printer:GapiDate.to_string
      { GapiDate.epoch with
            Netdate.year = 2011;
            month = 10;
            day = 14;
            hour = 10;
            minute = 30;
            zone = 120;
            week_day = -1;
      }
      t

let test_of_string_negative_offset () =
  let t = GapiDate.of_string "2011-10-14T10:30:00.000-02:00" in
    assert_equal
      ~printer:GapiDate.to_string
      { GapiDate.epoch with
            Netdate.year = 2011;
            month = 10;
            day = 14;
            hour = 10;
            minute = 30;
            zone = -120;
            week_day = -1;
      }
      t

let test_of_string_utc () =
  let t = GapiDate.of_string "2011-10-14T10:30:00.010Z" in
    assert_equal
      ~printer:GapiDate.to_string
      { GapiDate.epoch with
            Netdate.year = 2011;
            month = 10;
            day = 14;
            hour = 10;
            minute = 30;
            second = 0;
            nanos = 10000000;
            week_day = -1;
      }
      t

let test_of_string_utc_with_one_millisecond () =
  let t = GapiDate.of_string "2011-10-14T10:30:00.001Z" in
    assert_equal
      ~printer:GapiDate.to_string
      { GapiDate.epoch with
            Netdate.year = 2011;
            month = 10;
            day = 14;
            hour = 10;
            minute = 30;
            second = 0;
            nanos = 1000000;
            week_day = -1;
      }
      t

let test_of_string_full_date () =
  let t = GapiDate.of_string "2011-10-14" in
    assert_equal
      ~printer:GapiDate.to_string
      { GapiDate.epoch with
            Netdate.year = 2011;
            month = 10;
            day = 14;
            hour = 0;
            minute = 0;
            second = 0;
            nanos = 0;
            week_day = -1;
      }
      t

let suite = "Date test" >:::
  ["test_to_string" >:: test_to_string;
   "test_to_string_with_one_millisecond" >::
     test_to_string_with_one_millisecond;
   "test_of_string" >:: test_of_string;
   "test_of_string_negative_offset" >:: test_of_string_negative_offset;
   "test_of_string_utc" >:: test_of_string_utc;
   "test_of_string_utc_with_one_millisecond" >::
     test_of_string_utc_with_one_millisecond;
   "test_of_string_full_date" >:: test_of_string_full_date]

