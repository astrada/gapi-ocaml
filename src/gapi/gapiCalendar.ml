open GapiUtils.Infix
open GapiCore
open GapiJson

module Reminder =
struct
  type t = {
    _method : string;
    minutes : int
  }

  let _method = {
    GapiLens.get = (fun x -> x._method);
    GapiLens.set = (fun v x -> { x with _method = v })
  }
  let minutes = {
    GapiLens.get = (fun x -> x.minutes);
    GapiLens.set = (fun v x -> { x with minutes = v })
  }

  let empty = {
    _method = "";
    minutes = 0
  }

  let render x =
    render_object ""
      [render_string_value "method" x._method;
       render_int_value "minutes" x.minutes]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "method"; data_type = Scalar },
           Json_type.String v) ->
          { x with _method = v }
      | AnnotatedTree.Leaf
          ({ name = "minutes"; data_type = Scalar },
           Json_type.Int v) ->
          { x with minutes = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiCalendar.Reminder.parse" e

end

module CalendarListResource =
struct
  type t = {
    kind : string;
    etag : string;
    id : string;
    summary : string;
    description : string;
    location : string;
    timeZone : string;
    summaryOverride : string;
    colorId : string;
    hidden : bool;
    selected : bool;
    accessRole : string;
    defaultReminders : Reminder.t list
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v })
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v })
  }
  let summary = {
    GapiLens.get = (fun x -> x.summary);
    GapiLens.set = (fun v x -> { x with summary = v })
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v })
  }
  let location = {
    GapiLens.get = (fun x -> x.location);
    GapiLens.set = (fun v x -> { x with location = v })
  }
  let timeZone = {
    GapiLens.get = (fun x -> x.timeZone);
    GapiLens.set = (fun v x -> { x with timeZone = v })
  }
  let summaryOverride = {
    GapiLens.get = (fun x -> x.summaryOverride);
    GapiLens.set = (fun v x -> { x with summaryOverride = v })
  }
  let colorId = {
    GapiLens.get = (fun x -> x.colorId);
    GapiLens.set = (fun v x -> { x with colorId = v })
  }
  let hidden = {
    GapiLens.get = (fun x -> x.hidden);
    GapiLens.set = (fun v x -> { x with hidden = v })
  }
  let selected = {
    GapiLens.get = (fun x -> x.selected);
    GapiLens.set = (fun v x -> { x with selected = v })
  }
  let accessRole = {
    GapiLens.get = (fun x -> x.accessRole);
    GapiLens.set = (fun v x -> { x with accessRole = v })
  }
  let defaultReminders = {
    GapiLens.get = (fun x -> x.defaultReminders);
    GapiLens.set = (fun v x -> { x with defaultReminders = v })
  }

  let empty = {
    kind = "";
    etag = "";
    id = "";
    summary = "";
    description = "";
    location = "";
    timeZone = "";
    summaryOverride = "";
    colorId = "";
    hidden = false;
    selected = false;
    accessRole = "";
    defaultReminders = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "etag" x.etag;
       render_string_value "id" x.id;
       render_string_value "summary" x.summary;
       render_string_value "description" x.description;
       render_string_value "location" x.location;
       render_string_value "timeZone" x.timeZone;
       render_string_value "summaryOverride" x.summaryOverride;
       render_string_value "colorId" x.colorId;
       render_bool_value "hidden" x.hidden;
       render_bool_value "selected" x.selected;
       render_string_value "accessRole" x.accessRole;
       render_array "defaultReminders" Reminder.render x.defaultReminders]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "etag"; data_type = Scalar },
           Json_type.String v) ->
          { x with etag = v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "summary"; data_type = Scalar },
           Json_type.String v) ->
          { x with summary = v }
      | AnnotatedTree.Leaf
          ({ name = "description"; data_type = Scalar },
           Json_type.String v) ->
          { x with description = v }
      | AnnotatedTree.Leaf
          ({ name = "location"; data_type = Scalar },
           Json_type.String v) ->
          { x with location = v }
      | AnnotatedTree.Leaf
          ({ name = "timeZone"; data_type = Scalar },
           Json_type.String v) ->
          { x with timeZone = v }
      | AnnotatedTree.Leaf
          ({ name = "summaryOverride"; data_type = Scalar },
           Json_type.String v) ->
          { x with summaryOverride = v }
      | AnnotatedTree.Leaf
          ({ name = "colorId"; data_type = Scalar },
           Json_type.String v) ->
          { x with colorId = v }
      | AnnotatedTree.Leaf
          ({ name = "hidden"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with hidden = v }
      | AnnotatedTree.Leaf
          ({ name = "selected"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with selected = v }
      | AnnotatedTree.Leaf
          ({ name = "accessRole"; data_type = Scalar },
           Json_type.String v) ->
          { x with accessRole = v }
      | AnnotatedTree.Node
          ({ name = "defaultReminders"; data_type = Array },
           cs) ->
          parse_collection
            Reminder.parse
            Reminder.empty
            (fun xs -> { x with defaultReminders = xs })
            cs
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiCalendar.CalendarListResource.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module CalendarListList =
struct
  type t = {
    kind : string;
    etag : string;
    nextPageToken : string;
    items : CalendarListResource.t list
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v })
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v })
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v })
  }

  let empty = {
    kind = "";
    etag = "";
    nextPageToken = "";
    items = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "etag" x.etag;
       render_string_value "nextPageToken" x.nextPageToken;
       render_array "items" CalendarListResource.render x.items]

  let parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "etag"; data_type = Scalar },
           Json_type.String v) ->
          { x with etag = v }
      | AnnotatedTree.Leaf
          ({ name = "nextPageToken"; data_type = Scalar },
           Json_type.String v) ->
          { x with nextPageToken = v }
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_collection
            CalendarListResource.parse
            CalendarListResource.empty
            (fun xs -> { x with items = xs })
            cs
      | e ->
          unexpected "GapiCalendar.CalendarListList.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module CalendarsResource =
