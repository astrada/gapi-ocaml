(* $Id$
 * ----------------------------------------------------------------------
 *
 *)

(** Support for common date/time parsing and formatting.
 * Many routines refer to the epoch, which for Unix is 
 * 00:00:00 UTC, January 1, 1970. Timestamps given as
 * "seconds since the epoch" ignore leap seconds.
 *)

type t = {
  year : int;		(** complete year *)
  month : int;		(** 1..12 *)
  day : int;		(** 1..31 *)
  hour : int;           (** 0..23 *)
  minute : int;         (** 0..59 *)
  second : int;         (** 0..60 (60=leapsecond) *)
  nanos : int;          (** nanoseconds, new since Ocamlnet-3.5 *)
  zone : int;		(** in minutes; 60 = UTC+0100 *)
  week_day : int	(** 0 = sunday; -1 if not given *)
}

val localzone : int
  (** The offset in minutes for the local time zone from the UTC.
      This is the zone from the time when the program was started.
      For long-running programs, it is possible that the zone changes
      when daylight savings become effective or non-effective.
   *)

val localzone_nodst : int
  (** Returns the offset for the local time zone for the case that
      daylight savings are not effective.
   *)

val get_localzone : unit -> int
  (** Retrieves the current offset for the local time zone, taking
      daylight savings into account.
   *)

val create : ?localzone:bool -> ?zone:int -> ?nanos:int -> float -> t
  (** Convert the time (seconds since the epoch) to a date/time record 

      The [nanos] are added to the float as nanoseconds.

      If [zone] is set this zone is taken. Otherwise, if
      [localzone] is set, the local timezone is used that is valid
      at the requested time. Otherwise, UTC is used.

      Note that [create ~localzone:true t] is different from
      [create ~zone:(get_localzone()) t] because the latter assumes
      the timezone that is in effect when the function is called, and not 
      the timezone at the time [t].
   *)

type localization =
    { full_day_names : string array;
        (** Element [k] contains the name of the week day [k] (0=Sunday) *)

      abbr_day_names : string array;
        (** Element [k] contains the abbreviated name of the week day [k]
            (0=Sunday) *)

      parsed_day_names : string list array;
        (** Element [k] contains a list of all possible names of the week
            day [k]. The list includes full and abbreviated names, but can
            also contain any other allowed name (aliases). The names here
            are in lowercase characters.
         *)

      full_month_names : string array;
        (** Element [k] contains the name of the month day [k] (0=January) *)

      abbr_month_names : string array;
        (** Element [k] contains the abbreviated name of the month day [k] 
            (0=January) *)

      parsed_month_names : string list array;
        (** Element [k] contains a list of all possible names of the month
            [k]. The list includes full and abbreviated names, but can
            also contain any other allowed name (aliases). The names here
            are in lowercase characters.
         *)

      timezone_names : (string * int * bool) list;
        (** A list of pairs [(name,offset,isdst)] of timezones. The offset is
            in minutes.
         *)

      am_particle : string;
        (** A particle for "AM" *)

      pm_particle : string;
        (** A particle for "PM" *)

      d_format : string;
        (** Format string for date according to the locale *)

      t_format : string;
        (** Format string for time according to the locale *)

      d_t_format : string;
        (** Format string for date and time according to the locale *)

      t_format_ampm : string;
        (** Format string for time, using am and pm, according to the locale *)

      char_encoding : string;
        (** The character encoding of this locale *)
    }

type compiled_localization

val posix_l9n : localization
  (** The standard POSIX localization (English names) *)

val l9n_from_locale : string -> localization
  (** Retrieves the localization from the passed locale (use "" for the
      standard locale). Timezone names are not provided by the locale

      This function is not available on Windows (the POSIX localization
      is always returned).
   *)

val compile_l9n : localization -> compiled_localization
  (** Preprocess the localization data for faster parsing and printing *)

