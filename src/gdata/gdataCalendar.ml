open GdataUtils.Op

(* Calendar data types *)
let ns_gCal = "http://schemas.google.com/gCal/2005"

type calendar_accessLevelProperty = string

module WebContentGadgetPref =
struct
  type t = {
    wcgp_name : string;
    wcgp_value : string;
  }

  let empty = {
    wcgp_name = "";
    wcgp_value = ""
  }

  let to_xml_data_model webContentGadgetPref =
    GdataAtom.render_element ns_gCal "webContentGadgetPref"
      [GdataAtom.render_attribute "" "name" webContentGadgetPref.wcgp_name;
       GdataAtom.render_attribute "" "value" webContentGadgetPref.wcgp_value]

  let of_xml_data_model wcgp tree =
    match tree with
        GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "name"; `Namespace ""],
           GdataCore.Value.String v) ->
          { wcgp with wcgp_name = v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "value"; `Namespace ""],
           GdataCore.Value.String v) ->
          { wcgp with wcgp_value = v }
      | e ->
          GdataUtils.unexpected e

end

type calendar_webContent = {
  wc_height : int;
  wc_url : string;
  wc_width : int;
  wc_webContentGadgetPrefs : WebContentGadgetPref.t list
}

let empty_webContent = {
  wc_height = 0;
  wc_url = "";
  wc_width = 0;
  wc_webContentGadgetPrefs = []
}

type calendar_calendarWhere = string

type calendar_colorProperty = string

type calendar_hiddenProperty = bool

type calendar_overrideNameProperty = string

type calendar_selectedProperty = bool

type calendar_timeZoneProperty = string

type calendar_timesCleanedProperty = int

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
(* END Calendar data types *)

