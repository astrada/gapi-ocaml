module ClientLogin =
struct
  type auth_token = string

  type captcha =
      { url : string;
        token : string }

end

module OAuth1 =
struct
  type request_token =
      { request_token : string;
        request_token_secret : string;
        callback_confirmed : bool }

  type auth_token =
      { auth_token : string;
        verifier : string }

  type access_token =
      { access_token : string;
        access_token_secret : string }

end

module AuthSub =
struct
  type token_info =
      { target : string;
        scope : string;
        secure : bool
      }

end

module OAuth2 =
struct
  type auth_code = string

  type access_token =
      { access_token : string;
        token_type : string;
        expires_in : int;
        refresh_token : string
      }

end

type t =
    ClientLoginAuthToken of ClientLogin.auth_token
  | ClientLoginCaptcha of ClientLogin.captcha
  | OAuth1RequestToken of OAuth1.request_token
  | OAuth1AuthorizeToken of OAuth1.auth_token
  | OAuth1GetAccessToken of OAuth1.access_token
  | AuthSubTokenInfo of AuthSub.token_info
  | OAuth2AuthCode of OAuth2.auth_code
  | OAuth2AccessToken of OAuth2.access_token

