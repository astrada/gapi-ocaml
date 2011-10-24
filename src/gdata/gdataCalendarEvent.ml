open GdataUtils.Op

(* Calendar event data types *)
type gdata_attendeeStatus = string

type calendar_resourceProperty = {
  rp_id : string;
  rp_value : bool
}

let empty_resourceProperty = {
  rp_id = "";
  rp_value = false
}

type calendar_calendarWho = {
  cw_email : string;
  cw_rel : string;
  cw_value : string;
  cw_resource : calendar_resourceProperty;
  cw_attendeeStatus : gdata_attendeeStatus
}

let empty_who = {
  cw_email = "";
  cw_rel = "";
  cw_value = "";
  cw_resource = empty_resourceProperty;
  cw_attendeeStatus = ""
}

type gdata_kind = {
  k_scheme : string;
  k_term : string
}

let eventKind = {
  k_scheme = "http://schemas.google.com/g/2005#kind";
  k_term = "http://schemas.google.com/g/2005#event"
}

type gdata_eventStatus = string

type calendar_icalUIDProperty = string

type gdata_reminder = {
  r_absoluteTime : GdataDate.t;
  r_days : int;
  r_hours : int;
  r_method : string;
  r_minutes : int
}

let empty_reminder = {
  r_absoluteTime = GdataDate.epoch;
  r_days = 0;
  r_hours = 0;
  r_method = "";
  r_minutes = 0
}

type gdata_when = {
  w_endTime : GdataDate.t;
  w_startTime : GdataDate.t;
  w_value : string;
  w_reminders : gdata_reminder list
}

let empty_when = {
  w_endTime = GdataDate.epoch;
  w_startTime = GdataDate.epoch;
  w_value = "";
  w_reminders = []
}

type gdata_originalEvent = {
  oe_href : string;
  oe_id : string;
  oe_when : gdata_when
}

let empty_originalEvent = {
  oe_href = "";
  oe_id = "";
  oe_when = empty_when
}

type calendar_privateCopyProperty = bool

type calendar_quickAddProperty = bool

type gdata_recurrence = string

type calendar_sendEventNotificationsProperty = bool

type calendar_sequenceNumberProperty = int

type calendar_syncEventProperty = bool

type gdata_transparency = string

type gdata_visibility = string