val parse : ?localzone:bool -> ?zone:int -> ?l9n:compiled_localization -> 
            string -> t
  (** Parse a string and return a date/time record.

      The following particles are recognized (by example):
      - Date: [1971/06/22]
      - Date: [06/22/1971]
      - Date: [1971-06-22]
      - Date: [22-June-1971]
      - Date: [22.06.1971]
      - Date: [June 22, 1971]
      - Date: [22 June 1971]
      - Date (2 digit year): [06/22/71]
      - Date (2 digit year): [22.06.71]
      - Date (2 digit year): [71-06-22]
      - Date (2 digit year): [22-June-71]
      - Month names ([June], [Jun])
      - Weekday names ([Monday], [Mon])
      - Time: [14:55]
      - Time: [14:55:28]
      - Time: [14:55:28.6754]   (the fractional part is not returned)
      - Time may be preceded by [T]
      - Time zone: identifiers like [UTC], [CET], or [Z]
      - Time zone: [+01:00], [-01:00], only following time
      - Time zone: [+0100], [-0100], only following time

      Years must have 2 or 4 digits. 2-digit years >= 70 are interpreted
      as [1900+x]. 2-digit years < 70 are interpreted as [2000+x].
      Support for 2-digit years will be removed in a future version
      of Ocamlnet. (Support for 3-digit years is already removed in
      Ocamlnet 3.0.)

      The names of months and weekdays are recognized that are configured
      with the [l9n] argument. By default, English names are recognized.

      A date must be given. Time, time zones, and weekdays are optional.
      A missing time is reported as "00:00:00". A missing weekday is
      reported by setting [week_day=(-1)]. A missing time zone is 
      reported by setting [zone] to the passed default (which is determined
      from the [zone] and [localzone] arguments as for [create]).

      It is not checked whether the parsed numbers make sense
      (e.g. whether months are between 1 and 12).

      Date/time strings as defined in RFC 3339 are supported since
      Ocamlnet 3.0.
   *)

val since_epoch : t -> float
  (** Convert a date/time record into the time (seconds since the epoch),
      rounded down to the next integral number.
   *)

val since_epoch_timespec : t -> (float * int)
  (** Returns the seconds since the epoch as pair [(seconds,nanos)] *)

val since_epoch_approx : t -> float
  (** Same, but the nanos are added to the seconds. The precision of
      floats is not sufficient to represent this precisely, so the
      result is only an approximation.
   *)

val week_day : t -> int
  (** Returns the week day. If the [week_day] field is (-1) the week day
      is computed.
   *)

val year_day : t -> int
  (** Returns the year day (range 0 to 365) *)

val iso8601_week_pair : t -> int * int
  (** Returns [(week_number, year)] for the ISO-8601 definition of weeks.
      The week starts with Monday, and has numbers 1-53. A week is considered
      to be part of the year into which four or more days fall.
   *)

val parse_epoch : ?l9n:compiled_localization ->
                  ?localzone:bool -> ?zone:int -> string -> float
  (** Parse a string and return the time (integral seconds since the epoch) *)

val parse_epoch_timespec : ?l9n:compiled_localization ->
                           ?localzone:bool -> ?zone:int -> string -> float * int
  (** Parse a string and return the time (seconds and nanos since the epoch) *)
  
val parse_epoch_approx  : ?l9n:compiled_localization ->
                          ?localzone:bool -> ?zone:int -> string -> float
  (** Parse a string and return the time (approximate seconds since the epoch)
   *)

