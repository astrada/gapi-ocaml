(* Warning! This file is generated. Modify at your own risk. *)

module MessagePartHeader =
struct
  type t = {
    name : string;
    value : string;
    
  }
  
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let value = {
    GapiLens.get = (fun x -> x.value);
    GapiLens.set = (fun v x -> { x with value = v });
  }
  
  let empty = {
    name = "";
    value = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "value" x.value;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "value"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with value = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.MessagePartHeader.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module MessagePartBody =
struct
  type t = {
    attachmentId : string;
    data : string;
    size : int;
    
  }
  
  let attachmentId = {
    GapiLens.get = (fun x -> x.attachmentId);
    GapiLens.set = (fun v x -> { x with attachmentId = v });
  }
  let data = {
    GapiLens.get = (fun x -> x.data);
    GapiLens.set = (fun v x -> { x with data = v });
  }
  let size = {
    GapiLens.get = (fun x -> x.size);
    GapiLens.set = (fun v x -> { x with size = v });
  }
  
  let empty = {
    attachmentId = "";
    data = "";
    size = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "attachmentId" x.attachmentId;
      GapiJson.render_string_value "data" x.data;
      GapiJson.render_int_value "size" x.size;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "attachmentId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with attachmentId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "data"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with data = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with size = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.MessagePartBody.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module MessagePart =
struct
  type t = {
    body : MessagePartBody.t;
    filename : string;
    headers : MessagePartHeader.t list;
    mimeType : string;
    partId : string;
    parts : t list;
    
  }
  
  let body = {
    GapiLens.get = (fun x -> x.body);
    GapiLens.set = (fun v x -> { x with body = v });
  }
  let filename = {
    GapiLens.get = (fun x -> x.filename);
    GapiLens.set = (fun v x -> { x with filename = v });
  }
  let headers = {
    GapiLens.get = (fun x -> x.headers);
    GapiLens.set = (fun v x -> { x with headers = v });
  }
  let mimeType = {
    GapiLens.get = (fun x -> x.mimeType);
    GapiLens.set = (fun v x -> { x with mimeType = v });
  }
  let partId = {
    GapiLens.get = (fun x -> x.partId);
    GapiLens.set = (fun v x -> { x with partId = v });
  }
  let parts = {
    GapiLens.get = (fun x -> x.parts);
    GapiLens.set = (fun v x -> { x with parts = v });
  }
  
  let empty = {
    body = MessagePartBody.empty;
    filename = "";
    headers = [];
    mimeType = "";
    partId = "";
    parts = [];
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "body" (MessagePartBody.render_content v)) x.body;
      GapiJson.render_string_value "filename" x.filename;
      GapiJson.render_array "headers" MessagePartHeader.render x.headers;
      GapiJson.render_string_value "mimeType" x.mimeType;
      GapiJson.render_string_value "partId" x.partId;
      GapiJson.render_array "parts" render x.parts;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "body"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        MessagePartBody.parse
        MessagePartBody.empty
        (fun v -> { x with body = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "filename"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with filename = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "headers"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              MessagePartHeader.parse
              MessagePartHeader.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.MessagePart.parse.parse_collection" e x')
        MessagePartHeader.empty
        (fun v -> { x with headers = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "mimeType"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with mimeType = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "partId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with partId = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "parts"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children parse empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.MessagePart.parse.parse_collection" e x')
        empty
        (fun v -> { x with parts = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.MessagePart.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Message =
struct
  type t = {
    historyId : string;
    id : string;
    labelIds : string list;
    payload : MessagePart.t;
    raw : string;
    sizeEstimate : int;
    snippet : string;
    threadId : string;
    
  }
  
  let historyId = {
    GapiLens.get = (fun x -> x.historyId);
    GapiLens.set = (fun v x -> { x with historyId = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let labelIds = {
    GapiLens.get = (fun x -> x.labelIds);
    GapiLens.set = (fun v x -> { x with labelIds = v });
  }
  let payload = {
    GapiLens.get = (fun x -> x.payload);
    GapiLens.set = (fun v x -> { x with payload = v });
  }
  let raw = {
    GapiLens.get = (fun x -> x.raw);
    GapiLens.set = (fun v x -> { x with raw = v });
  }
  let sizeEstimate = {
    GapiLens.get = (fun x -> x.sizeEstimate);
    GapiLens.set = (fun v x -> { x with sizeEstimate = v });
  }
  let snippet = {
    GapiLens.get = (fun x -> x.snippet);
    GapiLens.set = (fun v x -> { x with snippet = v });
  }
  let threadId = {
    GapiLens.get = (fun x -> x.threadId);
    GapiLens.set = (fun v x -> { x with threadId = v });
  }
  
  let empty = {
    historyId = "";
    id = "";
    labelIds = [];
    payload = MessagePart.empty;
    raw = "";
    sizeEstimate = 0;
    snippet = "";
    threadId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "historyId" x.historyId;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_array "labelIds" (GapiJson.render_string_value "") x.labelIds;
      (fun v -> GapiJson.render_object "payload" (MessagePart.render_content v)) x.payload;
      GapiJson.render_string_value "raw" x.raw;
      GapiJson.render_int_value "sizeEstimate" x.sizeEstimate;
      GapiJson.render_string_value "snippet" x.snippet;
      GapiJson.render_string_value "threadId" x.threadId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "historyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with historyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labelIds"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.Message.parse.parse_collection" e x')
        ""
        (fun v -> { x with labelIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "payload"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        MessagePart.parse
        MessagePart.empty
        (fun v -> { x with payload = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "raw"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with raw = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sizeEstimate"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with sizeEstimate = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "snippet"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with snippet = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "threadId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with threadId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.Message.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module HistoryLabelRemoved =
struct
  type t = {
    labelIds : string list;
    message : Message.t;
    
  }
  
  let labelIds = {
    GapiLens.get = (fun x -> x.labelIds);
    GapiLens.set = (fun v x -> { x with labelIds = v });
  }
  let message = {
    GapiLens.get = (fun x -> x.message);
    GapiLens.set = (fun v x -> { x with message = v });
  }
  
  let empty = {
    labelIds = [];
    message = Message.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "labelIds" (GapiJson.render_string_value "") x.labelIds;
      (fun v -> GapiJson.render_object "message" (Message.render_content v)) x.message;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labelIds"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.HistoryLabelRemoved.parse.parse_collection" e x')
        ""
        (fun v -> { x with labelIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "message"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Message.parse
        Message.empty
        (fun v -> { x with message = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.HistoryLabelRemoved.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ModifyThreadRequest =
struct
  type t = {
    addLabelIds : string list;
    removeLabelIds : string list;
    
  }
  
  let addLabelIds = {
    GapiLens.get = (fun x -> x.addLabelIds);
    GapiLens.set = (fun v x -> { x with addLabelIds = v });
  }
  let removeLabelIds = {
    GapiLens.get = (fun x -> x.removeLabelIds);
    GapiLens.set = (fun v x -> { x with removeLabelIds = v });
  }
  
  let empty = {
    addLabelIds = [];
    removeLabelIds = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "addLabelIds" (GapiJson.render_string_value "") x.addLabelIds;
      GapiJson.render_array "removeLabelIds" (GapiJson.render_string_value "") x.removeLabelIds;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addLabelIds"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ModifyThreadRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with addLabelIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "removeLabelIds"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ModifyThreadRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with removeLabelIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ModifyThreadRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Label =
struct
  type t = {
    id : string;
    labelListVisibility : string;
    messageListVisibility : string;
    messagesTotal : int;
    messagesUnread : int;
    name : string;
    threadsTotal : int;
    threadsUnread : int;
    _type : string;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let labelListVisibility = {
    GapiLens.get = (fun x -> x.labelListVisibility);
    GapiLens.set = (fun v x -> { x with labelListVisibility = v });
  }
  let messageListVisibility = {
    GapiLens.get = (fun x -> x.messageListVisibility);
    GapiLens.set = (fun v x -> { x with messageListVisibility = v });
  }
  let messagesTotal = {
    GapiLens.get = (fun x -> x.messagesTotal);
    GapiLens.set = (fun v x -> { x with messagesTotal = v });
  }
  let messagesUnread = {
    GapiLens.get = (fun x -> x.messagesUnread);
    GapiLens.set = (fun v x -> { x with messagesUnread = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let threadsTotal = {
    GapiLens.get = (fun x -> x.threadsTotal);
    GapiLens.set = (fun v x -> { x with threadsTotal = v });
  }
  let threadsUnread = {
    GapiLens.get = (fun x -> x.threadsUnread);
    GapiLens.set = (fun v x -> { x with threadsUnread = v });
  }
  let _type = {
    GapiLens.get = (fun x -> x._type);
    GapiLens.set = (fun v x -> { x with _type = v });
  }
  
  let empty = {
    id = "";
    labelListVisibility = "";
    messageListVisibility = "";
    messagesTotal = 0;
    messagesUnread = 0;
    name = "";
    threadsTotal = 0;
    threadsUnread = 0;
    _type = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "labelListVisibility" x.labelListVisibility;
      GapiJson.render_string_value "messageListVisibility" x.messageListVisibility;
      GapiJson.render_int_value "messagesTotal" x.messagesTotal;
      GapiJson.render_int_value "messagesUnread" x.messagesUnread;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_int_value "threadsTotal" x.threadsTotal;
      GapiJson.render_int_value "threadsUnread" x.threadsUnread;
      GapiJson.render_string_value "type" x._type;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "labelListVisibility"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with labelListVisibility = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "messageListVisibility"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with messageListVisibility = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "messagesTotal"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with messagesTotal = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "messagesUnread"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with messagesUnread = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "threadsTotal"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with threadsTotal = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "threadsUnread"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with threadsUnread = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "type"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _type = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.Label.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Profile =
struct
  type t = {
    emailAddress : string;
    historyId : string;
    messagesTotal : int;
    threadsTotal : int;
    
  }
  
  let emailAddress = {
    GapiLens.get = (fun x -> x.emailAddress);
    GapiLens.set = (fun v x -> { x with emailAddress = v });
  }
  let historyId = {
    GapiLens.get = (fun x -> x.historyId);
    GapiLens.set = (fun v x -> { x with historyId = v });
  }
  let messagesTotal = {
    GapiLens.get = (fun x -> x.messagesTotal);
    GapiLens.set = (fun v x -> { x with messagesTotal = v });
  }
  let threadsTotal = {
    GapiLens.get = (fun x -> x.threadsTotal);
    GapiLens.set = (fun v x -> { x with threadsTotal = v });
  }
  
  let empty = {
    emailAddress = "";
    historyId = "";
    messagesTotal = 0;
    threadsTotal = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "emailAddress" x.emailAddress;
      GapiJson.render_string_value "historyId" x.historyId;
      GapiJson.render_int_value "messagesTotal" x.messagesTotal;
      GapiJson.render_int_value "threadsTotal" x.threadsTotal;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "emailAddress"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with emailAddress = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "historyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with historyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "messagesTotal"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with messagesTotal = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "threadsTotal"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with threadsTotal = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.Profile.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ModifyMessageRequest =
struct
  type t = {
    addLabelIds : string list;
    removeLabelIds : string list;
    
  }
  
  let addLabelIds = {
    GapiLens.get = (fun x -> x.addLabelIds);
    GapiLens.set = (fun v x -> { x with addLabelIds = v });
  }
  let removeLabelIds = {
    GapiLens.get = (fun x -> x.removeLabelIds);
    GapiLens.set = (fun v x -> { x with removeLabelIds = v });
  }
  
  let empty = {
    addLabelIds = [];
    removeLabelIds = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "addLabelIds" (GapiJson.render_string_value "") x.addLabelIds;
      GapiJson.render_array "removeLabelIds" (GapiJson.render_string_value "") x.removeLabelIds;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "addLabelIds"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ModifyMessageRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with addLabelIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "removeLabelIds"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ModifyMessageRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with removeLabelIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ModifyMessageRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Thread =
struct
  type t = {
    historyId : string;
    id : string;
    messages : Message.t list;
    snippet : string;
    
  }
  
  let historyId = {
    GapiLens.get = (fun x -> x.historyId);
    GapiLens.set = (fun v x -> { x with historyId = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let messages = {
    GapiLens.get = (fun x -> x.messages);
    GapiLens.set = (fun v x -> { x with messages = v });
  }
  let snippet = {
    GapiLens.get = (fun x -> x.snippet);
    GapiLens.set = (fun v x -> { x with snippet = v });
  }
  
  let empty = {
    historyId = "";
    id = "";
    messages = [];
    snippet = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "historyId" x.historyId;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_array "messages" Message.render x.messages;
      GapiJson.render_string_value "snippet" x.snippet;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "historyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with historyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "messages"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Message.parse
              Message.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.Thread.parse.parse_collection" e x')
        Message.empty
        (fun v -> { x with messages = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "snippet"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with snippet = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.Thread.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module HistoryLabelAdded =
struct
  type t = {
    labelIds : string list;
    message : Message.t;
    
  }
  
  let labelIds = {
    GapiLens.get = (fun x -> x.labelIds);
    GapiLens.set = (fun v x -> { x with labelIds = v });
  }
  let message = {
    GapiLens.get = (fun x -> x.message);
    GapiLens.set = (fun v x -> { x with message = v });
  }
  
  let empty = {
    labelIds = [];
    message = Message.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "labelIds" (GapiJson.render_string_value "") x.labelIds;
      (fun v -> GapiJson.render_object "message" (Message.render_content v)) x.message;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labelIds"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.HistoryLabelAdded.parse.parse_collection" e x')
        ""
        (fun v -> { x with labelIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "message"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Message.parse
        Message.empty
        (fun v -> { x with message = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.HistoryLabelAdded.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ListThreadsResponse =
struct
  type t = {
    nextPageToken : string;
    resultSizeEstimate : int;
    threads : Thread.t list;
    
  }
  
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let resultSizeEstimate = {
    GapiLens.get = (fun x -> x.resultSizeEstimate);
    GapiLens.set = (fun v x -> { x with resultSizeEstimate = v });
  }
  let threads = {
    GapiLens.get = (fun x -> x.threads);
    GapiLens.set = (fun v x -> { x with threads = v });
  }
  
  let empty = {
    nextPageToken = "";
    resultSizeEstimate = 0;
    threads = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_int_value "resultSizeEstimate" x.resultSizeEstimate;
      GapiJson.render_array "threads" Thread.render x.threads;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "resultSizeEstimate"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with resultSizeEstimate = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "threads"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Thread.parse Thread.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ListThreadsResponse.parse.parse_collection" e x')
        Thread.empty
        (fun v -> { x with threads = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ListThreadsResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Draft =
struct
  type t = {
    id : string;
    message : Message.t;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let message = {
    GapiLens.get = (fun x -> x.message);
    GapiLens.set = (fun v x -> { x with message = v });
  }
  
  let empty = {
    id = "";
    message = Message.empty;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      (fun v -> GapiJson.render_object "message" (Message.render_content v)) x.message;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "message"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Message.parse
        Message.empty
        (fun v -> { x with message = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.Draft.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ListDraftsResponse =
struct
  type t = {
    drafts : Draft.t list;
    nextPageToken : string;
    resultSizeEstimate : int;
    
  }
  
  let drafts = {
    GapiLens.get = (fun x -> x.drafts);
    GapiLens.set = (fun v x -> { x with drafts = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let resultSizeEstimate = {
    GapiLens.get = (fun x -> x.resultSizeEstimate);
    GapiLens.set = (fun v x -> { x with resultSizeEstimate = v });
  }
  
  let empty = {
    drafts = [];
    nextPageToken = "";
    resultSizeEstimate = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "drafts" Draft.render x.drafts;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_int_value "resultSizeEstimate" x.resultSizeEstimate;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "drafts"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Draft.parse Draft.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ListDraftsResponse.parse.parse_collection" e x')
        Draft.empty
        (fun v -> { x with drafts = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "resultSizeEstimate"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with resultSizeEstimate = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ListDraftsResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module HistoryMessageAdded =
struct
  type t = {
    message : Message.t;
    
  }
  
  let message = {
    GapiLens.get = (fun x -> x.message);
    GapiLens.set = (fun v x -> { x with message = v });
  }
  
  let empty = {
    message = Message.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "message" (Message.render_content v)) x.message;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "message"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Message.parse
        Message.empty
        (fun v -> { x with message = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.HistoryMessageAdded.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module HistoryMessageDeleted =
struct
  type t = {
    message : Message.t;
    
  }
  
  let message = {
    GapiLens.get = (fun x -> x.message);
    GapiLens.set = (fun v x -> { x with message = v });
  }
  
  let empty = {
    message = Message.empty;
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "message" (Message.render_content v)) x.message;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "message"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Message.parse
        Message.empty
        (fun v -> { x with message = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.HistoryMessageDeleted.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module History =
struct
  type t = {
    id : string;
    labelsAdded : HistoryLabelAdded.t list;
    labelsRemoved : HistoryLabelRemoved.t list;
    messages : Message.t list;
    messagesAdded : HistoryMessageAdded.t list;
    messagesDeleted : HistoryMessageDeleted.t list;
    
  }
  
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let labelsAdded = {
    GapiLens.get = (fun x -> x.labelsAdded);
    GapiLens.set = (fun v x -> { x with labelsAdded = v });
  }
  let labelsRemoved = {
    GapiLens.get = (fun x -> x.labelsRemoved);
    GapiLens.set = (fun v x -> { x with labelsRemoved = v });
  }
  let messages = {
    GapiLens.get = (fun x -> x.messages);
    GapiLens.set = (fun v x -> { x with messages = v });
  }
  let messagesAdded = {
    GapiLens.get = (fun x -> x.messagesAdded);
    GapiLens.set = (fun v x -> { x with messagesAdded = v });
  }
  let messagesDeleted = {
    GapiLens.get = (fun x -> x.messagesDeleted);
    GapiLens.set = (fun v x -> { x with messagesDeleted = v });
  }
  
  let empty = {
    id = "";
    labelsAdded = [];
    labelsRemoved = [];
    messages = [];
    messagesAdded = [];
    messagesDeleted = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_array "labelsAdded" HistoryLabelAdded.render x.labelsAdded;
      GapiJson.render_array "labelsRemoved" HistoryLabelRemoved.render x.labelsRemoved;
      GapiJson.render_array "messages" Message.render x.messages;
      GapiJson.render_array "messagesAdded" HistoryMessageAdded.render x.messagesAdded;
      GapiJson.render_array "messagesDeleted" HistoryMessageDeleted.render x.messagesDeleted;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labelsAdded"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              HistoryLabelAdded.parse
              HistoryLabelAdded.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.History.parse.parse_collection" e x')
        HistoryLabelAdded.empty
        (fun v -> { x with labelsAdded = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labelsRemoved"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              HistoryLabelRemoved.parse
              HistoryLabelRemoved.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.History.parse.parse_collection" e x')
        HistoryLabelRemoved.empty
        (fun v -> { x with labelsRemoved = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "messages"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Message.parse
              Message.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.History.parse.parse_collection" e x')
        Message.empty
        (fun v -> { x with messages = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "messagesAdded"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              HistoryMessageAdded.parse
              HistoryMessageAdded.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.History.parse.parse_collection" e x')
        HistoryMessageAdded.empty
        (fun v -> { x with messagesAdded = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "messagesDeleted"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              HistoryMessageDeleted.parse
              HistoryMessageDeleted.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.History.parse.parse_collection" e x')
        HistoryMessageDeleted.empty
        (fun v -> { x with messagesDeleted = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.History.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ListHistoryResponse =
struct
  type t = {
    history : History.t list;
    historyId : string;
    nextPageToken : string;
    
  }
  
  let history = {
    GapiLens.get = (fun x -> x.history);
    GapiLens.set = (fun v x -> { x with history = v });
  }
  let historyId = {
    GapiLens.get = (fun x -> x.historyId);
    GapiLens.set = (fun v x -> { x with historyId = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  
  let empty = {
    history = [];
    historyId = "";
    nextPageToken = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "history" History.render x.history;
      GapiJson.render_string_value "historyId" x.historyId;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "history"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              History.parse
              History.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ListHistoryResponse.parse.parse_collection" e x')
        History.empty
        (fun v -> { x with history = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "historyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with historyId = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ListHistoryResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ListMessagesResponse =
struct
  type t = {
    messages : Message.t list;
    nextPageToken : string;
    resultSizeEstimate : int;
    
  }
  
  let messages = {
    GapiLens.get = (fun x -> x.messages);
    GapiLens.set = (fun v x -> { x with messages = v });
  }
  let nextPageToken = {
    GapiLens.get = (fun x -> x.nextPageToken);
    GapiLens.set = (fun v x -> { x with nextPageToken = v });
  }
  let resultSizeEstimate = {
    GapiLens.get = (fun x -> x.resultSizeEstimate);
    GapiLens.set = (fun v x -> { x with resultSizeEstimate = v });
  }
  
  let empty = {
    messages = [];
    nextPageToken = "";
    resultSizeEstimate = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "messages" Message.render x.messages;
      GapiJson.render_string_value "nextPageToken" x.nextPageToken;
      GapiJson.render_int_value "resultSizeEstimate" x.resultSizeEstimate;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "messages"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              Message.parse
              Message.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ListMessagesResponse.parse.parse_collection" e x')
        Message.empty
        (fun v -> { x with messages = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "nextPageToken"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with nextPageToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "resultSizeEstimate"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with resultSizeEstimate = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ListMessagesResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ListLabelsResponse =
struct
  type t = {
    labels : Label.t list;
    
  }
  
  let labels = {
    GapiLens.get = (fun x -> x.labels);
    GapiLens.set = (fun v x -> { x with labels = v });
  }
  
  let empty = {
    labels = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "labels" Label.render x.labels;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "labels"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Label.parse Label.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ListLabelsResponse.parse.parse_collection" e x')
        Label.empty
        (fun v -> { x with labels = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ListLabelsResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

