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
    internalDate : int64;
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
  let internalDate = {
    GapiLens.get = (fun x -> x.internalDate);
    GapiLens.set = (fun v x -> { x with internalDate = v });
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
    internalDate = 0L;
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
      GapiJson.render_int64_value "internalDate" x.internalDate;
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
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "internalDate"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with internalDate = Int64.of_string v }
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

module ForwardingAddress =
struct
  type t = {
    forwardingEmail : string;
    verificationStatus : string;
    
  }
  
  let forwardingEmail = {
    GapiLens.get = (fun x -> x.forwardingEmail);
    GapiLens.set = (fun v x -> { x with forwardingEmail = v });
  }
  let verificationStatus = {
    GapiLens.get = (fun x -> x.verificationStatus);
    GapiLens.set = (fun v x -> { x with verificationStatus = v });
  }
  
  let empty = {
    forwardingEmail = "";
    verificationStatus = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "forwardingEmail" x.forwardingEmail;
      GapiJson.render_string_value "verificationStatus" x.verificationStatus;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "forwardingEmail"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with forwardingEmail = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "verificationStatus"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with verificationStatus = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ForwardingAddress.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ListForwardingAddressesResponse =
struct
  type t = {
    forwardingAddresses : ForwardingAddress.t list;
    
  }
  
  let forwardingAddresses = {
    GapiLens.get = (fun x -> x.forwardingAddresses);
    GapiLens.set = (fun v x -> { x with forwardingAddresses = v });
  }
  
  let empty = {
    forwardingAddresses = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "forwardingAddresses" ForwardingAddress.render x.forwardingAddresses;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "forwardingAddresses"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              ForwardingAddress.parse
              ForwardingAddress.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ListForwardingAddressesResponse.parse.parse_collection" e x')
        ForwardingAddress.empty
        (fun v -> { x with forwardingAddresses = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ListForwardingAddressesResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ImapSettings =
struct
  type t = {
    autoExpunge : bool;
    enabled : bool;
    expungeBehavior : string;
    maxFolderSize : int;
    
  }
  
  let autoExpunge = {
    GapiLens.get = (fun x -> x.autoExpunge);
    GapiLens.set = (fun v x -> { x with autoExpunge = v });
  }
  let enabled = {
    GapiLens.get = (fun x -> x.enabled);
    GapiLens.set = (fun v x -> { x with enabled = v });
  }
  let expungeBehavior = {
    GapiLens.get = (fun x -> x.expungeBehavior);
    GapiLens.set = (fun v x -> { x with expungeBehavior = v });
  }
  let maxFolderSize = {
    GapiLens.get = (fun x -> x.maxFolderSize);
    GapiLens.set = (fun v x -> { x with maxFolderSize = v });
  }
  
  let empty = {
    autoExpunge = false;
    enabled = false;
    expungeBehavior = "";
    maxFolderSize = 0;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "autoExpunge" x.autoExpunge;
      GapiJson.render_bool_value "enabled" x.enabled;
      GapiJson.render_string_value "expungeBehavior" x.expungeBehavior;
      GapiJson.render_int_value "maxFolderSize" x.maxFolderSize;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "autoExpunge"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with autoExpunge = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "enabled"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with enabled = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "expungeBehavior"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with expungeBehavior = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "maxFolderSize"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with maxFolderSize = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ImapSettings.parse" e x
  
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

module LabelColor =
struct
  type t = {
    backgroundColor : string;
    textColor : string;
    
  }
  
  let backgroundColor = {
    GapiLens.get = (fun x -> x.backgroundColor);
    GapiLens.set = (fun v x -> { x with backgroundColor = v });
  }
  let textColor = {
    GapiLens.get = (fun x -> x.textColor);
    GapiLens.set = (fun v x -> { x with textColor = v });
  }
  
  let empty = {
    backgroundColor = "";
    textColor = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "backgroundColor" x.backgroundColor;
      GapiJson.render_string_value "textColor" x.textColor;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "backgroundColor"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with backgroundColor = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "textColor"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with textColor = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.LabelColor.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Label =
struct
  type t = {
    color : LabelColor.t;
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
  
  let color = {
    GapiLens.get = (fun x -> x.color);
    GapiLens.set = (fun v x -> { x with color = v });
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
    color = LabelColor.empty;
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
      (fun v -> GapiJson.render_object "color" (LabelColor.render_content v)) x.color;
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
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "color"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        LabelColor.parse
        LabelColor.empty
        (fun v -> { x with color = v })
        cs
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

module SmtpMsa =
struct
  type t = {
    host : string;
    password : string;
    port : int;
    securityMode : string;
    username : string;
    
  }
  
  let host = {
    GapiLens.get = (fun x -> x.host);
    GapiLens.set = (fun v x -> { x with host = v });
  }
  let password = {
    GapiLens.get = (fun x -> x.password);
    GapiLens.set = (fun v x -> { x with password = v });
  }
  let port = {
    GapiLens.get = (fun x -> x.port);
    GapiLens.set = (fun v x -> { x with port = v });
  }
  let securityMode = {
    GapiLens.get = (fun x -> x.securityMode);
    GapiLens.set = (fun v x -> { x with securityMode = v });
  }
  let username = {
    GapiLens.get = (fun x -> x.username);
    GapiLens.set = (fun v x -> { x with username = v });
  }
  
  let empty = {
    host = "";
    password = "";
    port = 0;
    securityMode = "";
    username = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "host" x.host;
      GapiJson.render_string_value "password" x.password;
      GapiJson.render_int_value "port" x.port;
      GapiJson.render_string_value "securityMode" x.securityMode;
      GapiJson.render_string_value "username" x.username;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "host"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with host = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "password"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with password = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "port"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with port = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "securityMode"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with securityMode = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "username"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with username = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.SmtpMsa.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SendAs =
struct
  type t = {
    displayName : string;
    isDefault : bool;
    isPrimary : bool;
    replyToAddress : string;
    sendAsEmail : string;
    signature : string;
    smtpMsa : SmtpMsa.t;
    treatAsAlias : bool;
    verificationStatus : string;
    
  }
  
  let displayName = {
    GapiLens.get = (fun x -> x.displayName);
    GapiLens.set = (fun v x -> { x with displayName = v });
  }
  let isDefault = {
    GapiLens.get = (fun x -> x.isDefault);
    GapiLens.set = (fun v x -> { x with isDefault = v });
  }
  let isPrimary = {
    GapiLens.get = (fun x -> x.isPrimary);
    GapiLens.set = (fun v x -> { x with isPrimary = v });
  }
  let replyToAddress = {
    GapiLens.get = (fun x -> x.replyToAddress);
    GapiLens.set = (fun v x -> { x with replyToAddress = v });
  }
  let sendAsEmail = {
    GapiLens.get = (fun x -> x.sendAsEmail);
    GapiLens.set = (fun v x -> { x with sendAsEmail = v });
  }
  let signature = {
    GapiLens.get = (fun x -> x.signature);
    GapiLens.set = (fun v x -> { x with signature = v });
  }
  let smtpMsa = {
    GapiLens.get = (fun x -> x.smtpMsa);
    GapiLens.set = (fun v x -> { x with smtpMsa = v });
  }
  let treatAsAlias = {
    GapiLens.get = (fun x -> x.treatAsAlias);
    GapiLens.set = (fun v x -> { x with treatAsAlias = v });
  }
  let verificationStatus = {
    GapiLens.get = (fun x -> x.verificationStatus);
    GapiLens.set = (fun v x -> { x with verificationStatus = v });
  }
  
  let empty = {
    displayName = "";
    isDefault = false;
    isPrimary = false;
    replyToAddress = "";
    sendAsEmail = "";
    signature = "";
    smtpMsa = SmtpMsa.empty;
    treatAsAlias = false;
    verificationStatus = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "displayName" x.displayName;
      GapiJson.render_bool_value "isDefault" x.isDefault;
      GapiJson.render_bool_value "isPrimary" x.isPrimary;
      GapiJson.render_string_value "replyToAddress" x.replyToAddress;
      GapiJson.render_string_value "sendAsEmail" x.sendAsEmail;
      GapiJson.render_string_value "signature" x.signature;
      (fun v -> GapiJson.render_object "smtpMsa" (SmtpMsa.render_content v)) x.smtpMsa;
      GapiJson.render_bool_value "treatAsAlias" x.treatAsAlias;
      GapiJson.render_string_value "verificationStatus" x.verificationStatus;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "displayName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with displayName = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "isDefault"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with isDefault = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "isPrimary"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with isPrimary = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "replyToAddress"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with replyToAddress = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sendAsEmail"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sendAsEmail = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "signature"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with signature = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "smtpMsa"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        SmtpMsa.parse
        SmtpMsa.empty
        (fun v -> { x with smtpMsa = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "treatAsAlias"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with treatAsAlias = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "verificationStatus"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with verificationStatus = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.SendAs.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ListSendAsResponse =
struct
  type t = {
    sendAs : SendAs.t list;
    
  }
  
  let sendAs = {
    GapiLens.get = (fun x -> x.sendAs);
    GapiLens.set = (fun v x -> { x with sendAs = v });
  }
  
  let empty = {
    sendAs = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "sendAs" SendAs.render x.sendAs;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "sendAs"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children SendAs.parse SendAs.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ListSendAsResponse.parse.parse_collection" e x')
        SendAs.empty
        (fun v -> { x with sendAs = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ListSendAsResponse.parse" e x
  
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

module WatchResponse =
struct
  type t = {
    expiration : int64;
    historyId : string;
    
  }
  
  let expiration = {
    GapiLens.get = (fun x -> x.expiration);
    GapiLens.set = (fun v x -> { x with expiration = v });
  }
  let historyId = {
    GapiLens.get = (fun x -> x.historyId);
    GapiLens.set = (fun v x -> { x with historyId = v });
  }
  
  let empty = {
    expiration = 0L;
    historyId = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_int64_value "expiration" x.expiration;
      GapiJson.render_string_value "historyId" x.historyId;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "expiration"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with expiration = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "historyId"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with historyId = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.WatchResponse.parse" e x
  
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

module PopSettings =
struct
  type t = {
    accessWindow : string;
    disposition : string;
    
  }
  
  let accessWindow = {
    GapiLens.get = (fun x -> x.accessWindow);
    GapiLens.set = (fun v x -> { x with accessWindow = v });
  }
  let disposition = {
    GapiLens.get = (fun x -> x.disposition);
    GapiLens.set = (fun v x -> { x with disposition = v });
  }
  
  let empty = {
    accessWindow = "";
    disposition = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "accessWindow" x.accessWindow;
      GapiJson.render_string_value "disposition" x.disposition;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "accessWindow"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with accessWindow = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "disposition"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with disposition = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.PopSettings.parse" e x
  
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

module FilterCriteria =
struct
  type t = {
    excludeChats : bool;
    from : string;
    hasAttachment : bool;
    negatedQuery : string;
    query : string;
    size : int;
    sizeComparison : string;
    subject : string;
    _to : string;
    
  }
  
  let excludeChats = {
    GapiLens.get = (fun x -> x.excludeChats);
    GapiLens.set = (fun v x -> { x with excludeChats = v });
  }
  let from = {
    GapiLens.get = (fun x -> x.from);
    GapiLens.set = (fun v x -> { x with from = v });
  }
  let hasAttachment = {
    GapiLens.get = (fun x -> x.hasAttachment);
    GapiLens.set = (fun v x -> { x with hasAttachment = v });
  }
  let negatedQuery = {
    GapiLens.get = (fun x -> x.negatedQuery);
    GapiLens.set = (fun v x -> { x with negatedQuery = v });
  }
  let query = {
    GapiLens.get = (fun x -> x.query);
    GapiLens.set = (fun v x -> { x with query = v });
  }
  let size = {
    GapiLens.get = (fun x -> x.size);
    GapiLens.set = (fun v x -> { x with size = v });
  }
  let sizeComparison = {
    GapiLens.get = (fun x -> x.sizeComparison);
    GapiLens.set = (fun v x -> { x with sizeComparison = v });
  }
  let subject = {
    GapiLens.get = (fun x -> x.subject);
    GapiLens.set = (fun v x -> { x with subject = v });
  }
  let _to = {
    GapiLens.get = (fun x -> x._to);
    GapiLens.set = (fun v x -> { x with _to = v });
  }
  
  let empty = {
    excludeChats = false;
    from = "";
    hasAttachment = false;
    negatedQuery = "";
    query = "";
    size = 0;
    sizeComparison = "";
    subject = "";
    _to = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "excludeChats" x.excludeChats;
      GapiJson.render_string_value "from" x.from;
      GapiJson.render_bool_value "hasAttachment" x.hasAttachment;
      GapiJson.render_string_value "negatedQuery" x.negatedQuery;
      GapiJson.render_string_value "query" x.query;
      GapiJson.render_int_value "size" x.size;
      GapiJson.render_string_value "sizeComparison" x.sizeComparison;
      GapiJson.render_string_value "subject" x.subject;
      GapiJson.render_string_value "to" x._to;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "excludeChats"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with excludeChats = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "from"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with from = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "hasAttachment"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with hasAttachment = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "negatedQuery"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with negatedQuery = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "query"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with query = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "size"; data_type = GapiJson.Scalar },
        `Int v) ->
      { x with size = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sizeComparison"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with sizeComparison = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "subject"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with subject = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "to"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with _to = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.FilterCriteria.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module FilterAction =
struct
  type t = {
    addLabelIds : string list;
    forward : string;
    removeLabelIds : string list;
    
  }
  
  let addLabelIds = {
    GapiLens.get = (fun x -> x.addLabelIds);
    GapiLens.set = (fun v x -> { x with addLabelIds = v });
  }
  let forward = {
    GapiLens.get = (fun x -> x.forward);
    GapiLens.set = (fun v x -> { x with forward = v });
  }
  let removeLabelIds = {
    GapiLens.get = (fun x -> x.removeLabelIds);
    GapiLens.set = (fun v x -> { x with removeLabelIds = v });
  }
  
  let empty = {
    addLabelIds = [];
    forward = "";
    removeLabelIds = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "addLabelIds" (GapiJson.render_string_value "") x.addLabelIds;
      GapiJson.render_string_value "forward" x.forward;
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
            GapiJson.unexpected "GapiGmailV1Model.FilterAction.parse.parse_collection" e x')
        ""
        (fun v -> { x with addLabelIds = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "forward"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with forward = v }
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
            GapiJson.unexpected "GapiGmailV1Model.FilterAction.parse.parse_collection" e x')
        ""
        (fun v -> { x with removeLabelIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.FilterAction.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Filter =
struct
  type t = {
    action : FilterAction.t;
    criteria : FilterCriteria.t;
    id : string;
    
  }
  
  let action = {
    GapiLens.get = (fun x -> x.action);
    GapiLens.set = (fun v x -> { x with action = v });
  }
  let criteria = {
    GapiLens.get = (fun x -> x.criteria);
    GapiLens.set = (fun v x -> { x with criteria = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  
  let empty = {
    action = FilterAction.empty;
    criteria = FilterCriteria.empty;
    id = "";
    
  }
  
  let rec render_content x = 
     [
      (fun v -> GapiJson.render_object "action" (FilterAction.render_content v)) x.action;
      (fun v -> GapiJson.render_object "criteria" (FilterCriteria.render_content v)) x.criteria;
      GapiJson.render_string_value "id" x.id;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "action"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FilterAction.parse
        FilterAction.empty
        (fun v -> { x with action = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "criteria"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        FilterCriteria.parse
        FilterCriteria.empty
        (fun v -> { x with criteria = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.Filter.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module ListFiltersResponse =
struct
  type t = {
    filter : Filter.t list;
    
  }
  
  let filter = {
    GapiLens.get = (fun x -> x.filter);
    GapiLens.set = (fun v x -> { x with filter = v });
  }
  
  let empty = {
    filter = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "filter" Filter.render x.filter;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "filter"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children Filter.parse Filter.empty (fun v -> v) cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ListFiltersResponse.parse.parse_collection" e x')
        Filter.empty
        (fun v -> { x with filter = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ListFiltersResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module VacationSettings =
struct
  type t = {
    enableAutoReply : bool;
    endTime : int64;
    responseBodyHtml : string;
    responseBodyPlainText : string;
    responseSubject : string;
    restrictToContacts : bool;
    restrictToDomain : bool;
    startTime : int64;
    
  }
  
  let enableAutoReply = {
    GapiLens.get = (fun x -> x.enableAutoReply);
    GapiLens.set = (fun v x -> { x with enableAutoReply = v });
  }
  let endTime = {
    GapiLens.get = (fun x -> x.endTime);
    GapiLens.set = (fun v x -> { x with endTime = v });
  }
  let responseBodyHtml = {
    GapiLens.get = (fun x -> x.responseBodyHtml);
    GapiLens.set = (fun v x -> { x with responseBodyHtml = v });
  }
  let responseBodyPlainText = {
    GapiLens.get = (fun x -> x.responseBodyPlainText);
    GapiLens.set = (fun v x -> { x with responseBodyPlainText = v });
  }
  let responseSubject = {
    GapiLens.get = (fun x -> x.responseSubject);
    GapiLens.set = (fun v x -> { x with responseSubject = v });
  }
  let restrictToContacts = {
    GapiLens.get = (fun x -> x.restrictToContacts);
    GapiLens.set = (fun v x -> { x with restrictToContacts = v });
  }
  let restrictToDomain = {
    GapiLens.get = (fun x -> x.restrictToDomain);
    GapiLens.set = (fun v x -> { x with restrictToDomain = v });
  }
  let startTime = {
    GapiLens.get = (fun x -> x.startTime);
    GapiLens.set = (fun v x -> { x with startTime = v });
  }
  
  let empty = {
    enableAutoReply = false;
    endTime = 0L;
    responseBodyHtml = "";
    responseBodyPlainText = "";
    responseSubject = "";
    restrictToContacts = false;
    restrictToDomain = false;
    startTime = 0L;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_bool_value "enableAutoReply" x.enableAutoReply;
      GapiJson.render_int64_value "endTime" x.endTime;
      GapiJson.render_string_value "responseBodyHtml" x.responseBodyHtml;
      GapiJson.render_string_value "responseBodyPlainText" x.responseBodyPlainText;
      GapiJson.render_string_value "responseSubject" x.responseSubject;
      GapiJson.render_bool_value "restrictToContacts" x.restrictToContacts;
      GapiJson.render_bool_value "restrictToDomain" x.restrictToDomain;
      GapiJson.render_int64_value "startTime" x.startTime;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "enableAutoReply"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with enableAutoReply = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "endTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with endTime = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "responseBodyHtml"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with responseBodyHtml = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "responseBodyPlainText"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with responseBodyPlainText = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "responseSubject"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with responseSubject = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "restrictToContacts"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with restrictToContacts = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "restrictToDomain"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with restrictToDomain = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "startTime"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with startTime = Int64.of_string v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.VacationSettings.parse" e x
  
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

module BatchModifyMessagesRequest =
struct
  type t = {
    addLabelIds : string list;
    ids : string list;
    removeLabelIds : string list;
    
  }
  
  let addLabelIds = {
    GapiLens.get = (fun x -> x.addLabelIds);
    GapiLens.set = (fun v x -> { x with addLabelIds = v });
  }
  let ids = {
    GapiLens.get = (fun x -> x.ids);
    GapiLens.set = (fun v x -> { x with ids = v });
  }
  let removeLabelIds = {
    GapiLens.get = (fun x -> x.removeLabelIds);
    GapiLens.set = (fun v x -> { x with removeLabelIds = v });
  }
  
  let empty = {
    addLabelIds = [];
    ids = [];
    removeLabelIds = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "addLabelIds" (GapiJson.render_string_value "") x.addLabelIds;
      GapiJson.render_array "ids" (GapiJson.render_string_value "") x.ids;
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
            GapiJson.unexpected "GapiGmailV1Model.BatchModifyMessagesRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with addLabelIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "ids"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.BatchModifyMessagesRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with ids = v })
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
            GapiJson.unexpected "GapiGmailV1Model.BatchModifyMessagesRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with removeLabelIds = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.BatchModifyMessagesRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module WatchRequest =
struct
  type t = {
    labelFilterAction : string;
    labelIds : string list;
    topicName : string;
    
  }
  
  let labelFilterAction = {
    GapiLens.get = (fun x -> x.labelFilterAction);
    GapiLens.set = (fun v x -> { x with labelFilterAction = v });
  }
  let labelIds = {
    GapiLens.get = (fun x -> x.labelIds);
    GapiLens.set = (fun v x -> { x with labelIds = v });
  }
  let topicName = {
    GapiLens.get = (fun x -> x.topicName);
    GapiLens.set = (fun v x -> { x with topicName = v });
  }
  
  let empty = {
    labelFilterAction = "";
    labelIds = [];
    topicName = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "labelFilterAction" x.labelFilterAction;
      GapiJson.render_array "labelIds" (GapiJson.render_string_value "") x.labelIds;
      GapiJson.render_string_value "topicName" x.topicName;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "labelFilterAction"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with labelFilterAction = v }
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
            GapiJson.unexpected "GapiGmailV1Model.WatchRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with labelIds = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "topicName"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with topicName = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.WatchRequest.parse" e x
  
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

module BatchDeleteMessagesRequest =
struct
  type t = {
    ids : string list;
    
  }
  
  let ids = {
    GapiLens.get = (fun x -> x.ids);
    GapiLens.set = (fun v x -> { x with ids = v });
  }
  
  let empty = {
    ids = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "ids" (GapiJson.render_string_value "") x.ids;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "ids"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Leaf
              ({ GapiJson.name = ""; data_type = GapiJson.Scalar },
              `String v) ->
            v
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.BatchDeleteMessagesRequest.parse.parse_collection" e x')
        ""
        (fun v -> { x with ids = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.BatchDeleteMessagesRequest.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module SmimeInfo =
struct
  type t = {
    encryptedKeyPassword : string;
    expiration : int64;
    id : string;
    isDefault : bool;
    issuerCn : string;
    pem : string;
    pkcs12 : string;
    
  }
  
  let encryptedKeyPassword = {
    GapiLens.get = (fun x -> x.encryptedKeyPassword);
    GapiLens.set = (fun v x -> { x with encryptedKeyPassword = v });
  }
  let expiration = {
    GapiLens.get = (fun x -> x.expiration);
    GapiLens.set = (fun v x -> { x with expiration = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let isDefault = {
    GapiLens.get = (fun x -> x.isDefault);
    GapiLens.set = (fun v x -> { x with isDefault = v });
  }
  let issuerCn = {
    GapiLens.get = (fun x -> x.issuerCn);
    GapiLens.set = (fun v x -> { x with issuerCn = v });
  }
  let pem = {
    GapiLens.get = (fun x -> x.pem);
    GapiLens.set = (fun v x -> { x with pem = v });
  }
  let pkcs12 = {
    GapiLens.get = (fun x -> x.pkcs12);
    GapiLens.set = (fun v x -> { x with pkcs12 = v });
  }
  
  let empty = {
    encryptedKeyPassword = "";
    expiration = 0L;
    id = "";
    isDefault = false;
    issuerCn = "";
    pem = "";
    pkcs12 = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "encryptedKeyPassword" x.encryptedKeyPassword;
      GapiJson.render_int64_value "expiration" x.expiration;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_bool_value "isDefault" x.isDefault;
      GapiJson.render_string_value "issuerCn" x.issuerCn;
      GapiJson.render_string_value "pem" x.pem;
      GapiJson.render_string_value "pkcs12" x.pkcs12;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "encryptedKeyPassword"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with encryptedKeyPassword = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "expiration"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with expiration = Int64.of_string v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "isDefault"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with isDefault = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "issuerCn"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with issuerCn = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pem"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with pem = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "pkcs12"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with pkcs12 = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.SmimeInfo.parse" e x
  
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

module ListSmimeInfoResponse =
struct
  type t = {
    smimeInfo : SmimeInfo.t list;
    
  }
  
  let smimeInfo = {
    GapiLens.get = (fun x -> x.smimeInfo);
    GapiLens.set = (fun v x -> { x with smimeInfo = v });
  }
  
  let empty = {
    smimeInfo = [];
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_array "smimeInfo" SmimeInfo.render x.smimeInfo;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "smimeInfo"; data_type = GapiJson.Array },
        cs) ->
      GapiJson.parse_collection
        (fun x' -> function
          | GapiCore.AnnotatedTree.Node
              ({ GapiJson.name = ""; data_type = GapiJson.Object },
              cs) ->
            GapiJson.parse_children
              SmimeInfo.parse
              SmimeInfo.empty
              (fun v -> v)
              cs
          | e ->
            GapiJson.unexpected "GapiGmailV1Model.ListSmimeInfoResponse.parse.parse_collection" e x')
        SmimeInfo.empty
        (fun v -> { x with smimeInfo = v })
        cs
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.ListSmimeInfoResponse.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module AutoForwarding =
struct
  type t = {
    disposition : string;
    emailAddress : string;
    enabled : bool;
    
  }
  
  let disposition = {
    GapiLens.get = (fun x -> x.disposition);
    GapiLens.set = (fun v x -> { x with disposition = v });
  }
  let emailAddress = {
    GapiLens.get = (fun x -> x.emailAddress);
    GapiLens.set = (fun v x -> { x with emailAddress = v });
  }
  let enabled = {
    GapiLens.get = (fun x -> x.enabled);
    GapiLens.set = (fun v x -> { x with enabled = v });
  }
  
  let empty = {
    disposition = "";
    emailAddress = "";
    enabled = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "disposition" x.disposition;
      GapiJson.render_string_value "emailAddress" x.emailAddress;
      GapiJson.render_bool_value "enabled" x.enabled;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "disposition"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with disposition = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "emailAddress"; data_type = GapiJson.Scalar },
        `String v) ->
      { x with emailAddress = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "enabled"; data_type = GapiJson.Scalar },
        `Bool v) ->
      { x with enabled = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiGmailV1Model.AutoForwarding.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

