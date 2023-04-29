(* $Id$
 * ----------------------------------------------------------------------
 *
 *)

(* Thanks to Nicolas George for contributing the parsing and format code *)

open Printf

(* Calculate local zone offset in minutes *)
let get_localzone_at t =
  let gt = Unix.gmtime t
  and lt = Unix.localtime t in

  let min_diff = (lt.Unix.tm_hour * 60 + lt.Unix.tm_min) - 
                 (gt.Unix.tm_hour * 60 + gt.Unix.tm_min) in
  let day_diff = lt.Unix.tm_yday - gt.Unix.tm_yday in

  if day_diff < -1 || day_diff = 1 then      (* local day is UTC day + 1 *)
    min_diff + 24*60
  else if day_diff > 1 || day_diff = -1 then (* local day is UTC day - 1 *)
    min_diff - 24*60
  else                                       (* local day is UTC day *)
    min_diff
;;

let get_localzone() = get_localzone_at (Unix.time()) ;;

let localzone_nodst = 
  (* Get the timezone on 01-01-1970 and on 01-07-1970, and take the
     smaller one. This hopefully works on the northern and southern
     hemisphere
   *)
  min (get_localzone_at 0.0) (get_localzone_at 15638400.0) ;;

let localzone = get_localzone() ;;

type localization =
    { full_day_names : string array;
      abbr_day_names : string array;
      parsed_day_names : string list array;
      full_month_names : string array;
      abbr_month_names : string array;
      parsed_month_names : string list array;
      timezone_names : (string * int * bool) list;
      am_particle : string;
      pm_particle : string;
      d_format : string;
      t_format : string;
      d_t_format : string;
      t_format_ampm : string;
      char_encoding : string;
    }

let posix_l9n =
  { full_day_names =
      [| "Sunday"; "Monday"; "Tuesday"; "Wednesday"; "Thursday"; "Friday";
         "Saturday"
      |];
    abbr_day_names =
      [| "Sun"; "Mon"; "Tue"; "Wed"; "Thu"; "Fri"; "Sat" |] ;

    parsed_day_names =
      [| [ "sunday"; "sun" ];
         [ "monday"; "mon" ];
         [ "tuesday"; "tue"; "tues" ];
         [ "wednesday"; "wed"; "wednes" ];
         [ "thursday"; "thu"; "thur"; "thurs" ];
         [ "friday"; "fri" ];
         [ "saturday"; "sat" ];
      |];
      
    full_month_names =
      [| "January"; "February"; "March"; "April"; "May"; "June";
         "July"; "August"; "September"; "October"; "November"; "December"
      |];
    abbr_month_names =
      [| "Jan"; "Feb"; "Mar"; "Apr"; "May"; "Jun";
         "Jul"; "Aug"; "Sep"; "Oct"; "Nov"; "Dec"
      |];
    parsed_month_names =
      [| [ "january"; "jan" ];
         [ "february"; "feb" ];
         [ "march"; "mar" ];
         [ "april"; "apr" ];
         [ "may";  "may" ];
         [ "june"; "jun" ];
         [ "july";  "jul" ];
         [ "august"; "aug" ];
         [ "september";  "sep"; "sept" ];
         [ "october";  "oct" ];
         [ "november"; "nov" ];
         [ "december"; "dec" ]
      |];
    timezone_names =
      (* For a more complete list see
         http://en.wikipedia.org/wiki/List_of_time_zone_abbreviations
         We HAVE to implement the timezones mentioned in RFC-822
       *)
      ( let z n = (n/100) * 60 in
        [ "gmt",  z 0000, false;
          "ut",   z 0000, false;
          "utc",  z 0000, false;
          "wet",  z 0000, false;
          "z",    z 0000, false;
          "bst",  z 0100, true;
          "cet",  z 0100, false;
          "cest", z 0200, true;
          "met",  z 0100, false;
          "mewt", z 0100, false;
          "mest", z 0200, true;
          "mesz", z 0200, true;
          "swt",  z 0100, false;
          "sst",  z 0200, true;
          "fwt",  z 0100, false;
          "fst",  z 0100, true;
          "eet",  z 0200, false;
          "bt",	  z 0300, false;
          "zp4",  z 0400, false;
          "zp5",  z 0500, false;
          "zp6",  z 0600, false;
          "wast", z 0700, false;
          "wadt", z 0800, true;
          "cct",  z 0800, false;
          "jst",  z 0900, false;
          "east", z 1000, false;
          "eadt", z 1100, true;
          "gst",  z 1000, false;
          "nzt",  z 1200, false;
          "nzst", z 1200, false;
          "nzdt", z 1300, true;
          "idle", z 1200, false;
          "idlw", z(-1200), false;
          "nt",	  z(-1100), false;
          "hst",  z(-1000), false;
          "hdt",  z(-0900), true;
          "cat",  z(-1000), false;
          "ahst", z(-1000), false;
          "ydt",  z(-0800), true;
          "yst",  z(-0900), false;
          "pst",  z(-0800), false;
          "pdt",  z(-0700), true;
          "mst",  z(-0700), false;
          "mdt",  z(-0600), true;
          "cst",  z(-0600), false;
          "cdt",  z(-0500), true;
          "est",  z(-0500), false;
          "edt",  z(-0400), true;
          "ast",  z(-0400), false;
          "adt",  z(-0300), true;
          "wat",  z(-0100), false;
          "at",	  z(-0200), false;
        ]);
    am_particle = "am";
    pm_particle = "pm";
    d_format = "%m/%d/%y";
    t_format = "%H:%M:%S";
    d_t_format = "%a %b %e %H:%M:%S %Y";
    t_format_ampm = "%I:%M:%S %p";
    char_encoding = "US-ASCII";
  }