struct
  type t = {
    kind : string;
    etag : string;
    id : string;
    summary : string;
    description : string;
    location : string;
    timeZone : string
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v })
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v })
  }
  let summary = {
    GapiLens.get = (fun x -> x.summary);
    GapiLens.set = (fun v x -> { x with summary = v })
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v })
  }
  let location = {
    GapiLens.get = (fun x -> x.location);
    GapiLens.set = (fun v x -> { x with location = v })
  }
  let timeZone = {
    GapiLens.get = (fun x -> x.timeZone);
    GapiLens.set = (fun v x -> { x with timeZone = v })
  }

  let empty = {
    kind = "";
    etag = "";
    id = "";
    summary = "";
    description = "";
    location = "";
    timeZone = ""
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "etag" x.etag;
       render_string_value "id" x.id;
       render_string_value "summary" x.summary;
       render_string_value "description" x.description;
       render_string_value "location" x.location;
       render_string_value "timeZone" x.timeZone]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "etag"; data_type = Scalar },
           Json_type.String v) ->
          { x with etag = v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "summary"; data_type = Scalar },
           Json_type.String v) ->
          { x with summary = v }
      | AnnotatedTree.Leaf
          ({ name = "description"; data_type = Scalar },
           Json_type.String v) ->
          { x with description = v }
      | AnnotatedTree.Leaf
          ({ name = "location"; data_type = Scalar },
           Json_type.String v) ->
          { x with location = v }
      | AnnotatedTree.Leaf
          ({ name = "timeZone"; data_type = Scalar },
           Json_type.String v) ->
          { x with timeZone = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiCalendar.CalendarsResource.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module ColorResource =
struct
  type color = {
    background : string;
    foreground : string
  }
  type t = string * color

  let background = {
    GapiLens.get = (fun x -> x.background);
    GapiLens.set = (fun v x -> { x with background = v })
  }
  let foreground = {
    GapiLens.get = (fun x -> x.foreground);
    GapiLens.set = (fun v x -> { x with foreground = v })
  }
  let id = GapiLens.first
  let color = GapiLens.second

  let empty = ("", {
    background = "";
    foreground = ""
  })

  let render (id, x) =
    render_object id
      [render_string_value "background" x.background;
       render_string_value "foreground" x.foreground]

  let rec parse (id, x) tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "background"; data_type = Scalar },
           Json_type.String v) ->
          (id, { x with background = v })
      | AnnotatedTree.Leaf
          ({ name = "foreground"; data_type = Scalar },
           Json_type.String v) ->
          (id, { x with foreground = v })
      | AnnotatedTree.Node
          ({ name = n; data_type = Object },
           cs) ->
          parse_children
            (fun (_, c) t -> parse (n, c) t)
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiCalendar.Color.parse" e

