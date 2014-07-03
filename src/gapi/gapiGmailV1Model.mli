(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Gmail API (v1).
  
  For more information about this data model, see the
  {{:https://developers.google.com/gmail/api/}API Documentation}.
  *)

module ModifyThreadRequest :
sig
  type t = {
    addLabelIds : string list;
    (** A list of IDs of labels to add to this thread. *)
    removeLabelIds : string list;
    (** A list of IDs of labels to remove from this thread. *)
    
  }
  
  val addLabelIds : (t, string list) GapiLens.t
  val removeLabelIds : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Label :
sig
  type t = {
    id : string;
    (** The immutable ID of the label. *)
    labelListVisibility : string;
    (** The visibility of the label in the label list in the Gmail web interface. *)
    messageListVisibility : string;
    (** The visibility of the label in the message list in the Gmail web interface. *)
    name : string;
    (** The display name of the label. *)
    _type : string;
    (** The owner type for the label. User labels are created by the user and can be modified and deleted by the user and can be applied to any message or thread. System labels are internally created and cannot be added, modified, or deleted. System labels may be able to be applied to or removed from messages and threads under some circumstances but this is not guaranteed. For example, users can apply and remove the INBOX and UNREAD labels from messages and threads, but cannot apply or remove the DRAFTS or SENT labels from messages or threads. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val labelListVisibility : (t, string) GapiLens.t
  val messageListVisibility : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ModifyMessageRequest :
sig
  type t = {
    addLabelIds : string list;
    (** A list of IDs of labels to add to this message. *)
    removeLabelIds : string list;
    (** A list IDs of labels to remove from this message. *)
    
  }
  
  val addLabelIds : (t, string list) GapiLens.t
  val removeLabelIds : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module MessagePartHeader :
sig
  type t = {
    name : string;
    (** The name of the header before the : separator. For example, To. *)
    value : string;
    (** The value of the header after the : separator. For example, someuser\@example.com. *)
    
  }
  
  val name : (t, string) GapiLens.t
  val value : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module MessagePartBody :
sig
  type t = {
    attachmentId : string;
    (** When present, contains the ID of an external attachment that can be retrieved in a separate messages.attachments.get request. When not present, the entire content of the message part body is contained in the data field. *)
    data : string;
    (** The body data of a MIME message part. May be empty for MIME container types that have no message body or when the body data is sent as a separate attachment. An attachment ID is present if the body data is contained in a separate attachment. *)
    size : int;
    (** Total number of bytes in the body of the message part. *)
    
  }
  
  val attachmentId : (t, string) GapiLens.t
  val data : (t, string) GapiLens.t
  val size : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module MessagePart :
sig
  type t = {
    body : MessagePartBody.t;
    (** The message part body for this part, which may be empty for container MIME message parts. *)
    filename : string;
    (** The filename of the attachment. Only present if this message part represents an attachment. *)
    headers : MessagePartHeader.t list;
    (** List of headers on this message part. For the top-level message part, representing the entire message payload, it will contain the standard RFC 2822 email headers such as To, From, and Subject. *)
    mimeType : string;
    (** The MIME type of the message part. *)
    partId : string;
    (** The immutable ID of the message part. *)
    parts : t list;
    (** The child MIME message parts of this part. This only applies to container MIME message parts, for example multipart/*. For non- container MIME message part types, such as text/plain, this field is empty. For more information, see RFC 1521. *)
    
  }
  
  val body : (t, MessagePartBody.t) GapiLens.t
  val filename : (t, string) GapiLens.t
  val headers : (t, MessagePartHeader.t list) GapiLens.t
  val mimeType : (t, string) GapiLens.t
  val partId : (t, string) GapiLens.t
  val parts : (t, t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Message :
sig
  type t = {
    historyId : string;
    (** The ID of the last history record that modified this message. *)
    id : string;
    (** The immutable ID of the message. *)
    labelIds : string list;
    (** List of IDs of labels applied to this message. *)
    payload : MessagePart.t;
    (** The parsed email structure in the message parts. *)
    raw : string;
    (** The entire email message in an RFC 2822 formatted string. Returned in messages.get and drafts.get responses when the format=RAW parameter is supplied. *)
    sizeEstimate : int;
    (** Estimated size in bytes of the message. *)
    snippet : string;
    (** A short part of the message text. *)
    threadId : string;
    (** The ID of the thread the message belongs to. To add a message or draft to a thread, the following criteria must be met: 
- The requested threadId must be specified on the Message or Draft.Message you supply with your request. 
- The References and In-Reply-To headers must be set in compliance with the <a href="https://tools.ietf.org/html/rfc2822"RFC 2822 standard. 
- The Subject headers must match. *)
    
  }
  
  val historyId : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val labelIds : (t, string list) GapiLens.t
  val payload : (t, MessagePart.t) GapiLens.t
  val raw : (t, string) GapiLens.t
  val sizeEstimate : (t, int) GapiLens.t
  val snippet : (t, string) GapiLens.t
  val threadId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Thread :
sig
  type t = {
    historyId : string;
    (** The ID of the last history record that modified this thread. *)
    id : string;
    (** The unique ID of the thread. *)
    messages : Message.t list;
    (** The list of messages in the thread. *)
    snippet : string;
    (** A short part of the message text. *)
    
  }
  
  val historyId : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val messages : (t, Message.t list) GapiLens.t
  val snippet : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ListThreadsResponse :
sig
  type t = {
    nextPageToken : string;
    (** Page token to retrieve the next page of results in the list. *)
    resultSizeEstimate : int;
    (** Estimated total number of results. *)
    threads : Thread.t list;
    (** List of threads. *)
    
  }
  
  val nextPageToken : (t, string) GapiLens.t
  val resultSizeEstimate : (t, int) GapiLens.t
  val threads : (t, Thread.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Draft :
sig
  type t = {
    id : string;
    (** The immutable ID of the draft. *)
    message : Message.t;
    (** The message content of the draft. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val message : (t, Message.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ListDraftsResponse :
sig
  type t = {
    drafts : Draft.t list;
    (** List of drafts. *)
    nextPageToken : string;
    (** Token to retrieve the next page of results in the list. *)
    resultSizeEstimate : int;
    (** Estimated total number of results. *)
    
  }
  
  val drafts : (t, Draft.t list) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val resultSizeEstimate : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module History :
sig
  type t = {
    id : string;
    (** The mailbox sequence ID. *)
    messages : Message.t list;
    (** The messages that changed in this history record. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val messages : (t, Message.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ListHistoryResponse :
sig
  type t = {
    history : History.t list;
    (** List of history records. *)
    historyId : string;
    (** The ID of the mailbox's current history record. *)
    nextPageToken : string;
    (** Page token to retrieve the next page of results in the list. *)
    
  }
  
  val history : (t, History.t list) GapiLens.t
  val historyId : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ListMessagesResponse :
sig
  type t = {
    messages : Message.t list;
    (** List of messages. *)
    nextPageToken : string;
    (** Token to retrieve the next page of results in the list. *)
    resultSizeEstimate : int;
    (** Estimated total number of results. *)
    
  }
  
  val messages : (t, Message.t list) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val resultSizeEstimate : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ListLabelsResponse :
sig
  type t = {
    labels : Label.t list;
    (** List of labels. *)
    
  }
  
  val labels : (t, Label.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

