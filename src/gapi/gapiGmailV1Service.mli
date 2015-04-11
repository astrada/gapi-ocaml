(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Gmail API (v1).
  
  The Gmail REST API..
  
  For more information about this service, see the
  {{:https://developers.google.com/gmail/api/}API Documentation}.
  *)

module Scope :
sig
  val mail_google_com : string
  (** View and manage your mail *)
  
  val gmail_compose : string
  (** Manage drafts and send emails *)
  
  val gmail_insert : string
  (** Insert mail into your mailbox *)
  
  val gmail_labels : string
  (** Manage mailbox labels *)
  
  val gmail_modify : string
  (** View and modify but not delete your email *)
  
  val gmail_readonly : string
  (** View your emails messages and settings *)
  
  
end
(** Service Auth Scopes *)

module UsersResource :
sig
  module Threads :
  sig
    
    module Format :
    sig
      type t =
        | Default
        | Full (**  *)
        | Metadata (**  *)
        | Minimal (**  *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    (** Immediately and permanently deletes the specified thread. This operation cannot be undone. Prefer threads.trash instead.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id ID of the Thread to delete.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Gets the specified thread.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param format The format to return the messages in.
      @param metadataHeaders When given and format is METADATA, only include headers specified.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the thread to retrieve.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?format:Format.t ->
      ?metadataHeaders:string list ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Thread.t * GapiConversation.Session.t
    
    (** Lists the threads in the user's mailbox.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param includeSpamTrash Include threads from SPAM and TRASH in the results.
      @param maxResults Maximum number of threads to return.
      @param labelIds Only return threads with labels that match all of the specified label IDs.
      @param pageToken Page token to retrieve a specific page of results in the list.
      @param q Only return threads matching the specified query. Supports the same query format as the Gmail search box. For example, "from:someuser@example.com rfc822msgid: is:unread".
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?includeSpamTrash:bool ->
      ?maxResults:int ->
      ?labelIds:string list ->
      ?pageToken:string ->
      ?q:string ->
      userId:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.ListThreadsResponse.t * GapiConversation.Session.t
    
    (** Modifies the labels applied to the thread. This applies to all messages in the thread.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the thread to modify.
      *)
    val modify :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiGmailV1Model.ModifyThreadRequest.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Thread.t * GapiConversation.Session.t
    
    (** Moves the specified thread to the trash.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the thread to Trash.
      *)
    val trash :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Thread.t * GapiConversation.Session.t
    
    (** Removes the specified thread from the trash.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the thread to remove from Trash.
      *)
    val untrash :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Thread.t * GapiConversation.Session.t
    
    
  end
  
  module Messages :
  sig
    module Attachments :
    sig
      
      (** Gets the specified message attachment.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param etag Optional ETag.
        @param std_params Optional standard parameters.
        @param userId The user's email address. The special value me can be used to indicate the authenticated user.
        @param messageId The ID of the message containing the attachment.
        @param id The ID of the attachment.
        *)
      val get :
        ?base_url:string ->
        ?etag:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        messageId:string ->
        id:string ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.MessagePartBody.t * GapiConversation.Session.t
      
      
    end
    
    
    module InternalDateSource :
    sig
      type t =
        | Default
        | DateHeader (**  *)
        | ReceivedTime (**  *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    module Format :
    sig
      type t =
        | Default
        | Full (**  *)
        | Metadata (**  *)
        | Minimal (**  *)
        | Raw (**  *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    (** Immediately and permanently deletes the specified message. This operation cannot be undone. Prefer messages.trash instead.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the message to delete.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Gets the specified message.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param format The format to return the message in.
      @param metadataHeaders When given and format is METADATA, only include headers specified.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the message to retrieve.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?format:Format.t ->
      ?metadataHeaders:string list ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Message.t * GapiConversation.Session.t
    
    (** Imports a message into only this user's mailbox, with standard email delivery scanning and classification similar to receiving via SMTP. Does not send a message.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param deleted Mark the email as permanently deleted (not TRASH) and only visible in Google Apps Vault to a Vault administrator. Only used for Google Apps for Work accounts.
      @param internalDateSource Source for Gmail's internal date of the message.
      @param neverMarkSpam Ignore the Gmail spam classifier decision and never mark this email as SPAM in the mailbox.
      @param processForCalendar Process calendar invites in the email and add any extracted meetings to the Google Calendar for this user.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val import :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?media_source:GapiMediaResource.t ->
      ?deleted:bool ->
      ?internalDateSource:InternalDateSource.t ->
      ?neverMarkSpam:bool ->
      ?processForCalendar:bool ->
      userId:string ->
      GapiGmailV1Model.Message.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Message.t * GapiConversation.Session.t
    
    (** Directly inserts a message into only this user's mailbox similar to IMAP APPEND, bypassing most scanning and classification. Does not send a message.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param deleted Mark the email as permanently deleted (not TRASH) and only visible in Google Apps Vault to a Vault administrator. Only used for Google Apps for Work accounts.
      @param internalDateSource Source for Gmail's internal date of the message.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val insert :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?media_source:GapiMediaResource.t ->
      ?deleted:bool ->
      ?internalDateSource:InternalDateSource.t ->
      userId:string ->
      GapiGmailV1Model.Message.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Message.t * GapiConversation.Session.t
    
    (** Lists the messages in the user's mailbox.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param includeSpamTrash Include messages from SPAM and TRASH in the results.
      @param maxResults Maximum number of messages to return.
      @param labelIds Only return messages with labels that match all of the specified label IDs.
      @param pageToken Page token to retrieve a specific page of results in the list.
      @param q Only return messages matching the specified query. Supports the same query format as the Gmail search box. For example, "from:someuser@example.com rfc822msgid: is:unread".
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?includeSpamTrash:bool ->
      ?maxResults:int ->
      ?labelIds:string list ->
      ?pageToken:string ->
      ?q:string ->
      userId:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.ListMessagesResponse.t * GapiConversation.Session.t
    
    (** Modifies the labels on the specified message.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the message to modify.
      *)
    val modify :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiGmailV1Model.ModifyMessageRequest.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Message.t * GapiConversation.Session.t
    
    (** Sends the specified message to the recipients in the To, Cc, and Bcc headers.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val send :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?media_source:GapiMediaResource.t ->
      userId:string ->
      GapiGmailV1Model.Message.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Message.t * GapiConversation.Session.t
    
    (** Moves the specified message to the trash.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the message to Trash.
      *)
    val trash :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Message.t * GapiConversation.Session.t
    
    (** Removes the specified message from the trash.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the message to remove from Trash.
      *)
    val untrash :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Message.t * GapiConversation.Session.t
    
    
  end
  
  module Labels :
  sig
    
    (** Creates a new label.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val create :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiGmailV1Model.Label.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Label.t * GapiConversation.Session.t
    
    (** Immediately and permanently deletes the specified label and removes it from any messages and threads that it is applied to.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the label to delete.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Gets the specified label.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the label to retrieve.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Label.t * GapiConversation.Session.t
    
    (** Lists all labels in the user's mailbox.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.ListLabelsResponse.t * GapiConversation.Session.t
    
    (** Updates the specified label. This method supports patch semantics.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the label to update.
      *)
    val patch :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiGmailV1Model.Label.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Label.t * GapiConversation.Session.t
    
    (** Updates the specified label.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the label to update.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiGmailV1Model.Label.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Label.t * GapiConversation.Session.t
    
    
  end
  
  module History :
  sig
    
    (** Lists the history of all changes to the given mailbox. History results are returned in chronological order (increasing historyId).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param maxResults The maximum number of history records to return.
      @param labelId Only return messages with a label matching the ID.
      @param pageToken Page token to retrieve a specific page of results in the list.
      @param startHistoryId Required. Returns history records after the specified startHistoryId. The supplied startHistoryId should be obtained from the historyId of a message, thread, or previous list response. History IDs increase chronologically but are not contiguous with random gaps in between valid IDs. Supplying an invalid or out of date startHistoryId typically returns an HTTP 404 error code. A historyId is typically valid for at least a week, but in some circumstances may be valid for only a few hours. If you receive an HTTP 404 error response, your application should perform a full sync. If you receive no nextPageToken in the response, there are no updates to retrieve and you can store the returned historyId for a future request.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?maxResults:int ->
      ?labelId:string ->
      ?pageToken:string ->
      ?startHistoryId:string ->
      userId:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.ListHistoryResponse.t * GapiConversation.Session.t
    
    
  end
  
  module Drafts :
  sig
    
    module Format :
    sig
      type t =
        | Default
        | Full (**  *)
        | Metadata (**  *)
        | Minimal (**  *)
        | Raw (**  *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    (** Creates a new draft with the DRAFT label.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val create :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?media_source:GapiMediaResource.t ->
      userId:string ->
      GapiGmailV1Model.Draft.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Draft.t * GapiConversation.Session.t
    
    (** Immediately and permanently deletes the specified draft. Does not simply trash it.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the draft to delete.
      *)
    val delete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Gets the specified draft.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param etag Optional ETag.
      @param std_params Optional standard parameters.
      @param format The format to return the draft in.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the draft to retrieve.
      *)
    val get :
      ?base_url:string ->
      ?etag:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?format:Format.t ->
      userId:string ->
      id:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Draft.t * GapiConversation.Session.t
    
    (** Lists the drafts in the user's mailbox.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param maxResults Maximum number of drafts to return.
      @param pageToken Page token to retrieve a specific page of results in the list.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?maxResults:int ->
      ?pageToken:string ->
      userId:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.ListDraftsResponse.t * GapiConversation.Session.t
    
    (** Sends the specified, existing draft to the recipients in the To, Cc, and Bcc headers.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val send :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?media_source:GapiMediaResource.t ->
      userId:string ->
      GapiGmailV1Model.Draft.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Message.t * GapiConversation.Session.t
    
    (** Replaces a draft's content.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      @param id The ID of the draft to update.
      *)
    val update :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?media_source:GapiMediaResource.t ->
      userId:string ->
      id:string ->
      GapiGmailV1Model.Draft.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.Draft.t * GapiConversation.Session.t
    
    
  end
  
  
  (** Gets the current user's Gmail profile.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
    @param std_params Optional standard parameters.
    @param userId The user's email address. The special value me can be used to indicate the authenticated user.
    *)
  val getProfile :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    userId:string ->
    GapiConversation.Session.t ->
    GapiGmailV1Model.Profile.t * GapiConversation.Session.t
  
  
end


