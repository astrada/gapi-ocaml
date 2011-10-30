open OUnit

let test_to_string () =
  let t = {
    Netdate.year = 2011;
    Netdate.month = 10;
    Netdate.day = 14;
    Netdate.hour = 10;
    Netdate.minute = 30;
    Netdate.second = 0;
    Netdate.zone = 120;
    Netdate.week_day = -1 } in
  let s = GdataDate.to_string t in
    assert_equal "2011-10-14T10:30:00.000+02:00" s

let test_of_string () =
  let t = GdataDate.of_string "2011-10-14T10:30:00.000+02:00" in
    assert_equal
      { Netdate.year = 2011;
        Netdate.month = 10;
        Netdate.day = 14;
        Netdate.hour = 10;
        Netdate.minute = 30;
        Netdate.second = 0;
        Netdate.zone = 120;
        Netdate.week_day = -1 }
      t

let test_of_string_negative_offset () =
  let t = GdataDate.of_string "2011-10-14T10:30:00.000-02:00" in
    assert_equal
      { Netdate.year = 2011;
        Netdate.month = 10;
        Netdate.day = 14;
        Netdate.hour = 10;
        Netdate.minute = 30;
        Netdate.second = 0;
        Netdate.zone = -120;
        Netdate.week_day = -1 }
      t

let test_of_string_utc () =
  let t = GdataDate.of_string "2011-10-14T10:30:00.000Z" in
    assert_equal
      ~printer:GdataDate.to_string
      { Netdate.year = 2011;
        Netdate.month = 10;
        Netdate.day = 14;
        Netdate.hour = 10;
        Netdate.minute = 30;
        Netdate.second = 0;
        Netdate.zone = 0;
        Netdate.week_day = -1 }
      t

let test_of_string_full_date () =
  let t = GdataDate.of_string "2011-10-14" in
    assert_equal
      ~printer:GdataDate.to_string
      { Netdate.year = 2011;
        Netdate.month = 10;
        Netdate.day = 14;
        Netdate.hour = 0;
        Netdate.minute = 0;
        Netdate.second = 0;
        Netdate.zone = 0;
        Netdate.week_day = -1 }
      t

let suite = "Date test" >:::
  ["test_to_string" >:: test_to_string;
   "test_of_string" >:: test_of_string;
   "test_of_string_negative_offset" >:: test_of_string_negative_offset;
   "test_of_string_utc" >:: test_of_string_utc;
   "test_of_string_full_date" >:: test_of_string_full_date]

