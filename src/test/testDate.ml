open OUnit

let epoch = Netdate.create 0.0

let test_to_string () =
  let t = { epoch with
    Netdate.year = 2011;
    month = 10;
    day = 14;
    hour = 10;
    minute = 30;
    second = 0;
    zone = 120;
    week_day = -1 } in
  let s = GapiDate.to_string t in
    assert_equal "2011-10-14T10:30:00.000+02:00" s

let test_of_string () =
  let t = GapiDate.of_string "2011-10-14T10:30:00.000+02:00" in
    assert_equal
      { epoch with
          Netdate.year = 2011;
          month = 10;
          day = 14;
          hour = 10;
          minute = 30;
          second = 0;
          zone = 120;
          week_day = -1 }
      t

let test_of_string_negative_offset () =
  let t = GapiDate.of_string "2011-10-14T10:30:00.000-02:00" in
    assert_equal
      { epoch with
          Netdate.year = 2011;
          month = 10;
          day = 14;
          hour = 10;
          minute = 30;
          second = 0;
          zone = -120;
          week_day = -1 }
      t

let test_of_string_utc () =
  let t = GapiDate.of_string "2011-10-14T10:30:00.000Z" in
    assert_equal
      ~printer:GapiDate.to_string
      { epoch with
          Netdate.year = 2011;
          month = 10;
          day = 14;
          hour = 10;
          minute = 30;
          second = 0;
          zone = 0;
          week_day = -1 }
      t

let test_of_string_full_date () =
  let t = GapiDate.of_string "2011-10-14" in
    assert_equal
      ~printer:GapiDate.to_string
      { epoch with
          Netdate.year = 2011;
          month = 10;
          day = 14;
          hour = 0;
          minute = 0;
          second = 0;
          zone = 0;
          week_day = -1 }
      t

let suite = "Date test" >:::
  ["test_to_string" >:: test_to_string;
   "test_of_string" >:: test_of_string;
   "test_of_string_negative_offset" >:: test_of_string_negative_offset;
   "test_of_string_utc" >:: test_of_string_utc;
   "test_of_string_full_date" >:: test_of_string_full_date]

