open GapiUtils.Op

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
    comments : GdataCalendar.Comments.t;
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
    comments = GdataCalendar.Comments.empty;
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
       GdataCalendar.Comments.to_xml_data_model entry.comments;
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
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "etag"; `Namespace ns],
           v) when ns = GdataAtom.ns_gd ->
          { entry with etag = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "kind"; `Namespace ns],
           v) when ns = GdataAtom.ns_gd ->
          { entry with kind = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "author"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Author.of_xml_data_model
            GdataAtom.Author.empty
            (fun author -> { entry with authors =
                               author :: entry.authors })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Category.of_xml_data_model
            GdataAtom.Category.empty
            (fun category ->
               { entry with categories = category :: entry.categories })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "content"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Content.of_xml_data_model
            GdataAtom.Content.empty
            (fun content -> { entry with content = content })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "contributor"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Contributor.of_xml_data_model
            GdataAtom.Contributor.empty
            (fun contributor -> { entry with contributors =
                                    contributor :: entry.contributors })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "id"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with id = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "published"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with published = GdataDate.of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "updated"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with updated = GdataDate.of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "comments"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.Comments.of_xml_data_model
            GdataCalendar.Comments.empty
            (fun comments -> { entry with comments = comments })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "link"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataCalendar.Link.of_xml_data_model
            GdataCalendar.Link.empty
            (fun link -> { entry with links = link :: entry.links })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "where"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.Where.of_xml_data_model
            GdataCalendar.Where.empty
            (fun where -> { entry with where = where :: entry.where })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "who"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.Who.of_xml_data_model
            GdataCalendar.Who.empty
            (fun who -> { entry with who = who :: entry.who })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "uid"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with icalUID = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "sequence"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with sequenceNumber = int_of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Title.of_xml_data_model
            GdataAtom.Title.empty
            (fun title -> { entry with title = title })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "eventStatus"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataAtom.ns_gd ->
          { entry with eventStatus = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "originalEvent"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.OriginalEvent.of_xml_data_model
            GdataCalendar.OriginalEvent.empty
            (fun event -> { entry with originalEvent = event })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "transparency"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataAtom.ns_gd ->
          { entry with transparency = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "visibility"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataAtom.ns_gd ->
          { entry with visibility = v }
      | GapiCore.AnnotatedTree.Node
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
    specialized : bool;
    entry : RecurrenceExceptionEntry.t
  }

  let empty = {
    specialized = false;
    entry = RecurrenceExceptionEntry.empty
  }

  let to_xml_data_model ex =
    let render_recurrenceExceptionEntryLink entry =
      GdataAtom.render_element GdataAtom.ns_gd "entryLink"
        [RecurrenceExceptionEntry.to_xml_data_model entry]
    in
      GdataAtom.render_element GdataAtom.ns_gd "recurrenceException"
        [GdataAtom.render_bool_attribute "" "specialized" ex.specialized;
         render_recurrenceExceptionEntryLink ex.entry]

  let of_xml_data_model ex tree =
    let parse_recurrenceExceptionEntryLink entry tree =
      match tree with
          GapiCore.AnnotatedTree.Node
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
          GapiCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "specialized"; `Namespace ns],
             v) when ns = "" ->
            { ex with specialized = bool_of_string v }
        | GapiCore.AnnotatedTree.Node
            ([`Element; `Name "entryLink"; `Namespace ns],
             cs) when ns = GdataAtom.ns_gd ->
            GdataAtom.parse_children
              parse_recurrenceExceptionEntryLink
              RecurrenceExceptionEntry.empty
              (fun entry -> { ex with entry = entry })
              cs
        | e ->
            GdataUtils.unexpected e

end

