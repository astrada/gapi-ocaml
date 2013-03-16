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
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "background"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with background = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "foreground"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with foreground = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.ColorDefinition.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_collection "calendar" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (ColorDefinition.render_content v)) v) x.calendar;
      GapiJson.render_collection "event" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (ColorDefinition.render_content v)) v) x.event;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "updated" x.updated;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "calendar"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ColorDefinition.parse
              ColorDefinition.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.Colors.parse.parse_dictionary" e x')
        ("", ColorDefinition.empty)
        (fun v -> { x with calendar = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "event"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ColorDefinition.parse
              ColorDefinition.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.Colors.parse.parse_dictionary" e x')
        ("", ColorDefinition.empty)
        (fun v -> { x with event = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Colors.parse" e x
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "value" x.value;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with value = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Setting.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AclRule =
struct
  module Scope =
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
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with value = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.Scope.parse" e x
    
  end
  
  type t = {
    etag : string;
    id : string;
    kind : string;
    role : string;
    scope : Scope.t;
    
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
    scope = Scope.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "role" x.role;
      (fun v -> GapiJson.render_object "scope" (Scope.render_content v)) x.scope;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "role"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with role = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "scope"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Scope.parse
        Scope.empty
        (fun v -> { x with scope = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.AclRule.parse" e x
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "domain" x.domain;
      GapiJson.render_string_value "reason" x.reason;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "domain"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with domain = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "reason"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with reason = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Error.parse" e x
  
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
      GapiJson.render_array "calendars" (GapiJson.render_string_value "") x.calendars;
      GapiJson.render_array "errors" Error.render x.errors;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "calendars"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.FreeBusyGroup.parse.parse_collection" e x')
        ""
        (fun v -> { x with calendars = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "errors"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Error.parse Error.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.FreeBusyGroup.parse.parse_collection" e x')
        Error.empty
        (fun v -> { x with errors = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.FreeBusyGroup.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.FreeBusyRequestItem.parse" e x
  
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
    id : string;
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
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
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
    id = "";
    optional = false;
    organizer = false;
    resource = false;
    responseStatus = "";
    self = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "additionalGuests" x.additionalGuests;
      GapiJson.render_string_value "comment" x.comment;
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_string_value "email" x.email;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_bool_value "optional" x.optional;
      GapiJson.render_bool_value "organizer" x.organizer;
      GapiJson.render_bool_value "resource" x.resource;
      GapiJson.render_string_value "responseStatus" x.responseStatus;
      GapiJson.render_bool_value "self" x.self;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "additionalGuests"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with additionalGuests = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "comment"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with comment = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "email"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with email = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "optional"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with optional = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "organizer"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with organizer = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "resource"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with resource = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "responseStatus"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with responseStatus = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "self"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with self = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.EventAttendee.parse" e x
  
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
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "date"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with date = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "dateTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with dateTime = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeZone"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timeZone = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.EventDateTime.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "method" x._method;
      GapiJson.render_int_value "minutes" x.minutes;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "method"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _method = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "minutes"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with minutes = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.EventReminder.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Event =
struct
  module Reminders =
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
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "overrides"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children
                EventReminder.parse
                EventReminder.empty
                (fun v -> v)
                cs
            | e ->
              GapiJson.unexpected "GapiCalendarV3Model.Reminders.parse.parse_collection" e x')
          EventReminder.empty
          (fun v -> { x with overrides = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "useDefault"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with useDefault = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.Reminders.parse" e x
    
  end
  
  module Organizer =
  struct
    type t = {
      displayName : string;
      email : string;
      id : string;
      self : bool;
      
    }
    
    let displayName = {
      GapiLens.get = (fun x -> x.displayName);
      GapiLens.set = (fun v x -> { x with displayName = v });
    }
    let email = {
      GapiLens.get = (fun x -> x.email);
      GapiLens.set = (fun v x -> { x with email = v });
    }
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    let self = {
      GapiLens.get = (fun x -> x.self);
      GapiLens.set = (fun v x -> { x with self = v });
    }
    
    let empty = {
      displayName = "";
      email = "";
      id = "";
      self = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "displayName" x.displayName;
        GapiJson.render_string_value "email" x.email;
        GapiJson.render_string_value "id" x.id;
        GapiJson.render_bool_value "self" x.self;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with displayName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "email"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with email = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "self"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with self = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.Organizer.parse" e x
    
  end
  
  module Gadget =
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
        GapiJson.render_collection "preferences" GapiJson.Object (fun (id, v) -> GapiJson.render_string_value id v) x.preferences;
        GapiJson.render_string_value "title" x.title;
        GapiJson.render_string_value "type" x._type;
        GapiJson.render_int_value "width" x.width;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "display"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with display = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "height"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with height = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "iconLink"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with iconLink = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "link"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with link = v }
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "preferences"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = n; data_type = GapiJson.Scalar },
                `String v) ->
              (n, v)
            | e ->
              GapiJson.unexpected "GapiCalendarV3Model.Gadget.parse.parse_dictionary" e x')
          ("", "")
          (fun v -> { x with preferences = v })
          cs
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "title"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with title = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with _type = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "width"; data_type = GapiJson.Scalar },
          `Int v) ->
        { x with width = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.Gadget.parse" e x
    
  end
  
  module ExtendedProperties =
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
        GapiJson.render_collection "private" GapiJson.Object (fun (id, v) -> GapiJson.render_string_value id v) x._private;
        GapiJson.render_collection "shared" GapiJson.Object (fun (id, v) -> GapiJson.render_string_value id v) x.shared;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "private"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = n; data_type = GapiJson.Scalar },
                `String v) ->
              (n, v)
            | e ->
              GapiJson.unexpected "GapiCalendarV3Model.ExtendedProperties.parse.parse_dictionary" e x')
          ("", "")
          (fun v -> { x with _private = v })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "shared"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Leaf
                ({ GapiJson.name = n; data_type = GapiJson.Scalar },
                `String v) ->
              (n, v)
            | e ->
              GapiJson.unexpected "GapiCalendarV3Model.ExtendedProperties.parse.parse_dictionary" e x')
          ("", "")
          (fun v -> { x with shared = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.ExtendedProperties.parse" e x
    
  end
  
  module Creator =
  struct
    type t = {
      displayName : string;
      email : string;
      id : string;
      self : bool;
      
    }
    
    let displayName = {
      GapiLens.get = (fun x -> x.displayName);
      GapiLens.set = (fun v x -> { x with displayName = v });
    }
    let email = {
      GapiLens.get = (fun x -> x.email);
      GapiLens.set = (fun v x -> { x with email = v });
    }
    let id = {
      GapiLens.get = (fun x -> x.id);
      GapiLens.set = (fun v x -> { x with id = v });
    }
    let self = {
      GapiLens.get = (fun x -> x.self);
      GapiLens.set = (fun v x -> { x with self = v });
    }
    
    let empty = {
      displayName = "";
      email = "";
      id = "";
      self = false;
      
    }
    
    let rec render_content x = 
       [
        GapiJson.render_string_value "displayName" x.displayName;
        GapiJson.render_string_value "email" x.email;
        GapiJson.render_string_value "id" x.id;
        GapiJson.render_bool_value "self" x.self;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with displayName = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "email"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with email = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
          `String v) ->
        { x with id = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ GapiJson.name = "self"; data_type = GapiJson.Scalar },
          `Bool v) ->
        { x with self = v }
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiCalendarV3Model.Creator.parse" e x
    
  end
  
  type t = {
    anyoneCanAddSelf : bool;
    attendees : EventAttendee.t list;
    attendeesOmitted : bool;
    colorId : string;
    created : GapiDate.t;
    creator : Creator.t;
    description : string;
    _end : EventDateTime.t;
    endTimeUnspecified : bool;
    etag : string;
    extendedProperties : ExtendedProperties.t;
    gadget : Gadget.t;
    guestsCanInviteOthers : bool;
    guestsCanModify : bool;
    guestsCanSeeOtherGuests : bool;
    hangoutLink : string;
    htmlLink : string;
    iCalUID : string;
    id : string;
    kind : string;
    location : string;
    locked : bool;
    organizer : Organizer.t;
    originalStartTime : EventDateTime.t;
    privateCopy : bool;
    recurrence : string list;
    recurringEventId : string;
    reminders : Reminders.t;
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
  let endTimeUnspecified = {
    GapiLens.get = (fun x -> x.endTimeUnspecified);
    GapiLens.set = (fun v x -> { x with endTimeUnspecified = v });
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
  let hangoutLink = {
    GapiLens.get = (fun x -> x.hangoutLink);
    GapiLens.set = (fun v x -> { x with hangoutLink = v });
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
  let locked = {
    GapiLens.get = (fun x -> x.locked);
    GapiLens.set = (fun v x -> { x with locked = v });
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
    creator = Creator.empty;
    description = "";
    _end = EventDateTime.empty;
    endTimeUnspecified = false;
    etag = "";
    extendedProperties = ExtendedProperties.empty;
    gadget = Gadget.empty;
    guestsCanInviteOthers = false;
    guestsCanModify = false;
    guestsCanSeeOtherGuests = false;
    hangoutLink = "";
    htmlLink = "";
    iCalUID = "";
    id = "";
    kind = "";
    location = "";
    locked = false;
    organizer = Organizer.empty;
    originalStartTime = EventDateTime.empty;
    privateCopy = false;
    recurrence = [];
    recurringEventId = "";
    reminders = Reminders.empty;
    sequence = 0;
    start = EventDateTime.empty;
    status = "";
    summary = "";
    transparency = "";
    updated = GapiDate.epoch;
    visibility = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "anyoneCanAddSelf" x.anyoneCanAddSelf;
      GapiJson.render_array "attendees" EventAttendee.render x.attendees;
      GapiJson.render_bool_value "attendeesOmitted" x.attendeesOmitted;
      GapiJson.render_string_value "colorId" x.colorId;
      GapiJson.render_date_value "created" x.created;
      (fun v -> GapiJson.render_object "creator" (Creator.render_content v)) x.creator;
      GapiJson.render_string_value "description" x.description;
      (fun v -> GapiJson.render_object "end" (EventDateTime.render_content v)) x._end;
      GapiJson.render_bool_value "endTimeUnspecified" x.endTimeUnspecified;
      GapiJson.render_string_value "etag" x.etag;
      (fun v -> GapiJson.render_object "extendedProperties" (ExtendedProperties.render_content v)) x.extendedProperties;
      (fun v -> GapiJson.render_object "gadget" (Gadget.render_content v)) x.gadget;
      GapiJson.render_bool_value "guestsCanInviteOthers" x.guestsCanInviteOthers;
      GapiJson.render_bool_value "guestsCanModify" x.guestsCanModify;
      GapiJson.render_bool_value "guestsCanSeeOtherGuests" x.guestsCanSeeOtherGuests;
      GapiJson.render_string_value "hangoutLink" x.hangoutLink;
      GapiJson.render_string_value "htmlLink" x.htmlLink;
      GapiJson.render_string_value "iCalUID" x.iCalUID;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "location" x.location;
      GapiJson.render_bool_value "locked" x.locked;
      (fun v -> GapiJson.render_object "organizer" (Organizer.render_content v)) x.organizer;
      (fun v -> GapiJson.render_object "originalStartTime" (EventDateTime.render_content v)) x.originalStartTime;
      GapiJson.render_bool_value "privateCopy" x.privateCopy;
      GapiJson.render_array "recurrence" (GapiJson.render_string_value "") x.recurrence;
      GapiJson.render_string_value "recurringEventId" x.recurringEventId;
      (fun v -> GapiJson.render_object "reminders" (Reminders.render_content v)) x.reminders;
      GapiJson.render_int_value "sequence" x.sequence;
      (fun v -> GapiJson.render_object "start" (EventDateTime.render_content v)) x.start;
      GapiJson.render_string_value "status" x.status;
      GapiJson.render_string_value "summary" x.summary;
      GapiJson.render_string_value "transparency" x.transparency;
      GapiJson.render_date_value "updated" x.updated;
      GapiJson.render_string_value "visibility" x.visibility;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "anyoneCanAddSelf"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with anyoneCanAddSelf = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "attendees"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              EventAttendee.parse
              EventAttendee.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.Event.parse.parse_collection" e x')
        EventAttendee.empty
        (fun v -> { x with attendees = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "attendeesOmitted"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with attendeesOmitted = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "colorId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with colorId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "created"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with created = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "creator"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Creator.parse
        Creator.empty
        (fun v -> { x with creator = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
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
        ({ GapiJson.name = "endTimeUnspecified"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with endTimeUnspecified = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "extendedProperties"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        ExtendedProperties.parse
        ExtendedProperties.empty
        (fun v -> { x with extendedProperties = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "gadget"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Gadget.parse
        Gadget.empty
        (fun v -> { x with gadget = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "guestsCanInviteOthers"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with guestsCanInviteOthers = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "guestsCanModify"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with guestsCanModify = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "guestsCanSeeOtherGuests"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with guestsCanSeeOtherGuests = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hangoutLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with hangoutLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "htmlLink"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with htmlLink = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "iCalUID"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with iCalUID = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "location"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with location = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "locked"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with locked = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "organizer"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Organizer.parse
        Organizer.empty
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
        `Bool v) ->
      { x with privateCopy = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "recurrence"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.Event.parse.parse_collection" e x')
        ""
        (fun v -> { x with recurrence = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "recurringEventId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with recurringEventId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "reminders"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Reminders.parse
        Reminders.empty
        (fun v -> { x with reminders = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sequence"; data_type = GapiJson.Scalar },
        `Int v) ->
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
        `String v) ->
      { x with status = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "summary"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with summary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "transparency"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with transparency = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "visibility"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with visibility = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Event.parse" e x
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_int_value "calendarExpansionMax" x.calendarExpansionMax;
      GapiJson.render_int_value "groupExpansionMax" x.groupExpansionMax;
      GapiJson.render_array "items" FreeBusyRequestItem.render x.items;
      GapiJson.render_date_value "timeMax" x.timeMax;
      GapiJson.render_date_value "timeMin" x.timeMin;
      GapiJson.render_string_value "timeZone" x.timeZone;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "calendarExpansionMax"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with calendarExpansionMax = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "groupExpansionMax"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with groupExpansionMax = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FreeBusyRequestItem.parse
              FreeBusyRequestItem.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.FreeBusyRequest.parse.parse_collection" e x')
        FreeBusyRequestItem.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeMax"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timeMax = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeMin"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timeMin = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeZone"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timeZone = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.FreeBusyRequest.parse" e x
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" AclRule.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              AclRule.parse
              AclRule.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.Acl.parse.parse_collection" e x')
        AclRule.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Acl.parse" e x
  
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
  
  let rec render_content x = 
     [
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
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accessRole"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accessRole = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "defaultReminders"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              EventReminder.parse
              EventReminder.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.Events.parse.parse_collection" e x')
        EventReminder.empty
        (fun v -> { x with defaultReminders = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Event.parse Event.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.Events.parse.parse_collection" e x')
        Event.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "summary"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with summary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeZone"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timeZone = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "updated"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with updated = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Events.parse" e x
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" Setting.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Setting.parse
              Setting.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.Settings.parse.parse_collection" e x')
        Setting.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Settings.parse" e x
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "location" x.location;
      GapiJson.render_string_value "summary" x.summary;
      GapiJson.render_string_value "timeZone" x.timeZone;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "location"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with location = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "summary"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with summary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeZone"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timeZone = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.Calendar.parse" e x
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_date_value "end" x._end;
      GapiJson.render_date_value "start" x.start;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "end"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _end = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "start"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with start = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.TimePeriod.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module CalendarListEntry =
struct
  type t = {
    accessRole : string;
    backgroundColor : string;
    colorId : string;
    defaultReminders : EventReminder.t list;
    description : string;
    etag : string;
    foregroundColor : string;
    hidden : bool;
    id : string;
    kind : string;
    location : string;
    primary : bool;
    selected : bool;
    summary : string;
    summaryOverride : string;
    timeZone : string;
    
  }
  
  let accessRole = {
    GapiLens.get = (fun x -> x.accessRole);
    GapiLens.set = (fun v x -> { x with accessRole = v });
  }
  let backgroundColor = {
    GapiLens.get = (fun x -> x.backgroundColor);
    GapiLens.set = (fun v x -> { x with backgroundColor = v });
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
  let foregroundColor = {
    GapiLens.get = (fun x -> x.foregroundColor);
    GapiLens.set = (fun v x -> { x with foregroundColor = v });
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
  let primary = {
    GapiLens.get = (fun x -> x.primary);
    GapiLens.set = (fun v x -> { x with primary = v });
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
    backgroundColor = "";
    colorId = "";
    defaultReminders = [];
    description = "";
    etag = "";
    foregroundColor = "";
    hidden = false;
    id = "";
    kind = "";
    location = "";
    primary = false;
    selected = false;
    summary = "";
    summaryOverride = "";
    timeZone = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accessRole" x.accessRole;
      GapiJson.render_string_value "backgroundColor" x.backgroundColor;
      GapiJson.render_string_value "colorId" x.colorId;
      GapiJson.render_array "defaultReminders" EventReminder.render x.defaultReminders;
      GapiJson.render_string_value "description" x.description;
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_string_value "foregroundColor" x.foregroundColor;
      GapiJson.render_bool_value "hidden" x.hidden;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "location" x.location;
      GapiJson.render_bool_value "primary" x.primary;
      GapiJson.render_bool_value "selected" x.selected;
      GapiJson.render_string_value "summary" x.summary;
      GapiJson.render_string_value "summaryOverride" x.summaryOverride;
      GapiJson.render_string_value "timeZone" x.timeZone;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accessRole"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accessRole = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "backgroundColor"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with backgroundColor = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "colorId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with colorId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "defaultReminders"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              EventReminder.parse
              EventReminder.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.CalendarListEntry.parse.parse_collection" e x')
        EventReminder.empty
        (fun v -> { x with defaultReminders = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with description = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "foregroundColor"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with foregroundColor = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hidden"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hidden = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "location"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with location = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "primary"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with primary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "selected"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with selected = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "summary"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with summary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "summaryOverride"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with summaryOverride = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeZone"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timeZone = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.CalendarListEntry.parse" e x
  
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
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "busy"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              TimePeriod.parse
              TimePeriod.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.FreeBusyCalendar.parse.parse_collection" e x')
        TimePeriod.empty
        (fun v -> { x with busy = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "errors"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Error.parse Error.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.FreeBusyCalendar.parse.parse_collection" e x')
        Error.empty
        (fun v -> { x with errors = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.FreeBusyCalendar.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_collection "calendars" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (FreeBusyCalendar.render_content v)) v) x.calendars;
      GapiJson.render_collection "groups" GapiJson.Object (fun (id, v) -> (fun v -> GapiJson.render_object id (FreeBusyGroup.render_content v)) v) x.groups;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_date_value "timeMax" x.timeMax;
      GapiJson.render_date_value "timeMin" x.timeMin;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "calendars"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FreeBusyCalendar.parse
              FreeBusyCalendar.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.FreeBusyResponse.parse.parse_dictionary" e x')
        ("", FreeBusyCalendar.empty)
        (fun v -> { x with calendars = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "groups"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = n; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              FreeBusyGroup.parse
              FreeBusyGroup.empty
              (fun v -> (n, v))
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.FreeBusyResponse.parse.parse_dictionary" e x')
        ("", FreeBusyGroup.empty)
        (fun v -> { x with groups = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeMax"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timeMax = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timeMin"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with timeMin = GapiDate.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.FreeBusyResponse.parse" e x
  
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
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "etag" x.etag;
      GapiJson.render_array "items" CalendarListEntry.render x.items;
      GapiJson.render_string_value "kind" x.kind;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "etag"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with etag = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "items"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              CalendarListEntry.parse
              CalendarListEntry.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiCalendarV3Model.CalendarList.parse.parse_collection" e x')
        CalendarListEntry.empty
        (fun v -> { x with items = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "kind"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with kind = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiCalendarV3Model.CalendarList.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

