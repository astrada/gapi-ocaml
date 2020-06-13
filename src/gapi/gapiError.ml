open GapiCore
open GapiJson

module SingleError =
struct
  type t = {
    domain : string;
    reason : string;
    message : string;
    locationType : string;
    location : string;
    extendedHelp : string
  }

  let domain = {
    GapiLens.get = (fun x -> x.domain);
    GapiLens.set = (fun v x -> { x with domain = v })
  }
  let reason = {
    GapiLens.get = (fun x -> x.reason);
    GapiLens.set = (fun v x -> { x with reason = v })
  }
  let message = {
    GapiLens.get = (fun x -> x.message);
    GapiLens.set = (fun v x -> { x with message = v })
  }
  let locationType = {
    GapiLens.get = (fun x -> x.locationType);
    GapiLens.set = (fun v x -> { x with locationType = v })
  }
  let location = {
    GapiLens.get = (fun x -> x.location);
    GapiLens.set = (fun v x -> { x with location = v })
  }
  let extendedHelp = {
    GapiLens.get = (fun x -> x.extendedHelp);
    GapiLens.set = (fun v x -> { x with extendedHelp = v })
  }

  let empty = {
    domain = "";
    reason = "";
    message = "";
    locationType = "";
    location = "";
    extendedHelp = ""
  }

  let render x =
    render_object ""
      [render_string_value "domain" x.domain;
       render_string_value "reason" x.reason;
       render_string_value "message" x.message;
       render_string_value "locationType" x.locationType;
       render_string_value "location" x.location;
       render_string_value "extendedHelp" x.extendedHelp]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Leaf
          ({ name = "domain"; data_type = Scalar },
           `String v) ->
          { x with domain = v }
      | AnnotatedTree.Leaf
          ({ name = "reason"; data_type = Scalar },
           `String v) ->
          { x with reason = v }
      | AnnotatedTree.Leaf
          ({ name = "message"; data_type = Scalar },
           `String v) ->
          { x with message = v }
      | AnnotatedTree.Leaf
          ({ name = "message"; data_type = Scalar },
           `Null) ->
          x
      | AnnotatedTree.Leaf
          ({ name = "locationType"; data_type = Scalar },
           `String v) ->
          { x with locationType = v }
      | AnnotatedTree.Leaf
          ({ name = "location"; data_type = Scalar },
           `String v) ->
          { x with location = v }
      | AnnotatedTree.Leaf
          ({ name = "extendedHelp"; data_type = Scalar },
           `String v) ->
          { x with extendedHelp = v }
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Fun.id
            cs
      | e ->
          unexpected "GapiService.SingleError.parse" e x

end

module RequestError =
struct
  type t = {
    errors : SingleError.t list;
    code : int;
    message : string
  }

  let errors = {
    GapiLens.get = (fun x -> x.errors);
    GapiLens.set = (fun v x -> { x with errors = v })
  }
  let code = {
    GapiLens.get = (fun x -> x.code);
    GapiLens.set = (fun v x -> { x with code = v })
  }
  let message = {
    GapiLens.get = (fun x -> x.message);
    GapiLens.set = (fun v x -> { x with message = v })
  }

  let empty = {
    errors = [];
    code = 0;
    message = ""
  }

  let render x =
    render_object ""
      [render_object "error"
        [render_array "errors" SingleError.render x.errors;
         render_int_value "code" x.code;
         render_string_value "message" x.message]]

  let rec parse x tree =
    match tree with
        AnnotatedTree.Node
          ({ name = "errors"; data_type = Array },
           cs) ->
          parse_collection
            SingleError.parse
            SingleError.empty
            (fun xs -> { x with errors = xs })
            cs
      | AnnotatedTree.Leaf
          ({ name = "code"; data_type = Scalar },
           `Int v) ->
          { x with code = v }
      | AnnotatedTree.Leaf
          ({ name = "message"; data_type = Scalar },
           `String v) ->
          { x with message = v }
      | AnnotatedTree.Node
          ({ name = "error"; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Fun.id
            cs
      | AnnotatedTree.Node
          ({ name = ""; data_type = Object },
           cs) ->
          parse_children
            parse
            empty
            Fun.id
            cs
      | e ->
          unexpected "GapiService.RequestError.parse" e x

  let to_data_model = render_root render

  let of_data_model = parse_root parse empty

end