end

module ColorList =
struct
  type t = {
    kind : string;
    updated : string;
    calendar : ColorResource.t list;
    event : ColorResource.t list
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v })
  }
  let calendar = {
    GapiLens.get = (fun x -> x.calendar);
    GapiLens.set = (fun v x -> { x with calendar = v })
  }
  let event = {
    GapiLens.get = (fun x -> x.event);
    GapiLens.set = (fun v x -> { x with event = v })
  }

  let empty = {
    kind = "";
    updated = "";
    calendar = [];
    event = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "updated" x.updated;
       render_collection "calendar" Object ColorResource.render x.calendar;
       render_collection "event" Object ColorResource.render x.event]

  let parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "updated"; data_type = Scalar },
           Json_type.String v) ->
          { x with updated = v }
      | AnnotatedTree.Node
          ({ name = "calendar"; data_type = Object },
           cs) ->
          parse_collection
            ColorResource.parse
            ColorResource.empty
            (fun xs -> { x with calendar = xs })
            cs
      | AnnotatedTree.Node
          ({ name = "event"; data_type = Object },
           cs) ->
          parse_collection
            ColorResource.parse
            ColorResource.empty
            (fun xs -> { x with event = xs })
            cs
      | e ->
          unexpected "GapiCalendar.ColorList.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module SettingsResource =
struct
  type t = {
    kind : string;
    etag : string;
    id : string;
    value : string
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v })
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v })
  }
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v })
  }

  let empty = {
    kind = "";
    etag = "";
    id = "";
    value = ""
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "etag" x.etag;
       render_string_value "id" x.id;
       render_string_value "value" x.value]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "etag"; data_type = Scalar },
           Json_type.String v) ->
          { x with etag = v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "value"; data_type = Scalar },
           Json_type.String v) ->
          { x with value = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiCalendar.SettingsResource.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module SettingsList =
struct
  type t = {
    kind : string;
    etag : string;
    items : SettingsResource.t list
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v })
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v })
  }

  let empty = {
    kind = "";
    etag = "";
    items = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "etag" x.etag;
       render_array "items" SettingsResource.render x.items]

  let parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "etag"; data_type = Scalar },
           Json_type.String v) ->
          { x with etag = v }
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_collection
            SettingsResource.parse
            SettingsResource.empty
            (fun xs -> { x with items = xs })
            cs
      | e ->
          unexpected "GapiCalendar.SettingsList.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module FreeBusyParameters =
