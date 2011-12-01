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
          parse_array
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
          parse_array
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

