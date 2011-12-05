open GapiUtils.Infix
open GapiCore
open GapiJson

(* ACL *)

module ScopeData =
struct
  type t = {
    _type : string;
    value : string
  }

  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v })
  }
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v })
  }

  let empty = {
    _type = "";
    value = ""
  }

  let render x =
    render_object "scope"
      [render_string_value "type" x._type;
       render_string_value "value" x.value]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "type"; data_type = Scalar },
           Json_type.String v) ->
          { x with _type = v }
      | AnnotatedTree.Leaf
          ({ name = "value"; data_type = Scalar },
           Json_type.String v) ->
          { x with value = v }
      | AnnotatedTree.Node
          ({ name = "scope"; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiACL.ScopeData.parse" e

end

module AclRule =
struct
  type t = {
    kind : string;
    etag : string;
    id : string;
    scope : ScopeData.t;
    role : string
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
  let scope = {
    GapiLens.get = (fun x -> x.scope);
    GapiLens.set = (fun v x -> { x with scope = v })
  }
  let role = {
    GapiLens.get = (fun x -> x.role);
    GapiLens.set = (fun v x -> { x with role = v })
  }

  let empty = {
    kind = "";
    etag = "";
    id = "";
    scope = ScopeData.empty;
    role = ""
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "etag" x.etag;
       render_string_value "id" x.id;
       ScopeData.render x.scope;
       render_string_value "role" x.role]

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
      | AnnotatedTree.Node
          ({ name = "scope"; data_type = Object },
           cs) ->
          parse_children
            ScopeData.parse
            ScopeData.empty
            (fun s -> { x with scope = s })
            cs
      | AnnotatedTree.Leaf
          ({ name = "role"; data_type = Scalar },
           Json_type.String v) ->
          { x with role = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiACL.AclRule.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module Acl =
struct
  type t = {
    kind : string;
    etag : string;
    nextPageToken : string;
    items : AclRule.t list
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
       render_array "items" AclRule.render x.items]

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
            AclRule.parse
            AclRule.empty
            (fun xs -> { x with items = xs })
            cs
      | e ->
          unexpected "GapiACL.Acl.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

(* Calendar list *)

module EventReminder =
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
          unexpected "GapiCalendar.EventReminder.parse" e

end

module CalendarListEntry =
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
    defaultReminders : EventReminder.t list
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
       render_array "defaultReminders" EventReminder.render x.defaultReminders]

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
            EventReminder.parse
            EventReminder.empty
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
          unexpected "GapiCalendar.CalendarListEntry.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module CalendarList =
struct
  type t = {
    kind : string;
    etag : string;
    nextPageToken : string;
    items : CalendarListEntry.t list
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
       render_array "items" CalendarListEntry.render x.items]

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
            CalendarListEntry.parse
            CalendarListEntry.empty
            (fun xs -> { x with items = xs })
            cs
      | e ->
          unexpected "GapiCalendar.CalendarList.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

(* Calendars *)

module Calendar =
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
          unexpected "GapiCalendar.Calendar.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

(* Colors *)

module ColorDefinition =
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

module Colors =
struct
  type t = {
    kind : string;
    updated : string;
    calendar : ColorDefinition.t list;
    event : ColorDefinition.t list
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
       render_collection "calendar" Object ColorDefinition.render x.calendar;
       render_collection "event" Object ColorDefinition.render x.event]

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
            ColorDefinition.parse
            ColorDefinition.empty
            (fun xs -> { x with calendar = xs })
            cs
      | AnnotatedTree.Node
          ({ name = "event"; data_type = Object },
           cs) ->
          parse_collection
            ColorDefinition.parse
            ColorDefinition.empty
            (fun xs -> { x with event = xs })
            cs
      | e ->
          unexpected "GapiCalendar.Colors.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

(* Events *)

module PersonData =
struct
  type t = {
    email : string;
    displayName : string
  }

  let email = {
    GapiLens.get = (fun x -> x.email);
    GapiLens.set = (fun v x -> { x with email = v })
  }
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v })
  }

  let empty = {
    email = "";
    displayName = ""
  }

  let render x =
    [render_string_value "email" x.email;
     render_string_value "displayName" x.displayName]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "email"; data_type = Scalar },
           Json_type.String v) ->
          { x with email = v }
      | AnnotatedTree.Leaf
          ({ name = "displayName"; data_type = Scalar },
           Json_type.String v) ->
          { x with displayName = v }
      | e ->
          unexpected ("GapiCalendar.PersonData.parse") e

