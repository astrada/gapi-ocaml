open GapiUtils.Infix
open GapiCore
open GapiJson

(* Tasks *)

module Task =
struct
  type t = {
    kind : string;
    id : string;
    etag : string;
    title : string;
    updated : GapiDate.t;
    selfLink : string;
    parent : string;
    position : string;
    notes : string;
    status : string;
    due : GapiDate.t;
    completed : string;
    deleted : string;
    hidden : string
  }

	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let etag = {
		GapiLens.get = (fun x -> x.etag);
		GapiLens.set = (fun v x -> { x with etag = v })
	}
	let title = {
		GapiLens.get = (fun x -> x.title);
		GapiLens.set = (fun v x -> { x with title = v })
	}
	let updated = {
		GapiLens.get = (fun x -> x.updated);
		GapiLens.set = (fun v x -> { x with updated = v })
	}
	let selfLink = {
		GapiLens.get = (fun x -> x.selfLink);
		GapiLens.set = (fun v x -> { x with selfLink = v })
	}
	let parent = {
		GapiLens.get = (fun x -> x.parent);
		GapiLens.set = (fun v x -> { x with parent = v })
	}
	let position = {
		GapiLens.get = (fun x -> x.position);
		GapiLens.set = (fun v x -> { x with position = v })
	}
	let notes = {
		GapiLens.get = (fun x -> x.notes);
		GapiLens.set = (fun v x -> { x with notes = v })
	}
	let status = {
		GapiLens.get = (fun x -> x.status);
		GapiLens.set = (fun v x -> { x with status = v })
	}
	let due = {
		GapiLens.get = (fun x -> x.due);
		GapiLens.set = (fun v x -> { x with due = v })
	}
	let completed = {
		GapiLens.get = (fun x -> x.completed);
		GapiLens.set = (fun v x -> { x with completed = v })
	}
	let deleted = {
		GapiLens.get = (fun x -> x.deleted);
		GapiLens.set = (fun v x -> { x with deleted = v })
	}
	let hidden = {
		GapiLens.get = (fun x -> x.hidden);
		GapiLens.set = (fun v x -> { x with hidden = v })
	}

  let empty = {
    kind = "";
    id = "";
    etag = "";
    title = "";
    updated = GapiDate.epoch;
    selfLink = "";
    parent = "";
    position = "";
    notes = "";
    status = "";
    due = GapiDate.epoch;
    completed = "";
    deleted = "";
    hidden = ""
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "id" x.id;
       render_string_value "etag" x.etag;
       render_string_value "title" x.title;
       render_date_value "updated" x.updated;
       render_string_value "selfLink" x.selfLink;
       render_string_value "parent" x.parent;
       render_string_value "position" x.position;
       render_string_value "notes" x.notes;
       render_string_value "status" x.status;
       render_date_value "due" x.due;
       render_string_value "completed" x.completed;
       render_string_value "deleted" x.deleted;
       render_string_value "hidden" x.hidden]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "etag"; data_type = Scalar },
           Json_type.String v) ->
          { x with etag = v }
      | AnnotatedTree.Leaf
          ({ name = "title"; data_type = Scalar },
           Json_type.String v) ->
          { x with title = v }
      | AnnotatedTree.Leaf
          ({ name = "updated"; data_type = Scalar },
           Json_type.String v) ->
          { x with updated = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "selfLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with selfLink = v }
      | AnnotatedTree.Leaf
          ({ name = "parent"; data_type = Scalar },
           Json_type.String v) ->
          { x with parent = v }
      | AnnotatedTree.Leaf
          ({ name = "position"; data_type = Scalar },
           Json_type.String v) ->
          { x with position = v }
      | AnnotatedTree.Leaf
          ({ name = "notes"; data_type = Scalar },
           Json_type.String v) ->
          { x with notes = v }
      | AnnotatedTree.Leaf
          ({ name = "status"; data_type = Scalar },
           Json_type.String v) ->
          { x with status = v }
      | AnnotatedTree.Leaf
          ({ name = "due"; data_type = Scalar },
           Json_type.String v) ->
          { x with due = GapiDate.of_string v }
      | AnnotatedTree.Leaf
          ({ name = "completed"; data_type = Scalar },
           Json_type.String v) ->
          { x with completed = v }
      | AnnotatedTree.Leaf
          ({ name = "deleted"; data_type = Scalar },
           Json_type.String v) ->
          { x with deleted = v }
      | AnnotatedTree.Leaf
          ({ name = "hidden"; data_type = Scalar },
           Json_type.String v) ->
          { x with hidden = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiTasks.Task.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module Tasks =
struct
  type t = {
    kind : string;
    etag : string;
    nextPageToken : string;
    items : Task.t list
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
       render_array "items" Task.render x.items]

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
          ({ name = "nextPageToken"; data_type = Scalar },
           Json_type.String v) ->
          { x with nextPageToken = v }
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_collection
            Task.parse
            Task.empty
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
          unexpected "GapiTasks.Tasks.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

(* Task lists *)

module TaskList =
struct
  type t = {
    kind : string;
    id : string;
    etag : string;
    title : string;
    selfLink : string
  }

	let kind = {
		GapiLens.get = (fun x -> x.kind);
		GapiLens.set = (fun v x -> { x with kind = v })
	}
	let id = {
		GapiLens.get = (fun x -> x.id);
		GapiLens.set = (fun v x -> { x with id = v })
	}
	let etag = {
		GapiLens.get = (fun x -> x.etag);
		GapiLens.set = (fun v x -> { x with etag = v })
	}
	let title = {
		GapiLens.get = (fun x -> x.title);
		GapiLens.set = (fun v x -> { x with title = v })
	}
	let selfLink = {
		GapiLens.get = (fun x -> x.selfLink);
		GapiLens.set = (fun v x -> { x with selfLink = v })
	}

  let empty = {
    kind = "";
    id = "";
    etag = "";
    title = "";
    selfLink = ""
  }

  let render x =
    render_object ""
      [render_string_value "kind" x.kind;
       render_string_value "id" x.id;
       render_string_value "etag" x.etag;
       render_string_value "title" x.title;
       render_string_value "selfLink" x.selfLink]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "kind"; data_type = Scalar },
           Json_type.String v) ->
          { x with kind = v }
      | AnnotatedTree.Leaf
          ({ name = "id"; data_type = Scalar },
           Json_type.String v) ->
          { x with id = v }
      | AnnotatedTree.Leaf
          ({ name = "etag"; data_type = Scalar },
           Json_type.String v) ->
          { x with etag = v }
      | AnnotatedTree.Leaf
          ({ name = "title"; data_type = Scalar },
           Json_type.String v) ->
          { x with title = v }
      | AnnotatedTree.Leaf
          ({ name = "selfLink"; data_type = Scalar },
           Json_type.String v) ->
          { x with selfLink = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Std.identity
            cs
      | e ->
          unexpected "GapiTasks.TaskList.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

module TaskLists =
struct
  type t = {
    kind : string;
    etag : string;
    nextPageToken : string;
    items : TaskList.t list
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
       render_array "items" TaskList.render x.items]

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
          ({ name = "nextPageToken"; data_type = Scalar },
           Json_type.String v) ->
          { x with nextPageToken = v }
      | AnnotatedTree.Node
          ({ name = "items"; data_type = Array },
           cs) ->
          parse_collection
            TaskList.parse
            TaskList.empty
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
          unexpected "GapiTasks.TaskLists.parse" e

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

