open OUnit
module Fun = GapiFun

let test_strip_string_cr_lf () =
  let s = "test\r\n" in
  let result = GapiUtils.strip_string s in
  assert_equal ~printer:Fun.id "test" result

let suite =
  "Core test" >::: [ "test_strip_string_cr_lf" >:: test_strip_string_cr_lf ]