let l9n_from_locale name =
  let open Netsys_posix in
  try
    let info = Netsys_posix.query_langinfo name in
    let enc = Netconversion.encoding_of_string info.nl_CODESET in
    let to_lower = Netconversion.ustring_to_lower enc in
    { full_day_names =
        [| info.nl_DAY_1; info.nl_DAY_2; info.nl_DAY_3; info.nl_DAY_4;
           info.nl_DAY_5; info.nl_DAY_6; info.nl_DAY_7;
        |];
      abbr_day_names =
        [| info.nl_ABDAY_1; info.nl_ABDAY_2; info.nl_ABDAY_3; info.nl_ABDAY_4;
           info.nl_ABDAY_5; info.nl_ABDAY_6; info.nl_ABDAY_7;
        |];
      parsed_day_names =
        [| [ to_lower info.nl_DAY_1; to_lower info.nl_ABDAY_1 ];
           [ to_lower info.nl_DAY_2; to_lower info.nl_ABDAY_2 ];
           [ to_lower info.nl_DAY_3; to_lower info.nl_ABDAY_3 ];
           [ to_lower info.nl_DAY_4; to_lower info.nl_ABDAY_4 ];
           [ to_lower info.nl_DAY_5; to_lower info.nl_ABDAY_5 ];
           [ to_lower info.nl_DAY_6; to_lower info.nl_ABDAY_6 ];
           [ to_lower info.nl_DAY_7; to_lower info.nl_ABDAY_7 ];
        |];
      full_month_names =
        [| info.nl_MON_1; info.nl_MON_2; info.nl_MON_3;
           info.nl_MON_4; info.nl_MON_5; info.nl_MON_6;
           info.nl_MON_7; info.nl_MON_8; info.nl_MON_9;
           info.nl_MON_10; info.nl_MON_11; info.nl_MON_12;
        |];
      abbr_month_names =
        [| info.nl_ABMON_1; info.nl_ABMON_2; info.nl_ABMON_3;
           info.nl_ABMON_4; info.nl_ABMON_5; info.nl_ABMON_6;
           info.nl_ABMON_7; info.nl_ABMON_8; info.nl_ABMON_9;
           info.nl_ABMON_10; info.nl_ABMON_11; info.nl_ABMON_12;
        |];
      parsed_month_names =
        [| [ to_lower info.nl_MON_1; to_lower info.nl_ABMON_1 ];
           [ to_lower info.nl_MON_2; to_lower info.nl_ABMON_2 ];
           [ to_lower info.nl_MON_3; to_lower info.nl_ABMON_3 ];
           [ to_lower info.nl_MON_4; to_lower info.nl_ABMON_4 ];
           [ to_lower info.nl_MON_5; to_lower info.nl_ABMON_5 ];
           [ to_lower info.nl_MON_6; to_lower info.nl_ABMON_6 ];
           [ to_lower info.nl_MON_7; to_lower info.nl_ABMON_7 ];
           [ to_lower info.nl_MON_8; to_lower info.nl_ABMON_8 ];
           [ to_lower info.nl_MON_9; to_lower info.nl_ABMON_9 ];
           [ to_lower info.nl_MON_10; to_lower info.nl_ABMON_10 ];
           [ to_lower info.nl_MON_11; to_lower info.nl_ABMON_11 ];
           [ to_lower info.nl_MON_12; to_lower info.nl_ABMON_12 ];
        |];
      timezone_names = posix_l9n.timezone_names;
      am_particle = to_lower info.nl_AM_STR;
      pm_particle = to_lower info.nl_PM_STR;
      d_format = info.nl_D_FMT;
      t_format = info.nl_T_FMT;
      d_t_format = info.nl_D_T_FMT;
      t_format_ampm = info.nl_T_FMT_AMPM;
      char_encoding = info.nl_CODESET
    }
  with
    | _ -> posix_l9n



