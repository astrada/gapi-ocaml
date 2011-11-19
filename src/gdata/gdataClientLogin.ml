module Error =
struct
  type t =
      BadAuthentication
    | NotVerified
    | TermsNotAgreed
    | CaptchaRequired
    | Unknown
    | AccountDeleted
    | AccountDisabled
    | ServiceDisabled
    | ServiceUnavailable
    | GenericError of string

  let of_string s =
    match s with
        "BadAuthentication" -> BadAuthentication
      | "NotVerified" -> NotVerified
      | "TermsNotAgreed" -> TermsNotAgreed
      | "CaptchaRequired" -> CaptchaRequired
      | "Unknown" -> Unknown
      | "AccountDeleted" -> AccountDeleted
      | "AccountDisabled" -> AccountDisabled
      | "ServiceDisabled" -> ServiceDisabled
      | "ServiceUnavailable" -> ServiceUnavailable
      | s -> GenericError s

  let description error =
    match error with
        BadAuthentication -> "Invalid username or password."
      | NotVerified -> "The account email address has not been verified."
      | TermsNotAgreed -> "The user has not agreed to terms."
      | CaptchaRequired -> "A CAPTCHA is required."
      | Unknown -> "Unknown or unspecified error."
      | AccountDeleted -> "The user account has been deleted."
      | AccountDisabled -> "The user account has been disabled."
      | ServiceDisabled -> "The user's access to the specified service has been disabled."
      | ServiceUnavailable -> "The service is not available; try again later."
      | GenericError s -> s

end

module Service =
struct
  type t =
      GoogleAnalytics
    | GoogleApps
    | GoogleBase
    | GoogleSites
    | Blogger
    | BookSearch
    | Calendar
    | GoogleCodeSearch
    | Contacts
    | DocumentsList
    | Finance
    | Gmail
    | Health
    | HealthSandbox
    | Maps
    | Picasa
    | Sidewiki
    | Spreadsheets
    | WebmasterTools
    | YouTube
    | OtherService of string

  let string_of service =
    match service with
        GoogleAnalytics -> "analytics"
      | GoogleApps -> "apps"
      | GoogleBase -> "gbase"
      | GoogleSites -> "jotspot"
      | Blogger -> "blogger"
      | BookSearch -> "print"
      | Calendar -> "cl"
      | GoogleCodeSearch -> "codesearch"
      | Contacts -> "cp"
      | DocumentsList -> "writely"
      | Finance -> "finance"
      | Gmail -> "mail"
      | Health -> "health"
      | HealthSandbox -> "weaver"
      | Maps -> "local"
      | Picasa -> "lh2"
      | Sidewiki -> "annotateweb"
      | Spreadsheets -> "wise"
      | WebmasterTools -> "sitemaps"
      | YouTube -> "youtube"
      | OtherService s -> s

end

exception LoginException of Error.t

let get_auth_token
      ?(account_type = "HOSTED_OR_GOOGLE")
      ?(url = "https://www.google.com/accounts/ClientLogin")
      ~email
      ~password
      ~source
      ~service
      session =
  let rec parse_next_line pipe =
    try
      let line = GdataPipe.OcamlnetPipe.read_line pipe in
      let (key, value) = ExtString.String.split line "=" in
        match key with
            "Auth" ->
              GdataConversation.Done (GdataAuthResponse.ClientLoginAuthToken
                                        value)
          | "Error" ->
              GdataConversation.Error value
          | _ ->
              GdataConversation.Continue parse_next_line
    with End_of_file ->
      GdataConversation.Error
        "Invalid response: authentication token not found" in 
  let parse_login_response pipe _ _ _ =
    GdataConversation.loop parse_next_line pipe in
  let post_data = GapiCore.PostData.Fields
                    [("Email", email);
                     ("Passwd", password);
                     ("accountType", account_type);
                     ("source", source);
                     ("service", (Service.string_of service))]
  in
    try
      GdataConversation.request
        ~post_data
        GapiCore.HttpMethod.POST
        session
        url
        parse_login_response
    with GdataConversation.ConversationException message ->
      raise (LoginException (Error.of_string message))