(* Calendar feed: parsing *)
let parse_where where tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "valueString"; `Namespace ""],
         GdataCore.Value.String v) ->
        v
    | e ->
        GdataUtils.unexpected e

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
    | e ->
        GdataUtils.unexpected e

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
    | e ->
        GdataUtils.unexpected e

let parse_attendeeStatus where tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "value"; `Namespace ""],
         GdataCore.Value.String v) ->
        v
    | e ->
        GdataUtils.unexpected e

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
         cs) when ns = ns_gCal ->
        GdataAtom.parse_children
          parse_resourceProperty
          empty_resourceProperty
          (fun property -> { who with cw_resource = property })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "attendeeStatus"; `Namespace ns],
         cs) when ns = GdataAtom.ns_gd ->
        GdataAtom.parse_children
          parse_attendeeStatus
          ""
          (fun status -> { who with cw_attendeeStatus = status })
          cs
    | e ->
        GdataUtils.unexpected e

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
    | e ->
        GdataUtils.unexpected e

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
         cs) when ns = GdataAtom.ns_gd ->
        GdataAtom.parse_children
          parse_reminder
          empty_reminder
          (fun reminder ->
             { cwhen with w_reminders = reminder :: cwhen.w_reminders })
          cs
    | e ->
        GdataUtils.unexpected e

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
         cs) when ns = GdataAtom.ns_gd ->
        GdataAtom.parse_children
          parse_when
          empty_when
          (fun cwhen -> { event with oe_when = cwhen })
          cs
    | e ->
        GdataUtils.unexpected e
(* END Calendar feed: parsing *)


(* Calendar feed: rendering *)
let get_calendar_prefix namespace =
  if namespace = ns_gCal then "gCal"
  else GdataACL.get_acl_prefix namespace

let render_where where =
  GdataAtom.render_value ~attribute:"valueString" GdataAtom.ns_gd "where" where

let render_extendedProperty property =
  GdataAtom.render_element GdataAtom.ns_gd "extendedProperty"
    [GdataAtom.render_attribute "" "name" property.cep_name;
     GdataAtom.render_attribute "" "realm" property.cep_realm;
     GdataAtom.render_attribute "" "value" property.cep_value]

let render_resourceProperty property =
  GdataAtom.render_element GdataAtom.ns_gd "resource"
    [GdataAtom.render_attribute "" "id" property.rp_id;
     GdataAtom.render_attribute "" "value" (string_of_bool property.rp_value)]

let render_attendeeStatus status =
  GdataAtom.render_value ~attribute:"value" GdataAtom.ns_gd "who" status

let render_who who =
  GdataAtom.render_element GdataAtom.ns_gd "resource"
    [GdataAtom.render_attribute "" "email" who.cw_email;
     GdataAtom.render_attribute "" "rel" who.cw_rel;
     GdataAtom.render_attribute "" "valueString" who.cw_value;
     render_resourceProperty who.cw_resource;
     render_attendeeStatus who.cw_attendeeStatus]

let render_reminder reminder =
  GdataAtom.render_element GdataAtom.ns_gd "reminder"
    [GdataAtom.render_date_attribute "" "absoluteTime" reminder.r_absoluteTime;
     GdataAtom.render_attribute "" "days" (string_of_int reminder.r_days);
     GdataAtom.render_attribute "" "hours" (string_of_int reminder.r_hours);
     GdataAtom.render_attribute "" "method" reminder.r_method;
     GdataAtom.render_attribute "" "minutes" (string_of_int reminder.r_minutes)]

let render_when cwhen =
  GdataAtom.render_element GdataAtom.ns_gd "when"
    [GdataAtom.render_date_attribute "" "startTime" cwhen.w_startTime;
     GdataAtom.render_date_attribute "" "endTime" cwhen.w_endTime;
     GdataAtom.render_attribute "" "valueString" cwhen.w_value;
     GdataAtom.render_element_list render_reminder cwhen.w_reminders]

let render_originalEvent event =
  GdataAtom.render_element GdataAtom.ns_gd "originalEvent"
    [GdataAtom.render_attribute "" "href" event.oe_href;
     GdataAtom.render_attribute "" "id" event.oe_id;
     render_when event.oe_when]
(* END Calendar feed: rendering *)

module Link =
struct
  type t = {
    href : string;
    length : Int64.t;
    rel : string;
    title : string;
    ltype : string;
    webContent : calendar_webContent
  }

  let empty = {
    href = "";
    length = 0L;
    rel = "";
    title = "";
    ltype = "";
    webContent = empty_webContent
  }

  let to_xml_data_model link =
    let render_webContent webContent =
      GdataAtom.render_element ns_gCal "webContent"
        [GdataAtom.render_int_attribute "" "height" webContent.wc_height;
         GdataAtom.render_attribute "" "url" webContent.wc_url;
         GdataAtom.render_int_attribute "" "width" webContent.wc_width;
         GdataAtom.render_element_list WebContentGadgetPref.to_xml_data_model webContent.wc_webContentGadgetPrefs]
    in

    GdataAtom.render_element GdataAtom.ns_atom "link"
      [GdataAtom.render_attribute "" "href" link.href;
       GdataAtom.render_generic_attribute Int64.to_string Int64.zero "" "length" link.length;
       GdataAtom.render_attribute "" "rel" link.rel;
       GdataAtom.render_attribute "" "title" link.title;
       GdataAtom.render_attribute "" "type" link.ltype;
       render_webContent link.webContent]

  let of_xml_data_model link tree =
    let parse_webContent webContent tree =
      match tree with
          GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "height"; `Namespace ""],
             GdataCore.Value.String v) ->
            { webContent with wc_height = int_of_string v }
        | GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "url"; `Namespace ""],
             GdataCore.Value.String v) ->
            { webContent with wc_url = v }
        | GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "width"; `Namespace ""],
             GdataCore.Value.String v) ->
            { webContent with wc_width = int_of_string v }
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "webContentGadgetPref"; `Namespace ns],
             cs) when ns = ns_gCal ->
            GdataAtom.parse_children
              WebContentGadgetPref.of_xml_data_model
              WebContentGadgetPref.empty
              (fun wcgp -> { webContent with wc_webContentGadgetPrefs =
                               wcgp :: webContent.wc_webContentGadgetPrefs })
              cs
        | e ->
            GdataUtils.unexpected e
    in

      match tree with
          GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "href"; `Namespace ""],
             GdataCore.Value.String v) ->
            { link with href = v }
        | GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "length"; `Namespace ""],
             GdataCore.Value.String v) ->
            { link with length = Int64.of_string v }
        | GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "rel"; `Namespace ""],
             GdataCore.Value.String v) ->
            { link with rel = v }
        | GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "title"; `Namespace ""],
             GdataCore.Value.String v) ->
            { link with title = v }
        | GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "type"; `Namespace ""],
             GdataCore.Value.String v) ->
            { link with ltype = v }
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "webContent"; `Namespace ns],
             cs) when ns = ns_gCal ->
            GdataAtom.parse_children
              parse_webContent
              empty_webContent 
              (fun webContent -> { link with webContent = webContent })
              cs
        | e ->
            GdataUtils.unexpected e

end

module Entry =
struct
  type t = {
    etag : string;
    kind : string;
    authors : GdataAtom.Author.t list;
    categories : GdataAtom.Category.t list;
    contributors : GdataAtom.Contributor.t list;
    id : GdataAtom.atom_id;
    content : GdataAtom.Content.t;
    published : GdataAtom.atom_published;
    updated : GdataAtom.atom_updated;
    edited : GdataAtom.app_edited;
    accesslevel : calendar_accessLevelProperty;
    links : Link.t list;
    where : calendar_calendarWhere list;
    color : calendar_colorProperty;
    hidden : calendar_hiddenProperty;
    overridename : calendar_overrideNameProperty;
    selected : calendar_selectedProperty;
    timezone : calendar_timeZoneProperty;
    timesCleaned : calendar_timesCleanedProperty;
    summary : GdataAtom.Summary.t;
    title : GdataAtom.Title.t;
    extensions : GdataCore.xml_data_model list
  }

  let empty = {
    etag = "";
    kind = "";
    authors = [];
    categories = [];
    contributors = [];
    id = "";
    content = GdataAtom.Content.empty;
    published = GdataDate.epoch;
    updated = GdataDate.epoch;
    edited = GdataDate.epoch;
    accesslevel = "";
    links = [];
    where = [];
    color = "";
    hidden = false;
    overridename = "";
    selected = false;
    timezone = "";
    timesCleaned = 0;
    summary = GdataAtom.Summary.empty;
    title = GdataAtom.Title.empty;
    extensions = []
  }

  let to_xml_data_model entry =
    GdataAtom.render_element GdataAtom.ns_atom "entry"
      [GdataAtom.render_attribute GdataAtom.ns_gd "etag" entry.etag;
       GdataAtom.render_attribute GdataAtom.ns_gd "kind" entry.kind;
       GdataAtom.render_element_list GdataAtom.Author.to_xml_data_model entry.authors;
       GdataAtom.render_element_list GdataAtom.Category.to_xml_data_model entry.categories;
       GdataAtom.render_element_list GdataAtom.Contributor.to_xml_data_model entry.contributors;
       GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.id;
       GdataAtom.Content.to_xml_data_model entry.content;
       GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.published;
       GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.updated;
       GdataAtom.render_date_element GdataAtom.ns_app "edited" entry.edited;
       GdataAtom.render_value ns_gCal "accesslevel" entry.accesslevel;
       GdataAtom.render_element_list Link.to_xml_data_model entry.links;
       GdataAtom.render_element_list render_where entry.where;
       GdataAtom.render_value ns_gCal "color" entry.color;
       GdataAtom.render_bool_value ns_gCal "hidden" entry.hidden;
       GdataAtom.render_bool_value ns_gCal "selected" entry.selected;
       GdataAtom.render_value ns_gCal "timezone" entry.timezone;
       GdataAtom.render_int_value ns_gCal "timesCleaned" entry.timesCleaned;
       GdataAtom.Summary.to_xml_data_model entry.summary;
       GdataAtom.Title.to_xml_data_model entry.title;
       entry.extensions]

  let of_xml_data_model entry tree =
    match tree with
        GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "etag"; `Namespace ns],
           GdataCore.Value.String v) when ns = GdataAtom.ns_gd ->
          { entry with etag = v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "kind"; `Namespace ns],
           GdataCore.Value.String v) when ns = GdataAtom.ns_gd ->
          { entry with kind = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "author"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Author.of_xml_data_model
            GdataAtom.Author.empty
            (fun author -> { entry with authors = author :: entry.authors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Category.of_xml_data_model
            GdataAtom.Category.empty
            (fun category -> { entry with categories = category :: entry.categories })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "contributor"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Contributor.of_xml_data_model
            GdataAtom.Contributor.empty
            (fun contributor -> { entry with contributors =
                                    contributor :: entry.contributors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "id"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { entry with id = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "content"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Content.of_xml_data_model
            GdataAtom.Content.empty
            (fun content -> { entry with content = content })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "published"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { entry with published = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "updated"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
          { entry with updated = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "edited"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_app ->
          { entry with edited = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "accesslevel"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               GdataCore.Value.String v)]) when ns = ns_gCal ->
          { entry with accesslevel = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "link"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            Link.of_xml_data_model
            Link.empty
            (fun link -> { entry with links = link :: entry.links })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "where"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            parse_where
            ""
            (fun where -> { entry with where = where :: entry.where })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "color"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               GdataCore.Value.String v)]) when ns = ns_gCal ->
          { entry with color = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "hidden"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               GdataCore.Value.String v)]) when ns = ns_gCal ->
          { entry with hidden = bool_of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "overridename"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               GdataCore.Value.String v)]) when ns = ns_gCal ->
          { entry with overridename = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "selected"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               GdataCore.Value.String v)]) when ns = ns_gCal ->
          { entry with selected = bool_of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "timezone"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               GdataCore.Value.String v)]) when ns = ns_gCal ->
          { entry with timezone = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "timesCleaned"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               GdataCore.Value.String v)]) when ns = ns_gCal ->
          { entry with timesCleaned = int_of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "summary"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Summary.of_xml_data_model
            GdataAtom.Summary.empty
            (fun summary -> { entry with summary = summary })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Title.of_xml_data_model
            GdataAtom.Title.empty
            (fun title -> { entry with title = title })
            cs
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          entry
      | extension ->
          let extensions = extension :: entry.extensions in
            { entry with extensions = extensions }

end

(* Personal settings *)
let parse_personal_settings tree =
  let settings = Hashtbl.create 16 in

  let parse_entry tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "settingsProperty"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "name"; `Namespace ""],
               GdataCore.Value.String n);
            GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               GdataCore.Value.String v)]) when ns = ns_gCal ->
          Hashtbl.add settings n v
      | _ ->
          ()
  in

  let parse_feed tree =
    match tree with
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "entry"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          List.iter parse_entry cs
      | _ ->
          ()
  in

  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feed"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          List.iter parse_feed cs
      | e ->
          GdataUtils.unexpected e
  in
    parse_root tree;
    settings
(* END Personal settings *)


module EntryElement = GdataAtom.MakeElement
                        (struct
                           include Entry

                           let element_name = "entry"

                           let element_namespace = GdataAtom.ns_atom

                           let get_prefix = get_calendar_prefix
                         end)

let parse_calendar_entry = EntryElement.parse_xml_tree

let calendar_entry_to_data_model = EntryElement.build_xml_tree

module Feed = GdataAtom.MakeFeed(Entry)(Link)

module Comments = GdataComments.Make(Link)

(* Utilities *)
module Rel =
struct
  type t =
    [ `EventFeed
    | GdataACL.Rel.t ]

  let to_string l  =
    match l with
        `EventFeed -> ns_gCal ^ "#eventFeed"
      | #GdataACL.Rel.t -> GdataACL.Rel.to_string l

end

let find_url rel links =
  let link = List.find
               (fun link ->
                  link.Link.rel = Rel.to_string rel)
               links
  in
    link.Link.href
(* END Utilities *)

