module Option = GapiOption

module ClientLogin =
struct
  type auth_token = string

  type captcha = {
    url : string;
    token : string;
  }

  let url = {
    GapiLens.get = (fun x -> x.url);
    GapiLens.set = (fun v x -> { x with url = v })
  }
  let token = {
    GapiLens.get = (fun x -> x.token);
    GapiLens.set = (fun v x -> { x with token = v })
  }

end

module OAuth1 =
struct
  type request_token = {
    request_token : string;
    request_token_secret : string;
    callback_confirmed : bool;
  }

  let request_token = {
    GapiLens.get = (fun x -> x.request_token);
    GapiLens.set = (fun v x -> { x with request_token = v })
  }
  let request_token_secret = {
    GapiLens.get = (fun x -> x.request_token_secret);
    GapiLens.set = (fun v x -> { x with request_token_secret = v })
  }
  let callback_confirmed = {
    GapiLens.get = (fun x -> x.callback_confirmed);
    GapiLens.set = (fun v x -> { x with callback_confirmed = v })
  }

  type auth_token = {
    auth_token : string;
    verifier : string;
  }

  let auth_token = {
    GapiLens.get = (fun x -> x.auth_token);
    GapiLens.set = (fun v x -> { x with auth_token = v })
  }
  let verifier = {
    GapiLens.get = (fun x -> x.verifier);
    GapiLens.set = (fun v x -> { x with verifier = v })
  }

  type access_token = {
    access_token : string;
    access_token_secret : string;
  }

  let access_token = {
    GapiLens.get = (fun x -> x.access_token);
    GapiLens.set = (fun v x -> { x with access_token = v })
  }
  let access_token_secret = {
    GapiLens.get = (fun x -> x.access_token_secret);
    GapiLens.set = (fun v x -> { x with access_token_secret = v })
  }

end

module AuthSub =
struct
  type token_info = {
    target : string;
    scope : string;
    secure : bool;
  }

  let target = {
    GapiLens.get = (fun x -> x.target);
    GapiLens.set = (fun v x -> { x with target = v })
  }
  let scope = {
    GapiLens.get = (fun x -> x.scope);
    GapiLens.set = (fun v x -> { x with scope = v })
  }
  let secure = {
    GapiLens.get = (fun x -> x.secure);
    GapiLens.set = (fun v x -> { x with secure = v })
  }

end

module OAuth2 =
struct
  type auth_code = string

  type access_token = {
    access_token : string;
    token_type : string;
    expires_in : int;
    refresh_token : string;
  }

  let access_token = {
    GapiLens.get = (fun x -> x.access_token);
    GapiLens.set = (fun v x -> { x with access_token = v })
  }
  let token_type = {
    GapiLens.get = (fun x -> x.token_type);
    GapiLens.set = (fun v x -> { x with token_type = v })
  }
  let expires_in = {
    GapiLens.get = (fun x -> x.expires_in);
    GapiLens.set = (fun v x -> { x with expires_in = v })
  }
  let refresh_token = {
    GapiLens.get = (fun x -> x.refresh_token);
    GapiLens.set = (fun v x -> { x with refresh_token = v })
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

let client_login_auth_token = {
  GapiLens.get = (function ClientLoginAuthToken v -> Some v | _ -> None);
  GapiLens.set = (fun v _ -> ClientLoginAuthToken (Option.get v))
}
let client_login_captcha = {
  GapiLens.get = (function ClientLoginCaptcha v -> Some v | _ -> None);
  GapiLens.set = (fun v _ -> ClientLoginCaptcha (Option.get v))
}
let oauth1_request_token = {
  GapiLens.get = (function OAuth1RequestToken v -> Some v | _ -> None);
  GapiLens.set = (fun v _ -> OAuth1RequestToken (Option.get v))
}
let oauth1_authorize_token = {
  GapiLens.get = (function OAuth1AuthorizeToken v -> Some v | _ -> None);
  GapiLens.set = (fun v _ -> OAuth1AuthorizeToken (Option.get v))
}
let oauth1_get_access_token = {
  GapiLens.get = (function OAuth1GetAccessToken v -> Some v | _ -> None);
  GapiLens.set = (fun v _ -> OAuth1GetAccessToken (Option.get v))
}
let auth_sub_token_info = {
  GapiLens.get = (function AuthSubTokenInfo v -> Some v | _ -> None);
  GapiLens.set = (fun v _ -> AuthSubTokenInfo (Option.get v))
}
let oauth2_auth_code = {
  GapiLens.get = (function OAuth2AuthCode v -> Some v | _ -> None);
  GapiLens.set = (fun v _ -> OAuth2AuthCode (Option.get v))
}
let oauth2_access_token = {
  GapiLens.get = (function OAuth2AccessToken v -> Some v | _ -> None);
  GapiLens.set = (fun v _ -> OAuth2AccessToken (Option.get v))
}