module Entry =
struct
  type t = {
    etag : string;
    kind : string;
    batch_id : string;
    batch_operation : GdataBatch.Operation.t;
    batch_status : GdataBatch.Status.t;
    authors : GdataAtom.Author.t list;
    content : GdataAtom.Content.t;
    contributors : GdataAtom.Contributor.t list;
    id : GdataAtom.atom_id;
    published : GdataAtom.atom_published;
    updated : GdataAtom.atom_updated;
    edited : GdataAtom.app_edited;
    comments : GdataCalendar.Comments.t;
    extendedProperties : GdataCalendar.ExtendedProperty.t list;
    links : GdataCalendar.Link.t list;
    recurrenceExceptions : RecurrenceException.t list;
    where : GdataCalendar.Where.t list;
    who : GdataCalendar.Who.t list;
    icalUID : GdataCalendar.calendar_icalUIDProperty;
    privateCopy : GdataCalendar.calendar_privateCopyProperty;
    quickAdd : GdataCalendar.calendar_quickAddProperty;
    sendEventNotifications : GdataCalendar.calendar_sendEventNotificationsProperty;
    sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
    syncEvent : GdataCalendar.calendar_syncEventProperty;
    summary : GdataAtom.Summary.t;
    title : GdataAtom.Title.t;
    categories : GdataAtom.Category.t list;
    eventStatus : GdataCalendar.gdata_eventStatus;
    originalEvent : GdataCalendar.OriginalEvent.t;
    recurrence : GdataCalendar.gdata_recurrence;
    reminders : GdataCalendar.Reminder.t list;
    transparency : GdataCalendar.gdata_transparency;
    visibility : GdataCalendar.gdata_visibility;
    _when : GdataCalendar.When.t list;
    anyoneCanAddSelf : bool;
    guestsCanInviteOthers : bool;
    guestsCanModify : bool;
    guestsCanSeeGuests : bool;
    extensions : GdataCore.xml_data_model list
  }

  let empty = {
    etag = "";
    kind = "";
    batch_id = "";
    batch_operation = GdataBatch.Operation.None;
    batch_status = GdataBatch.Status.empty;
    authors = [];
    content = GdataAtom.Content.empty;
    contributors = [];
    id = "";
    published = GdataDate.epoch;
    updated = GdataDate.epoch;
    edited = GdataDate.epoch;
    comments = GdataCalendar.Comments.empty;
    extendedProperties = [];
    links = [];
    recurrenceExceptions = [];
    where = [];
    who = [];
    icalUID = "";
    privateCopy = false;
    quickAdd = false;
    sendEventNotifications = false;
    sequenceNumber = 0;
    syncEvent = false;
    summary = GdataAtom.Summary.empty;
    title = GdataAtom.Title.empty;
    categories = [];
    eventStatus = "";
    originalEvent = GdataCalendar.OriginalEvent.empty;
    recurrence = "";
    reminders = [];
    transparency = "";
    visibility = "";
    _when = [];
    anyoneCanAddSelf = false;
    guestsCanInviteOthers = false;
    guestsCanModify = false;
    guestsCanSeeGuests = false;
    extensions = []
  }

  let to_xml_data_model entry =
    GdataAtom.render_element GdataAtom.ns_atom "entry"
      [GdataAtom.render_attribute GdataAtom.ns_gd "etag" entry.etag;
       GdataAtom.render_attribute GdataAtom.ns_gd "kind" entry.kind;
       GdataAtom.render_text_element GdataAtom.ns_batch "id" entry.batch_id;
       GdataAtom.render_text_element GdataAtom.ns_batch "operation" (GdataBatch.Operation.to_string entry.batch_operation);
       GdataBatch.Status.to_xml_data_model entry.batch_status;
       GdataAtom.render_element_list GdataAtom.Author.to_xml_data_model entry.authors;
       GdataAtom.Content.to_xml_data_model entry.content;
       GdataAtom.render_element_list GdataAtom.Contributor.to_xml_data_model entry.contributors;
       GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.id;
       GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.published;
       GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.updated;
       GdataAtom.render_date_element GdataAtom.ns_app "edited" entry.edited;
       GdataCalendar.Comments.to_xml_data_model entry.comments;
       GdataAtom.render_element_list GdataCalendar.ExtendedProperty.to_xml_data_model entry.extendedProperties;
       GdataAtom.render_element_list GdataCalendar.Link.to_xml_data_model entry.links;
       GdataAtom.render_element_list RecurrenceException.to_xml_data_model entry.recurrenceExceptions;
       GdataAtom.render_element_list GdataCalendar.Where.to_xml_data_model entry.where;
       GdataAtom.render_element_list GdataCalendar.Who.to_xml_data_model entry.who;
       GdataAtom.render_value GdataAtom.ns_gd "uid" entry.icalUID;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "privateCopy" entry.privateCopy;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "quickadd" entry.quickAdd;
       GdataAtom.render_int_value GdataAtom.ns_gd "sequence" entry.sequenceNumber;
       GdataAtom.Summary.to_xml_data_model entry.summary;
       GdataAtom.Title.to_xml_data_model entry.title;
       GdataAtom.render_element_list GdataAtom.Category.to_xml_data_model entry.categories;
       GdataAtom.render_value GdataAtom.ns_gd "eventStatus" entry.eventStatus;
       GdataCalendar.OriginalEvent.to_xml_data_model entry.originalEvent;
       GdataAtom.render_text_element GdataAtom.ns_gd "recurrence" entry.recurrence;
       GdataAtom.render_element_list GdataCalendar.Reminder.to_xml_data_model entry.reminders;
       GdataAtom.render_value GdataAtom.ns_gd "transparency" entry.transparency;
       GdataAtom.render_value GdataAtom.ns_gd "visibility" entry.visibility;
       GdataAtom.render_element_list GdataCalendar.When.to_xml_data_model entry._when;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "anyoneCanAddSelf" entry.anyoneCanAddSelf;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "guestsCanInviteOthers" entry.guestsCanInviteOthers;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "guestsCanModify" entry.guestsCanModify;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "guestsCanSeeGuests" entry.guestsCanSeeGuests;
       entry.extensions]

  let of_xml_data_model entry tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "etag"; `Namespace ns],
           v) when ns = GdataAtom.ns_gd ->
          { entry with etag = v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "kind"; `Namespace ns],
           v) when ns = GdataAtom.ns_gd ->
          { entry with kind = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "id"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_batch ->
          { entry with batch_id = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "operation"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_batch ->
          { entry with batch_operation = GdataBatch.Operation.of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "status"; `Namespace ns],
           cs) when ns = GdataAtom.ns_batch ->
          GdataAtom.parse_children
            GdataBatch.Status.of_xml_data_model
            GdataBatch.Status.empty
            (fun status -> { entry with batch_status = status })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "author"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Author.of_xml_data_model
            GdataAtom.Author.empty
            (fun author -> { entry with authors =
                               author :: entry.authors })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "content"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Content.of_xml_data_model
            GdataAtom.Content.empty
            (fun content -> { entry with content = content })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "contributor"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Contributor.of_xml_data_model
            GdataAtom.Contributor.empty
            (fun contributor -> { entry with contributors =
                                    contributor :: entry.contributors })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "id"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with id = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "published"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with published = GdataDate.of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "updated"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_atom ->
          { entry with updated = GdataDate.of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "edited"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Text], v)]) when ns = GdataAtom.ns_app ->
          { entry with edited = GdataDate.of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "comments"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.Comments.of_xml_data_model
            GdataCalendar.Comments.empty
            (fun comments -> { entry with comments = comments })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "extendedProperty"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.ExtendedProperty.of_xml_data_model
            GdataCalendar.ExtendedProperty.empty
            (fun property ->
               { entry with extendedProperties =
                   property :: entry.extendedProperties })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "link"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataCalendar.Link.of_xml_data_model
            GdataCalendar.Link.empty
            (fun link -> { entry with links = link :: entry.links })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "recurrenceException"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            RecurrenceException.of_xml_data_model
            RecurrenceException.empty
            (fun ex ->
               { entry with recurrenceExceptions =
                   ex :: entry.recurrenceExceptions })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "where"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.Where.of_xml_data_model
            GdataCalendar.Where.empty
            (fun where -> { entry with where = where :: entry.where })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "who"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.Who.of_xml_data_model
            GdataCalendar.Who.empty
            (fun who -> { entry with who = who :: entry.who })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "uid"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with icalUID = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "privateCopy"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with privateCopy = bool_of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "quickadd"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with quickAdd = bool_of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "sequence"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with sequenceNumber = int_of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "summary"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Summary.of_xml_data_model
            GdataAtom.Summary.empty
            (fun summary -> { entry with summary = summary })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Title.of_xml_data_model
            GdataAtom.Title.empty
            (fun title -> { entry with title = title })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.Category.of_xml_data_model
            GdataAtom.Category.empty
            (fun category -> { entry with categories = category :: entry.categories })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "eventStatus"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataAtom.ns_gd ->
          { entry with eventStatus = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "originalEvent"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.OriginalEvent.of_xml_data_model
            GdataCalendar.OriginalEvent.empty
            (fun event -> { entry with originalEvent = event })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "recurrence"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataAtom.ns_gd ->
          { entry with recurrence = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "reminder"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.Reminder.of_xml_data_model
            GdataCalendar.Reminder.empty
            (fun reminder -> { entry with reminders = reminder :: entry.reminders })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "transparency"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataAtom.ns_gd ->
          { entry with transparency = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "visibility"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataAtom.ns_gd ->
          { entry with visibility = v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "when"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            GdataCalendar.When.of_xml_data_model
            GdataCalendar.When.empty
            (fun cwhen -> { entry with _when = cwhen :: entry._when })
            cs
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "anyoneCanAddSelf"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with anyoneCanAddSelf = bool_of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "guestsCanInviteOthers"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with guestsCanInviteOthers = bool_of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "guestsCanModify"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with guestsCanModify = bool_of_string v }
      | GapiCore.AnnotatedTree.Node
          ([`Element; `Name "guestsCanSeeGuests"; `Namespace ns],
           [GapiCore.AnnotatedTree.Leaf
              ([`Attribute; `Name "value"; `Namespace ""],
               v)]) when ns = GdataCalendar.ns_gCal ->
          { entry with guestsCanSeeGuests = bool_of_string v }
      | GapiCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          entry
      | extension ->
          let extensions = extension :: entry.extensions in
            { entry with extensions = extensions }

end

module Feed = GdataAtom.MakeFeed(Entry)(GdataCalendar.Link)
(* END Calendar event data types *)


(* Calendar event feed: parsing *)
let parse_calendar_event_entry =
  GdataAtom.data_model_to_entry
    Entry.of_xml_data_model
    Entry.empty
(* END Calendar event feed: parsing *)


(* Calendar event feed: rendering *)
let calendar_event_entry_to_data_model =
  GdataAtom.element_to_data_model
    GdataCalendar.get_calendar_prefix
    Entry.to_xml_data_model 

let calendar_event_feed_to_data_model =
  GdataAtom.element_to_data_model
    GdataCalendar.get_calendar_prefix
    Feed.to_xml_data_model 
(* END Calendar event feed: rendering *)

