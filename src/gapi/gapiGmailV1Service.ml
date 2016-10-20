(* Warning! This file is generated. Modify at your own risk. *)

open GapiUtils.Infix
open GapiGmailV1Model

module Scope =
struct
  let mail_google_com = "https://mail.google.com/"
  
  let gmail_compose = "https://www.googleapis.com/auth/gmail.compose"
  
  let gmail_insert = "https://www.googleapis.com/auth/gmail.insert"
  
  let gmail_labels = "https://www.googleapis.com/auth/gmail.labels"
  
  let gmail_modify = "https://www.googleapis.com/auth/gmail.modify"
  
  let gmail_readonly = "https://www.googleapis.com/auth/gmail.readonly"
  
  let gmail_send = "https://www.googleapis.com/auth/gmail.send"
  
  
end

module UsersResource =
struct
  module Drafts =
  struct
    module Format =
    struct
      type t =
        | Default
        | Full
        | Metadata
        | Minimal
        | Raw
        
      let to_string = function
        | Default -> ""
        | Full -> "full"
        | Metadata -> "metadata"
        | Minimal -> "minimal"
        | Raw -> "raw"
        
      let of_string = function
        | "" -> Default
        | "full" -> Full
        | "metadata" -> Metadata
        | "minimal" -> Minimal
        | "raw" -> Raw
        | s -> failwith ("Unexpected value for Format:" ^ s)
    
    end
    
    module DraftsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        alt : string;
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* drafts-specific query parameters *)
        format : Format.t;
        maxResults : int;
        pageToken : string;
        
      }
      
      let default = {
        alt = "";
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        format = Format.Default;
        maxResults = 100;
        pageToken = "";
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.alt) (fun x -> x) "alt";
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.format) Format.to_string "format";
        param (fun p -> p.maxResults) string_of_int "maxResults";
        param (fun p -> p.pageToken) (fun x -> x) "pageToken";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(format = default.format)
          ?(maxResults = default.maxResults)
          ?(pageToken = default.pageToken)
          () =
        let parameters = {
          alt = standard_parameters.GapiService.StandardParameters.alt;
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          format;
          maxResults;
          pageToken;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let create
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ?media_source
          ~userId
          draft
          session =
      let base_path = [((fun x -> x) userId); "drafts"] in
      let media_path = [""; "resumable"; "upload"; "gmail"; "v1"; "users";
        ((fun x -> x) userId); "drafts"] in
      let path_to_add = if Option.is_some media_source then media_path
        else base_path in
      let full_url = GapiUtils.add_path_to_url path_to_add base_url in
      let params = DraftsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map DraftsParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters ?media_source
        ~data_to_post:(GapiJson.render_json Draft.to_data_model) ~data:draft
        full_url (GapiJson.parse_json_response Draft.of_data_model) session 
      
    let delete
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "drafts"; ((fun x -> x) id)] base_url in
      let params = DraftsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map DraftsParameters.to_key_value_list
        params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let get
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?etag
          ?std_params
          ?(format = Format.Default)
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "drafts"; ((fun x -> x) id)] base_url in
      let params = DraftsParameters.merge_parameters
        ?standard_parameters:std_params ~format () in
      let query_parameters = Option.map DraftsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response Draft.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ?(maxResults = 100)
          ?pageToken
          ~userId
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "drafts"] base_url in
      let params = DraftsParameters.merge_parameters
        ?standard_parameters:std_params ~maxResults ?pageToken () in
      let query_parameters = Option.map DraftsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response ListDraftsResponse.of_data_model)
        session 
      
    let send
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ?media_source
          ~userId
          draft
          session =
      let base_path = [((fun x -> x) userId); "drafts"; "send"] in
      let media_path = [""; "resumable"; "upload"; "gmail"; "v1"; "users";
        ((fun x -> x) userId); "drafts"; "send"] in
      let path_to_add = if Option.is_some media_source then media_path
        else base_path in
      let full_url = GapiUtils.add_path_to_url path_to_add base_url in
      let params = DraftsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map DraftsParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters ?media_source
        ~data_to_post:(GapiJson.render_json Draft.to_data_model) ~data:draft
        full_url (GapiJson.parse_json_response Message.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ?media_source
          ~userId
          ~id
          draft
          session =
      let base_path = [((fun x -> x) userId); "drafts"; ((fun x -> x) id)] in
      let media_path = [""; "resumable"; "upload"; "gmail"; "v1"; "users";
        ((fun x -> x) userId); "drafts"; ((fun x -> x) id)] in
      let path_to_add = if Option.is_some media_source then media_path
        else base_path in
      let full_url = GapiUtils.add_path_to_url path_to_add base_url in
      let params = DraftsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map DraftsParameters.to_key_value_list
        params in
      GapiService.put ?query_parameters ?media_source
        ~data_to_post:(GapiJson.render_json Draft.to_data_model) ~data:draft
        full_url (GapiJson.parse_json_response Draft.of_data_model) session 
      
    
  end
  
  module History =
  struct
    module HistoryParameters =
    struct
      type t = {
        (* Standard query parameters *)
        alt : string;
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* history-specific query parameters *)
        labelId : string;
        maxResults : int;
        pageToken : string;
        startHistoryId : string;
        
      }
      
      let default = {
        alt = "";
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        labelId = "";
        maxResults = 100;
        pageToken = "";
        startHistoryId = "";
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.alt) (fun x -> x) "alt";
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.labelId) (fun x -> x) "labelId";
        param (fun p -> p.maxResults) string_of_int "maxResults";
        param (fun p -> p.pageToken) (fun x -> x) "pageToken";
        param (fun p -> p.startHistoryId) (fun x -> x) "startHistoryId";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(labelId = default.labelId)
          ?(maxResults = default.maxResults)
          ?(pageToken = default.pageToken)
          ?(startHistoryId = default.startHistoryId)
          () =
        let parameters = {
          alt = standard_parameters.GapiService.StandardParameters.alt;
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          labelId;
          maxResults;
          pageToken;
          startHistoryId;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let list
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ?(maxResults = 100)
          ?labelId
          ?pageToken
          ?startHistoryId
          ~userId
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "history"] base_url in
      let params = HistoryParameters.merge_parameters
        ?standard_parameters:std_params ?labelId ~maxResults ?pageToken
        ?startHistoryId () in
      let query_parameters = Option.map HistoryParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response ListHistoryResponse.of_data_model)
        session 
      
    
  end
  
  module Labels =
  struct
    let create
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          label
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "labels"] base_url in
      let params = GapiService.StandardParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        GapiService.StandardParameters.to_key_value_list params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json Label.to_data_model) ~data:label
        full_url (GapiJson.parse_json_response Label.of_data_model) session 
      
    let delete
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "labels"; ((fun x -> x) id)] base_url in
      let params = GapiService.StandardParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        GapiService.StandardParameters.to_key_value_list params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let get
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?etag
          ?std_params
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "labels"; ((fun x -> x) id)] base_url in
      let params = GapiService.StandardParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        GapiService.StandardParameters.to_key_value_list params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response Label.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "labels"] base_url in
      let params = GapiService.StandardParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        GapiService.StandardParameters.to_key_value_list params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response ListLabelsResponse.of_data_model)
        session 
      
    let patch
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          label
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "labels"; ((fun x -> x) id)] base_url in
      let params = GapiService.StandardParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        GapiService.StandardParameters.to_key_value_list params in
      GapiService.patch ?query_parameters
        ~data_to_post:(GapiJson.render_json Label.to_data_model) ~data:label
        full_url (GapiJson.parse_json_response Label.of_data_model) session 
      
    let update
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          label
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "labels"; ((fun x -> x) id)] base_url in
      let params = GapiService.StandardParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map
        GapiService.StandardParameters.to_key_value_list params in
      GapiService.put ?query_parameters
        ~data_to_post:(GapiJson.render_json Label.to_data_model) ~data:label
        full_url (GapiJson.parse_json_response Label.of_data_model) session 
      
    
  end
  
  module Messages =
  struct
    module Attachments =
    struct
      let get
            ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
            ?etag
            ?std_params
            ~userId
            ~messageId
            ~id
            session =
        let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
          "messages"; ((fun x -> x) messageId); "attachments";
          ((fun x -> x) id)] base_url in
        let params = GapiService.StandardParameters.merge_parameters
          ?standard_parameters:std_params () in
        let query_parameters = Option.map
          GapiService.StandardParameters.to_key_value_list params in
        GapiService.get ?query_parameters ?etag full_url
          (GapiJson.parse_json_response MessagePartBody.of_data_model)
          session 
        
      
    end
    
    module Format =
    struct
      type t =
        | Default
        | Full
        | Metadata
        | Minimal
        | Raw
        
      let to_string = function
        | Default -> ""
        | Full -> "full"
        | Metadata -> "metadata"
        | Minimal -> "minimal"
        | Raw -> "raw"
        
      let of_string = function
        | "" -> Default
        | "full" -> Full
        | "metadata" -> Metadata
        | "minimal" -> Minimal
        | "raw" -> Raw
        | s -> failwith ("Unexpected value for Format:" ^ s)
    
    end
    
    module InternalDateSource =
    struct
      type t =
        | Default
        | DateHeader
        | ReceivedTime
        
      let to_string = function
        | Default -> ""
        | DateHeader -> "dateHeader"
        | ReceivedTime -> "receivedTime"
        
      let of_string = function
        | "" -> Default
        | "dateHeader" -> DateHeader
        | "receivedTime" -> ReceivedTime
        | s -> failwith ("Unexpected value for InternalDateSource:" ^ s)
    
    end
    
    module MessagesParameters =
    struct
      type t = {
        (* Standard query parameters *)
        alt : string;
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* messages-specific query parameters *)
        deleted : bool;
        format : Format.t;
        includeSpamTrash : bool;
        internalDateSource : InternalDateSource.t;
        labelIds : string list;
        maxResults : int;
        metadataHeaders : string list;
        neverMarkSpam : bool;
        pageToken : string;
        processForCalendar : bool;
        q : string;
        
      }
      
      let default = {
        alt = "";
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        deleted = false;
        format = Format.Default;
        includeSpamTrash = false;
        internalDateSource = InternalDateSource.Default;
        labelIds = [];
        maxResults = 100;
        metadataHeaders = [];
        neverMarkSpam = false;
        pageToken = "";
        processForCalendar = false;
        q = "";
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.alt) (fun x -> x) "alt";
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.deleted) string_of_bool "deleted";
        param (fun p -> p.format) Format.to_string "format";
        param (fun p -> p.includeSpamTrash) string_of_bool "includeSpamTrash";
        param (fun p -> p.internalDateSource) InternalDateSource.to_string "internalDateSource";
        GapiService.build_params qp (fun p -> p.labelIds) (fun x -> x) "labelIds";
        param (fun p -> p.maxResults) string_of_int "maxResults";
        GapiService.build_params qp (fun p -> p.metadataHeaders) (fun x -> x) "metadataHeaders";
        param (fun p -> p.neverMarkSpam) string_of_bool "neverMarkSpam";
        param (fun p -> p.pageToken) (fun x -> x) "pageToken";
        param (fun p -> p.processForCalendar) string_of_bool "processForCalendar";
        param (fun p -> p.q) (fun x -> x) "q";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(deleted = default.deleted)
          ?(format = default.format)
          ?(includeSpamTrash = default.includeSpamTrash)
          ?(internalDateSource = default.internalDateSource)
          ?(labelIds = default.labelIds)
          ?(maxResults = default.maxResults)
          ?(metadataHeaders = default.metadataHeaders)
          ?(neverMarkSpam = default.neverMarkSpam)
          ?(pageToken = default.pageToken)
          ?(processForCalendar = default.processForCalendar)
          ?(q = default.q)
          () =
        let parameters = {
          alt = standard_parameters.GapiService.StandardParameters.alt;
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          deleted;
          format;
          includeSpamTrash;
          internalDateSource;
          labelIds;
          maxResults;
          metadataHeaders;
          neverMarkSpam;
          pageToken;
          processForCalendar;
          q;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let delete
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "messages"; ((fun x -> x) id)] base_url in
      let params = MessagesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map MessagesParameters.to_key_value_list
        params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let get
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?etag
          ?std_params
          ?(format = Format.Default)
          ?metadataHeaders
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "messages"; ((fun x -> x) id)] base_url in
      let params = MessagesParameters.merge_parameters
        ?standard_parameters:std_params ~format ?metadataHeaders () in
      let query_parameters = Option.map MessagesParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response Message.of_data_model) session 
      
    let import
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ?media_source
          ?(deleted = false)
          ?(internalDateSource = InternalDateSource.Default)
          ?(neverMarkSpam = false)
          ?(processForCalendar = false)
          ~userId
          message
          session =
      let base_path = [((fun x -> x) userId); "messages"; "import"] in
      let media_path = [""; "resumable"; "upload"; "gmail"; "v1"; "users";
        ((fun x -> x) userId); "messages"; "import"] in
      let path_to_add = if Option.is_some media_source then media_path
        else base_path in
      let full_url = GapiUtils.add_path_to_url path_to_add base_url in
      let params = MessagesParameters.merge_parameters
        ?standard_parameters:std_params ~deleted ~internalDateSource
        ~neverMarkSpam ~processForCalendar () in
      let query_parameters = Option.map MessagesParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters ?media_source
        ~data_to_post:(GapiJson.render_json Message.to_data_model)
        ~data:message full_url
        (GapiJson.parse_json_response Message.of_data_model) session 
      
    let insert
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ?media_source
          ?(deleted = false)
          ?(internalDateSource = InternalDateSource.Default)
          ~userId
          message
          session =
      let base_path = [((fun x -> x) userId); "messages"] in
      let media_path = [""; "resumable"; "upload"; "gmail"; "v1"; "users";
        ((fun x -> x) userId); "messages"] in
      let path_to_add = if Option.is_some media_source then media_path
        else base_path in
      let full_url = GapiUtils.add_path_to_url path_to_add base_url in
      let params = MessagesParameters.merge_parameters
        ?standard_parameters:std_params ~deleted ~internalDateSource () in
      let query_parameters = Option.map MessagesParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters ?media_source
        ~data_to_post:(GapiJson.render_json Message.to_data_model)
        ~data:message full_url
        (GapiJson.parse_json_response Message.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ?(includeSpamTrash = false)
          ?(maxResults = 100)
          ?labelIds
          ?pageToken
          ?q
          ~userId
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "messages"] base_url in
      let params = MessagesParameters.merge_parameters
        ?standard_parameters:std_params ~includeSpamTrash ?labelIds
        ~maxResults ?pageToken ?q () in
      let query_parameters = Option.map MessagesParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response ListMessagesResponse.of_data_model)
        session 
      
    let modify
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          modifyMessageRequest
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "messages"; ((fun x -> x) id); "modify"] base_url in
      let params = MessagesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map MessagesParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json ModifyMessageRequest.to_data_model)
        ~data:modifyMessageRequest full_url
        (GapiJson.parse_json_response Message.of_data_model) session 
      
    let send
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ?media_source
          ~userId
          message
          session =
      let base_path = [((fun x -> x) userId); "messages"; "send"] in
      let media_path = [""; "resumable"; "upload"; "gmail"; "v1"; "users";
        ((fun x -> x) userId); "messages"; "send"] in
      let path_to_add = if Option.is_some media_source then media_path
        else base_path in
      let full_url = GapiUtils.add_path_to_url path_to_add base_url in
      let params = MessagesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map MessagesParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters ?media_source
        ~data_to_post:(GapiJson.render_json Message.to_data_model)
        ~data:message full_url
        (GapiJson.parse_json_response Message.of_data_model) session 
      
    let trash
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "messages"; ((fun x -> x) id); "trash"] base_url in
      let params = MessagesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map MessagesParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters ~data:Message.empty full_url
        (GapiJson.parse_json_response Message.of_data_model) session 
      
    let untrash
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "messages"; ((fun x -> x) id); "untrash"] base_url in
      let params = MessagesParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map MessagesParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters ~data:Message.empty full_url
        (GapiJson.parse_json_response Message.of_data_model) session 
      
    
  end
  
  module Threads =
  struct
    module Format =
    struct
      type t =
        | Default
        | Full
        | Metadata
        | Minimal
        
      let to_string = function
        | Default -> ""
        | Full -> "full"
        | Metadata -> "metadata"
        | Minimal -> "minimal"
        
      let of_string = function
        | "" -> Default
        | "full" -> Full
        | "metadata" -> Metadata
        | "minimal" -> Minimal
        | s -> failwith ("Unexpected value for Format:" ^ s)
    
    end
    
    module ThreadsParameters =
    struct
      type t = {
        (* Standard query parameters *)
        alt : string;
        fields : string;
        prettyPrint : bool;
        quotaUser : string;
        userIp : string;
        key : string;
        (* threads-specific query parameters *)
        format : Format.t;
        includeSpamTrash : bool;
        labelIds : string list;
        maxResults : int;
        metadataHeaders : string list;
        pageToken : string;
        q : string;
        
      }
      
      let default = {
        alt = "";
        fields = "";
        prettyPrint = true;
        quotaUser = "";
        userIp = "";
        key = "";
        format = Format.Default;
        includeSpamTrash = false;
        labelIds = [];
        maxResults = 100;
        metadataHeaders = [];
        pageToken = "";
        q = "";
        
      }
      
      let to_key_value_list qp =
        let param get_value to_string name =
          GapiService.build_param default qp get_value to_string name in [
        param (fun p -> p.alt) (fun x -> x) "alt";
        param (fun p -> p.fields) (fun x -> x) "fields";
        param (fun p -> p.prettyPrint) string_of_bool "prettyPrint";
        param (fun p -> p.quotaUser) (fun x -> x) "quotaUser";
        param (fun p -> p.userIp) (fun x -> x) "userIp";
        param (fun p -> p.key) (fun x -> x) "key";
        param (fun p -> p.format) Format.to_string "format";
        param (fun p -> p.includeSpamTrash) string_of_bool "includeSpamTrash";
        GapiService.build_params qp (fun p -> p.labelIds) (fun x -> x) "labelIds";
        param (fun p -> p.maxResults) string_of_int "maxResults";
        GapiService.build_params qp (fun p -> p.metadataHeaders) (fun x -> x) "metadataHeaders";
        param (fun p -> p.pageToken) (fun x -> x) "pageToken";
        param (fun p -> p.q) (fun x -> x) "q";
        
      ] |> List.concat
      
      let merge_parameters
          ?(standard_parameters = GapiService.StandardParameters.default)
          ?(format = default.format)
          ?(includeSpamTrash = default.includeSpamTrash)
          ?(labelIds = default.labelIds)
          ?(maxResults = default.maxResults)
          ?(metadataHeaders = default.metadataHeaders)
          ?(pageToken = default.pageToken)
          ?(q = default.q)
          () =
        let parameters = {
          alt = standard_parameters.GapiService.StandardParameters.alt;
          fields = standard_parameters.GapiService.StandardParameters.fields;
          prettyPrint = standard_parameters.GapiService.StandardParameters.prettyPrint;
          quotaUser = standard_parameters.GapiService.StandardParameters.quotaUser;
          userIp = standard_parameters.GapiService.StandardParameters.userIp;
          key = standard_parameters.GapiService.StandardParameters.key;
          format;
          includeSpamTrash;
          labelIds;
          maxResults;
          metadataHeaders;
          pageToken;
          q;
          
        } in
        if parameters = default then None else Some parameters
      
    end
    
    let delete
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "threads"; ((fun x -> x) id)] base_url in
      let params = ThreadsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map ThreadsParameters.to_key_value_list
        params in
      GapiService.delete ?query_parameters full_url
        GapiRequest.parse_empty_response session 
      
    let get
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?etag
          ?std_params
          ?(format = Format.Default)
          ?metadataHeaders
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "threads"; ((fun x -> x) id)] base_url in
      let params = ThreadsParameters.merge_parameters
        ?standard_parameters:std_params ~format ?metadataHeaders () in
      let query_parameters = Option.map ThreadsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters ?etag full_url
        (GapiJson.parse_json_response Thread.of_data_model) session 
      
    let list
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ?(includeSpamTrash = false)
          ?(maxResults = 100)
          ?labelIds
          ?pageToken
          ?q
          ~userId
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "threads"] base_url in
      let params = ThreadsParameters.merge_parameters
        ?standard_parameters:std_params ~includeSpamTrash ?labelIds
        ~maxResults ?pageToken ?q () in
      let query_parameters = Option.map ThreadsParameters.to_key_value_list
        params in
      GapiService.get ?query_parameters full_url
        (GapiJson.parse_json_response ListThreadsResponse.of_data_model)
        session 
      
    let modify
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          modifyThreadRequest
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "threads"; ((fun x -> x) id); "modify"] base_url in
      let params = ThreadsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map ThreadsParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters
        ~data_to_post:(GapiJson.render_json ModifyThreadRequest.to_data_model)
        ~data:modifyThreadRequest full_url
        (GapiJson.parse_json_response Thread.of_data_model) session 
      
    let trash
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "threads"; ((fun x -> x) id); "trash"] base_url in
      let params = ThreadsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map ThreadsParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters ~data:Thread.empty full_url
        (GapiJson.parse_json_response Thread.of_data_model) session 
      
    let untrash
          ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
          ?std_params
          ~userId
          ~id
          session =
      let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
        "threads"; ((fun x -> x) id); "untrash"] base_url in
      let params = ThreadsParameters.merge_parameters
        ?standard_parameters:std_params () in
      let query_parameters = Option.map ThreadsParameters.to_key_value_list
        params in
      GapiService.post ?query_parameters ~data:Thread.empty full_url
        (GapiJson.parse_json_response Thread.of_data_model) session 
      
    
  end
  
  let getProfile
        ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
        ?std_params
        ~userId
        session =
    let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId);
      "profile"] base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.get ?query_parameters full_url
      (GapiJson.parse_json_response Profile.of_data_model) session 
    
  let stop
        ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
        ?std_params
        ~userId
        session =
    let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId); "stop"]
      base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters ~data:() full_url
      GapiRequest.parse_empty_response session 
    
  let watch
        ?(base_url = "https://www.googleapis.com/gmail/v1/users/")
        ?std_params
        ~userId
        watchRequest
        session =
    let full_url = GapiUtils.add_path_to_url [((fun x -> x) userId); "watch"]
      base_url in
    let params = GapiService.StandardParameters.merge_parameters
      ?standard_parameters:std_params () in
    let query_parameters = Option.map
      GapiService.StandardParameters.to_key_value_list params in
    GapiService.post ?query_parameters
      ~data_to_post:(GapiJson.render_json WatchRequest.to_data_model)
      ~data:watchRequest full_url
      (GapiJson.parse_json_response WatchResponse.of_data_model) session 
    
  
end

