(* Warning! This file is generated. Modify at your own risk. *)

(** Data definition for Gmail API (v1).
  
  For more information about this data model, see the
  {{:https://developers.google.com/gmail/api/}API Documentation}.
  *)

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
    (** The body data of a MIME message part as a base64url encoded string. May be empty for MIME container types that have no message body or when the body data is sent as a separate attachment. An attachment ID is present if the body data is contained in a separate attachment. *)
    size : int;
    (** Number of bytes for the message part data (encoding notwithstanding). *)
    
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
    internalDate : int64;
    (** The internal message creation timestamp (epoch ms), which determines ordering in the inbox. For normal SMTP-received email, this represents the time the message was originally accepted by Google, which is more reliable than the Date header. However, for API-migrated mail, it can be configured by client to be based on the Date header. *)
    labelIds : string list;
    (** List of IDs of labels applied to this message. *)
    payload : MessagePart.t;
    (** The parsed email structure in the message parts. *)
    raw : string;
    (** The entire email message in an RFC 2822 formatted and base64url encoded string. Returned in messages.get and drafts.get responses when the format=RAW parameter is supplied. *)
    sizeEstimate : int;
    (** Estimated size in bytes of the message. *)
    snippet : string;
    (** A short part of the message text. *)
    threadId : string;
    (** The ID of the thread the message belongs to. To add a message or draft to a thread, the following criteria must be met: 
- The requested threadId must be specified on the Message or Draft.Message you supply with your request. 
- The References and In-Reply-To headers must be set in compliance with the RFC 2822 standard. 
- The Subject headers must match. *)
    
  }
  
  val historyId : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val internalDate : (t, int64) GapiLens.t
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

module HistoryLabelRemoved :
sig
  type t = {
    labelIds : string list;
    (** Label IDs removed from the message. *)
    message : Message.t;
    (**  *)
    
  }
  
  val labelIds : (t, string list) GapiLens.t
  val message : (t, Message.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ForwardingAddress :
sig
  type t = {
    forwardingEmail : string;
    (** An email address to which messages can be forwarded. *)
    verificationStatus : string;
    (** Indicates whether this address has been verified and is usable for forwarding. Read-only. *)
    
  }
  
  val forwardingEmail : (t, string) GapiLens.t
  val verificationStatus : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ListForwardingAddressesResponse :
sig
  type t = {
    forwardingAddresses : ForwardingAddress.t list;
    (** List of addresses that may be used for forwarding. *)
    
  }
  
  val forwardingAddresses : (t, ForwardingAddress.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ImapSettings :
sig
  type t = {
    autoExpunge : bool;
    (** If this value is true, Gmail will immediately expunge a message when it is marked as deleted in IMAP. Otherwise, Gmail will wait for an update from the client before expunging messages marked as deleted. *)
    enabled : bool;
    (** Whether IMAP is enabled for the account. *)
    expungeBehavior : string;
    (** The action that will be executed on a message when it is marked as deleted and expunged from the last visible IMAP folder. *)
    maxFolderSize : int;
    (** An optional limit on the number of messages that an IMAP folder may contain. Legal values are 0, 1000, 2000, 5000 or 10000. A value of zero is interpreted to mean that there is no limit. *)
    
  }
  
  val autoExpunge : (t, bool) GapiLens.t
  val enabled : (t, bool) GapiLens.t
  val expungeBehavior : (t, string) GapiLens.t
  val maxFolderSize : (t, int) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

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

module LabelColor :
sig
  type t = {
    backgroundColor : string;
    (** The background color represented as hex string #RRGGBB (ex #000000). This field is required in order to set the color of a label. Only the following predefined set of color values are allowed:
#000000, #434343, #666666, #999999, #cccccc, #efefef, #f3f3f3, #ffffff, #fb4c2f, #ffad47, #fad165, #16a766, #43d692, #4a86e8, #a479e2, #f691b3, #f6c5be, #ffe6c7, #fef1d1, #b9e4d0, #c6f3de, #c9daf8, #e4d7f5, #fcdee8, #efa093, #ffd6a2, #fce8b3, #89d3b2, #a0eac9, #a4c2f4, #d0bcf1, #fbc8d9, #e66550, #ffbc6b, #fcda83, #44b984, #68dfa9, #6d9eeb, #b694e8, #f7a7c0, #cc3a21, #eaa041, #f2c960, #149e60, #3dc789, #3c78d8, #8e63ce, #e07798, #ac2b16, #cf8933, #d5ae49, #0b804b, #2a9c68, #285bac, #653e9b, #b65775, #822111, #a46a21, #aa8831, #076239, #1a764d, #1c4587, #41236d, #83334c *)
    textColor : string;
    (** The text color of the label, represented as hex string. This field is required in order to set the color of a label. Only the following predefined set of color values are allowed:
#000000, #434343, #666666, #999999, #cccccc, #efefef, #f3f3f3, #ffffff, #fb4c2f, #ffad47, #fad165, #16a766, #43d692, #4a86e8, #a479e2, #f691b3, #f6c5be, #ffe6c7, #fef1d1, #b9e4d0, #c6f3de, #c9daf8, #e4d7f5, #fcdee8, #efa093, #ffd6a2, #fce8b3, #89d3b2, #a0eac9, #a4c2f4, #d0bcf1, #fbc8d9, #e66550, #ffbc6b, #fcda83, #44b984, #68dfa9, #6d9eeb, #b694e8, #f7a7c0, #cc3a21, #eaa041, #f2c960, #149e60, #3dc789, #3c78d8, #8e63ce, #e07798, #ac2b16, #cf8933, #d5ae49, #0b804b, #2a9c68, #285bac, #653e9b, #b65775, #822111, #a46a21, #aa8831, #076239, #1a764d, #1c4587, #41236d, #83334c *)
    
  }
  
  val backgroundColor : (t, string) GapiLens.t
  val textColor : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Label :
sig
  type t = {
    color : LabelColor.t;
    (** The color to assign to the label. Color is only available for labels that have their type set to user. *)
    id : string;
    (** The immutable ID of the label. *)
    labelListVisibility : string;
    (** The visibility of the label in the label list in the Gmail web interface. *)
    messageListVisibility : string;
    (** The visibility of the label in the message list in the Gmail web interface. *)
    messagesTotal : int;
    (** The total number of messages with the label. *)
    messagesUnread : int;
    (** The number of unread messages with the label. *)
    name : string;
    (** The display name of the label. *)
    threadsTotal : int;
    (** The total number of threads with the label. *)
    threadsUnread : int;
    (** The number of unread threads with the label. *)
    _type : string;
    (** The owner type for the label. User labels are created by the user and can be modified and deleted by the user and can be applied to any message or thread. System labels are internally created and cannot be added, modified, or deleted. System labels may be able to be applied to or removed from messages and threads under some circumstances but this is not guaranteed. For example, users can apply and remove the INBOX and UNREAD labels from messages and threads, but cannot apply or remove the DRAFTS or SENT labels from messages or threads. *)
    
  }
  
  val color : (t, LabelColor.t) GapiLens.t
  val id : (t, string) GapiLens.t
  val labelListVisibility : (t, string) GapiLens.t
  val messageListVisibility : (t, string) GapiLens.t
  val messagesTotal : (t, int) GapiLens.t
  val messagesUnread : (t, int) GapiLens.t
  val name : (t, string) GapiLens.t
  val threadsTotal : (t, int) GapiLens.t
  val threadsUnread : (t, int) GapiLens.t
  val _type : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SmtpMsa :
sig
  type t = {
    host : string;
    (** The hostname of the SMTP service. Required. *)
    password : string;
    (** The password that will be used for authentication with the SMTP service. This is a write-only field that can be specified in requests to create or update SendAs settings; it is never populated in responses. *)
    port : int;
    (** The port of the SMTP service. Required. *)
    securityMode : string;
    (** The protocol that will be used to secure communication with the SMTP service. Required. *)
    username : string;
    (** The username that will be used for authentication with the SMTP service. This is a write-only field that can be specified in requests to create or update SendAs settings; it is never populated in responses. *)
    
  }
  
  val host : (t, string) GapiLens.t
  val password : (t, string) GapiLens.t
  val port : (t, int) GapiLens.t
  val securityMode : (t, string) GapiLens.t
  val username : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SendAs :
sig
  type t = {
    displayName : string;
    (** A name that appears in the "From:" header for mail sent using this alias. For custom "from" addresses, when this is empty, Gmail will populate the "From:" header with the name that is used for the primary address associated with the account. If the admin has disabled the ability for users to update their name format, requests to update this field for the primary login will silently fail. *)
    isDefault : bool;
    (** Whether this address is selected as the default "From:" address in situations such as composing a new message or sending a vacation auto-reply. Every Gmail account has exactly one default send-as address, so the only legal value that clients may write to this field is true. Changing this from false to true for an address will result in this field becoming false for the other previous default address. *)
    isPrimary : bool;
    (** Whether this address is the primary address used to login to the account. Every Gmail account has exactly one primary address, and it cannot be deleted from the collection of send-as aliases. This field is read-only. *)
    replyToAddress : string;
    (** An optional email address that is included in a "Reply-To:" header for mail sent using this alias. If this is empty, Gmail will not generate a "Reply-To:" header. *)
    sendAsEmail : string;
    (** The email address that appears in the "From:" header for mail sent using this alias. This is read-only for all operations except create. *)
    signature : string;
    (** An optional HTML signature that is included in messages composed with this alias in the Gmail web UI. *)
    smtpMsa : SmtpMsa.t;
    (** An optional SMTP service that will be used as an outbound relay for mail sent using this alias. If this is empty, outbound mail will be sent directly from Gmail's servers to the destination SMTP service. This setting only applies to custom "from" aliases. *)
    treatAsAlias : bool;
    (** Whether Gmail should  treat this address as an alias for the user's primary email address. This setting only applies to custom "from" aliases. *)
    verificationStatus : string;
    (** Indicates whether this address has been verified for use as a send-as alias. Read-only. This setting only applies to custom "from" aliases. *)
    
  }
  
  val displayName : (t, string) GapiLens.t
  val isDefault : (t, bool) GapiLens.t
  val isPrimary : (t, bool) GapiLens.t
  val replyToAddress : (t, string) GapiLens.t
  val sendAsEmail : (t, string) GapiLens.t
  val signature : (t, string) GapiLens.t
  val smtpMsa : (t, SmtpMsa.t) GapiLens.t
  val treatAsAlias : (t, bool) GapiLens.t
  val verificationStatus : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ListSendAsResponse :
sig
  type t = {
    sendAs : SendAs.t list;
    (** List of send-as aliases. *)
    
  }
  
  val sendAs : (t, SendAs.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Profile :
sig
  type t = {
    emailAddress : string;
    (** The user's email address. *)
    historyId : string;
    (** The ID of the mailbox's current history record. *)
    messagesTotal : int;
    (** The total number of messages in the mailbox. *)
    threadsTotal : int;
    (** The total number of threads in the mailbox. *)
    
  }
  
  val emailAddress : (t, string) GapiLens.t
  val historyId : (t, string) GapiLens.t
  val messagesTotal : (t, int) GapiLens.t
  val threadsTotal : (t, int) GapiLens.t
  
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

module WatchResponse :
sig
  type t = {
    expiration : int64;
    (** When Gmail will stop sending notifications for mailbox updates (epoch millis). Call watch again before this time to renew the watch. *)
    historyId : string;
    (** The ID of the mailbox's current history record. *)
    
  }
  
  val expiration : (t, int64) GapiLens.t
  val historyId : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module HistoryLabelAdded :
sig
  type t = {
    labelIds : string list;
    (** Label IDs added to the message. *)
    message : Message.t;
    (**  *)
    
  }
  
  val labelIds : (t, string list) GapiLens.t
  val message : (t, Message.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module PopSettings :
sig
  type t = {
    accessWindow : string;
    (** The range of messages which are accessible via POP. *)
    disposition : string;
    (** The action that will be executed on a message after it has been fetched via POP. *)
    
  }
  
  val accessWindow : (t, string) GapiLens.t
  val disposition : (t, string) GapiLens.t
  
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

module FilterCriteria :
sig
  type t = {
    excludeChats : bool;
    (** Whether the response should exclude chats. *)
    from : string;
    (** The sender's display name or email address. *)
    hasAttachment : bool;
    (** Whether the message has any attachment. *)
    negatedQuery : string;
    (** Only return messages not matching the specified query. Supports the same query format as the Gmail search box. For example, "from:someuser\@example.com rfc822msgid: is:unread". *)
    query : string;
    (** Only return messages matching the specified query. Supports the same query format as the Gmail search box. For example, "from:someuser\@example.com rfc822msgid: is:unread". *)
    size : int;
    (** The size of the entire RFC822 message in bytes, including all headers and attachments. *)
    sizeComparison : string;
    (** How the message size in bytes should be in relation to the size field. *)
    subject : string;
    (** Case-insensitive phrase found in the message's subject. Trailing and leading whitespace are be trimmed and adjacent spaces are collapsed. *)
    _to : string;
    (** The recipient's display name or email address. Includes recipients in the "to", "cc", and "bcc" header fields. You can use simply the local part of the email address. For example, "example" and "example\@" both match "example\@gmail.com". This field is case-insensitive. *)
    
  }
  
  val excludeChats : (t, bool) GapiLens.t
  val from : (t, string) GapiLens.t
  val hasAttachment : (t, bool) GapiLens.t
  val negatedQuery : (t, string) GapiLens.t
  val query : (t, string) GapiLens.t
  val size : (t, int) GapiLens.t
  val sizeComparison : (t, string) GapiLens.t
  val subject : (t, string) GapiLens.t
  val _to : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module FilterAction :
sig
  type t = {
    addLabelIds : string list;
    (** List of labels to add to the message. *)
    forward : string;
    (** Email address that the message should be forwarded to. *)
    removeLabelIds : string list;
    (** List of labels to remove from the message. *)
    
  }
  
  val addLabelIds : (t, string list) GapiLens.t
  val forward : (t, string) GapiLens.t
  val removeLabelIds : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module Filter :
sig
  type t = {
    action : FilterAction.t;
    (** Action that the filter performs. *)
    criteria : FilterCriteria.t;
    (** Matching criteria for the filter. *)
    id : string;
    (** The server assigned ID of the filter. *)
    
  }
  
  val action : (t, FilterAction.t) GapiLens.t
  val criteria : (t, FilterCriteria.t) GapiLens.t
  val id : (t, string) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module ListFiltersResponse :
sig
  type t = {
    filter : Filter.t list;
    (** List of a user's filters. *)
    
  }
  
  val filter : (t, Filter.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module VacationSettings :
sig
  type t = {
    enableAutoReply : bool;
    (** Flag that controls whether Gmail automatically replies to messages. *)
    endTime : int64;
    (** An optional end time for sending auto-replies (epoch ms). When this is specified, Gmail will automatically reply only to messages that it receives before the end time. If both startTime and endTime are specified, startTime must precede endTime. *)
    responseBodyHtml : string;
    (** Response body in HTML format. Gmail will sanitize the HTML before storing it. *)
    responseBodyPlainText : string;
    (** Response body in plain text format. *)
    responseSubject : string;
    (** Optional text to prepend to the subject line in vacation responses. In order to enable auto-replies, either the response subject or the response body must be nonempty. *)
    restrictToContacts : bool;
    (** Flag that determines whether responses are sent to recipients who are not in the user's list of contacts. *)
    restrictToDomain : bool;
    (** Flag that determines whether responses are sent to recipients who are outside of the user's domain. This feature is only available for G Suite users. *)
    startTime : int64;
    (** An optional start time for sending auto-replies (epoch ms). When this is specified, Gmail will automatically reply only to messages that it receives after the start time. If both startTime and endTime are specified, startTime must precede endTime. *)
    
  }
  
  val enableAutoReply : (t, bool) GapiLens.t
  val endTime : (t, int64) GapiLens.t
  val responseBodyHtml : (t, string) GapiLens.t
  val responseBodyPlainText : (t, string) GapiLens.t
  val responseSubject : (t, string) GapiLens.t
  val restrictToContacts : (t, bool) GapiLens.t
  val restrictToDomain : (t, bool) GapiLens.t
  val startTime : (t, int64) GapiLens.t
  
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

module HistoryMessageAdded :
sig
  type t = {
    message : Message.t;
    (**  *)
    
  }
  
  val message : (t, Message.t) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module HistoryMessageDeleted :
sig
  type t = {
    message : Message.t;
    (**  *)
    
  }
  
  val message : (t, Message.t) GapiLens.t
  
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
    labelsAdded : HistoryLabelAdded.t list;
    (** Labels added to messages in this history record. *)
    labelsRemoved : HistoryLabelRemoved.t list;
    (** Labels removed from messages in this history record. *)
    messages : Message.t list;
    (** List of messages changed in this history record. The fields for specific change types, such as messagesAdded may duplicate messages in this field. We recommend using the specific change-type fields instead of this. *)
    messagesAdded : HistoryMessageAdded.t list;
    (** Messages added to the mailbox in this history record. *)
    messagesDeleted : HistoryMessageDeleted.t list;
    (** Messages deleted (not Trashed) from the mailbox in this history record. *)
    
  }
  
  val id : (t, string) GapiLens.t
  val labelsAdded : (t, HistoryLabelAdded.t list) GapiLens.t
  val labelsRemoved : (t, HistoryLabelRemoved.t list) GapiLens.t
  val messages : (t, Message.t list) GapiLens.t
  val messagesAdded : (t, HistoryMessageAdded.t list) GapiLens.t
  val messagesDeleted : (t, HistoryMessageDeleted.t list) GapiLens.t
  
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
    (** List of history records. Any messages contained in the response will typically only have id and threadId fields populated. *)
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

module BatchModifyMessagesRequest :
sig
  type t = {
    addLabelIds : string list;
    (** A list of label IDs to add to messages. *)
    ids : string list;
    (** The IDs of the messages to modify. There is a limit of 1000 ids per request. *)
    removeLabelIds : string list;
    (** A list of label IDs to remove from messages. *)
    
  }
  
  val addLabelIds : (t, string list) GapiLens.t
  val ids : (t, string list) GapiLens.t
  val removeLabelIds : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module WatchRequest :
sig
  type t = {
    labelFilterAction : string;
    (** Filtering behavior of labelIds list specified. *)
    labelIds : string list;
    (** List of label_ids to restrict notifications about. By default, if unspecified, all changes are pushed out. If specified then dictates which labels are required for a push notification to be generated. *)
    topicName : string;
    (** A fully qualified Google Cloud Pub/Sub API topic name to publish the events to. This topic name **must** already exist in Cloud Pub/Sub and you **must** have already granted gmail "publish" permission on it. For example, "projects/my-project-identifier/topics/my-topic-name" (using the Cloud Pub/Sub "v1" topic naming format).

Note that the "my-project-identifier" portion must exactly match your Google developer project id (the one executing this watch request). *)
    
  }
  
  val labelFilterAction : (t, string) GapiLens.t
  val labelIds : (t, string list) GapiLens.t
  val topicName : (t, string) GapiLens.t
  
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

module BatchDeleteMessagesRequest :
sig
  type t = {
    ids : string list;
    (** The IDs of the messages to delete. *)
    
  }
  
  val ids : (t, string list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module SmimeInfo :
sig
  type t = {
    encryptedKeyPassword : string;
    (** Encrypted key password, when key is encrypted. *)
    expiration : int64;
    (** When the certificate expires (in milliseconds since epoch). *)
    id : string;
    (** The immutable ID for the SmimeInfo. *)
    isDefault : bool;
    (** Whether this SmimeInfo is the default one for this user's send-as address. *)
    issuerCn : string;
    (** The S/MIME certificate issuer's common name. *)
    pem : string;
    (** PEM formatted X509 concatenated certificate string (standard base64 encoding). Format used for returning key, which includes public key as well as certificate chain (not private key). *)
    pkcs12 : string;
    (** PKCS#12 format containing a single private/public key pair and certificate chain. This format is only accepted from client for creating a new SmimeInfo and is never returned, because the private key is not intended to be exported. PKCS#12 may be encrypted, in which case encryptedKeyPassword should be set appropriately. *)
    
  }
  
  val encryptedKeyPassword : (t, string) GapiLens.t
  val expiration : (t, int64) GapiLens.t
  val id : (t, string) GapiLens.t
  val isDefault : (t, bool) GapiLens.t
  val issuerCn : (t, string) GapiLens.t
  val pem : (t, string) GapiLens.t
  val pkcs12 : (t, string) GapiLens.t
  
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

module ListSmimeInfoResponse :
sig
  type t = {
    smimeInfo : SmimeInfo.t list;
    (** List of SmimeInfo. *)
    
  }
  
  val smimeInfo : (t, SmimeInfo.t list) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

module AutoForwarding :
sig
  type t = {
    disposition : string;
    (** The state that a message should be left in after it has been forwarded. *)
    emailAddress : string;
    (** Email address to which all incoming messages are forwarded. This email address must be a verified member of the forwarding addresses. *)
    enabled : bool;
    (** Whether all incoming mail is automatically forwarded to another address. *)
    
  }
  
  val disposition : (t, string) GapiLens.t
  val emailAddress : (t, string) GapiLens.t
  val enabled : (t, bool) GapiLens.t
  
  val empty : t
  
  val render : t -> GapiJson.json_data_model list
  
  val parse : t -> GapiJson.json_data_model -> t
  
  val to_data_model : t -> GapiJson.json_data_model
  
  val of_data_model : GapiJson.json_data_model -> t
  
end

