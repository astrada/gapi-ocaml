open OUnit

type json_data_type =
    Object
  | Array
  | Scalar

let json_data_type_to_string = function
    Object -> "Object"
  | Array -> "Array"
  | Scalar -> "Scalar"

type json_metadata =
    { name : string;
      data_type : json_data_type;
    }

let metadata_description { name = n; data_type = dt } =
  Printf.sprintf "name=%s data_type=%s" n (json_data_type_to_string dt)

type json_data_model = (json_metadata, Json_type.t) GapiCore.AnnotatedTree.t

let unexpected r e =
  match e with
      GapiCore.AnnotatedTree.Leaf (metadata, _) ->
        failwith ("Unexpected leaf: "
                  ^ (metadata_description metadata)
                  ^ " in " ^ r)
    | GapiCore.AnnotatedTree.Node (metadata, _) ->
        failwith ("Unexpected node: "
                  ^ (metadata_description metadata)
                  ^ " in " ^ r)

let render_value name default value =
  if value <> default then
    [GapiCore.AnnotatedTree.Leaf (
      { name = name; data_type = Scalar },
      value)]
  else
    []

let render_string_value ?(default = "") name value =
  render_value name (Json_type.String default) (Json_type.String value)

let render_int_value ?(default = 0) name value =
  render_value name (Json_type.Int default) (Json_type.Int value)

let render_bool_value ?(default = false) name value =
  render_value name (Json_type.Bool default) (Json_type.Bool value)

let render_struct name data_type xs =
  let xs' = List.concat xs in
    if xs' <> [] then
      [GapiCore.AnnotatedTree.Node (
        { name = name; data_type = data_type },
        xs')]
    else
      []

let render_object name xs =
  render_struct name Object xs

let render_array name render xs =
  let xs' = List.map render xs in
    render_struct name Array xs'

let parse_children parse_child empty_element update cs =
  let element = List.fold_left
                  parse_child
                  empty_element
                  cs
  in
    update element

let parse_array parse_child empty_element update cs =
  let xs = List.fold_right
                  (fun x xs' -> parse_child empty_element x :: xs')
                  cs
                  []
  in
    update xs


module Reminder =
struct
  type t = {
    _method : string;
    minutes : int
  }

  let empty = {
    _method = "";
    minutes = 0
  }

  let to_data_model x =
    render_object ""
      [render_string_value "method" x._method;
       render_int_value "minutes" x.minutes]

  let rec of_data_model x tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ({ name = "method"; data_type = Scalar },
           Json_type.String v) ->
          { x with _method = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "minutes"; data_type = Scalar },
           Json_type.Int v) ->
          { x with minutes = v }
      | GapiCore.AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            of_data_model
            empty
            (fun x -> x)
            cs
      | e ->
          unexpected "Reminder.of_data_model" e

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

  let to_data_model x =
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
       render_array "defaultReminders" Reminder.to_data_model x.defaultReminders]

  let rec of_data_model x tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "etag"; data_type = Scalar },
           Json_type.String v) ->
          { x with etag = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "summary"; data_type = Scalar },
           Json_type.String v) ->
          { x with summary = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "description"; data_type = Scalar },
           Json_type.String v) ->
          { x with description = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "location"; data_type = Scalar },
           Json_type.String v) ->
          { x with location = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "timeZone"; data_type = Scalar },
           Json_type.String v) ->
          { x with timeZone = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "summaryOverride"; data_type = Scalar },
           Json_type.String v) ->
          { x with summaryOverride = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "colorId"; data_type = Scalar },
           Json_type.String v) ->
          { x with colorId = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "hidden"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with hidden = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "selected"; data_type = Scalar },
           Json_type.Bool v) ->
          { x with selected = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "accessRole"; data_type = Scalar },
           Json_type.String v) ->
          { x with accessRole = v }
      | GapiCore.AnnotatedTree.Node
          ({ name = "defaultReminders"; data_type = Array },
           cs) ->
          parse_array
            Reminder.of_data_model
            Reminder.empty
            (fun xs -> { x with defaultReminders = xs })
            cs
      | GapiCore.AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            of_data_model
            empty
            (fun x -> x)
            cs
      | e ->
          unexpected "CalendarListResource.of_data_model" e

end

module CalendarListList =
struct
  type t = {
    kind : string;
    etag : string;
    nextPageToken : string;
    items : CalendarListResource.t list
  }

  let empty = {
    kind = "";
    etag = "";
    nextPageToken = "";
    items = []
  }

  let to_data_model x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "etag" x.etag;
       render_string_value "nextPageToken" x.nextPageToken;
       render_array "items" CalendarListResource.to_data_model x.items]

  let of_data_model x tree =
    match tree with
        GapiCore.AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "etag"; data_type = Scalar },
           Json_type.String v) ->
          { x with etag = v }
      | GapiCore.AnnotatedTree.Leaf
          ({ name = "nextPageToken"; data_type = Scalar },
           Json_type.String v) ->
          { x with nextPageToken = v }
      | GapiCore.AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_array
            CalendarListResource.of_data_model
            CalendarListResource.empty
            (fun xs -> { x with items = xs })
            cs
      | e ->
          unexpected "CalendarListList.of_data_model" e

  let parse tree =
    match tree with
        GapiCore.AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            of_data_model
            empty
            (fun x -> x)
            cs
      | e ->
          unexpected "CalendarListList.parse" e

end

let json_tree_to_string tree =
  let join _ = String.concat "," in
    GapiCore.AnnotatedTree.fold
      (fun m xs ->
         match m.data_type with
             Object ->
               Printf.sprintf "%a{%a}"
                 (fun _ n -> if n <> "" then "\"" ^ n ^ "\":" else "") m.name
                 join xs
           | Array ->
               Printf.sprintf "\"%s\":[%a]" m.name join xs
           | _ -> assert false)
      (fun m value ->
         let s = Json_type.Browse.describe value in
           Printf.sprintf "\"%s\":%s" m.name s)
      tree

let json_to_data_model json_value =
  let rec map (name, value) =
    match value with
        Json_type.Object xs ->
          GapiCore.AnnotatedTree.Node (
            { name = name;
              data_type = Object },
            List.map map xs)
      | Json_type.Array xs ->
          GapiCore.AnnotatedTree.Node (
            { name = name;
              data_type = Array
            },
            List.map (fun x -> map ("", x)) xs)
      | _ ->
          GapiCore.AnnotatedTree.Leaf (
            { name = name;
              data_type = Scalar
            },
            value)
  in
    map ("", json_value)

let test_list () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (response, session) =
         GapiService.query
           "https://www.googleapis.com/calendar/v3/users/me/calendarList"
           GapiConversation.read_all
           session
       in
         TestHelper.assert_not_empty
           "Response should not be empty"
           response;
         TestHelper.assert_not_empty
           "ETag should not be empty"
           session.GapiConversation.Session.etag)

let test_parse_list () =
  let calendar_list_json =
    Json_io.load_json "test/data/test_calendar_list.json" in
  let tree = json_to_data_model calendar_list_json in
  let calendarListList = CalendarListList.parse tree in
  let tree' = List.hd (CalendarListList.to_data_model calendarListList) in
    assert_equal
      ~printer:json_tree_to_string
      tree
      tree'

let suite = "Calendar List (v3) test" >:::
  [(*"test_list" >:: test_list;*)
   "test_parse_list" >:: test_parse_list
  ]