end

module EventDateTime =
struct
  type t = {
    date : GapiDate.t;
    dateTime : GapiDate.t;
    timeZone : string
  }

  let date = {
    GapiLens.get = (fun x -> x.date);
    GapiLens.set = (fun v x -> { x with date = v })
  }
  let dateTime = {
    GapiLens.get = (fun x -> x.dateTime);
    GapiLens.set = (fun v x -> { x with dateTime = v })
  }
  let timeZone = {
    GapiLens.get = (fun x -> x.timeZone);
    GapiLens.set = (fun v x -> { x with timeZone = v })
  }

  let empty = {
    date = GapiDate.epoch;
    dateTime = GapiDate.epoch;
    timeZone = ""
  }

  let render x =
    [render_date_value ~time:false "date" x.date;
     render_date_value "dateTime" x.dateTime;
     render_string_value "timeZone" x.timeZone]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "date"; data_type = Scalar },
           Json_type.String v) ->
          { x with date = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "dateTime"; data_type = Scalar },
           Json_type.String v) ->
          { x with dateTime = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "timeZone"; data_type = Scalar },
           Json_type.String v) ->
          { x with timeZone = v }
      | e ->
          unexpected ("GapiCalendar.EventDateTime.parse") e

end

module EventAttendee =
struct
  type t = {
    email : string;
    displayName : string;
    organizer : bool;
    self : bool;
    resource : bool;
    optional : bool;
    responseStatus : string;
    comment : string;
    additionalGuests : int
  }

  let email = {
    GapiLens.get = (fun x -> x.email);
    GapiLens.set = (fun v x -> { x with email = v })
  }
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v })
  }
  let organizer = {
    GapiLens.get = (fun x -> x.organizer);
    GapiLens.set = (fun v x -> { x with organizer = v })
  }
  let self = {
    GapiLens.get = (fun x -> x.self);
    GapiLens.set = (fun v x -> { x with self = v })
  }
  let resource = {
    GapiLens.get = (fun x -> x.resource);
    GapiLens.set = (fun v x -> { x with resource = v })
  }
  let optional = {
    GapiLens.get = (fun x -> x.optional);
    GapiLens.set = (fun v x -> { x with optional = v })
  }
  let comment = {
    GapiLens.get = (fun x -> x.comment);
    GapiLens.set = (fun v x -> { x with comment = v })
  }
  let additionalGuests = {
    GapiLens.get = (fun x -> x.additionalGuests);
    GapiLens.set = (fun v x -> { x with additionalGuests = v })
  }

  let empty = {
    email = "";
    displayName = "";
    organizer = false;
    self = false;
    resource = false;
    optional = false;
    responseStatus = "";
    comment = "";
    additionalGuests = 0
  }

  let render x =
    render_object ""
      [render_string_value "email" x.email;
       render_string_value "displayName" x.displayName;
       render_bool_value "organizer" x.organizer;
       render_bool_value "self" x.self;
       render_bool_value "resource" x.resource;
       render_bool_value "optional" x.optional;
       render_string_value "responseStatus" x.responseStatus;
       render_string_value "comment" x.comment;
       render_int_value "additionalGuests" x.additionalGuests]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "email"; data_type = Scalar },
           Json_type.String v) ->
          { x with email = v }
      | AnnotatedTree.Leaf
          ({ name = "displayName"; data_type = Scalar },
           Json_type.String v) ->
          { x with displayName = v }
      | AnnotatedTree.Leaf
          ({ name = "organizer"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with organizer = v }
      | AnnotatedTree.Leaf
          ({ name = "self"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with self = v }
      | AnnotatedTree.Leaf
          ({ name = "resource"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with resource = v }
      | AnnotatedTree.Leaf
          ({ name = "optional"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with optional = v }
      | AnnotatedTree.Leaf
          ({ name = "responseStatus"; data_type = Scalar },
           Json_type.String v) ->
          { x with responseStatus = v }
      | AnnotatedTree.Leaf
          ({ name = "comment"; data_type = Scalar },
           Json_type.String v) ->
          { x with comment = v }
      | AnnotatedTree.Leaf
          ({ name = "additionalGuests"; data_type = Scalar },
           Json_type.Int v) ->
          { x with additionalGuests = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected ("GapiCalendar.EventAttendee.parse") e

end

module ExtendedPropertiesData =
struct
  type t = {
    _private : (string * string) list;
    shared : (string * string) list
  }

  let _private = {
    GapiLens.get = (fun x -> x._private);
    GapiLens.set = (fun v x -> { x with _private = v })
  }
  let shared = {
    GapiLens.get = (fun x -> x.shared);
    GapiLens.set = (fun v x -> { x with shared = v })
  }

  let empty = {
    _private = [];
    shared = []
  }

  let render x =
    let render_property (name, value) =
      render_string_value name value
    in
      render_object "extendedProperties"
        [render_collection "private" Object render_property x._private;
         render_collection "shared" Object render_property x.shared]

  let parse x tree =
    let parse_property _ = function
        AnnotatedTree.Leaf
          ({ name = n; data_type = Scalar },
           Json_type.String v) ->
          (n, v)
      | e ->
          unexpected "GapiCalendar.ExtendedPropertiesData.parse_property" e
    in
      match tree with
          AnnotatedTree.Node
            ({ name = "private"; data_type = Object },
             cs) ->
            parse_collection
              parse_property
              ("", "")
              (fun xs -> { x with _private = xs })
              cs
        | AnnotatedTree.Node
            ({ name = "shared"; data_type = Object },
             cs) ->
            parse_collection
              parse_property
              ("", "")
              (fun xs -> { x with shared = xs })
              cs
        | e ->
            unexpected "GapiCalendar.ExtendedPropertiesData.parse" e

end

module GadgetData =
struct
  type t = {
    _type : string;
    title : string;
    link : string;
    iconLink : string;
    width : int;
    height : int;
    display : string;
    preferences : (string * string) list
  }

  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v })
  }
  let title = {
    GapiLens.get = (fun x -> x.title);
    GapiLens.set = (fun v x -> { x with title = v })
  }
  let link = {
    GapiLens.get = (fun x -> x.link);
    GapiLens.set = (fun v x -> { x with link = v })
  }
  let iconLink = {
    GapiLens.get = (fun x -> x.iconLink);
    GapiLens.set = (fun v x -> { x with iconLink = v })
  }
  let width = {
    GapiLens.get = (fun x -> x.width);
    GapiLens.set = (fun v x -> { x with width = v })
  }
  let height = {
    GapiLens.get = (fun x -> x.height);
    GapiLens.set = (fun v x -> { x with height = v })
  }
  let display = {
    GapiLens.get = (fun x -> x.display);
    GapiLens.set = (fun v x -> { x with display = v })
  }
  let preferences = {
    GapiLens.get = (fun x -> x.preferences);
    GapiLens.set = (fun v x -> { x with preferences = v })
  }

  let empty = {
    _type = "";
    title = "";
    link = "";
    iconLink = "";
    width = 0;
    height = 0;
    display = "";
    preferences = []
  }

  let render x =
    let render_preference (name, value) =
      render_string_value name value
    in
      render_object ""
        [render_string_value "type" x._type;
         render_string_value "title" x.title;
         render_string_value "link" x.link;
         render_string_value "iconLink" x.iconLink;
         render_int_value "width" x.width;
         render_int_value "height" x.height;
         render_string_value "display" x.display;
         render_collection "preferences" Object render_preference x.preferences]

  let rec parse x tree =
    let parse_preference _ = function
        AnnotatedTree.Leaf
          ({ name = n; data_type = Scalar },
           Json_type.String v) ->
          (n, v)
      | e ->
          unexpected "GapiCalendar.GadgetData.parse_preference" e
    in
      match tree with
          AnnotatedTree.Leaf
            ({ name = "type"; data_type = Scalar },
             Json_type.String v) ->
            { x with _type = v }
        | AnnotatedTree.Leaf
            ({ name = "title"; data_type = Scalar },
             Json_type.String v) ->
            { x with title = v }
        | AnnotatedTree.Leaf
            ({ name = "link"; data_type = Scalar },
             Json_type.String v) ->
            { x with link = v }
        | AnnotatedTree.Leaf
            ({ name = "iconLink"; data_type = Scalar },
             Json_type.String v) ->
            { x with iconLink = v }
        | AnnotatedTree.Leaf
            ({ name = "width"; data_type = Scalar },
             Json_type.Int v) ->
            { x with width = v }
        | AnnotatedTree.Leaf
            ({ name = "height"; data_type = Scalar },
             Json_type.Int v) ->
            { x with height = v }
        | AnnotatedTree.Leaf
            ({ name = "display"; data_type = Scalar },
             Json_type.String v) ->
            { x with display = v }
        | AnnotatedTree.Node
            ({ name = "preferences"; data_type = Object },
             cs) ->
            parse_collection
              parse_preference
              ("", "")
              (fun xs -> { x with preferences = xs })
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
            unexpected ("GapiCalendar.EventAttendee.parse") e

end

module RemindersData =
struct
  type t = {
    useDefault : bool;
    overrides : EventReminder.t list
  }

  let useDefault = {
    GapiLens.get = (fun x -> x.useDefault);
    GapiLens.set = (fun v x -> { x with useDefault = v })
  }
  let overrides = {
    GapiLens.get = (fun x -> x.overrides);
    GapiLens.set = (fun v x -> { x with overrides = v })
  }

  let empty = {
    useDefault = false;
    overrides = []
  }

  let render x =
    render_object "reminders"
      [render_bool_value "useDefault" x.useDefault;
       render_array "overrides" EventReminder.render x.overrides]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "useDefault"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with useDefault = v }
      | AnnotatedTree.Node
          ({ name = "overrides"; data_type = Array },
           cs) ->
          parse_collection
            EventReminder.parse
            EventReminder.empty
            (fun xs -> { x with overrides = xs })
            cs
      | AnnotatedTree.Node
          ({ name = "reminders"; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiCalendar.Remiders.parse" e

end

module Event =
struct
  type t = {
    kind : string;
    etag : string;
    id : string;
    status : string;
    htmlLink : string;
    created : GapiDate.t;
    updated : GapiDate.t;
    summary : string;
    description : string;
    location : string;
    colorId : string;
    creator : PersonData.t;
    organizer : PersonData.t;
    start : EventDateTime.t;
    _end : EventDateTime.t;
    recurrence : string list;
    recurringEventId : string;
    originalStartTime : EventDateTime.t;
    transparency : string;
    visibility : string;
    iCalUID : string;
    sequence : int;
    attendees : EventAttendee.t list;
    attendeesOmitted : bool;
    extendedProperties : ExtendedPropertiesData.t;
    gadget : GadgetData.t;
    anyoneCanAddSelf : bool;
    guestsCanInviteOthers : bool;
    guestsCanModify : bool;
    guestsCanSeeOtherGuests : bool;
    privateCopy : bool;
    reminders : RemindersData.t
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
  let status = {
    GapiLens.get = (fun x -> x.status);
    GapiLens.set = (fun v x -> { x with status = v })
  }
  let htmlLink = {
    GapiLens.get = (fun x -> x.htmlLink);
    GapiLens.set = (fun v x -> { x with htmlLink = v })
  }
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v })
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v })
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
  let colorId = {
    GapiLens.get = (fun x -> x.colorId);
    GapiLens.set = (fun v x -> { x with colorId = v })
  }
  let creator = {
    GapiLens.get = (fun x -> x.creator);
    GapiLens.set = (fun v x -> { x with creator = v })
  }
  let organizer = {
    GapiLens.get = (fun x -> x.organizer);
    GapiLens.set = (fun v x -> { x with organizer = v })
  }
  let start = {
    GapiLens.get = (fun x -> x.start);
    GapiLens.set = (fun v x -> { x with start = v })
  }
  let _end = {
    GapiLens.get = (fun x -> x._end);
    GapiLens.set = (fun v x -> { x with _end = v })
  }
  let recurrence = {
    GapiLens.get = (fun x -> x.recurrence);
    GapiLens.set = (fun v x -> { x with recurrence = v })
  }
  let recurringEventId = {
    GapiLens.get = (fun x -> x.recurringEventId);
    GapiLens.set = (fun v x -> { x with recurringEventId = v })
  }
  let originalStartTime = {
    GapiLens.get = (fun x -> x.originalStartTime);
    GapiLens.set = (fun v x -> { x with originalStartTime = v })
  }
  let transparency = {
    GapiLens.get = (fun x -> x.transparency);
    GapiLens.set = (fun v x -> { x with transparency = v })
  }
  let visibility = {
    GapiLens.get = (fun x -> x.visibility);
    GapiLens.set = (fun v x -> { x with visibility = v })
  }
  let iCalUID = {
    GapiLens.get = (fun x -> x.iCalUID);
    GapiLens.set = (fun v x -> { x with iCalUID = v })
  }
  let sequence = {
    GapiLens.get = (fun x -> x.sequence);
    GapiLens.set = (fun v x -> { x with sequence = v })
  }
  let attendees = {
    GapiLens.get = (fun x -> x.attendees);
    GapiLens.set = (fun v x -> { x with attendees = v })
  }
  let attendeesOmitted = {
    GapiLens.get = (fun x -> x.attendeesOmitted);
    GapiLens.set = (fun v x -> { x with attendeesOmitted = v })
  }
  let extendedProperties = {
    GapiLens.get = (fun x -> x.extendedProperties);
    GapiLens.set = (fun v x -> { x with extendedProperties = v })
  }
  let gadget = {
    GapiLens.get = (fun x -> x.gadget);
    GapiLens.set = (fun v x -> { x with gadget = v })
  }
  let anyoneCanAddSelf = {
    GapiLens.get = (fun x -> x.anyoneCanAddSelf);
    GapiLens.set = (fun v x -> { x with anyoneCanAddSelf = v })
  }
  let guestsCanInviteOthers = {
    GapiLens.get = (fun x -> x.guestsCanInviteOthers);
    GapiLens.set = (fun v x -> { x with guestsCanInviteOthers = v })
  }
  let guestsCanModify = {
    GapiLens.get = (fun x -> x.guestsCanModify);
    GapiLens.set = (fun v x -> { x with guestsCanModify = v })
  }
  let guestsCanSeeOtherGuests = {
    GapiLens.get = (fun x -> x.guestsCanSeeOtherGuests);
    GapiLens.set = (fun v x -> { x with guestsCanSeeOtherGuests = v })
  }
  let privateCopy = {
    GapiLens.get = (fun x -> x.privateCopy);
    GapiLens.set = (fun v x -> { x with privateCopy = v })
  }
  let reminders = {
    GapiLens.get = (fun x -> x.reminders);
    GapiLens.set = (fun v x -> { x with reminders = v })
  }

  let empty = {
    kind = "";
    etag = "";
    id = "";
    status = "";
    htmlLink = "";
    created = GapiDate.epoch;
    updated = GapiDate.epoch;
    summary = "";
    description = "";
    location = "";
    colorId = "";
    creator = PersonData.empty;
    organizer = PersonData.empty;
    start = EventDateTime.empty;
    _end = EventDateTime.empty;
    recurrence = [];
    recurringEventId = "";
    originalStartTime = EventDateTime.empty;
    transparency = "";
    visibility = "";
    iCalUID = "";
    sequence = 0;
    attendees = [];
    attendeesOmitted = false;
    extendedProperties = ExtendedPropertiesData.empty;
    gadget = GadgetData.empty;
    anyoneCanAddSelf = false;
    guestsCanInviteOthers = false;
    guestsCanModify = false;
    guestsCanSeeOtherGuests = false;
    privateCopy = false;
    reminders = RemindersData.empty
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "etag" x.etag;
       render_string_value "id" x.id;
       render_string_value "status" x.status;
       render_string_value "htmlLink" x.htmlLink;
       render_date_value "created" x.created;
       render_date_value "updated" x.updated;
       render_string_value "summary" x.summary;
       render_string_value "description" x.description;
       render_string_value "location" x.location;
       render_string_value "colorId" x.colorId;
       render_object "creator" (PersonData.render x.creator);
       render_object "organizer" (PersonData.render x.organizer);
       render_object "start" (EventDateTime.render x.start);
       render_object "end" (EventDateTime.render x._end);
       render_array "recurrence" (render_string_value "") x.recurrence;
       render_string_value "recurringEventId" x.recurringEventId;
       render_object "originalStartTime" (EventDateTime.render x.originalStartTime);
       render_string_value "transparency" x.transparency;
       render_string_value "visibility" x.visibility;
       render_string_value "iCalUID" x.iCalUID;
       render_int_value "sequence" x.sequence;
       render_array "attendees" EventAttendee.render x.attendees;
       render_bool_value "attendeesOmitted" x.attendeesOmitted;
       ExtendedPropertiesData.render x.extendedProperties;
       GadgetData.render x.gadget;
       render_bool_value "anyoneCanAddSelf" x.anyoneCanAddSelf;
       render_bool_value "guestsCanInviteOthers" x.guestsCanInviteOthers;
       render_bool_value "guestsCanModify" x.guestsCanModify;
       render_bool_value "guestsCanSeeOtherGuests" x.guestsCanSeeOtherGuests;
       render_bool_value "privateCopy" x.privateCopy;
       RemindersData.render x.reminders]

  let parse_recurrence _ = function
      AnnotatedTree.Leaf
        ({ name = ""; data_type = Scalar },
         Json_type.String v) ->
        v
    | e ->
        unexpected "GapiCalendar.Event.parse_recurrence" e

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
          ({ name = "status"; data_type = Scalar },
           Json_type.String v) ->
          { x with status = v }
      | AnnotatedTree.Leaf
          ({ name = "htmlLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with htmlLink = v }
      | AnnotatedTree.Leaf
          ({ name = "created"; data_type = Scalar },
           Json_type.String v) ->
          { x with created = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "updated"; data_type = Scalar },
           Json_type.String v) ->
          { x with updated = GapiDate.of_string v }
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
          ({ name = "colorId"; data_type = Scalar },
           Json_type.String v) ->
          { x with colorId = v }
      | AnnotatedTree.Node
          ({ name = "organizer"; data_type = Object },
           cs) ->
          parse_children
            PersonData.parse
            PersonData.empty
            (fun v -> { x with organizer = v })
            cs
      | AnnotatedTree.Node
          ({ name = "creator"; data_type = Object },
           cs) ->
          parse_children
            PersonData.parse
            PersonData.empty
            (fun v -> { x with creator = v })
            cs
      | AnnotatedTree.Node
          ({ name = "start"; data_type = Object },
           cs) ->
          parse_children
            EventDateTime.parse
            EventDateTime.empty
            (fun v -> { x with start = v })
            cs
      | AnnotatedTree.Node
          ({ name = "end"; data_type = Object },
           cs) ->
          parse_children
            EventDateTime.parse
            EventDateTime.empty
            (fun v -> { x with _end = v })
            cs
      | AnnotatedTree.Node
          ({ name = "recurrence"; data_type = Array },
           cs) ->
          parse_collection
            parse_recurrence
            ""
            (fun xs -> { x with recurrence = xs })
            cs
      | AnnotatedTree.Leaf
          ({ name = "recurringEventId"; data_type = Scalar },
           Json_type.String v) ->
          { x with recurringEventId = v }
      | AnnotatedTree.Node
          ({ name = "originalStartTime"; data_type = Object },
           cs) ->
          parse_children
            EventDateTime.parse
            EventDateTime.empty
            (fun v -> { x with originalStartTime = v })
            cs
      | AnnotatedTree.Leaf
          ({ name = "transparency"; data_type = Scalar },
           Json_type.String v) ->
          { x with transparency = v }
      | AnnotatedTree.Leaf
          ({ name = "visibility"; data_type = Scalar },
           Json_type.String v) ->
          { x with visibility = v }
      | AnnotatedTree.Leaf
          ({ name = "iCalUID"; data_type = Scalar },
           Json_type.String v) ->
          { x with iCalUID = v }
      | AnnotatedTree.Leaf
          ({ name = "sequence"; data_type = Scalar },
           Json_type.Int v) ->
          { x with sequence = v }
      | AnnotatedTree.Node
          ({ name = "attendees"; data_type = Array },
           cs) ->
          parse_collection
            EventAttendee.parse
            EventAttendee.empty
            (fun xs -> { x with attendees = xs })
            cs
      | AnnotatedTree.Leaf
          ({ name = "attendeesOmitted"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with attendeesOmitted = v }
      | AnnotatedTree.Node
          ({ name = "extendedProperties"; data_type = Object },
           cs) ->
          parse_children
            ExtendedPropertiesData.parse
            ExtendedPropertiesData.empty
            (fun v -> { x with extendedProperties = v })
            cs
      | AnnotatedTree.Node
          ({ name = "gadget"; data_type = Object },
           cs) ->
          parse_children
            GadgetData.parse
            GadgetData.empty
            (fun v -> { x with gadget = v })
            cs
      | AnnotatedTree.Leaf
          ({ name = "anyoneCanAddSelf"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with anyoneCanAddSelf = v }
      | AnnotatedTree.Leaf
          ({ name = "guestsCanInviteOthers"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with guestsCanInviteOthers = v }
      | AnnotatedTree.Leaf
          ({ name = "guestsCanModify"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with guestsCanModify = v }
      | AnnotatedTree.Leaf
          ({ name = "guestsCanSeeOtherGuests"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with guestsCanSeeOtherGuests = v }
      | AnnotatedTree.Leaf
          ({ name = "privateCopy"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with privateCopy = v }
      | AnnotatedTree.Node
          ({ name = "reminders"; data_type = Object },
           cs) ->
          parse_children
            RemindersData.parse
            RemindersData.empty
            (fun v -> { x with reminders = v })
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
          unexpected "GapiCalendar.Calendar.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module Events =
struct
  type t = {
    kind : string;
    etag : string;
    summary : string;
    description : string;
    updated : GapiDate.t;
    timeZone : string;
    accessRole : string;
    defaultReminders : EventReminder.t list;
    nextPageToken : string;
    items : Event.t list
  }

  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v })
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v })
  }
  let summary = {
    GapiLens.get = (fun x -> x.summary);
    GapiLens.set = (fun v x -> { x with summary = v })
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v })
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v })
  }
  let timeZone = {
    GapiLens.get = (fun x -> x.timeZone);
    GapiLens.set = (fun v x -> { x with timeZone = v })
  }
  let accessRole = {
    GapiLens.get = (fun x -> x.accessRole);
    GapiLens.set = (fun v x -> { x with accessRole = v })
  }
  let defaultReminders = {
    GapiLens.get = (fun x -> x.defaultReminders);
    GapiLens.set = (fun v x -> { x with defaultReminders = v })
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
    summary = "";
    description = "";
    updated = GapiDate.epoch;
    timeZone = "";
    accessRole = "";
    defaultReminders = [];
    nextPageToken = "";
    items = []
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "etag" x.etag;
       render_string_value "summary" x.summary;
       render_string_value "description" x.description;
       render_date_value "updated" x.updated;
       render_string_value "timeZone" x.timeZone;
       render_string_value "accessRole" x.accessRole;
       render_array "defaultReminders" EventReminder.render x.defaultReminders;
       render_string_value "nextPageToken" x.nextPageToken;
       render_array "items" Event.render x.items]

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
          ({ name = "summary"; data_type = Scalar },
           Json_type.String v) ->
          { x with summary = v }
      | AnnotatedTree.Leaf
          ({ name = "description"; data_type = Scalar },
           Json_type.String v) ->
          { x with description = v }
      | AnnotatedTree.Leaf
          ({ name = "updated"; data_type = Scalar },
           Json_type.String v) ->
          { x with updated = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "timeZone"; data_type = Scalar },
           Json_type.String v) ->
          { x with timeZone = v }
      | AnnotatedTree.Leaf
          ({ name = "accessRole"; data_type = Scalar },
           Json_type.String v) ->
          { x with accessRole = v }
      | AnnotatedTree.Node
          ({ name = "defaultReminders"; data_type = Array },
           cs) ->
          parse_collection
            EventReminder.parse
            EventReminder.empty
            (fun xs -> { x with defaultReminders = xs })
            cs
      | AnnotatedTree.Leaf
          ({ name = "nextPageToken"; data_type = Scalar },
           Json_type.String v) ->
          { x with nextPageToken = v }
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_collection
            Event.parse
            Event.empty
            (fun xs -> { x with items = xs })
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
          unexpected "GapiCalendar.Events.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

(* Freebusy *)

module FreeBusyRequest =
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

module TimePeriod =
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
          unexpected "GapiCalendar.TimePeriod.parse" e

end

module FreeBusyCalendar =
struct
  type calendar = {
    errors : Error.t list;
    busy : TimePeriod.t list
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
       render_array "busy" TimePeriod.render x.busy]

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
                 TimePeriod.parse
                 TimePeriod.empty
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

(* Settings *)

module Setting =
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
          unexpected "GapiCalendar.Setting.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module Settings =
struct
  type t = {
    kind : string;
    etag : string;
    items : Setting.t list
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
       render_array "items" Setting.render x.items]

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
            Setting.parse
            Setting.empty
            (fun xs -> { x with items = xs })
            cs
      | e ->
          unexpected "GapiCalendar.Settings.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

