(* Warning! This file is generated. Modify at your own risk. *)

module ColorDefinition =
struct
  type t = {
    background : string;
    foreground : string;
    
  }
  
  let background = {
    GapiLens.get = (fun x -> x.background);
    GapiLens.set = (fun v x -> { x with background = v });
  }
  let foreground = {
    GapiLens.get = (fun x -> x.foreground);
    GapiLens.set = (fun v x -> { x with foreground = v });
  }
  
  let empty = {
    background = "";
    foreground = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "background" x.background;
      GapiJson.render_string_value "foreground" x.foreground;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "background"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with background = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "foreground"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with foreground = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.ColorDefinition.parse" e
  
end

module Colors =
struct
  type t = {
    calendar : (string * ColorDefinition.t) list;
    event : (string * ColorDefinition.t) list;
    kind : string;
    updated : GapiDate.t;
    
  }
  
  let calendar = {
    GapiLens.get = (fun x -> x.calendar);
    GapiLens.set = (fun v x -> { x with calendar = v });
  }
  let event = {
    GapiLens.get = (fun x -> x.event);
    GapiLens.set = (fun v x -> { x with event = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  
  let empty = {
    calendar = [];
    event = [];
    kind = "";
    updated = GapiDate.epoch;
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_collection "calendar" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (ColorDefinition.render_content v)) x.calendar;
      GapiJson.render_collection "event" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (ColorDefinition.render_content v)) x.event;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "updated" x.updated;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "calendar"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ColorDefinition.parse
              ColorDefinition.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.Colors.parse.parse_dictionary" e)
        ("", ColorDefinition.empty)
        (fun xs -> { x with calendar = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "event"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ColorDefinition.parse
              ColorDefinition.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.Colors.parse.parse_dictionary" e)
        ("", ColorDefinition.empty)
        (fun xs -> { x with event = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Colors.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Setting =
struct
  type t = {
    etag : string;
    id : string;
    kind : string;
    value : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v });
  }
  
  let empty = {
    etag = "";
    id = "";
    kind = "";
    value = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "value" x.value;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with value = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Setting.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AclRule =
struct
  module ScopeData =
  struct
    type t = {
      _type : string;
      value : string;
      
    }
    
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    let value = {
      GapiLens.get = (fun x -> x.value);
      GapiLens.set = (fun v x -> { x with value = v });
    }
    
    let empty = {
      _type = "";
      value = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "type" x._type;
        GapiJson.render_string_value "value" x.value;
        
      ]
    
    let render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with value = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.ScopeData.parse" e
    
  end
  
  type t = {
    etag : string;
    id : string;
    kind : string;
    role : string;
    scope : ScopeData.t;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let role = {
    GapiLens.get = (fun x -> x.role);
    GapiLens.set = (fun v x -> { x with role = v });
  }
  let scope = {
    GapiLens.get = (fun x -> x.scope);
    GapiLens.set = (fun v x -> { x with scope = v });
  }
  
  let empty = {
    etag = "";
    id = "";
    kind = "";
    role = "";
    scope = ScopeData.empty;
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "role" x.role;
      GapiJson.render_object "scope" (ScopeData.render_content x.scope);
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "role"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with role = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "scope"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ScopeData.parse
        ScopeData.empty
        (fun v -> { x with scope = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.AclRule.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Error =
struct
  type t = {
    domain : string;
    reason : string;
    
  }
  
  let domain = {
    GapiLens.get = (fun x -> x.domain);
    GapiLens.set = (fun v x -> { x with domain = v });
  }
  let reason = {
    GapiLens.get = (fun x -> x.reason);
    GapiLens.set = (fun v x -> { x with reason = v });
  }
  
  let empty = {
    domain = "";
    reason = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "domain" x.domain;
      GapiJson.render_string_value "reason" x.reason;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "domain"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with domain = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "reason"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with reason = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Error.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FreeBusyGroup =
struct
  type t = {
    calendars : string list;
    errors : Error.t list;
    
  }
  
  let calendars = {
    GapiLens.get = (fun x -> x.calendars);
    GapiLens.set = (fun v x -> { x with calendars = v });
  }
  let errors = {
    GapiLens.get = (fun x -> x.errors);
    GapiLens.set = (fun v x -> { x with errors = v });
  }
  
  let empty = {
    calendars = [];
    errors = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_collection "calendars" GapiJson.Array (GapiJson.render_string_value "") x.calendars;
      GapiJson.render_array "errors" Error.render x.errors;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "calendars"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with calendars = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "errors"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        Error.parse
        Error.empty
        (fun xs -> { x with errors = xs })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.FreeBusyGroup.parse" e
  
end

module FreeBusyRequestItem =
struct
  type t = {
    id : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  
  let empty = {
    id = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "id" x.id;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.FreeBusyRequestItem.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module EventAttendee =
struct
  type t = {
    additionalGuests : int;
    comment : string;
    displayName : string;
    email : string;
    optional : bool;
    organizer : bool;
    resource : bool;
    responseStatus : string;
    self : bool;
    
  }
  
  let additionalGuests = {
    GapiLens.get = (fun x -> x.additionalGuests);
    GapiLens.set = (fun v x -> { x with additionalGuests = v });
  }
  let comment = {
    GapiLens.get = (fun x -> x.comment);
    GapiLens.set = (fun v x -> { x with comment = v });
  }
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let email = {
    GapiLens.get = (fun x -> x.email);
    GapiLens.set = (fun v x -> { x with email = v });
  }
  let optional = {
    GapiLens.get = (fun x -> x.optional);
    GapiLens.set = (fun v x -> { x with optional = v });
  }
  let organizer = {
    GapiLens.get = (fun x -> x.organizer);
    GapiLens.set = (fun v x -> { x with organizer = v });
  }
  let resource = {
    GapiLens.get = (fun x -> x.resource);
    GapiLens.set = (fun v x -> { x with resource = v });
  }
  let responseStatus = {
    GapiLens.get = (fun x -> x.responseStatus);
    GapiLens.set = (fun v x -> { x with responseStatus = v });
  }
  let self = {
    GapiLens.get = (fun x -> x.self);
    GapiLens.set = (fun v x -> { x with self = v });
  }
  
  let empty = {
    additionalGuests = 0;
    comment = "";
    displayName = "";
    email = "";
    optional = false;
    organizer = false;
    resource = false;
    responseStatus = "";
    self = false;
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_int_value "additionalGuests" x.additionalGuests;
      GapiJson.render_string_value "comment" x.comment;
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_string_value "email" x.email;
      GapiJson.render_bool_value "optional" x.optional;
      GapiJson.render_bool_value "organizer" x.organizer;
      GapiJson.render_bool_value "resource" x.resource;
      GapiJson.render_string_value "responseStatus" x.responseStatus;
      GapiJson.render_bool_value "self" x.self;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "additionalGuests"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with additionalGuests = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "comment"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with comment = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "email"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with email = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "optional"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with optional = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "organizer"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with organizer = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "resource"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with resource = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "responseStatus"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with responseStatus = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "self"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with self = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.EventAttendee.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module EventDateTime =
struct
  type t = {
    date : GapiDate.t;
    dateTime : GapiDate.t;
    timeZone : string;
    
  }
  
  let date = {
    GapiLens.get = (fun x -> x.date);
    GapiLens.set = (fun v x -> { x with date = v });
  }
  let dateTime = {
    GapiLens.get = (fun x -> x.dateTime);
    GapiLens.set = (fun v x -> { x with dateTime = v });
  }
  let timeZone = {
    GapiLens.get = (fun x -> x.timeZone);
    GapiLens.set = (fun v x -> { x with timeZone = v });
  }
  
  let empty = {
    date = GapiDate.epoch;
    dateTime = GapiDate.epoch;
    timeZone = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_date_value "date" x.date;
      GapiJson.render_date_value "dateTime" x.dateTime;
      GapiJson.render_string_value "timeZone" x.timeZone;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "date"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with date = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dateTime"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with dateTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeZone"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with timeZone = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.EventDateTime.parse" e
  
end

module EventReminder =
struct
  type t = {
    _method : string;
    minutes : int;
    
  }
  
  let _method = {
    GapiLens.get = (fun x -> x._method);
    GapiLens.set = (fun v x -> { x with _method = v });
  }
  let minutes = {
    GapiLens.get = (fun x -> x.minutes);
    GapiLens.set = (fun v x -> { x with minutes = v });
  }
  
  let empty = {
    _method = "";
    minutes = 0;
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "method" x._method;
      GapiJson.render_int_value "minutes" x.minutes;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "method"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _method = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "minutes"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with minutes = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.EventReminder.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Event =
struct
  module RemindersData =
  struct
    type t = {
      overrides : EventReminder.t list;
      useDefault : bool;
      
    }
    
    let overrides = {
      GapiLens.get = (fun x -> x.overrides);
      GapiLens.set = (fun v x -> { x with overrides = v });
    }
    let useDefault = {
      GapiLens.get = (fun x -> x.useDefault);
      GapiLens.set = (fun v x -> { x with useDefault = v });
    }
    
    let empty = {
      overrides = [];
      useDefault = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_array "overrides" EventReminder.render x.overrides;
        GapiJson.render_bool_value "useDefault" x.useDefault;
        
      ]
    
    let render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "overrides"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          EventReminder.parse
          EventReminder.empty
          (fun xs -> { x with overrides = xs })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "useDefault"; data_type = GapiJson.Scalar },
          Json_type.Bool v) ->
        { x with useDefault = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.RemindersData.parse" e
    
  end
  
  module OrganizerData =
  struct
    type t = {
      displayName : string;
      email : string;
      
    }
    
    let displayName = {
      GapiLens.get = (fun x -> x.displayName);
      GapiLens.set = (fun v x -> { x with displayName = v });
    }
    let email = {
      GapiLens.get = (fun x -> x.email);
      GapiLens.set = (fun v x -> { x with email = v });
    }
    
    let empty = {
      displayName = "";
      email = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "displayName" x.displayName;
        GapiJson.render_string_value "email" x.email;
        
      ]
    
    let render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with displayName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "email"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with email = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.OrganizerData.parse" e
    
  end
  
  module GadgetData =
  struct
    type t = {
      display : string;
      height : int;
      iconLink : string;
      link : string;
      preferences : (string * string) list;
      title : string;
      _type : string;
      width : int;
      
    }
    
    let display = {
      GapiLens.get = (fun x -> x.display);
      GapiLens.set = (fun v x -> { x with display = v });
    }
    let height = {
      GapiLens.get = (fun x -> x.height);
      GapiLens.set = (fun v x -> { x with height = v });
    }
    let iconLink = {
      GapiLens.get = (fun x -> x.iconLink);
      GapiLens.set = (fun v x -> { x with iconLink = v });
    }
    let link = {
      GapiLens.get = (fun x -> x.link);
      GapiLens.set = (fun v x -> { x with link = v });
    }
    let preferences = {
      GapiLens.get = (fun x -> x.preferences);
      GapiLens.set = (fun v x -> { x with preferences = v });
    }
    let title = {
      GapiLens.get = (fun x -> x.title);
      GapiLens.set = (fun v x -> { x with title = v });
    }
    let _type = {
      GapiLens.get = (fun x -> x._type);
      GapiLens.set = (fun v x -> { x with _type = v });
    }
    let width = {
      GapiLens.get = (fun x -> x.width);
      GapiLens.set = (fun v x -> { x with width = v });
    }
    
    let empty = {
      display = "";
      height = 0;
      iconLink = "";
      link = "";
      preferences = [];
      title = "";
      _type = "";
      width = 0;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "display" x.display;
        GapiJson.render_int_value "height" x.height;
        GapiJson.render_string_value "iconLink" x.iconLink;
        GapiJson.render_string_value "link" x.link;
        GapiJson.render_collection "preferences" GapiJson.Object (fun (id, v) -> GapiJson.render_object id [GapiJson.render_string_value id v]) x.preferences;
        GapiJson.render_string_value "title" x.title;
        GapiJson.render_string_value "type" x._type;
        GapiJson.render_int_value "width" x.width;
        
      ]
    
    let render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "display"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with display = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "height"; data_type = GapiJson.Scalar },
          Json_type.Int v) ->
        { x with height = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "iconLink"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with iconLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "link"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with link = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "preferences"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_collection
          GapiJson.parse_dictionary_entry
          ("", "")
          (fun xs -> { x with preferences = xs })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with title = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          Json_type.Int v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.GadgetData.parse" e
    
  end
  
  module ExtendedPropertiesData =
  struct
    type t = {
      _private : (string * string) list;
      shared : (string * string) list;
      
    }
    
    let _private = {
      GapiLens.get = (fun x -> x._private);
      GapiLens.set = (fun v x -> { x with _private = v });
    }
    let shared = {
      GapiLens.get = (fun x -> x.shared);
      GapiLens.set = (fun v x -> { x with shared = v });
    }
    
    let empty = {
      _private = [];
      shared = [];
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_collection "private" GapiJson.Object (fun (id, v) -> GapiJson.render_object id [GapiJson.render_string_value id v]) x._private;
        GapiJson.render_collection "shared" GapiJson.Object (fun (id, v) -> GapiJson.render_object id [GapiJson.render_string_value id v]) x.shared;
        
      ]
    
    let render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "private"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_collection
          GapiJson.parse_dictionary_entry
          ("", "")
          (fun xs -> { x with _private = xs })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "shared"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_collection
          GapiJson.parse_dictionary_entry
          ("", "")
          (fun xs -> { x with shared = xs })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.ExtendedPropertiesData.parse" e
    
  end
  
  module CreatorData =
  struct
    type t = {
      displayName : string;
      email : string;
      
    }
    
    let displayName = {
      GapiLens.get = (fun x -> x.displayName);
      GapiLens.set = (fun v x -> { x with displayName = v });
    }
    let email = {
      GapiLens.get = (fun x -> x.email);
      GapiLens.set = (fun v x -> { x with email = v });
    }
    
    let empty = {
      displayName = "";
      email = "";
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "displayName" x.displayName;
        GapiJson.render_string_value "email" x.email;
        
      ]
    
    let render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with displayName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "email"; data_type = GapiJson.Scalar },
          Json_type.String v) ->
        { x with email = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.CreatorData.parse" e
    
  end
  
  type t = {
    anyoneCanAddSelf : bool;
    attendees : EventAttendee.t list;
    attendeesOmitted : bool;
    colorId : string;
    created : GapiDate.t;
    creator : CreatorData.t;
    description : string;
    _end : EventDateTime.t;
    etag : string;
    extendedProperties : ExtendedPropertiesData.t;
    gadget : GadgetData.t;
    guestsCanInviteOthers : bool;
    guestsCanModify : bool;
    guestsCanSeeOtherGuests : bool;
    htmlLink : string;
    iCalUID : string;
    id : string;
    kind : string;
    location : string;
    organizer : OrganizerData.t;
    originalStartTime : EventDateTime.t;
    privateCopy : bool;
    recurrence : string list;
    recurringEventId : string;
    reminders : RemindersData.t;
    sequence : int;
    start : EventDateTime.t;
    status : string;
    summary : string;
    transparency : string;
    updated : GapiDate.t;
    visibility : string;
    
  }
  
  let anyoneCanAddSelf = {
    GapiLens.get = (fun x -> x.anyoneCanAddSelf);
    GapiLens.set = (fun v x -> { x with anyoneCanAddSelf = v });
  }
  let attendees = {
    GapiLens.get = (fun x -> x.attendees);
    GapiLens.set = (fun v x -> { x with attendees = v });
  }
  let attendeesOmitted = {
    GapiLens.get = (fun x -> x.attendeesOmitted);
    GapiLens.set = (fun v x -> { x with attendeesOmitted = v });
  }
  let colorId = {
    GapiLens.get = (fun x -> x.colorId);
    GapiLens.set = (fun v x -> { x with colorId = v });
  }
  let created = {
    GapiLens.get = (fun x -> x.created);
    GapiLens.set = (fun v x -> { x with created = v });
  }
  let creator = {
    GapiLens.get = (fun x -> x.creator);
    GapiLens.set = (fun v x -> { x with creator = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let _end = {
    GapiLens.get = (fun x -> x._end);
    GapiLens.set = (fun v x -> { x with _end = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let extendedProperties = {
    GapiLens.get = (fun x -> x.extendedProperties);
    GapiLens.set = (fun v x -> { x with extendedProperties = v });
  }
  let gadget = {
    GapiLens.get = (fun x -> x.gadget);
    GapiLens.set = (fun v x -> { x with gadget = v });
  }
  let guestsCanInviteOthers = {
    GapiLens.get = (fun x -> x.guestsCanInviteOthers);
    GapiLens.set = (fun v x -> { x with guestsCanInviteOthers = v });
  }
  let guestsCanModify = {
    GapiLens.get = (fun x -> x.guestsCanModify);
    GapiLens.set = (fun v x -> { x with guestsCanModify = v });
  }
  let guestsCanSeeOtherGuests = {
    GapiLens.get = (fun x -> x.guestsCanSeeOtherGuests);
    GapiLens.set = (fun v x -> { x with guestsCanSeeOtherGuests = v });
  }
  let htmlLink = {
    GapiLens.get = (fun x -> x.htmlLink);
    GapiLens.set = (fun v x -> { x with htmlLink = v });
  }
  let iCalUID = {
    GapiLens.get = (fun x -> x.iCalUID);
    GapiLens.set = (fun v x -> { x with iCalUID = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let location = {
    GapiLens.get = (fun x -> x.location);
    GapiLens.set = (fun v x -> { x with location = v });
  }
  let organizer = {
    GapiLens.get = (fun x -> x.organizer);
    GapiLens.set = (fun v x -> { x with organizer = v });
  }
  let originalStartTime = {
    GapiLens.get = (fun x -> x.originalStartTime);
    GapiLens.set = (fun v x -> { x with originalStartTime = v });
  }
  let privateCopy = {
    GapiLens.get = (fun x -> x.privateCopy);
    GapiLens.set = (fun v x -> { x with privateCopy = v });
  }
  let recurrence = {
    GapiLens.get = (fun x -> x.recurrence);
    GapiLens.set = (fun v x -> { x with recurrence = v });
  }
  let recurringEventId = {
    GapiLens.get = (fun x -> x.recurringEventId);
    GapiLens.set = (fun v x -> { x with recurringEventId = v });
  }
  let reminders = {
    GapiLens.get = (fun x -> x.reminders);
    GapiLens.set = (fun v x -> { x with reminders = v });
  }
  let sequence = {
    GapiLens.get = (fun x -> x.sequence);
    GapiLens.set = (fun v x -> { x with sequence = v });
  }
  let start = {
    GapiLens.get = (fun x -> x.start);
    GapiLens.set = (fun v x -> { x with start = v });
  }
  let status = {
    GapiLens.get = (fun x -> x.status);
    GapiLens.set = (fun v x -> { x with status = v });
  }
  let summary = {
    GapiLens.get = (fun x -> x.summary);
    GapiLens.set = (fun v x -> { x with summary = v });
  }
  let transparency = {
    GapiLens.get = (fun x -> x.transparency);
    GapiLens.set = (fun v x -> { x with transparency = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  let visibility = {
    GapiLens.get = (fun x -> x.visibility);
    GapiLens.set = (fun v x -> { x with visibility = v });
  }
  
  let empty = {
    anyoneCanAddSelf = false;
    attendees = [];
    attendeesOmitted = false;
    colorId = "";
    created = GapiDate.epoch;
    creator = CreatorData.empty;
    description = "";
    _end = EventDateTime.empty;
    etag = "";
    extendedProperties = ExtendedPropertiesData.empty;
    gadget = GadgetData.empty;
    guestsCanInviteOthers = false;
    guestsCanModify = false;
    guestsCanSeeOtherGuests = false;
    htmlLink = "";
    iCalUID = "";
    id = "";
    kind = "";
    location = "";
    organizer = OrganizerData.empty;
    originalStartTime = EventDateTime.empty;
    privateCopy = false;
    recurrence = [];
    recurringEventId = "";
    reminders = RemindersData.empty;
    sequence = 0;
    start = EventDateTime.empty;
    status = "";
    summary = "";
    transparency = "";
    updated = GapiDate.epoch;
    visibility = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_bool_value "anyoneCanAddSelf" x.anyoneCanAddSelf;
      GapiJson.render_array "attendees" EventAttendee.render x.attendees;
      GapiJson.render_bool_value "attendeesOmitted" x.attendeesOmitted;
      GapiJson.render_string_value "colorId" x.colorId;
      GapiJson.render_date_value "created" x.created;
      GapiJson.render_object "creator" (CreatorData.render_content x.creator);
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_object "end" (EventDateTime.render_content x._end);
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_object "extendedProperties" (ExtendedPropertiesData.render_content x.extendedProperties);
      GapiJson.render_object "gadget" (GadgetData.render_content x.gadget);
      GapiJson.render_bool_value "guestsCanInviteOthers" x.guestsCanInviteOthers;
      GapiJson.render_bool_value "guestsCanModify" x.guestsCanModify;
      GapiJson.render_bool_value "guestsCanSeeOtherGuests" x.guestsCanSeeOtherGuests;
      GapiJson.render_string_value "htmlLink" x.htmlLink;
      GapiJson.render_string_value "iCalUID" x.iCalUID;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "location" x.location;
      GapiJson.render_object "organizer" (OrganizerData.render_content x.organizer);
      GapiJson.render_object "originalStartTime" (EventDateTime.render_content x.originalStartTime);
      GapiJson.render_bool_value "privateCopy" x.privateCopy;
      GapiJson.render_collection "recurrence" GapiJson.Array (GapiJson.render_string_value "") x.recurrence;
      GapiJson.render_string_value "recurringEventId" x.recurringEventId;
      GapiJson.render_object "reminders" (RemindersData.render_content x.reminders);
      GapiJson.render_int_value "sequence" x.sequence;
      GapiJson.render_object "start" (EventDateTime.render_content x.start);
      GapiJson.render_string_value "status" x.status;
      GapiJson.render_string_value "summary" x.summary;
      GapiJson.render_string_value "transparency" x.transparency;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_string_value "visibility" x.visibility;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "anyoneCanAddSelf"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with anyoneCanAddSelf = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "attendees"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        EventAttendee.parse
        EventAttendee.empty
        (fun xs -> { x with attendees = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "attendeesOmitted"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with attendeesOmitted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "colorId"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with colorId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "creator"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        CreatorData.parse
        CreatorData.empty
        (fun v -> { x with creator = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "end"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EventDateTime.parse
        EventDateTime.empty
        (fun v -> { x with _end = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "extendedProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ExtendedPropertiesData.parse
        ExtendedPropertiesData.empty
        (fun v -> { x with extendedProperties = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "gadget"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        GadgetData.parse
        GadgetData.empty
        (fun v -> { x with gadget = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "guestsCanInviteOthers"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with guestsCanInviteOthers = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "guestsCanModify"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with guestsCanModify = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "guestsCanSeeOtherGuests"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with guestsCanSeeOtherGuests = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlLink"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with htmlLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "iCalUID"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with iCalUID = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "location"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with location = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "organizer"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        OrganizerData.parse
        OrganizerData.empty
        (fun v -> { x with organizer = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "originalStartTime"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EventDateTime.parse
        EventDateTime.empty
        (fun v -> { x with originalStartTime = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "privateCopy"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with privateCopy = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "recurrence"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        GapiJson.parse_string_element
        ""
        (fun xs -> { x with recurrence = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "recurringEventId"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with recurringEventId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "reminders"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        RemindersData.parse
        RemindersData.empty
        (fun v -> { x with reminders = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sequence"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with sequence = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "start"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        EventDateTime.parse
        EventDateTime.empty
        (fun v -> { x with start = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "status"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with status = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "summary"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with summary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "transparency"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with transparency = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "visibility"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with visibility = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Event.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FreeBusyRequest =
struct
  type t = {
    calendarExpansionMax : int;
    groupExpansionMax : int;
    items : FreeBusyRequestItem.t list;
    timeMax : GapiDate.t;
    timeMin : GapiDate.t;
    timeZone : string;
    
  }
  
  let calendarExpansionMax = {
    GapiLens.get = (fun x -> x.calendarExpansionMax);
    GapiLens.set = (fun v x -> { x with calendarExpansionMax = v });
  }
  let groupExpansionMax = {
    GapiLens.get = (fun x -> x.groupExpansionMax);
    GapiLens.set = (fun v x -> { x with groupExpansionMax = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let timeMax = {
    GapiLens.get = (fun x -> x.timeMax);
    GapiLens.set = (fun v x -> { x with timeMax = v });
  }
  let timeMin = {
    GapiLens.get = (fun x -> x.timeMin);
    GapiLens.set = (fun v x -> { x with timeMin = v });
  }
  let timeZone = {
    GapiLens.get = (fun x -> x.timeZone);
    GapiLens.set = (fun v x -> { x with timeZone = v });
  }
  
  let empty = {
    calendarExpansionMax = 0;
    groupExpansionMax = 0;
    items = [];
    timeMax = GapiDate.epoch;
    timeMin = GapiDate.epoch;
    timeZone = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_int_value "calendarExpansionMax" x.calendarExpansionMax;
      GapiJson.render_int_value "groupExpansionMax" x.groupExpansionMax;
      GapiJson.render_array "items" FreeBusyRequestItem.render x.items;
      GapiJson.render_date_value "timeMax" x.timeMax;
      GapiJson.render_date_value "timeMin" x.timeMin;
      GapiJson.render_string_value "timeZone" x.timeZone;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "calendarExpansionMax"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with calendarExpansionMax = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "groupExpansionMax"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with groupExpansionMax = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        FreeBusyRequestItem.parse
        FreeBusyRequestItem.empty
        (fun xs -> { x with items = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeMax"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with timeMax = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeMin"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with timeMin = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeZone"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with timeZone = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.FreeBusyRequest.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Acl =
struct
  type t = {
    etag : string;
    items : AclRule.t list;
    kind : string;
    nextPageToken : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" AclRule.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        AclRule.parse
        AclRule.empty
        (fun xs -> { x with items = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Acl.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Events =
struct
  type t = {
    accessRole : string;
    defaultReminders : EventReminder.t list;
    description : string;
    etag : string;
    items : Event.t list;
    kind : string;
    nextPageToken : string;
    summary : string;
    timeZone : string;
    updated : GapiDate.t;
    
  }
  
  let accessRole = {
    GapiLens.get = (fun x -> x.accessRole);
    GapiLens.set = (fun v x -> { x with accessRole = v });
  }
  let defaultReminders = {
    GapiLens.get = (fun x -> x.defaultReminders);
    GapiLens.set = (fun v x -> { x with defaultReminders = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let summary = {
    GapiLens.get = (fun x -> x.summary);
    GapiLens.set = (fun v x -> { x with summary = v });
  }
  let timeZone = {
    GapiLens.get = (fun x -> x.timeZone);
    GapiLens.set = (fun v x -> { x with timeZone = v });
  }
  let updated = {
    GapiLens.get = (fun x -> x.updated);
    GapiLens.set = (fun v x -> { x with updated = v });
  }
  
  let empty = {
    accessRole = "";
    defaultReminders = [];
    description = "";
    etag = "";
    items = [];
    kind = "";
    nextPageToken = "";
    summary = "";
    timeZone = "";
    updated = GapiDate.epoch;
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "accessRole" x.accessRole;
      GapiJson.render_array "defaultReminders" EventReminder.render x.defaultReminders;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" Event.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_string_value "summary" x.summary;
      GapiJson.render_string_value "timeZone" x.timeZone;
      GapiJson.render_date_value "updated" x.updated;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accessRole"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with accessRole = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "defaultReminders"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        EventReminder.parse
        EventReminder.empty
        (fun xs -> { x with defaultReminders = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        Event.parse
        Event.empty
        (fun xs -> { x with items = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "summary"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with summary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeZone"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with timeZone = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Events.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Settings =
struct
  type t = {
    etag : string;
    items : Setting.t list;
    kind : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" Setting.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        Setting.parse
        Setting.empty
        (fun xs -> { x with items = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Settings.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Calendar =
struct
  type t = {
    description : string;
    etag : string;
    id : string;
    kind : string;
    location : string;
    summary : string;
    timeZone : string;
    
  }
  
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let location = {
    GapiLens.get = (fun x -> x.location);
    GapiLens.set = (fun v x -> { x with location = v });
  }
  let summary = {
    GapiLens.get = (fun x -> x.summary);
    GapiLens.set = (fun v x -> { x with summary = v });
  }
  let timeZone = {
    GapiLens.get = (fun x -> x.timeZone);
    GapiLens.set = (fun v x -> { x with timeZone = v });
  }
  
  let empty = {
    description = "";
    etag = "";
    id = "";
    kind = "";
    location = "";
    summary = "";
    timeZone = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "location" x.location;
      GapiJson.render_string_value "summary" x.summary;
      GapiJson.render_string_value "timeZone" x.timeZone;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "location"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with location = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "summary"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with summary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeZone"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with timeZone = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Calendar.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module TimePeriod =
struct
  type t = {
    _end : GapiDate.t;
    start : GapiDate.t;
    
  }
  
  let _end = {
    GapiLens.get = (fun x -> x._end);
    GapiLens.set = (fun v x -> { x with _end = v });
  }
  let start = {
    GapiLens.get = (fun x -> x.start);
    GapiLens.set = (fun v x -> { x with start = v });
  }
  
  let empty = {
    _end = GapiDate.epoch;
    start = GapiDate.epoch;
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_date_value "end" x._end;
      GapiJson.render_date_value "start" x.start;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "end"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with _end = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "start"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with start = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.TimePeriod.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CalendarListEntry =
struct
  type t = {
    accessRole : string;
    colorId : string;
    defaultReminders : EventReminder.t list;
    description : string;
    etag : string;
    hidden : bool;
    id : string;
    kind : string;
    location : string;
    selected : bool;
    summary : string;
    summaryOverride : string;
    timeZone : string;
    
  }
  
  let accessRole = {
    GapiLens.get = (fun x -> x.accessRole);
    GapiLens.set = (fun v x -> { x with accessRole = v });
  }
  let colorId = {
    GapiLens.get = (fun x -> x.colorId);
    GapiLens.set = (fun v x -> { x with colorId = v });
  }
  let defaultReminders = {
    GapiLens.get = (fun x -> x.defaultReminders);
    GapiLens.set = (fun v x -> { x with defaultReminders = v });
  }
  let description = {
    GapiLens.get = (fun x -> x.description);
    GapiLens.set = (fun v x -> { x with description = v });
  }
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let hidden = {
    GapiLens.get = (fun x -> x.hidden);
    GapiLens.set = (fun v x -> { x with hidden = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let location = {
    GapiLens.get = (fun x -> x.location);
    GapiLens.set = (fun v x -> { x with location = v });
  }
  let selected = {
    GapiLens.get = (fun x -> x.selected);
    GapiLens.set = (fun v x -> { x with selected = v });
  }
  let summary = {
    GapiLens.get = (fun x -> x.summary);
    GapiLens.set = (fun v x -> { x with summary = v });
  }
  let summaryOverride = {
    GapiLens.get = (fun x -> x.summaryOverride);
    GapiLens.set = (fun v x -> { x with summaryOverride = v });
  }
  let timeZone = {
    GapiLens.get = (fun x -> x.timeZone);
    GapiLens.set = (fun v x -> { x with timeZone = v });
  }
  
  let empty = {
    accessRole = "";
    colorId = "";
    defaultReminders = [];
    description = "";
    etag = "";
    hidden = false;
    id = "";
    kind = "";
    location = "";
    selected = false;
    summary = "";
    summaryOverride = "";
    timeZone = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "accessRole" x.accessRole;
      GapiJson.render_string_value "colorId" x.colorId;
      GapiJson.render_array "defaultReminders" EventReminder.render x.defaultReminders;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_bool_value "hidden" x.hidden;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "location" x.location;
      GapiJson.render_bool_value "selected" x.selected;
      GapiJson.render_string_value "summary" x.summary;
      GapiJson.render_string_value "summaryOverride" x.summaryOverride;
      GapiJson.render_string_value "timeZone" x.timeZone;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accessRole"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with accessRole = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "colorId"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with colorId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "defaultReminders"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        EventReminder.parse
        EventReminder.empty
        (fun xs -> { x with defaultReminders = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hidden"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with hidden = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "location"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with location = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selected"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with selected = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "summary"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with summary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "summaryOverride"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with summaryOverride = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeZone"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with timeZone = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.CalendarListEntry.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FreeBusyCalendar =
struct
  type t = {
    busy : TimePeriod.t list;
    errors : Error.t list;
    
  }
  
  let busy = {
    GapiLens.get = (fun x -> x.busy);
    GapiLens.set = (fun v x -> { x with busy = v });
  }
  let errors = {
    GapiLens.get = (fun x -> x.errors);
    GapiLens.set = (fun v x -> { x with errors = v });
  }
  
  let empty = {
    busy = [];
    errors = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "busy" TimePeriod.render x.busy;
      GapiJson.render_array "errors" Error.render x.errors;
      
    ]
  
  let render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "busy"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        TimePeriod.parse
        TimePeriod.empty
        (fun xs -> { x with busy = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "errors"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        Error.parse
        Error.empty
        (fun xs -> { x with errors = xs })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.FreeBusyCalendar.parse" e
  
end

module FreeBusyResponse =
struct
  type t = {
    calendars : (string * FreeBusyCalendar.t) list;
    groups : (string * FreeBusyGroup.t) list;
    kind : string;
    timeMax : GapiDate.t;
    timeMin : GapiDate.t;
    
  }
  
  let calendars = {
    GapiLens.get = (fun x -> x.calendars);
    GapiLens.set = (fun v x -> { x with calendars = v });
  }
  let groups = {
    GapiLens.get = (fun x -> x.groups);
    GapiLens.set = (fun v x -> { x with groups = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let timeMax = {
    GapiLens.get = (fun x -> x.timeMax);
    GapiLens.set = (fun v x -> { x with timeMax = v });
  }
  let timeMin = {
    GapiLens.get = (fun x -> x.timeMin);
    GapiLens.set = (fun v x -> { x with timeMin = v });
  }
  
  let empty = {
    calendars = [];
    groups = [];
    kind = "";
    timeMax = GapiDate.epoch;
    timeMin = GapiDate.epoch;
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_collection "calendars" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (FreeBusyCalendar.render_content v)) x.calendars;
      GapiJson.render_collection "groups" GapiJson.Object (fun (id, v) -> GapiJson.render_object id (FreeBusyGroup.render_content v)) x.groups;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "timeMax" x.timeMax;
      GapiJson.render_date_value "timeMin" x.timeMin;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "calendars"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FreeBusyCalendar.parse
              FreeBusyCalendar.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.FreeBusyResponse.parse.parse_dictionary" e)
        ("", FreeBusyCalendar.empty)
        (fun xs -> { x with calendars = xs })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "groups"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun _ -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FreeBusyGroup.parse
              FreeBusyGroup.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.FreeBusyResponse.parse.parse_dictionary" e)
        ("", FreeBusyGroup.empty)
        (fun xs -> { x with groups = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeMax"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with timeMax = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeMin"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with timeMin = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.FreeBusyResponse.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CalendarList =
struct
  type t = {
    etag : string;
    items : CalendarListEntry.t list;
    kind : string;
    nextPageToken : string;
    
  }
  
  let etag = {
    GapiLens.get = (fun x -> x.etag);
    GapiLens.set = (fun v x -> { x with etag = v });
  }
  let items = {
    GapiLens.get = (fun x -> x.items);
    GapiLens.set = (fun v x -> { x with items = v });
  }
  let kind = {
    GapiLens.get = (fun x -> x.kind);
    GapiLens.set = (fun v x -> { x with kind = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  
  let empty = {
    etag = "";
    items = [];
    kind = "";
    nextPageToken = "";
    
  }
  
  let render x = 
    GapiJson.render_object "" [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" CalendarListEntry.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        CalendarListEntry.parse
        CalendarListEntry.empty
        (fun xs -> { x with items = xs })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.CalendarList.parse" e
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