type token =
  | Number of int * int   (* number of digits, value *)
  | Day of int
  | Month of int
  | Meridian of bool
  | Zone of int * bool
  | Dst
  | Plus
  | Minus
  | Comma
  | Colon
  | Slash
  | Dot
  | Time    (* "T" *)
  | Invalid
;;

type compiled_localization =
    { l9n : localization;
      tokens : (string, token) Hashtbl.t
    }

let compile_l9n l9n =
  let tokens = Hashtbl.create 53 in
  let add_token (name, value) =
    Hashtbl.replace tokens name value in
  List.iter
    (fun (name,zone,isdst) ->
       add_token (name, (Zone(zone,isdst)))
    )
    l9n.timezone_names;
  add_token (l9n.am_particle, Meridian false);
  add_token (l9n.pm_particle, Meridian true);
  Array.iteri
    (fun i names ->
       List.iter
         (fun name ->
            add_token (name, Month(i+1))
         )
         names
    )
    l9n.parsed_month_names;
  Array.iteri
    (fun i names ->
       List.iter
         (fun name ->
            add_token (name, Day i)
         )
         names
    )
    l9n.parsed_day_names;
  add_token ("t", Time);
  add_token ("dst", Dst);
  { l9n = l9n;
    tokens = tokens
  }


let c_posix_l9n = compile_l9n posix_l9n  

let rec ten_power n =
  if n<=0 then 1 else 10 * (ten_power (n-1))

let to_lower cl9n =
  try
    let enc = Netconversion.encoding_of_string cl9n.l9n.char_encoding in
    fun s ->
      Netconversion.ustring_to_lower enc s
  with _ -> (fun s -> s)

let to_upper cl9n =
  try
    let enc = Netconversion.encoding_of_string cl9n.l9n.char_encoding in
    fun s ->
      Netconversion.ustring_to_upper enc s
  with _ -> (fun s -> s)


let stream_cons prefix stream =
  (* Prefix the list [prefix] before stream *)
  let prefix = ref prefix in
  Stream.from
    (fun _ ->
       match !prefix with
         | [] -> ( try Some(Stream.next stream) with Stream.Failure -> None )
         | p :: prefix' -> prefix := prefix'; Some p
    )


let stream_njunk n stream =
  for k = 1 to n do Stream.junk stream done


let tokens_of_string cl9n str =
  let to_lower = to_lower cl9n in
  let rec scan_any stream =
    match Stream.peek stream with
      | Some('0'..'9' as c) ->
          Stream.junk stream;
          scan_number (1, int_of_char c - 48) stream
      | Some(('a'..'z' | 'A'..'Z' | '\128'..'\255') as c) ->
          Stream.junk stream;
	  let b = Buffer.create 16 in
	  Buffer.add_char b c;
	  scan_word b stream
      | Some '(' -> 
          Stream.junk stream; scan_comment 0 stream
      | Some (' ' | '\t') ->
          Stream.junk stream; scan_any stream
      | Some '+' ->
          Stream.junk stream; stream_cons [ Plus ] (scan_any stream)
      | Some '-' ->
          Stream.junk stream; stream_cons [ Minus ] (scan_any stream)
      | Some ':' ->
          Stream.junk stream; stream_cons [ Colon ] (scan_any stream)
      | Some ',' ->
          Stream.junk stream; stream_cons [ Comma ] (scan_any stream)
      | Some '/' ->
          Stream.junk stream; stream_cons [ Slash ] (scan_any stream)
      | Some '.' ->
          Stream.junk stream; stream_cons [ Dot ] (scan_any stream)
      | Some _ ->
          Stream.junk stream; stream_cons [ Invalid ] (scan_any stream)
      | None ->
          Stream.of_list []
  and scan_number (l,a) stream =
    match Stream.peek stream with
      | Some ( ('0'..'9') as c ) ->
          Stream.junk stream;
          if l = 9 then failwith "Netdate: number too large";
          scan_number (l+1, a * 10 + (int_of_char c - 48)) stream
      | _ ->
          stream_cons [ Number(l,a) ] (scan_any stream)
  and scan_word b stream =
    match Stream.peek stream with
      | Some(('a'..'z' | 'A'..'Z' | '\128'..'\255') as c) ->
          Stream.junk stream;
          Buffer.add_char b c;
	  scan_word b stream
      | Some '.' ->
          Stream.junk stream;
          scan_word b stream
      | _ ->
          let s = to_lower (Buffer.contents b) in
          let tok =
            try Hashtbl.find cl9n.tokens s with Not_found -> Invalid in
          stream_cons [ tok ] (scan_any stream)
  and scan_comment n stream =
    match Stream.peek stream with
      | Some ')' ->
          Stream.junk stream;
          if n=0 then scan_any stream
          else scan_comment (n-1) stream
      | Some '(' ->
          Stream.junk stream;
          scan_comment (n+1) stream
      | Some _ ->
          Stream.junk stream;
          scan_comment n stream
      | None ->
          raise Stream.Failure in
  scan_any (Stream.of_string str)