struct
  type t = {
    timeMin : GapiDate.t;
    timeMax : GapiDate.t;
    timeZone : string;
    groupExpansionMax : int;
    calendarExpansionMax : int;
    items : string list
  }

  let timeMin = {
    GapiLens.get = (fun x -> x.timeMin);
    GapiLens.set = (fun v x -> { x with timeMin = v })
  }
  let timeMax = {
    GapiLens.get = (fun x -> x.timeMax);
    GapiLens.set = (fun v x -> { x with timeMax = v })
  }
  let timeZone = {
    GapiLens.get = (fun x -> x.timeZone);
    GapiLens.set = (fun v x -> { x with timeZone = v })
  }
  let groupExpansionMax = {
    GapiLens.get = (fun x -> x.groupExpansionMax);
    GapiLens.set = (fun v x -> { x with groupExpansionMax = v })
  }
  let calendarExpansionMax = {
    GapiLens.get = (fun x -> x.calendarExpansionMax);
    GapiLens.set = (fun v x -> { x with calendarExpansionMax = v })
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v })
  }

  let empty = {
    timeMin = GapiDate.epoch;
    timeMax = GapiDate.epoch;
    timeZone = "";
    groupExpansionMax = 0;
    calendarExpansionMax = 0;
    items = []
  }

  let render x =
    let render_item id =
      render_object ""
        [render_string_value "id" id]
    in
      render_object ""
        [render_date_value "timeMin" x.timeMin;
         render_date_value "timeMax" x.timeMax;
         render_string_value "timeZone" x.timeZone;
         render_int_value "groupExpansionMax" x.groupExpansionMax;
         render_int_value "calendarExpansionMax" x.calendarExpansionMax;
         render_array "items" render_item x.items]

  let to_data_model = render_root render

end