type calendar_calendarRecurrenceExceptionEntry = {
  cree_etag : string;
  cree_authors : GdataAtom.atom_author list;
  cree_categories : GdataAtom.atom_category list;
  cree_content : GdataAtom.atom_content;
  cree_contributors : GdataAtom.atom_contributor list;
  cree_id : GdataAtom.atom_id;
  cree_published : GdataAtom.atom_published;
  cree_updated : GdataAtom.atom_updated;
  cree_comments : GdataCalendarComment.calendar_calendarComments;
  cree_links : GdataCalendar.calendar_calendarLink list;
  cree_where : GdataCalendar.calendar_calendarWhere list;
  cree_who : calendar_calendarWho list;
  cree_icalUID : calendar_icalUIDProperty;
  cree_sequenceNumber : calendar_sequenceNumberProperty;
  cree_title : GdataAtom.atom_textConstruct;
  cree_eventStatus : gdata_eventStatus;
  cree_originalEvent : gdata_originalEvent;
  cree_transparency : gdata_transparency;
  cree_visibility : gdata_visibility;
  cree_when : gdata_when list;
  cree_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_recurrenceExceptionEntry = {
  cree_etag = "";
  cree_authors = [];
  cree_categories = [];
  cree_content = GdataAtom.empty_content;
  cree_contributors = [];
  cree_id = "";
  cree_published = GdataDate.epoch;
  cree_updated = GdataDate.epoch;
  cree_comments = GdataCalendarComment.empty_comments;
  cree_links = [];
  cree_where = [];
  cree_who = [];
  cree_icalUID = "";
  cree_sequenceNumber = 0;
  cree_title = GdataAtom.empty_text;
  cree_eventStatus = "";
  cree_originalEvent = empty_originalEvent;
  cree_transparency = "";
  cree_visibility = "";
  cree_when = [];
  cree_extensions = []
}

type calendar_calendarExtendedProperty = {
  cep_name : string;
  cep_realm : string;
  cep_value : string
}

let empty_extendedProperty = {
  cep_name = "";
  cep_realm = "";
  cep_value = ""
}

type calendar_calendarRecurrenceException = {
  cre_specialized : bool;
  cre_entry : calendar_calendarRecurrenceExceptionEntry
}

let empty_recurrenceException = {
  cre_specialized = false;
  cre_entry = empty_recurrenceExceptionEntry
}

type calendar_calendarEventEntry = {
  cee_etag : string;
  cee_authors : GdataAtom.atom_author list;
  cee_content : GdataAtom.atom_content;
  cee_contributors : GdataAtom.atom_contributor list;
  cee_id : GdataAtom.atom_id;
  cee_published : GdataAtom.atom_published;
  cee_updated : GdataAtom.atom_updated;
  cee_comments : GdataCalendarComment.calendar_calendarComments;
  cee_extendedProperties : calendar_calendarExtendedProperty list;
  cee_links : GdataCalendar.calendar_calendarLink list;
  cee_recurrenceExceptions : calendar_calendarRecurrenceException list;
  cee_where : GdataCalendar.calendar_calendarWhere list;
  cee_who : calendar_calendarWho list;
  cee_icalUID : calendar_icalUIDProperty;
  cee_privateCopy : calendar_privateCopyProperty;
  cee_quickAdd : calendar_quickAddProperty;
  cee_sendEventNotifications : calendar_sendEventNotificationsProperty;
  cee_sequenceNumber : calendar_sequenceNumberProperty;
  cee_syncEvent : calendar_syncEventProperty;
  cee_summary : GdataAtom.atom_textConstruct;
  cee_title : GdataAtom.atom_textConstruct;
  cee_eventKind : gdata_kind;
  cee_eventStatus : gdata_eventStatus;
  cee_originalEvent : gdata_originalEvent;
  cee_recurrence : gdata_recurrence;
  cee_reminders : gdata_reminder list;
  cee_transparency : gdata_transparency;
  cee_visibility : gdata_visibility;
  cee_when : gdata_when list;
  cee_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_eventEntry = {
  cee_etag = "";
  cee_authors = [];
  cee_content = GdataAtom.empty_content;
  cee_contributors = [];
  cee_id = "";
  cee_published = GdataDate.epoch;
  cee_updated = GdataDate.epoch;
  cee_comments = GdataCalendarComment.empty_comments;
  cee_extendedProperties = [];
  cee_links = [];
  cee_recurrenceExceptions = [];
  cee_where = [];
  cee_who = [];
  cee_icalUID = "";
  cee_privateCopy = false;
  cee_quickAdd = false;
  cee_sendEventNotifications = false;
  cee_sequenceNumber = 0;
  cee_syncEvent = false;
  cee_summary = GdataAtom.empty_text;
  cee_title = GdataAtom.empty_text;
  cee_eventKind = eventKind;
  cee_eventStatus = "";
  cee_originalEvent = empty_originalEvent;
  cee_recurrence = "";
  cee_reminders = [];
  cee_transparency = "";
  cee_visibility = "";
  cee_when = [];
  cee_extensions = []
}

type calendar_calendarEventFeed = {
  cef_etag : string;
  cef_authors : GdataAtom.atom_author list;
  cef_contributors : GdataAtom.atom_contributor list;
  cef_generator : GdataAtom.atom_generator;
  cef_id : GdataAtom.atom_id;
  cef_updated : GdataAtom.atom_updated;
  cef_entries : calendar_calendarEventEntry list;
  cef_links : GdataCalendar.calendar_calendarLink list;
  cef_timezone : GdataCalendar.calendar_timeZoneProperty;
  cef_timesCleaned : GdataCalendar.calendar_timesCleanedProperty;
  cef_subtitle : GdataAtom.atom_textConstruct;
  cef_title : GdataAtom.atom_textConstruct;
  cef_eventKind : gdata_kind;
  cef_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
  cef_startIndex : GdataAtom.opensearch_startIndex;
  cef_totalResults : GdataAtom.opensearch_totalResults;
  cef_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_eventFeed = {
  cef_etag = "";
  cef_authors = [];
  cef_contributors = [];
  cef_generator = GdataAtom.empty_generator;
  cef_id = "";
  cef_updated = GdataDate.epoch;
  cef_entries = [];
  cef_links = [];
  cef_timezone = "";
  cef_timesCleaned = 0;
  cef_subtitle = GdataAtom.empty_text;
  cef_title = GdataAtom.empty_text;
  cef_eventKind = eventKind;
  cef_itemsPerPage = 0;
  cef_startIndex = 0;
  cef_totalResults = 0;
  cef_extensions = []
}
(* END Calendar event data types *)


(* Calendar event feed: parsing *)
let parse_extendedProperty property tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "name"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { property with cep_name = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "realm"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { property with cep_realm = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "value"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { property with cep_value = v }
    | _ ->
        assert false

let parse_resourceProperty resource tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "id"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { resource with rp_id = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "value"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { resource with rp_value = bool_of_string v }
    | _ ->
        assert false

let parse_attendeeStatus where tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "value"; `Namespace ""],
         GdataCore.Value.String v) ->
        v
    | _ ->
        assert false

let parse_who who tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "email"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { who with cw_email = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "rel"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { who with cw_rel = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "valueString"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { who with cw_value = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "resource"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gCal ->
        GdataAtom.parse_children
          parse_resourceProperty
          empty_resourceProperty
          (fun property -> { who with cw_resource = property })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "attendeeStatus"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_attendeeStatus
          ""
          (fun status -> { who with cw_attendeeStatus = status })
          cs
    | _ ->
        assert false

let parse_reminder reminder tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "absoluteTime"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { reminder with r_absoluteTime = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "days"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { reminder with r_days = int_of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "hours"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { reminder with r_hours = int_of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "method"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { reminder with r_method = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "minutes"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { reminder with r_minutes = int_of_string v }
    | _ ->
        assert false

let parse_when cwhen tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "startTime"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { cwhen with w_startTime = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "endTime"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { cwhen with w_endTime = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "valueString"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { cwhen with w_value = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "reminder"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_reminder
          empty_reminder
          (fun reminder ->
             { cwhen with w_reminders = reminder :: cwhen.w_reminders })
          cs
    | _ ->
        assert false

let parse_originalEvent event tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "href"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { event with oe_href = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "id"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { event with oe_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "when"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_when
          empty_when
          (fun cwhen -> { event with oe_when = cwhen })
          cs
    | _ ->
        assert false

let parse_recurrenceExceptionEntry entry tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { entry with cree_etag = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { entry with cree_authors =
                             author :: entry.cree_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_category
          GdataAtom.empty_category
          (fun category ->
             { entry with cree_categories = category :: entry.cree_categories })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "content"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_content
          GdataAtom.empty_content
          (fun content -> { entry with cree_content = content })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun contributor -> { entry with cree_contributors =
                                  contributor :: entry.cree_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cree_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "published"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cree_published = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cree_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "comments"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendarComment.parse_comments
          GdataCalendarComment.empty_comments
          (fun comments -> { entry with cree_comments = comments })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataCalendar.parse_link
          GdataCalendar.empty_link
          (fun link -> { entry with cree_links = link :: entry.cree_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "where"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.parse_where
          ""
          (fun where -> { entry with cree_where = where :: entry.cree_where })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "who"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_who
          empty_who
          (fun who -> { entry with cree_who = who :: entry.cree_who })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "uid"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cree_icalUID = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "sequence"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cree_sequenceNumber = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { entry with cree_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "eventStatus"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cree_eventStatus = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "originalEvent"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_originalEvent
          empty_originalEvent
          (fun event -> { entry with cree_originalEvent = event })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "transparency"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cree_transparency = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "visibility"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cree_visibility = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "when"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_when
          empty_when
          (fun cwhen -> { entry with cree_when = cwhen :: entry.cree_when })
          cs
    | extension ->
        let extensions = extension :: entry.cree_extensions in
          { entry with cree_extensions = extensions }

let parse_recurrenceExceptionEntryLink entry tree =
  match tree with
      GdataCore.AnnotatedTree.Node
        ([`Element; `Name "entry"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          parse_recurrenceExceptionEntry
          empty_recurrenceExceptionEntry
          Std.identity
          cs
    | _ ->
        assert false

let parse_recurrenceException ex tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "specialized"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { ex with cre_specialized = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "entryLink"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_recurrenceExceptionEntryLink
          empty_recurrenceExceptionEntry
          (fun entry -> { ex with cre_entry = entry })
          cs
    | _ ->
        assert false

let parse_entry entry tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { entry with cee_etag = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { entry with cee_authors =
                             author :: entry.cee_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "content"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_content
          GdataAtom.empty_content
          (fun content -> { entry with cee_content = content })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun contributor -> { entry with cee_contributors =
                                  contributor :: entry.cee_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cee_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "published"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cee_published = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cee_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "comments"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendarComment.parse_comments
          GdataCalendarComment.empty_comments
          (fun comments -> { entry with cee_comments = comments })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "extendedProperty"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_extendedProperty
          empty_extendedProperty
          (fun property ->
             { entry with cee_extendedProperties =
                 property :: entry.cee_extendedProperties })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataCalendar.parse_link
          GdataCalendar.empty_link
          (fun link -> { entry with cee_links = link :: entry.cee_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "recurrenceException"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_recurrenceException
          empty_recurrenceException
          (fun ex ->
             { entry with cee_recurrenceExceptions =
                 ex :: entry.cee_recurrenceExceptions })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "where"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.parse_where
          ""
          (fun where -> { entry with cee_where = where :: entry.cee_where })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "who"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_who
          empty_who
          (fun who -> { entry with cee_who = who :: entry.cee_who })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "uid"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_icalUID = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "sequence"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_sequenceNumber = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { entry with cee_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "eventStatus"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cee_eventStatus = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "originalEvent"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_originalEvent
          empty_originalEvent
          (fun event -> { entry with cee_originalEvent = event })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "transparency"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cee_transparency = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "visibility"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cee_visibility = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "when"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_when
          empty_when
          (fun cwhen -> { entry with cee_when = cwhen :: entry.cee_when })
          cs
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name _; `Namespace ns],
         _) when ns = Xmlm.ns_xmlns ->
        entry
    | extension ->
        let extensions = extension :: entry.cee_extensions in
          { entry with cee_extensions = extensions }

let parse_feed feed tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { feed with cef_etag = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { feed with cef_authors = author :: feed.cef_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun contributor -> { feed with cef_contributors =
                                  contributor :: feed.cef_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "generator"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_generator
          GdataAtom.empty_generator
          (fun generator -> { feed with cef_generator = generator })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { feed with cef_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { feed with cef_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "entry"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          parse_entry
          empty_eventEntry
          (fun entry -> { feed with cef_entries = entry :: feed.cef_entries })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataCalendar.parse_link
          GdataCalendar.empty_link
          (fun link -> { feed with cef_links = link :: feed.cef_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "timezone"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { feed with cef_timezone = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "timesCleaned"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { feed with cef_timesCleaned = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "subtitle"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun subtitle -> { feed with cef_subtitle = subtitle })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { feed with cef_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "itemsPerPage"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with cef_itemsPerPage = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "startIndex"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with cef_startIndex = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "totalResults"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with cef_totalResults = int_of_string v }

    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name _; `Namespace ns],
         _) when ns = Xmlm.ns_xmlns ->
        feed
    | extension ->
        let extensions = extension :: feed.cef_extensions in
          { feed with cef_extensions = extensions }

let parse_calendar_event_feed tree =
  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feed"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            parse_feed
            empty_eventFeed
            Std.identity
            cs
      | _ ->
          assert false
  in
    parse_root tree

let parse_calendar_event_entry tree =
  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "entry"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            parse_entry
            empty_eventEntry
            Std.identity
            cs
      | _ ->
          assert false
  in
    parse_root tree
(* END Calendar event feed: parsing *)


(* Calendar event feed: rendering *)
let render_extendedProperty property =
  GdataAtom.render_element GdataCalendar.ns_gd "extendedProperty"
    [GdataAtom.render_attribute "" "name" property.cep_name;
     GdataAtom.render_attribute "" "realm" property.cep_realm;
     GdataAtom.render_attribute "" "value" property.cep_value]

let render_resourceProperty property =
  GdataAtom.render_element GdataCalendar.ns_gd "resource"
    [GdataAtom.render_attribute "" "id" property.rp_id;
     GdataAtom.render_attribute "" "value" (string_of_bool property.rp_value)]

let render_attendeeStatus status =
  GdataAtom.render_value ~attribute:"value" GdataCalendar.ns_gd "who" status

let render_who who =
  GdataAtom.render_element GdataCalendar.ns_gd "resource"
    [GdataAtom.render_attribute "" "email" who.cw_email;
     GdataAtom.render_attribute "" "rel" who.cw_rel;
     GdataAtom.render_attribute "" "valueString" who.cw_value;
     render_resourceProperty who.cw_resource;
     render_attendeeStatus who.cw_attendeeStatus]

let render_reminder reminder =
  GdataAtom.render_element GdataCalendar.ns_gd "reminder"
    [GdataAtom.render_date_attribute "" "absoluteTime" reminder.r_absoluteTime;
     GdataAtom.render_attribute "" "days" (string_of_int reminder.r_days);
     GdataAtom.render_attribute "" "hours" (string_of_int reminder.r_hours);
     GdataAtom.render_attribute "" "method" reminder.r_method;
     GdataAtom.render_attribute "" "minutes" (string_of_int reminder.r_minutes)]

let render_when cwhen =
  GdataAtom.render_element GdataCalendar.ns_gd "when"
    [GdataAtom.render_date_attribute "" "startTime" cwhen.w_startTime;
     GdataAtom.render_date_attribute "" "endTime" cwhen.w_endTime;
     GdataAtom.render_attribute "" "valueString" cwhen.w_value;
     GdataAtom.render_element_list render_reminder cwhen.w_reminders]

let render_originalEvent event =
  GdataAtom.render_element GdataCalendar.ns_gd "originalEvent"
    [GdataAtom.render_attribute "" "href" event.oe_href;
     GdataAtom.render_attribute "" "id" event.oe_id;
     render_when event.oe_when]

let render_recurrenceExceptionEntry entry =
  GdataAtom.render_element GdataAtom.ns_atom "entry"
    [GdataAtom.render_attribute GdataCalendar.ns_gd "etag" entry.cree_etag;
     GdataAtom.render_element_list (GdataAtom.render_author "author") entry.cree_authors;
     GdataAtom.render_element_list GdataAtom.render_category entry.cree_categories;
     GdataAtom.render_content entry.cree_content;
     GdataAtom.render_element_list (GdataAtom.render_author "contributor") entry.cree_contributors;
     GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.cree_id;
     GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.cree_published;
     GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.cree_updated;
     GdataCalendarComment.render_comments entry.cree_comments;
     GdataAtom.render_element_list GdataCalendar.render_link entry.cree_links;
     GdataAtom.render_element_list GdataCalendar.render_where entry.cree_where;
     GdataAtom.render_element_list render_who entry.cree_who;
     GdataAtom.render_value GdataCalendar.ns_gd "uid" entry.cree_icalUID;
     GdataAtom.render_int_value GdataCalendar.ns_gd "sequence" entry.cree_sequenceNumber;
     GdataAtom.render_text_construct "title" entry.cree_title;
     GdataAtom.render_value GdataCalendar.ns_gd "eventStatus" entry.cree_eventStatus;
     render_originalEvent entry.cree_originalEvent;
     GdataAtom.render_value GdataCalendar.ns_gd "transparency" entry.cree_transparency;
     GdataAtom.render_value GdataCalendar.ns_gd "visibility" entry.cree_visibility;
     GdataAtom.render_element_list render_when entry.cree_when;
     entry.cree_extensions]

let render_recurrenceExceptionEntryLink entry =
  GdataAtom.render_element GdataCalendar.ns_gd "entryLink"
    [render_recurrenceExceptionEntry entry]

let render_recurrenceException ex =
  GdataAtom.render_element GdataCalendar.ns_gd "recurrenceException"
    [GdataAtom.render_bool_attribute "" "specialized" ex.cre_specialized;
     render_recurrenceExceptionEntryLink ex.cre_entry]

let calendar_event_entry_to_data_model entry =
  let entry_element =
    (* TODO: better namespace handling *)
    GdataAtom.render_element GdataAtom.ns_atom "entry"
      [GdataAtom.render_attribute Xmlm.ns_xmlns "xmlns" GdataAtom.ns_atom;
       GdataAtom.render_attribute Xmlm.ns_xmlns "gCal" GdataCalendar.ns_gCal;
       GdataAtom.render_attribute Xmlm.ns_xmlns "gd" GdataCalendar.ns_gd;
       GdataAtom.render_attribute Xmlm.ns_xmlns "app" GdataAtom.ns_app;
       GdataAtom.render_element_list (GdataAtom.render_author "author") entry.cee_authors;
       GdataAtom.render_content entry.cee_content;
       GdataAtom.render_element_list (GdataAtom.render_author "contributor") entry.cee_contributors;
       GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.cee_id;
       GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.cee_published;
       GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.cee_updated;
       GdataCalendarComment.render_comments entry.cee_comments;
       GdataAtom.render_element_list render_extendedProperty entry.cee_extendedProperties;
       GdataAtom.render_element_list GdataCalendar.render_link entry.cee_links;
       GdataAtom.render_element_list render_recurrenceException entry.cee_recurrenceExceptions;
       GdataAtom.render_element_list GdataCalendar.render_where entry.cee_where;
       GdataAtom.render_element_list render_who entry.cee_who;
       GdataAtom.render_value ~attribute:"value" GdataCalendar.ns_gd "uid" entry.cee_icalUID;
       GdataAtom.render_int_value ~attribute:"value" GdataCalendar.ns_gd "sequence" entry.cee_sequenceNumber;
       GdataAtom.render_text_construct "title" entry.cee_title;
       GdataAtom.render_value ~attribute:"value" GdataCalendar.ns_gd "eventStatus" entry.cee_eventStatus;
       render_originalEvent entry.cee_originalEvent;
       GdataAtom.render_value ~attribute:"value" GdataCalendar.ns_gd "transparency" entry.cee_transparency;
       GdataAtom.render_value ~attribute:"value" GdataCalendar.ns_gd "visibility" entry.cee_visibility;
       GdataAtom.render_element_list render_when entry.cee_when;
       entry.cee_extensions]
  in

    List.hd entry_element
(* END Calendar event feed: rendering *)