;;

type t = {
  year : int;		(* complete year *)
  month : int;		(* 1..12 *)
  day : int;		(* 1..31 *)
  hour : int;
  minute : int;
  second : int;
  nanos : int;
  zone : int;		(* in minutes; 60 = UTC+0100 *)
  week_day : int	(* 0 = sunday; -1 if not given *)
} ;;

let parse ?(localzone=false) 
          ?zone:dzone
          ?(l9n = c_posix_l9n)
          str =
  let invalid() = invalid_arg "Netdate.parse" in
  let tokens = tokens_of_string l9n str in
  let hour = ref None
  and minute = ref None
  and second = ref None
  and nanos = ref None
  and zone = ref None
  and week_day = ref None
  and day = ref None
  and month = ref None
  and year = ref None in
  let add_data ?h ?m ?s ?ns ?mdn ?tz ?wd ?md ?mo ?y ?y2 () =
    (* tz as in the above table *)
    let may_store r = function
      | None -> ()
      | v when !r = None -> r := v
      | _ -> invalid() in
    let h = match h with
      | None -> None
      | Some h -> match mdn with
	  | None when h >= 0 && h <= 23 -> Some h
	  | Some false when h > 0 && h <= 11 -> Some h
	  | Some false when h = 12 -> Some 0
	  | Some true when h > 0 && h <= 11 -> Some (h + 12)
	  | Some true when h = 12 -> Some 12 
	  | _ -> invalid() in
    let y = match y with
      | None ->
	  ( match y2 with
	      | Some y -> if y < 69 then Some (2000 + y) else Some(1900 + y)
	      | None -> None
	  )
      | Some y -> Some y in
    may_store hour h;
    may_store minute m;
    may_store second s;
    may_store nanos ns;
    may_store zone tz;
    may_store week_day wd;
    may_store day md;
    may_store month mo;
    may_store year y in
  let rec scan_gen stream =
    match Stream.peek stream with
      | Some(Number(l,n)) ->
          Stream.junk stream;
          scan_number (l,n) stream
      | Some Time ->
          Stream.junk stream;
          let tok1 = Stream.next stream in
          let tok2 = Stream.next stream in
          let tok3 = Stream.next stream in
          ( match tok1,tok2,tok3 with
              | Number((0|1|2),n), Colon, Number((0|1|2),m) ->
                  scan_hour n m stream
              | _ ->
                  invalid()
          )
      | Some(Zone(tz,isdst)) ->
          Stream.junk stream;
          let dst = scan_dst stream in
          let eff_tz =
          if isdst then tz else
            match dst with
              | Some true -> tz + 60
              | _ -> tz in
          add_data ~tz:eff_tz ();
          scan_gen stream
      | Some(Day wd) ->
          Stream.junk stream;
          let _ = scan_opt_coma stream in
          add_data ~wd ();
          scan_gen stream
      | Some(Month mo) ->
          Stream.junk stream;
          let tok1 = Stream.next stream in
          ( match tok1 with
              | Number(lmd,md) ->
                  scan_date_m mo (lmd,md) stream
              | _ ->
                  invalid()
          )
      | Some _ ->
          Stream.junk stream;
          invalid()
      | None ->
          ()
  and scan_number (l,n) stream =
    match Stream.peek stream with
      | Some(Meridian mdn) ->
          Stream.junk stream;
          add_data ~h:n ~mdn ();
	  scan_gen stream
      | Some Colon ->
          Stream.junk stream;
          let tok1 = Stream.next stream in
          ( match tok1 with
              | Number((0|1|2),m) ->
                  if l <= 2 then
                    scan_hour n m stream
                  else
                    invalid()
              | _ -> invalid()
          )
      | Some Slash ->
          Stream.junk stream;
          let tok1 = Stream.next stream in
          ( match tok1 with
              | Number((0|1|2),m) -> scan_date_s (l,n) m stream
              | _ -> invalid()
          )
      | Some Dot ->
          Stream.junk stream;
          let tok1 = Stream.next stream in
          ( match tok1 with
              | Number((0|1|2),m) ->
                  if l<=2 then
	            scan_date_dot n m stream
	          else invalid()
              | _ -> invalid()
          )
      | Some Minus ->
          Stream.junk stream;
          scan_date_d (l,n) stream
      | Some (Month mo) ->
          Stream.junk stream;
          add_data ~md:n ~mo ();
	  scan_gen stream
      | _ ->
          if l=4 then
            add_data ~y:n ()
          else
            invalid();
          scan_gen stream
  and scan_hour h m stream =
    match Stream.peek stream with
      | Some Colon ->
          Stream.junk stream;
          let tok1 = Stream.next stream in
          ( match tok1 with
              | Number(_,s) -> scan_hour_second_frac h m s stream
              | _ -> invalid()
          )
      | _ ->
          let tz_opt = scan_tz_opt stream in
          ( match tz_opt with 
              | Some tz ->
                  add_data ~h ~m ~tz ();
	          scan_gen stream
              | None ->
                  let mdn = scan_opt_meridian stream in
                  add_data ~h ~m ?mdn ();
                  scan_gen stream
          )
  and scan_tz_opt stream =
    match Stream.peek stream with
      | Some Plus  -> Stream.junk stream; Some(scan_tz_details 1 stream)
      | Some Minus -> Stream.junk stream; Some(scan_tz_details (-1) stream)
      | _ -> None
  and scan_tz_details sign stream =
    match Stream.peek stream with
      | Some(Number(l,tz)) when l=4 ->
          Stream.junk stream;
          sign * ((tz/100) * 60 + (tz mod 100))
      | Some(Number(l,tz)) when l<=2 ->
          Stream.junk stream;
          scan_tz_details2 sign tz stream
      | _ ->
          invalid()
  and scan_tz_details2 sign tz1 stream =
    match Stream.npeek 2 stream with
      | [ Colon; Number((0|1|2),tz2) ] ->
          stream_njunk 2 stream;
          sign * (60 * tz1 + tz2)
      | _ ->
          sign * 60 * tz1
	
  and scan_hour_second_frac h m s stream =
    match Stream.npeek 2 stream with
      | [ Dot; Number(l,f) ] ->  (* e.g. 12:50:48.12345 *)
          stream_njunk 2 stream;
          let ns = f * ten_power (9-l) in
          scan_hour_second h m s ns stream
      | _ ->
          scan_hour_second h m s 0 stream

  and scan_hour_second h m s ns stream =
    match scan_tz_opt stream with
      | Some tz ->
          add_data ~h ~m ~s ~ns ~tz ();
          scan_gen stream
      | None ->
          let mdn = scan_opt_meridian stream in
          add_data ~h ~m ~s ~ns ?mdn ();
          scan_gen stream

  and scan_date_s (ln,n) m stream =
    match Stream.npeek 2 stream with
      | [ Slash; Number(lp,p) ] ->
          stream_njunk 2 stream;
	  if ln = 4
	  then add_data ~y:n ~mo:m ~md:p ()
	  else
	    if lp = 4 then
	      add_data ~y:p ~mo:n ~md:m ()
	    else
	      if lp = 2 then
	        add_data ~y2:p ~mo:n ~md:m ()
	      else
	        invalid();
	  scan_gen stream
      | _ ->
	  add_data ~mo:n ~md:m ();
	  scan_gen stream

  and scan_date_dot n m stream =
    match Stream.npeek 2 stream with
      | [ Dot; Number(l,p) ] ->
          stream_njunk 2 stream;
	  if l=4 then
	    add_data ~md:n ~mo:m ~y: p ()
	  else if l=2 then
	    add_data ~md:n ~mo:m ~y2: p ()
	  else invalid();
	  scan_gen stream
      | _ ->
	  add_data ~md:n ~mo:m ();
	  scan_gen stream

  and scan_date_d (ln,n) stream =
    match Stream.npeek 3 stream with
      | [ Number(_,mo); Minus; Number(_,md) ] ->
          stream_njunk 3 stream;
	  if ln=4 then
	    add_data ~y:n ~mo ~md ()
	  else
	    if ln=2 then
	      add_data ~y2:n ~mo ~md ()
	    else  invalid();
	  scan_gen stream
      | [ Month mo; Minus; Number(ly,y) ] ->
          stream_njunk 3 stream;
	  if ly=4 then
	    add_data ~y ~mo ~md:n ()
	  else if ly=2 then
	    add_data ~y2:y ~mo ~md:n ()
	  else invalid();
	  scan_gen stream
      | _ ->
          invalid()

  and scan_date_m mo (lmd,md) stream =
    match Stream.npeek 2 stream with
      | [ Comma; Number(4,y) ] ->
          stream_njunk 2 stream;
	  add_data ~y ~mo ~md ();
	  scan_gen stream
      | _ ->
	  add_data ~mo ~md ();
	  scan_gen stream
  and scan_dst stream =
    match Stream.peek stream with
      | Some Dst -> Stream.junk stream; Some true
      | _ -> None
  and scan_opt_coma stream =
    match Stream.peek stream with
      | Some Comma -> Stream.junk stream; ()
      | _ -> ()
  and scan_opt_meridian stream =
    match Stream.peek stream with
      | Some (Meridian mdn) -> Stream.junk stream; Some mdn
      | _ -> None
  in
  (try scan_gen tokens;
   with
     | Stream.Error _ -> invalid()
     | Stream.Failure -> invalid()
  );
  let may_get r =
    match !r with
      | None -> invalid()
      | Some r -> r in
  let get_default d r =
    match !r with
      | None -> d
      | Some r -> r in
  let month = may_get month in
  if month < 1 || month > 12 then invalid();
  let date =
    {
      year = may_get year;
      month = month;
      day = may_get day;
      hour = get_default 0 hour;
      minute = get_default 0 minute;
      second = get_default 0 second;
      nanos = get_default 0 nanos;
      zone = get_default (match dzone with None -> 0 | Some z -> z) zone;
      week_day = get_default (-1) week_day
    } in
  if !zone=None && dzone=None && localzone then
    let tm =
      { Unix.tm_year = date.year - 1900;
        tm_mon = date.month - 1;
        tm_mday = date.day;
        tm_hour = date.hour;
        tm_min = date.minute;
        tm_sec = date.second;
        tm_wday = 0;
        tm_yday = 0;
        tm_isdst = false
      } in
    let (_,tm) = Unix.mktime tm in
    let zone = localzone_nodst + (if tm.Unix.tm_isdst then 60 else 0) in
    { date with zone = zone }
  else
    date
