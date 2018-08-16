(* Warning! This file is generated. Modify at your own risk. *)

(** Service definition for Gmail API (v1).
  
  Access Gmail mailboxes including sending user email..
  
  For more information about this service, see the
  {{:https://developers.google.com/gmail/api/}API Documentation}.
  *)

module Scope :
sig
  val mail_google_com : string
  (** Read, send, delete, and manage your email *)
  
  val gmail_compose : string
  (** Manage drafts and send emails *)
  
  val gmail_insert : string
  (** Insert mail into your mailbox *)
  
  val gmail_labels : string
  (** Manage mailbox labels *)
  
  val gmail_metadata : string
  (** View your email message metadata such as labels and headers, but not the email body *)
  
  val gmail_modify : string
  (** View and modify but not delete your email *)
  
  val gmail_readonly : string
  (** View your email messages and settings *)
  
  val gmail_send : string
  (** Send email on your behalf *)
  
  val gmail_settings_basic : string
  (** Manage your basic mail settings *)
  
  val gmail_settings_sharing : string
  (** Manage your sensitive mail settings, including who can manage your mail *)
  
  
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
      @param q Only return threads matching the specified query. Supports the same query format as the Gmail search box. For example, "from:someuser@example.com rfc822msgid: is:unread". Parameter cannot be used when accessing the api using the gmail.metadata scope.
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
  
  module Settings :
  sig
    module SendAs :
    sig
      module SmimeInfo :
      sig
        
        (** Deletes the specified S/MIME config for the specified send-as alias.
          
          @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
          @param std_params Optional standard parameters.
          @param userId The user's email address. The special value me can be used to indicate the authenticated user.
          @param sendAsEmail The email address that appears in the "From:" header for mail sent using this alias.
          @param id The immutable ID for the SmimeInfo.
          *)
        val delete :
          ?base_url:string ->
          ?std_params:GapiService.StandardParameters.t ->
          userId:string ->
          sendAsEmail:string ->
          id:string ->
          GapiConversation.Session.t ->
          unit * GapiConversation.Session.t
        
        (** Gets the specified S/MIME config for the specified send-as alias.
          
          @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
          @param etag Optional ETag.
          @param std_params Optional standard parameters.
          @param userId The user's email address. The special value me can be used to indicate the authenticated user.
          @param sendAsEmail The email address that appears in the "From:" header for mail sent using this alias.
          @param id The immutable ID for the SmimeInfo.
          *)
        val get :
          ?base_url:string ->
          ?etag:string ->
          ?std_params:GapiService.StandardParameters.t ->
          userId:string ->
          sendAsEmail:string ->
          id:string ->
          GapiConversation.Session.t ->
          GapiGmailV1Model.SmimeInfo.t * GapiConversation.Session.t
        
        (** Insert (upload) the given S/MIME config for the specified send-as alias. Note that pkcs12 format is required for the key.
          
          @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
          @param std_params Optional standard parameters.
          @param userId The user's email address. The special value me can be used to indicate the authenticated user.
          @param sendAsEmail The email address that appears in the "From:" header for mail sent using this alias.
          *)
        val insert :
          ?base_url:string ->
          ?std_params:GapiService.StandardParameters.t ->
          userId:string ->
          sendAsEmail:string ->
          GapiGmailV1Model.SmimeInfo.t ->
          GapiConversation.Session.t ->
          GapiGmailV1Model.SmimeInfo.t * GapiConversation.Session.t
        
        (** Lists S/MIME configs for the specified send-as alias.
          
          @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
          @param std_params Optional standard parameters.
          @param userId The user's email address. The special value me can be used to indicate the authenticated user.
          @param sendAsEmail The email address that appears in the "From:" header for mail sent using this alias.
          *)
        val list :
          ?base_url:string ->
          ?std_params:GapiService.StandardParameters.t ->
          userId:string ->
          sendAsEmail:string ->
          GapiConversation.Session.t ->
          GapiGmailV1Model.ListSmimeInfoResponse.t * GapiConversation.Session.t
        
        (** Sets the default S/MIME config for the specified send-as alias.
          
          @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
          @param std_params Optional standard parameters.
          @param userId The user's email address. The special value me can be used to indicate the authenticated user.
          @param sendAsEmail The email address that appears in the "From:" header for mail sent using this alias.
          @param id The immutable ID for the SmimeInfo.
          *)
        val setDefault :
          ?base_url:string ->
          ?std_params:GapiService.StandardParameters.t ->
          userId:string ->
          sendAsEmail:string ->
          id:string ->
          GapiConversation.Session.t ->
          unit * GapiConversation.Session.t
        
        
      end
      
      
      (** Creates a custom "from" send-as alias. If an SMTP MSA is specified, Gmail will attempt to connect to the SMTP service to validate the configuration before creating the alias. If ownership verification is required for the alias, a message will be sent to the email address and the resource's verification status will be set to pending; otherwise, the resource will be created with verification status set to accepted. If a signature is provided, Gmail will sanitize the HTML before saving it with the alias.

This method is only available to service account clients that have been delegated domain-wide authority.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        *)
      val create :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        GapiGmailV1Model.SendAs.t ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.SendAs.t * GapiConversation.Session.t
      
      (** Deletes the specified send-as alias. Revokes any verification that may have been required for using it.

This method is only available to service account clients that have been delegated domain-wide authority.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        @param sendAsEmail The send-as alias to be deleted.
        *)
      val delete :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        sendAsEmail:string ->
        GapiConversation.Session.t ->
        unit * GapiConversation.Session.t
      
      (** Gets the specified send-as alias. Fails with an HTTP 404 error if the specified address is not a member of the collection.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param etag Optional ETag.
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        @param sendAsEmail The send-as alias to be retrieved.
        *)
      val get :
        ?base_url:string ->
        ?etag:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        sendAsEmail:string ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.SendAs.t * GapiConversation.Session.t
      
      (** Lists the send-as aliases for the specified account. The result includes the primary send-as address associated with the account as well as any custom "from" aliases.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        *)
      val list :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.ListSendAsResponse.t * GapiConversation.Session.t
      
      (** Updates a send-as alias. If a signature is provided, Gmail will sanitize the HTML before saving it with the alias.

Addresses other than the primary address for the account can only be updated by service account clients that have been delegated domain-wide authority. This method supports patch semantics.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        @param sendAsEmail The send-as alias to be updated.
        *)
      val patch :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        sendAsEmail:string ->
        GapiGmailV1Model.SendAs.t ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.SendAs.t * GapiConversation.Session.t
      
      (** Updates a send-as alias. If a signature is provided, Gmail will sanitize the HTML before saving it with the alias.

Addresses other than the primary address for the account can only be updated by service account clients that have been delegated domain-wide authority.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        @param sendAsEmail The send-as alias to be updated.
        *)
      val update :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        sendAsEmail:string ->
        GapiGmailV1Model.SendAs.t ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.SendAs.t * GapiConversation.Session.t
      
      (** Sends a verification email to the specified send-as alias address. The verification status must be pending.

This method is only available to service account clients that have been delegated domain-wide authority.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        @param sendAsEmail The send-as alias to be verified.
        *)
      val verify :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        sendAsEmail:string ->
        GapiConversation.Session.t ->
        unit * GapiConversation.Session.t
      
      
    end
    
    module ForwardingAddresses :
    sig
      
      (** Creates a forwarding address. If ownership verification is required, a message will be sent to the recipient and the resource's verification status will be set to pending; otherwise, the resource will be created with verification status set to accepted.

This method is only available to service account clients that have been delegated domain-wide authority.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        *)
      val create :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        GapiGmailV1Model.ForwardingAddress.t ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.ForwardingAddress.t * GapiConversation.Session.t
      
      (** Deletes the specified forwarding address and revokes any verification that may have been required.

This method is only available to service account clients that have been delegated domain-wide authority.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        @param forwardingEmail The forwarding address to be deleted.
        *)
      val delete :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        forwardingEmail:string ->
        GapiConversation.Session.t ->
        unit * GapiConversation.Session.t
      
      (** Gets the specified forwarding address.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param etag Optional ETag.
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        @param forwardingEmail The forwarding address to be retrieved.
        *)
      val get :
        ?base_url:string ->
        ?etag:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        forwardingEmail:string ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.ForwardingAddress.t * GapiConversation.Session.t
      
      (** Lists the forwarding addresses for the specified account.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        *)
      val list :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.ListForwardingAddressesResponse.t * GapiConversation.Session.t
      
      
    end
    
    module Filters :
    sig
      
      (** Creates a filter.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        *)
      val create :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        GapiGmailV1Model.Filter.t ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.Filter.t * GapiConversation.Session.t
      
      (** Deletes a filter.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        @param id The ID of the filter to be deleted.
        *)
      val delete :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        id:string ->
        GapiConversation.Session.t ->
        unit * GapiConversation.Session.t
      
      (** Gets a filter.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param etag Optional ETag.
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        @param id The ID of the filter to be fetched.
        *)
      val get :
        ?base_url:string ->
        ?etag:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        id:string ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.Filter.t * GapiConversation.Session.t
      
      (** Lists the message filters of a Gmail user.
        
        @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
        @param std_params Optional standard parameters.
        @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
        *)
      val list :
        ?base_url:string ->
        ?std_params:GapiService.StandardParameters.t ->
        userId:string ->
        GapiConversation.Session.t ->
        GapiGmailV1Model.ListFiltersResponse.t * GapiConversation.Session.t
      
      
    end
    
    
    (** Gets the auto-forwarding setting for the specified account.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
      *)
    val getAutoForwarding :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.AutoForwarding.t * GapiConversation.Session.t
    
    (** Gets IMAP settings.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
      *)
    val getImap :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.ImapSettings.t * GapiConversation.Session.t
    
    (** Gets POP settings.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
      *)
    val getPop :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.PopSettings.t * GapiConversation.Session.t
    
    (** Gets vacation responder settings.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
      *)
    val getVacation :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.VacationSettings.t * GapiConversation.Session.t
    
    (** Updates the auto-forwarding setting for the specified account. A verified forwarding address must be specified when auto-forwarding is enabled.

This method is only available to service account clients that have been delegated domain-wide authority.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
      *)
    val updateAutoForwarding :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiGmailV1Model.AutoForwarding.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.AutoForwarding.t * GapiConversation.Session.t
    
    (** Updates IMAP settings.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
      *)
    val updateImap :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiGmailV1Model.ImapSettings.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.ImapSettings.t * GapiConversation.Session.t
    
    (** Updates POP settings.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
      *)
    val updatePop :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiGmailV1Model.PopSettings.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.PopSettings.t * GapiConversation.Session.t
    
    (** Updates vacation responder settings.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId User's email address. The special value "me" can be used to indicate the authenticated user.
      *)
    val updateVacation :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiGmailV1Model.VacationSettings.t ->
      GapiConversation.Session.t ->
      GapiGmailV1Model.VacationSettings.t * GapiConversation.Session.t
    
    
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
    
    (** Deletes many messages by message ID. Provides no guarantees that messages were not already deleted or even existed at all.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val batchDelete :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiGmailV1Model.BatchDeleteMessagesRequest.t ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
    (** Modifies the labels on the specified messages.
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val batchModify :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      userId:string ->
      GapiGmailV1Model.BatchModifyMessagesRequest.t ->
      GapiConversation.Session.t ->
      unit * GapiConversation.Session.t
    
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
      @param deleted Mark the email as permanently deleted (not TRASH) and only visible in Google Vault to a Vault administrator. Only used for G Suite accounts.
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
      @param deleted Mark the email as permanently deleted (not TRASH) and only visible in Google Vault to a Vault administrator. Only used for G Suite accounts.
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
      @param q Only return messages matching the specified query. Supports the same query format as the Gmail search box. For example, "from:someuser@example.com rfc822msgid:<somemsgid@example.com> is:unread". Parameter cannot be used when accessing the api using the gmail.metadata scope.
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
    
    module HistoryTypes :
    sig
      type t =
        | Default
        | LabelAdded (**  *)
        | LabelRemoved (**  *)
        | MessageAdded (**  *)
        | MessageDeleted (**  *)
        
      val to_string : t -> string
      
      val of_string : string -> t
      
    end
    
    (** Lists the history of all changes to the given mailbox. History results are returned in chronological order (increasing historyId).
      
      @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
      @param std_params Optional standard parameters.
      @param maxResults The maximum number of history records to return.
      @param historyTypes History types to be returned by the function
      @param labelId Only return messages with a label matching the ID.
      @param pageToken Page token to retrieve a specific page of results in the list.
      @param startHistoryId Required. Returns history records after the specified startHistoryId. The supplied startHistoryId should be obtained from the historyId of a message, thread, or previous list response. History IDs increase chronologically but are not contiguous with random gaps in between valid IDs. Supplying an invalid or out of date startHistoryId typically returns an HTTP 404 error code. A historyId is typically valid for at least a week, but in some rare circumstances may be valid for only a few hours. If you receive an HTTP 404 error response, your application should perform a full sync. If you receive no nextPageToken in the response, there are no updates to retrieve and you can store the returned historyId for a future request.
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?maxResults:int ->
      ?historyTypes:HistoryTypes.t list ->
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
      @param includeSpamTrash Include drafts from SPAM and TRASH in the results.
      @param maxResults Maximum number of drafts to return.
      @param pageToken Page token to retrieve a specific page of results in the list.
      @param q Only return draft messages matching the specified query. Supports the same query format as the Gmail search box. For example, "from:someuser@example.com rfc822msgid: is:unread".
      @param userId The user's email address. The special value me can be used to indicate the authenticated user.
      *)
    val list :
      ?base_url:string ->
      ?std_params:GapiService.StandardParameters.t ->
      ?includeSpamTrash:bool ->
      ?maxResults:int ->
      ?pageToken:string ->
      ?q:string ->
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
  
  (** Stop receiving push notifications for the given user mailbox.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
    @param std_params Optional standard parameters.
    @param userId The user's email address. The special value me can be used to indicate the authenticated user.
    *)
  val stop :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    userId:string ->
    GapiConversation.Session.t ->
    unit * GapiConversation.Session.t
  
  (** Set up or update a push notification watch on the given user mailbox.
    
    @param base_url Service endpoint base URL (defaults to ["https://www.googleapis.com/gmail/v1/users/"]).
    @param std_params Optional standard parameters.
    @param userId The user's email address. The special value me can be used to indicate the authenticated user.
    *)
  val watch :
    ?base_url:string ->
    ?std_params:GapiService.StandardParameters.t ->
    userId:string ->
    GapiGmailV1Model.WatchRequest.t ->
    GapiConversation.Session.t ->
    GapiGmailV1Model.WatchResponse.t * GapiConversation.Session.t
  
  
end


