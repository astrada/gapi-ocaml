open GdataUtils.Op

(* Calendar event data types *)
module RecurrenceExceptionEntry =
struct
  type t = {
    etag : string;
    kind : string;
    authors : GdataAtom.Author.t list;
    categories : GdataAtom.Category.t list;
    content : GdataAtom.Content.t;
    contributors : GdataAtom.Contributor.t list;
    id : GdataAtom.atom_id;
    published : GdataAtom.atom_published;
    updated : GdataAtom.atom_updated;
    comments : GdataCalendar.Comments.comments;
    links : GdataCalendar.Link.t list;
    where : GdataCalendar.Where.t list;
    who : GdataCalendar.Who.t list;
    icalUID : GdataCalendar.calendar_icalUIDProperty;
    sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
    title : GdataAtom.Title.t;
    eventStatus : GdataCalendar.gdata_eventStatus;
    originalEvent : GdataCalendar.OriginalEvent.t;
    transparency : GdataCalendar.gdata_transparency;
    visibility : GdataCalendar.gdata_visibility;
    _when : GdataCalendar.When.t list;
    extensions : GdataCore.xml_data_model list
  }

  let empty = {
    etag = "";
    kind = "";
    authors = [];
    categories = [];
    content = GdataAtom.Content.empty;
    contributors = [];
    id = "";
    published = GdataDate.epoch;
    updated = GdataDate.epoch;
    comments = GdataCalendar.Comments.empty_comments;
    links = [];
    where = [];
    who = [];
    icalUID = "";
    sequenceNumber = 0;
    title = GdataAtom.Title.empty;
    eventStatus = "";
    originalEvent = GdataCalendar.OriginalEvent.empty;
    transparency = "";
    visibility = "";
    _when = [];
    extensions = []
  }

  let to_xml_data_model entry =
    GdataAtom.render_element GdataAtom.ns_atom "entry"
      [GdataAtom.render_attribute GdataAtom.ns_gd "etag" entry.etag;
       GdataAtom.render_attribute GdataAtom.ns_gd "kind" entry.kind;
       GdataAtom.render_element_list GdataAtom.Author.to_xml_data_model entry.authors;
       GdataAtom.render_element_list GdataAtom.Category.to_xml_data_model entry.categories;
       GdataAtom.Content.to_xml_data_model entry.content;
       GdataAtom.render_element_list GdataAtom.Contributor.to_xml_data_model entry.contributors;
       GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.id;
       GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.published;
       GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.updated;
       GdataCalendar.Comments.render_comments entry.comments;
       GdataAtom.render_element_list GdataCalendar.Link.to_xml_data_model entry.links;
       GdataAtom.render_element_list GdataCalendar.Where.to_xml_data_model entry.where;
       GdataAtom.render_element_list GdataCalendar.Who.to_xml_data_model entry.who;
       GdataAtom.render_value GdataAtom.ns_gd "uid" entry.icalUID;
       GdataAtom.render_int_value GdataAtom.ns_gd "sequence" entry.sequenceNumber;
       GdataAtom.Title.to_xml_data_model entry.title;
       GdataAtom.render_value GdataAtom.ns_gd "eventStatus" entry.eventStatus;
       GdataCalendar.OriginalEvent.to_xml_data_model entry.originalEvent;
       GdataAtom.render_value GdataAtom.ns_gd "transparency" entry.transparency;
       GdataAtom.render_value GdataAtom.ns_gd "visibility" entry.visibility;
       GdataAtom.render_element_list GdataCalendar.When.to_xml_data_model entry._when;
       entry.extensions]

  let of_xml_data_model entry tree =
    match tree with
        GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "etag"; `Namespace ns],
           v) when ns = GdataAtom.ns_gd ->
          { entry with etag = v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "kind"; `Namespace ns],
           v) when ns = GdataAtom.ns_gd ->
          { entry with kind = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "author"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Author.of_xml_data_model
            GdataAtom.Author.empty
            (fun author -> { entry with authors =
                               author :: entry.authors })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Category.of_xml_data_model
            GdataAtom.Category.empty
            (fun category ->
               { entry with categories = category :: entry.categories })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "content"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Content.of_xml_data_model
            GdataAtom.Content.empty
            (fun content -> { entry with content = content })
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
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with id = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "published"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with published = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "updated"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with updated = GdataDate.of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "comments"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.Comments.parse_comments
            GdataCalendar.Comments.empty_comments
            (fun comments -> { entry with comments = comments })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "link"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataCalendar.Link.of_xml_data_model
            GdataCalendar.Link.empty
            (fun link -> { entry with links = link :: entry.links })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "where"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.Where.of_xml_data_model
            GdataCalendar.Where.empty
            (fun where -> { entry with where = where :: entry.where })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "who"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.Who.of_xml_data_model
            GdataCalendar.Who.empty
            (fun who -> { entry with who = who :: entry.who })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "uid"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with icalUID = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "sequence"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with sequenceNumber = int_of_string v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Title.of_xml_data_model
            GdataAtom.Title.empty
            (fun title -> { entry with title = title })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "eventStatus"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataAtom.ns_gd ->
          { entry with eventStatus = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "originalEvent"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.OriginalEvent.of_xml_data_model
            GdataCalendar.OriginalEvent.empty
            (fun event -> { entry with originalEvent = event })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "transparency"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataAtom.ns_gd ->
          { entry with transparency = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "visibility"; `Namespace ns],
           [GdataCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataAtom.ns_gd ->
          { entry with visibility = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "when"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.When.of_xml_data_model
            GdataCalendar.When.empty
            (fun cwhen -> { entry with _when = cwhen :: entry._when })
            cs
      | extension ->
          let extensions = extension :: entry.extensions in
            { entry with extensions = extensions }

end

module RecurrenceException =
struct
  type t = {
    cre_specialized : bool;
    cre_entry : RecurrenceExceptionEntry.t
  }

  let empty = {
    cre_specialized = false;
    cre_entry = RecurrenceExceptionEntry.empty
  }

  let to_xml_data_model ex =
    let render_recurrenceExceptionEntryLink entry =
      GdataAtom.render_element GdataAtom.ns_gd "entryLink"
        [RecurrenceExceptionEntry.to_xml_data_model entry]
    in
      GdataAtom.render_element GdataAtom.ns_gd "recurrenceException"
        [GdataAtom.render_bool_attribute "" "specialized" ex.cre_specialized;
         render_recurrenceExceptionEntryLink ex.cre_entry]

  let of_xml_data_model ex tree =
    let parse_recurrenceExceptionEntryLink entry tree =
      match tree with
          GdataCore.AnnotatedTree.Node
            ([`Element; `Name "entry"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              RecurrenceExceptionEntry.of_xml_data_model
              RecurrenceExceptionEntry.empty
              Std.identity
              cs
        | e ->
            GdataUtils.unexpected e
    in
      match tree with
          GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "specialized"; `Namespace ns],
             v) when ns = "" ->
            { ex with cre_specialized = bool_of_string v }
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "entryLink"; `Namespace ns],
             cs) when ns = GdataAtom.ns_gd ->
            GdataAtom.parse_children
              parse_recurrenceExceptionEntryLink
              RecurrenceExceptionEntry.empty
              (fun entry -> { ex with cre_entry = entry })
              cs
        | e ->
            GdataUtils.unexpected e

end

type calendar_calendarEventEntry = {
  cee_etag : string;
  cee_kind : string;
  cee_authors : GdataAtom.Author.t list;
  cee_content : GdataAtom.Content.t;
  cee_contributors : GdataAtom.Contributor.t list;
  cee_id : GdataAtom.atom_id;
  cee_published : GdataAtom.atom_published;
  cee_updated : GdataAtom.atom_updated;
  cee_edited : GdataAtom.app_edited;
  cee_comments : GdataCalendar.Comments.comments;
  cee_extendedProperties : GdataCalendar.ExtendedProperty.t list;
  cee_links : GdataCalendar.Link.t list;
  cee_recurrenceExceptions : RecurrenceException.t list;
  cee_where : GdataCalendar.Where.t list;
  cee_who : GdataCalendar.Who.t list;
  cee_icalUID : GdataCalendar.calendar_icalUIDProperty;
  cee_privateCopy : GdataCalendar.calendar_privateCopyProperty;
  cee_quickAdd : GdataCalendar.calendar_quickAddProperty;
  cee_sendEventNotifications : GdataCalendar.calendar_sendEventNotificationsProperty;
  cee_sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
  cee_syncEvent : GdataCalendar.calendar_syncEventProperty;
  cee_summary : GdataAtom.Summary.t;
  cee_title : GdataAtom.Title.t;
  cee_categories : GdataAtom.Category.t list;
  cee_eventStatus : GdataCalendar.gdata_eventStatus;
  cee_originalEvent : GdataCalendar.OriginalEvent.t;
  cee_recurrence : GdataCalendar.gdata_recurrence;
  cee_reminders : GdataCalendar.Reminder.t list;
  cee_transparency : GdataCalendar.gdata_transparency;
  cee_visibility : GdataCalendar.gdata_visibility;
  cee_when : GdataCalendar.When.t list;
  cee_anyoneCanAddSelf : bool;
  cee_guestsCanInviteOthers : bool;
  cee_guestsCanModify : bool;
  cee_guestsCanSeeGuests : bool;
  cee_extensions : GdataCore.xml_data_model list
}

let empty_eventEntry = {
  cee_etag = "";
  cee_kind = "";
  cee_authors = [];
  cee_content = GdataAtom.Content.empty;
  cee_contributors = [];
  cee_id = "";
  cee_published = GdataDate.epoch;
  cee_updated = GdataDate.epoch;
  cee_edited = GdataDate.epoch;
  cee_comments = GdataCalendar.Comments.empty_comments;
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
  cee_summary = GdataAtom.Summary.empty;
  cee_title = GdataAtom.Title.empty;
  cee_categories = [];
  cee_eventStatus = "";
  cee_originalEvent = GdataCalendar.OriginalEvent.empty;
  cee_recurrence = "";
  cee_reminders = [];
  cee_transparency = "";
  cee_visibility = "";
  cee_when = [];
  cee_anyoneCanAddSelf = false;
  cee_guestsCanInviteOthers = false;
  cee_guestsCanModify = false;
  cee_guestsCanSeeGuests = false;
  cee_extensions = []
}
(* END Calendar event data types *)


(* Calendar event feed: parsing *)
let parse_entry entry tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         v) when ns = GdataAtom.ns_gd ->
        { entry with cee_etag = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "kind"; `Namespace ns],
         v) when ns = GdataAtom.ns_gd ->
        { entry with cee_kind = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Author.of_xml_data_model
          GdataAtom.Author.empty
          (fun author -> { entry with cee_authors =
                             author :: entry.cee_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "content"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Content.of_xml_data_model
          GdataAtom.Content.empty
          (fun content -> { entry with cee_content = content })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Contributor.of_xml_data_model
          GdataAtom.Contributor.empty
          (fun contributor -> { entry with cee_contributors =
                                  contributor :: entry.cee_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], v)]) when ns = GdataAtom.ns_atom ->
        { entry with cee_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "published"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], v)]) when ns = GdataAtom.ns_atom ->
        { entry with cee_published = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], v)]) when ns = GdataAtom.ns_atom ->
        { entry with cee_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "edited"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], v)]) when ns = GdataAtom.ns_app ->
        { entry with cee_edited = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "comments"; `Namespace ns],
         cs) when ns = GdataAtom.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.Comments.parse_comments
          GdataCalendar.Comments.empty_comments
          (fun comments -> { entry with cee_comments = comments })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "extendedProperty"; `Namespace ns],
         cs) when ns = GdataAtom.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.ExtendedProperty.of_xml_data_model
          GdataCalendar.ExtendedProperty.empty
          (fun property ->
             { entry with cee_extendedProperties =
                 property :: entry.cee_extendedProperties })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataCalendar.Link.of_xml_data_model
          GdataCalendar.Link.empty
          (fun link -> { entry with cee_links = link :: entry.cee_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "recurrenceException"; `Namespace ns],
         cs) when ns = GdataAtom.ns_gd ->
        GdataAtom.parse_children
          RecurrenceException.of_xml_data_model
          RecurrenceException.empty
          (fun ex ->
             { entry with cee_recurrenceExceptions =
                 ex :: entry.cee_recurrenceExceptions })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "where"; `Namespace ns],
         cs) when ns = GdataAtom.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.Where.of_xml_data_model
          GdataCalendar.Where.empty
          (fun where -> { entry with cee_where = where :: entry.cee_where })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "who"; `Namespace ns],
         cs) when ns = GdataAtom.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.Who.of_xml_data_model
          GdataCalendar.Who.empty
          (fun who -> { entry with cee_who = who :: entry.cee_who })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "uid"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_icalUID = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "privateCopy"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_privateCopy = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "quickadd"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_quickAdd = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "sequence"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_sequenceNumber = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "summary"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Summary.of_xml_data_model
          GdataAtom.Summary.empty
          (fun summary -> { entry with cee_summary = summary })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Title.of_xml_data_model
          GdataAtom.Title.empty
          (fun title -> { entry with cee_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.Category.of_xml_data_model
          GdataAtom.Category.empty
          (fun category -> { entry with cee_categories = category :: entry.cee_categories })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "eventStatus"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataAtom.ns_gd ->
        { entry with cee_eventStatus = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "originalEvent"; `Namespace ns],
         cs) when ns = GdataAtom.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.OriginalEvent.of_xml_data_model
          GdataCalendar.OriginalEvent.empty
          (fun event -> { entry with cee_originalEvent = event })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "recurrence"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataAtom.ns_gd ->
        { entry with cee_recurrence = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "reminder"; `Namespace ns],
         cs) when ns = GdataAtom.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.Reminder.of_xml_data_model
          GdataCalendar.Reminder.empty
          (fun reminder -> { entry with cee_reminders = reminder :: entry.cee_reminders })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "transparency"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataAtom.ns_gd ->
        { entry with cee_transparency = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "visibility"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataAtom.ns_gd ->
        { entry with cee_visibility = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "when"; `Namespace ns],
         cs) when ns = GdataAtom.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.When.of_xml_data_model
          GdataCalendar.When.empty
          (fun cwhen -> { entry with cee_when = cwhen :: entry.cee_when })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "anyoneCanAddSelf"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_anyoneCanAddSelf = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "guestsCanInviteOthers"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_guestsCanInviteOthers = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "guestsCanModify"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_guestsCanModify = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "guestsCanSeeGuests"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_guestsCanSeeGuests = bool_of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name _; `Namespace ns],
         _) when ns = Xmlm.ns_xmlns ->
        entry
    | extension ->
        let extensions = extension :: entry.cee_extensions in
          { entry with cee_extensions = extensions }

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
      | e ->
          GdataUtils.unexpected e
  in
    parse_root tree
(* END Calendar event feed: parsing *)


(* Calendar event feed: rendering *)
let render_entry entry =
  (* TODO: better namespace handling *)
  GdataAtom.render_element GdataAtom.ns_atom "entry"
    [GdataAtom.render_attribute GdataAtom.ns_gd "etag" entry.cee_etag;
     GdataAtom.render_attribute GdataAtom.ns_gd "kind" entry.cee_kind;
     GdataAtom.render_element_list GdataAtom.Author.to_xml_data_model entry.cee_authors;
     GdataAtom.Content.to_xml_data_model entry.cee_content;
     GdataAtom.render_element_list GdataAtom.Contributor.to_xml_data_model entry.cee_contributors;
     GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.cee_id;
     GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.cee_published;
     GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.cee_updated;
     GdataAtom.render_date_element GdataAtom.ns_app "edited" entry.cee_edited;
     GdataCalendar.Comments.render_comments entry.cee_comments;
     GdataAtom.render_element_list GdataCalendar.ExtendedProperty.to_xml_data_model entry.cee_extendedProperties;
     GdataAtom.render_element_list GdataCalendar.Link.to_xml_data_model entry.cee_links;
     GdataAtom.render_element_list RecurrenceException.to_xml_data_model entry.cee_recurrenceExceptions;
     GdataAtom.render_element_list GdataCalendar.Where.to_xml_data_model entry.cee_where;
     GdataAtom.render_element_list GdataCalendar.Who.to_xml_data_model entry.cee_who;
     GdataAtom.render_value GdataAtom.ns_gd "uid" entry.cee_icalUID;
     GdataAtom.render_bool_value GdataCalendar.ns_gCal "privateCopy" entry.cee_privateCopy;
     GdataAtom.render_bool_value GdataCalendar.ns_gCal "quickadd" entry.cee_quickAdd;
     GdataAtom.render_int_value GdataAtom.ns_gd "sequence" entry.cee_sequenceNumber;
     GdataAtom.Summary.to_xml_data_model entry.cee_summary;
     GdataAtom.Title.to_xml_data_model entry.cee_title;
     GdataAtom.render_element_list GdataAtom.Category.to_xml_data_model entry.cee_categories;
     GdataAtom.render_value GdataAtom.ns_gd "eventStatus" entry.cee_eventStatus;
     GdataCalendar.OriginalEvent.to_xml_data_model entry.cee_originalEvent;
     GdataAtom.render_text_element GdataAtom.ns_gd "recurrence" entry.cee_recurrence;
     GdataAtom.render_element_list GdataCalendar.Reminder.to_xml_data_model entry.cee_reminders;
     GdataAtom.render_value GdataAtom.ns_gd "transparency" entry.cee_transparency;
     GdataAtom.render_value GdataAtom.ns_gd "visibility" entry.cee_visibility;
     GdataAtom.render_element_list GdataCalendar.When.to_xml_data_model entry.cee_when;
     GdataAtom.render_bool_value GdataCalendar.ns_gCal "anyoneCanAddSelf" entry.cee_anyoneCanAddSelf;
     GdataAtom.render_bool_value GdataCalendar.ns_gCal "guestsCanInviteOthers" entry.cee_guestsCanInviteOthers;
     GdataAtom.render_bool_value GdataCalendar.ns_gCal "guestsCanModify" entry.cee_guestsCanModify;
     GdataAtom.render_bool_value GdataCalendar.ns_gCal "guestsCanSeeGuests" entry.cee_guestsCanSeeGuests;
     entry.cee_extensions]

let calendar_event_entry_to_data_model entry =
  GdataAtom.element_to_data_model
    GdataCalendar.get_calendar_prefix
    render_entry 
    entry
(* END Calendar event feed: rendering *)

module Entry =
struct
  type t = calendar_calendarEventEntry

  let empty = empty_eventEntry

  let to_xml_data_model = render_entry

  let of_xml_data_model = parse_entry

end

module Feed = GdataAtom.MakeFeed(Entry)(GdataCalendar.Link)