;;

let months_start =
  [| 0; 31; 59; 90; 120; 151; 181; 212; 243; 273; 304; 334 |]
;;

let is_leap year =
  year mod 4 = 0 && (year mod 100 <> 0 || year mod 400 = 0)
;;

let since_epoch date =
  if date.month < 1 || date.month > 12 then invalid_arg "Netdate.since_epoch";
  let in_day = float_of_int
    (date.hour * 3600 + (date.minute - date.zone) * 60 + date.second) in
  let days = date.year * 365 + (date.year + 3) / 4 - (date.year + 99) / 100 +
    (date.year + 399) / 400 - 719528 in
  let days = days + months_start.(date.month - 1) + date.day - 1 in
  let days =
    if is_leap date.year && date.month > 2
    then days + 1 else days in
  86400.0 *. (float_of_int days) +. in_day
;;

let since_epoch_timespec date =
  (since_epoch date, date.nanos)

let since_epoch_approx date =
  since_epoch date +. (float date.nanos) *. 1E-9

let parse_epoch ?l9n ?localzone ?zone str = 
  since_epoch (parse ?l9n ?localzone ?zone str) ;;

let parse_epoch_timespec ?l9n ?localzone ?zone str = 
  since_epoch_timespec (parse ?l9n ?localzone ?zone str) ;;

