(* TODO: use Ocamlnet 3 functions *)
type t = Netdate.t

let epoch = Netdate.create 0.0

let to_string date =
  let timezone = Netdate.format ~fmt:"%z" date in
  let tz =
    if timezone = "+0000" then
      "Z"
    else
      let tz_hour = String.sub timezone 0 3 in
      let tz_minute = String.sub timezone 3 2 in
        tz_hour ^ ":" ^ tz_minute in
  let result = Netdate.format ~fmt:"%Y-%m-%dT%T" date in
    result ^ ".000" ^ tz

let rfc3339_regexp = Str.regexp "^\\([0-9][0-9][0-9][0-9]\\)-\\([0-9][0-9]\\)-\\([0-9][0-9]\\)T\\([0-9][0-9]\\):\\([0-9][0-9]\\):\\([0-9][0-9]\\)\\(\\.[0-9]+\\)?\\(Z\\|\\([-+]\\)\\([0-9][0-9]\\):\\([0-9][0-9]\\)\\)$"

let of_string date_string =
  let matched n =
    Str.matched_group n date_string in
  let parse_int n =
    int_of_string (matched n) in
  let matches = Str.string_match rfc3339_regexp date_string 0 in
    if matches then
      begin
        let year = parse_int 1 in
        let month = parse_int 2 in
        let day = parse_int 3 in
        let hour = parse_int 4 in
        let minute = parse_int 5 in
        let second = parse_int 6 in
        let timezone = matched 8 in
        let (tz_sign, tz_hour, tz_minute) =
          if timezone = "Z" then
            (1, 0, 0)
          else
            let sign = matched 9 in
              ((if sign = "+" then 1 else -1), parse_int 10, parse_int 11)
        in
          { Netdate.year = year;
            Netdate.month = month;
            Netdate.day = day;
            Netdate.hour = hour;
            Netdate.minute = minute;
            Netdate.second = second;
            Netdate.zone = tz_sign * (tz_hour * 60 + tz_minute);
            Netdate.week_day = -1
          }
      end
    else
      failwith "Invalid RFC3339 date"

