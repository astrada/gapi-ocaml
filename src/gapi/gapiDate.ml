type t = Netdate.t

let epoch = Netdate.create 0.0

let now () = Netdate.create (Unix.time ())

let to_string ?(time = true) date =
  let timezone = Netdate.format ~fmt:"%z" date in
  let tz =
    if timezone = "+0000" then
      "Z"
    else
      let tz_hour = String.sub timezone 0 3 in
      let tz_minute = String.sub timezone 3 2 in
      tz_hour ^ ":" ^ tz_minute in
  if time then
    let fraction = string_of_int date.Netdate.nanos in
    let fraction_length = String.length fraction in
    let fraction_string =
      let padding =
        if fraction_length < 3 then
          String.make (3 - fraction_length) '0'
        else "" in
      let milli = String.sub fraction 0 (min fraction_length 3) in
      "." ^ padding ^ milli in
    let result = Netdate.format ~fmt:"%Y-%m-%dT%T" date in
    result ^ fraction_string ^ tz
  else
    Netdate.format ~fmt:"%Y-%m-%d" date

let rfc3339_regexp = Str.regexp "^\\([0-9][0-9][0-9][0-9]\\)-\\([0-9][0-9]\\)-\\([0-9][0-9]\\)\\(T\\([0-9][0-9]\\):\\([0-9][0-9]\\):\\([0-9][0-9]\\)\\(\\.\\([0-9]+\\)\\)?\\(Z\\|\\([-+]\\)\\([0-9][0-9]\\):\\([0-9][0-9]\\)\\)\\)?$"

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
      let full_date = {
        epoch with
            Netdate.year;
            month;
            day = day;
            week_day = -1
      } in
      try
        let hour = parse_int 5 in
        let minute = parse_int 6 in
        let second = parse_int 7 in
        let nanos = if matched 8 <> "" then (parse_int 9) * 1000000 else 0 in
        let timezone = matched 10 in
        let (tz_sign, tz_hour, tz_minute) =
          if timezone = "Z" then
            (1, 0, 0)
          else
            let sign = matched 11 in
            ((if sign = "+" then 1 else -1), parse_int 12, parse_int 13)
        in
        { full_date with
              Netdate.hour;
              minute = minute;
              second = second;
              nanos = nanos;
              zone = tz_sign * (tz_hour * 60 + tz_minute);
              week_day = -1
        }
      with Not_found ->
        full_date
    end
  else
    failwith ("Invalid RFC3339 date: " ^ date_string)