let parse_epoch_approx ?l9n ?localzone ?zone str = 
  since_epoch_approx (parse ?l9n ?localzone ?zone str) ;;


let billion = 1_000_000_000

let create ?(localzone=false) 
           ?zone
	   ?(nanos=0)
           time =
  (* Add nanos to time: *)
  let t0 = floor time in
  let ns0 = truncate ( (time -. t0) *. 1E9 ) in
  let ns1 = if ns0 >= billion - nanos then (nanos-billion)+ns0 else nanos+ns0 in
  let t1 = if ns0 >= billion - nanos then t0 +. 1.0 else t0 in

  let zone =
    match zone with
      | Some z -> z
      | None ->
          if localzone then
            get_localzone_at t1
          else
            0 in

  let t2 = t1 +. (float_of_int (zone * 60)) in
  let days = floor (t2 /. 86400.0) in
  let in_day = int_of_float (t2 -. 86400.0 *. days) in
  let days = days +. 719528.0 in
  let n400 = floor (days /. 146097.0) in
  let r400 = int_of_float (days -. n400 *. 146097.0) in
  let n400 = int_of_float n400 in
  let (n100, r100) =
    if r400 < 36525 then (0, r400)
    else ((r400 - 1) / 36524, (r400 - 1) mod 36524) in
  let (n4, r4) =
    if n100 = 0 then (r100 / 1461, r100 mod 1461)
    else if r100 < 1460 then (0, r100)
    else ((r100 + 1) / 1461, (r100 + 1) mod 1461) in
  let (n1, r1) =
    if n4 = 0 && n100 <> 0 then (r4 / 365, r4 mod 365)
    else if r4 < 366 then (0, r4)
    else ((r4 - 1) / 365, (r4 - 1) mod 365) in
  let year = 400 * n400 + 100 * n100 + 4 * n4 + n1 in
  let month_start =
    if is_leap year then
      fun m -> months_start.(m) + (if m > 1 then 1 else 0)
    else
      fun m -> months_start.(m) in
  let month_guess = r1 / 29 in
  let month =
    if month_guess = 12 then 11
    else if r1 >= month_start month_guess then month_guess
    else month_guess - 1 in
  let second = in_day mod 60
  and minutes = in_day / 60 in
  let minute = minutes mod 60
  and hour = minutes / 60 in
  {
    year = year;
    month = month + 1;
    day = r1 - (month_start month) + 1;
    hour = hour;
    minute = minute;
    second = second;
    nanos = ns1;
    zone = zone;
    week_day = int_of_float (mod_float (days +. 6.0) 7.0)
  }
