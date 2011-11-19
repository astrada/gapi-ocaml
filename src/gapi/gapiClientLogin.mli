module Error :
sig
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

  val of_string : string -> t

  val description : t -> string

end

module Service :
sig
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

  val string_of : t -> string

end

exception LoginException of Error.t

val get_auth_token :
  ?account_type:string ->
  ?url:string ->
  email:string ->
  password:string ->
  source:string ->
  service:Service.t ->
  GapiConversation.Session.t ->
  GapiAuthResponse.t * GapiConversation.Session.t