val format_to : ?l9n:compiled_localization ->
                Netchannels.out_obj_channel -> fmt:string -> t -> unit
  (** Format a date/time record according to the format string and outputs
   * the resulting string to the channel.
   *
   * The format string consists of zero or more conversion specifications
   * and ordinary characters.  All ordinary characters are output directly
   * to the channel.  A conversion specification consists of the '%'
   * character and one other character.
   *
   * The conversion specifications are:
   *
   *  - [%A]: full weekday name.
   *  - [%a]: abbreviated weekday name.
   *  - [%B]: full month name.
   *  - [%b]: abbreviated month name.
   *  - [%C]: (year / 100) as an integer; single digits are preceded by a zero.
   *  - [%c]: the preferred date+time representation of [l9n]
   *  - [%D]: equivalent to ["%m/%d/%y"].
   *  - [%d]: day of the month as an integer (01-31); single digits are
   *          preceded by a zero.
   *  - [%e]: day of the month as an integer (1-31).
   *  - [%F]: equivalent to ["%Y-%m-%d"] (ISO 8601)
   *  - [%G]: the year of the week according to the ISO-8601 week definition
   *  - [%g]: same as %G but uses a two-digit year
   *  - [%H]: hour (24-hour clock) as an integer (00-23).
   *  - [%h]: the same as %b.
   *  - [%I]: hour (12-hour clock) as an integer (01-12).
   *  - [%j]: day of the year as an integer (001-366).
   *  - [%k]: hour (24-hour clock) as an integer (0-23);
   *          single digits are preceded by a blank.
   *  - [%l]: hour (12-hour clock) as an integer (1-12);
   *          single digits are preceded by a blank.
   *  - [%M]: minute as an integer (00-59).
   *  - [%m]: month as an integer (01-12).
   *  - [%n]: a newline.
   *  - [%p]: "AM" or "PM" as defined in [l9n], in uppercase
   *  - [%P]: "am" or "pm" as defined in [l9n], in lowercase
   *  - [%R]: equivalent to ["%H:%M"].
   *  - [%r]: the time in am/pm notation according to [l9n]
   *  - [%S]: second as an integer (00-60). This format accepts a precision
        argument, e.g. [%.3S] to print the second with three digits after the
        dot.
   *  - [%s]: number of seconds since the epoch
   *  - [%T]: equivalent to ["%H:%M:%S"].
   *  - [%t]: a tab.
   *  - [%U]: week number of the year (Sunday as the first day
   *          of the week) as an integer (00-53).
   *  - [%u]  weekday (Monday as the first day of the week) as
   *          an integer (1-7).
   *  - [%V]: week number of the year (ISO-8601 definition, use together with
   *          [%G] or [%g]
   *  - [%W]: week number of the year (Monday as the first day
   *          of the week) as an integer (00-53).
   *  - [%w]: weekday (Sunday as the first day of the week) as
   *          an integer (0-6).
   *  - [%X]: representation of the time according to [l9n]
   *  - [%x]: representation of the date according to [l9n]
   *  - [%Y]: year with century as an integer.
   *  - [%y]: year without century as an integer (00-99).
   *  - [%z]: time zone offset from UTC; a leading plus sign
   *        stands for east of UTC, a minus sign for west of UTC, hours and
   *        minutes follow with two digits each and no delimiter between them
   *        (common form for RFC 822 date headers).
   *  - [%Z]: same as [%z]
   *  - [%:z]: time zone with colon, e.g. +05:00 (new since Ocamlnet 3)
   *  - [%%]: a `%' character.
   *
   * If [l9n] is not passed, the default is the POSIX localization
   * (English names).
   *)

val format : ?l9n:compiled_localization -> fmt:string -> t -> string
  (** Format a date/time record as a string *)

val mk_date : ?localzone:bool -> ?zone:int -> ?nanos:int -> fmt:string -> 
                 float -> string
  (** Format the seconds (plus nanos if present) as a string *)

val mk_mail_date : ?localzone:bool -> ?zone:int -> float -> string
  (** Convert the time (seconds since the epoch) to a date string that
   * conforms to RFC 1123 (which updates RFC 822).
   *
   * Example: ["Sun, 06 Nov 1994 08:49:37 -0500"].
   *)

val mk_usenet_date : ?localzone:bool -> ?zone:int -> float -> string
  (** Convert the time (seconds since the epoch) to a date string that
   * conforms to RFC 1036 (which obsoletes RFC 850).
   *
   * Example: ["Sunday, 06-Nov-94 08:49:37 -0500"].
   *
   * Note that this format has only two digits for the year.
   *)

val mk_internet_date : ?localzone:bool -> ?zone:int -> ?digits:int ->
                         float -> string
  (** Convert the time (seconds since the epoch) to a date string that
   * conforms to RFC 3339. This is the most modern format, and should
   * be used if permitted by the network protocol. Pass in [digits] the
   * number of digits for the fractional part of seconds.
   *
   * Example: ["1996-12-19T16:39:57.89-08:00"].
   *)