;;

let week_day date = (* 0..6, relative to timezone *)
  if date.week_day = (-1) then
    let t1 = since_epoch date in
    let t2 = t1 +. (float_of_int (date.zone * 60)) in
    let days = floor (t2 /. 86400.0) in
    int_of_float (mod_float (days +. 4.0) 7.0)
  else
    date.week_day
;;


let year_day date = (* 0..365, relative to timezone *)
  let is_leap_year = is_leap date.year in
  months_start.(date.month - 1) +
    (if date.month >= 3 && is_leap_year then 1 else 0) +
    date.day - 1
;;


let rec iso8601_week_pair date =
  let ( % ) a b = if a >= 0 then a mod b else  a mod b + b in
  let d_wday = week_day date in
  let d_yday = year_day date in
  let wday_jan_1 =  (* wday of jan 1 *)
    (d_wday - d_yday) % 7 in
  let shift =
    if wday_jan_1 = 1 then 7 else (wday_jan_1 - 1) % 7 in
  let offset =
    if wday_jan_1 >= 2 && wday_jan_1 <= 4 then 1 else 0 in
  let week = (d_yday + shift) / 7 + offset in
  if week = 0 then 
    (* replace with last week of last year *)
    let date' =
      { date with
        year = date.year - 1;
        month = 12;
        day = 31;
        week_day = (-1)
      } in
    iso8601_week_pair date'
  else
    if week = 53 then
      (* only if dec 31 is a thu/fri/sat/sun *)
      let date' =
        { date with
            month = 12;
            day = 31;
            week_day = (-1)
        } in
      let d_wday' = week_day date' in
      if d_wday' >= 4 || d_wday' = 0 then
        (53, date.year)
      else
        (1, date.year+1)
    else
      (week, date.year)