module Error =
struct
  type t = {
    domain : string;
    reason : string
  }

  let domain = {
    GapiLens.get = (fun x -> x.domain);
    GapiLens.set = (fun v x -> { x with domain = v })
  }
  let reason = {
    GapiLens.get = (fun x -> x.reason);
    GapiLens.set = (fun v x -> { x with reason = v })
  }

  let empty = {
    domain = "";
    reason = ""
  }

  let render x =
    render_object ""
      [render_string_value "domain" x.domain;
       render_string_value "reason" x.reason]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "domain"; data_type = Scalar },
           Json_type.String v) ->
          { x with domain = v }
      | AnnotatedTree.Leaf
          ({ name = "reason"; data_type = Scalar },
           Json_type.String v) ->
          { x with reason = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiCalendar.Error.parse" e

end

module FreeBusyGroup =
struct
  type group = {
    errors : Error.t list;
    calendars : string list
  }
  type t = string * group

  let errors = {
    GapiLens.get = (fun x -> x.errors);
    GapiLens.set = (fun v x -> { x with errors = v })
  }
  let calendars = {
    GapiLens.get = (fun x -> x.calendars);
    GapiLens.set = (fun v x -> { x with calendars = v })
  }
  let id = GapiLens.first
  let group = GapiLens.second

  let empty = ("", {
    errors = [];
    calendars = []
  })

  let render (id, x) =
    render_object id
      [render_array "errors" Error.render x.errors;
       render_array "calendars" (render_string_value "") x.calendars]

  let rec parse (id, x) tree =
    let parse_calendar _ = function
        AnnotatedTree.Leaf
          ({ name = ""; data_type = Scalar },
           Json_type.String v) ->
          v
      | e ->
          unexpected "GapiCalendar.FreeBusyGroup.parse_calendar" e
    in
      match tree with
          AnnotatedTree.Node
            ({ name = "errors"; data_type = Array },
             cs) ->
            (id, parse_collection
                   Error.parse
                   Error.empty
                   (fun xs -> { x with errors = xs })
                   cs)
        | AnnotatedTree.Node
            ({ name = "calendars"; data_type = Array },
             cs) ->
            (id, parse_collection
                   parse_calendar
                   ""
                   (fun xs -> { x with calendars = xs })
                   cs)
        | AnnotatedTree.Node
            ({ name = n; data_type = Object },
             cs) ->
            parse_children
              (fun (_, c) t -> parse (n, c) t)
              empty
              Std.identity
              cs
        | e ->
            unexpected "GapiCalendar.FreeBusyGroup.parse" e

end

module Busy =
struct
  type t = {
    start : GapiDate.t;
    _end : GapiDate.t
  }

  let start = {
    GapiLens.get = (fun x -> x.start);
    GapiLens.set = (fun v x -> { x with start = v })
  }
  let _end = {
    GapiLens.get = (fun x -> x._end);
    GapiLens.set = (fun v x -> { x with _end = v })
  }

  let empty = {
    start = GapiDate.epoch;
    _end = GapiDate.epoch
  }

  let render x =
    render_object ""
      [render_date_value "start" x.start;
       render_date_value "end" x._end]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "start"; data_type = Scalar },
           Json_type.String v) ->
          { x with start = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "end"; data_type = Scalar },
           Json_type.String v) ->
          { x with _end = GapiDate.of_string v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiCalendar.Busy.parse" e

end

module FreeBusyCalendar =
struct
  type calendar = {
    errors : Error.t list;
    busy : Busy.t list
  }
  type t = string * calendar

  let errors = {
    GapiLens.get = (fun x -> x.errors);
    GapiLens.set = (fun v x -> { x with errors = v })
  }
  let busy = {
    GapiLens.get = (fun x -> x.busy);
    GapiLens.set = (fun v x -> { x with busy = v })
  }
  let id = GapiLens.first
  let calendar = GapiLens.second

  let empty = ("", {
    errors = [];
    busy = []
  })

  let render (id, x) =
    render_object id
      [render_array "errors" Error.render x.errors;
       render_array "busy" Busy.render x.busy]

  let rec parse (id, x) tree =
    match tree with
        AnnotatedTree.Node
          ({ name = "errors"; data_type = Array },
           cs) ->
          (id, parse_collection
                 Error.parse
                 Error.empty
                 (fun xs -> { x with errors = xs })
                 cs)
      | AnnotatedTree.Node
          ({ name = "busy"; data_type = Array },
           cs) ->
          (id, parse_collection
                 Busy.parse
                 Busy.empty
                 (fun xs -> { x with busy = xs })
                 cs)
      | AnnotatedTree.Node
          ({ name = n; data_type = Object },
           cs) ->
          parse_children
            (fun (_, c) t -> parse (n, c) t)
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiCalendar.FreeBusyCalendar.parse" e

end

module FreeBusyResource =
struct
  type t = {
    kind : string;
    timeMin : GapiDate.t;
    timeMax : GapiDate.t;
    groups : FreeBusyGroup.t list;
    calendars : FreeBusyCalendar.t list;
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let timeMin = {
    GapiLens.get = (fun x -> x.timeMin);
    GapiLens.set = (fun v x -> { x with timeMin = v })
  }
  let timeMax = {
    GapiLens.get = (fun x -> x.timeMax);
    GapiLens.set = (fun v x -> { x with timeMax = v })
  }
  let groups = {
    GapiLens.get = (fun x -> x.groups);
    GapiLens.set = (fun v x -> { x with groups = v })
  }
  let calendars = {
    GapiLens.get = (fun x -> x.calendars);
    GapiLens.set = (fun v x -> { x with calendars = v })
  }

  let empty = {
    kind = "";
    timeMin = GapiDate.epoch;
    timeMax = GapiDate.epoch;
    groups = [];
    calendars = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_date_value "timeMin" x.timeMin;
       render_date_value "timeMax" x.timeMax;
       render_collection "groups" Object FreeBusyGroup.render x.groups;
       render_collection "calendars" Object FreeBusyCalendar.render x.calendars]

  let parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "timeMin"; data_type = Scalar },
           Json_type.String v) ->
          { x with timeMin = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "timeMax"; data_type = Scalar },
           Json_type.String v) ->
          { x with timeMax = GapiDate.of_string v }
      | AnnotatedTree.Node
          ({ name = "groups"; data_type = Object },
           cs) ->
          parse_collection
            FreeBusyGroup.parse
            FreeBusyGroup.empty
            (fun xs -> { x with groups = xs })
            cs
      | AnnotatedTree.Node
          ({ name = "calendars"; data_type = Object },
           cs) ->
          parse_collection
            FreeBusyCalendar.parse
            FreeBusyCalendar.empty
            (fun xs -> { x with calendars = xs })
            cs
      | e ->
          unexpected "GapiCalendar.FreeBusyResource.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