let rec format_to ?(l9n=c_posix_l9n) out_ch ~fmt date =
  let to_lower = to_lower l9n in
  let to_upper = to_upper l9n in
  let add_char c = out_ch#output_char c
  and add_string s = out_ch#output_string s in
  let fail () = invalid_arg "Netdate.format_to" in
  let add_digits w b n =
    if n >= b * 10 then fail ();
    let rec aux b n =
      add_char (char_of_int (48 + n / b));
      if b >= 10 then aux (b / 10) (n mod b) in
    if w then (
      let rec aux_spaces b =
	if n >= b || b < 10 then (
	  aux b n
	) else (
	  add_char ' ';
	  aux_spaces (b / 10)
	) in
      aux_spaces b
    ) else (
      aux b n
    ) in
  let wd_lz = lazy (week_day date) in
  let wd () = Lazy.force wd_lz in
  let yd_lz = lazy (year_day date) in
  let yd () = Lazy.force yd_lz in
  let wp_lz = lazy (iso8601_week_pair date) in
  let wp() = Lazy.force wp_lz in
  let rec do_format ?(have_colon=false) ?(precision=0) = function
    | 'a' -> add_string l9n.l9n.abbr_day_names.( wd() )
    | 'A' -> add_string l9n.l9n.full_day_names.( wd() )
    | 'b' | 'h' -> add_string l9n.l9n.abbr_month_names.(date.month - 1)
    | 'B' -> add_string l9n.l9n.full_month_names.(date.month - 1)
    | 'C' -> add_digits false 10 (date.year / 100)
    | 'd' -> add_digits false 10 date.day
    | 'e' -> add_digits true 10 date.day
    | 'g' -> add_digits false 10 (snd(wp()) mod 10)
    | 'G' -> add_digits false 1000 (snd(wp()))
    | 'H' -> add_digits false 10 date.hour
    | 'I' -> add_digits false 10 (match date.hour mod 12 with 0 -> 12 | d -> d)
    | 'j' -> add_digits false 100 (yd () + 1)
    | 'k' -> add_digits true 10 date.hour
    | 'l' -> add_digits true 10 (match date.hour mod 12 with 0 -> 12 | d -> d)
    | 'm' -> add_digits false 10 date.month
    | 'M' -> add_digits false 10 date.minute
    | 'n' -> add_char '\n'
    | 'p' -> add_string (if date.hour >= 12 then
                           to_upper l9n.l9n.pm_particle
                         else
                           to_upper l9n.l9n.am_particle
                        )
    | 'P' -> add_string (if date.hour >= 12 then
                           to_lower l9n.l9n.pm_particle
                         else
                           to_lower l9n.l9n.am_particle)
    | 's' -> add_string (string_of_float (since_epoch date))
    | 'S' -> add_digits false 10 date.second;
             if precision > 0 then (
	       add_char '.';
	       add_string
		 (sprintf 
		    "%0*d"
		    precision (date.nanos / ten_power(9-precision)))
	     )
    | 't' -> add_char '\t'
    | 'u' -> add_digits false 1 (match wd () with 0 -> 7 | n -> n)
    | 'y' -> add_digits false 10 (date.year mod 100)
    | 'Y' -> add_digits false 1000 date.year
    | 'z' | 'Z' ->
	let (s, z) =
	  if date.zone >= 0 then ('+', date.zone)
	  else ('-', -date.zone) in
	add_char s;
	add_digits false 10 (z / 60);
	if have_colon then add_char ':';
	add_digits false 10 (z mod 60)
    | 'U' -> add_digits false 10 ((yd () - wd () + 7) / 7)
    | 'V' -> add_digits false 10 (fst(wp()))
    | 'W' -> let wdm = if wd() = 0 then 6 else wd() - 1 in
             add_digits false 10 ((yd () - wdm + 7) / 7)
    | 'w' -> add_digits false 1 (wd ())
    | '%' -> add_char '%'
    | 'c' -> format_to ~l9n out_ch ~fmt:l9n.l9n.d_t_format date        
    | 'F' -> do_format 'Y'; add_char '-'; do_format 'm'; add_char '-';
             do_format 'd'
    | 'x' -> format_to ~l9n out_ch ~fmt:l9n.l9n.d_format date
    | 'X' -> format_to ~l9n out_ch ~fmt:l9n.l9n.t_format date
    | 'D' ->
	do_format 'm';
	add_char '/';
	do_format 'd';
	add_char '/';
	do_format 'y'
    | 'r' -> format_to ~l9n out_ch ~fmt:l9n.l9n.t_format_ampm date
    | 'R' ->
	do_format 'H';
	add_char ':';
	do_format 'M'
    | 'T'  ->
	do_format 'R';
	add_char ':';
	do_format 'S'
    | _ -> fail () in
  let l_fmt = String.length fmt in
  let rec aux i =
    if i = l_fmt then ()
    else match fmt.[i] with
      | '%' when i = l_fmt - 1 -> fail ()
      | '%' ->
	  if fmt.[i + 1] = ':' then (
	    if i+2 >= l_fmt then fail();
	    do_format ~have_colon:true fmt.[i + 2];
	    aux (i + 3)
	  )
	  else (
	    if fmt.[i + 1] = '.' then (
	      if i+3 >= l_fmt then fail();
	      match fmt.[i+2] with
		| '0'..'9' as c ->
		    let d = Char.code c - 48 in
		    do_format ~precision:d fmt.[i + 3];
		    aux (i + 4)
		| _ -> fail()
	    )
	    else (
	      do_format fmt.[i + 1];
	      aux (i + 2)
	    )
	  )
      | c -> add_char c; aux (i + 1) in
  try aux 0
  with _ -> fail ()
;;

let format ?l9n ~fmt date =
  let b = Buffer.create (String.length fmt * 2) in
  format_to ?l9n (new Netchannels.output_buffer b) ~fmt date;
  Buffer.contents b
;;

(* The format routines above may want to support internationalization
 * in the future. The following must use the English conventions
 * described in the relevant RFCs.
 *)

let mk_date ?localzone ?zone ?nanos ~fmt t =
  format ~fmt (create ?localzone ?zone ?nanos t)

let mk_mail_date ?localzone ?zone t =
  format "%a, %d %b %Y %H:%M:%S %z" (create ?localzone ?zone t)
;;

let mk_usenet_date ?localzone ?zone t =
  format "%A, %d-%b-%y %H:%M:%S %z" (create ?localzone ?zone t)
;;

let mk_internet_date ?localzone ?zone ?(digits=0) t =
  if digits < 0 || digits > 9 then
    failwith "Netdate.mk_internet_date: digits out of bounds";
  let fmt =
    sprintf 
      "%%Y-%%m-%%dT%%H:%%M:%%.%dS%%:z"
      digits in
  format ~fmt (create ?localzone ?zone t)
;;
