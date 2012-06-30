(* Warning! This file is generated. Modify at your own risk. *)

module Tokeninfo =
struct
  type t = {
    access_type : string;
    audience : string;
    email : string;
    expires_in : int;
    issued_to : string;
    scope : string;
    user_id : string;
    verified_email : bool;
    
  }
  
  let access_type = {
    GapiLens.get = (fun x -> x.access_type);
    GapiLens.set = (fun v x -> { x with access_type = v });
  }
  let audience = {
    GapiLens.get = (fun x -> x.audience);
    GapiLens.set = (fun v x -> { x with audience = v });
  }
  let email = {
    GapiLens.get = (fun x -> x.email);
    GapiLens.set = (fun v x -> { x with email = v });
  }
  let expires_in = {
    GapiLens.get = (fun x -> x.expires_in);
    GapiLens.set = (fun v x -> { x with expires_in = v });
  }
  let issued_to = {
    GapiLens.get = (fun x -> x.issued_to);
    GapiLens.set = (fun v x -> { x with issued_to = v });
  }
  let scope = {
    GapiLens.get = (fun x -> x.scope);
    GapiLens.set = (fun v x -> { x with scope = v });
  }
  let user_id = {
    GapiLens.get = (fun x -> x.user_id);
    GapiLens.set = (fun v x -> { x with user_id = v });
  }
  let verified_email = {
    GapiLens.get = (fun x -> x.verified_email);
    GapiLens.set = (fun v x -> { x with verified_email = v });
  }
  
  let empty = {
    access_type = "";
    audience = "";
    email = "";
    expires_in = 0;
    issued_to = "";
    scope = "";
    user_id = "";
    verified_email = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "access_type" x.access_type;
      GapiJson.render_string_value "audience" x.audience;
      GapiJson.render_string_value "email" x.email;
      GapiJson.render_int_value "expires_in" x.expires_in;
      GapiJson.render_string_value "issued_to" x.issued_to;
      GapiJson.render_string_value "scope" x.scope;
      GapiJson.render_string_value "user_id" x.user_id;
      GapiJson.render_bool_value "verified_email" x.verified_email;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "access_type"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with access_type = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "audience"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with audience = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "email"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with email = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "expires_in"; data_type = GapiJson.Scalar },
        Json_type.Int v) ->
      { x with expires_in = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "issued_to"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with issued_to = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "scope"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with scope = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "user_id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with user_id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "verified_email"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with verified_email = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiOauth2V2Model.Tokeninfo.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Userinfo =
struct
  type t = {
    birthday : string;
    email : string;
    family_name : string;
    gender : string;
    given_name : string;
    id : string;
    link : string;
    locale : string;
    name : string;
    picture : string;
    timezone : string;
    verified_email : bool;
    
  }
  
  let birthday = {
    GapiLens.get = (fun x -> x.birthday);
    GapiLens.set = (fun v x -> { x with birthday = v });
  }
  let email = {
    GapiLens.get = (fun x -> x.email);
    GapiLens.set = (fun v x -> { x with email = v });
  }
  let family_name = {
    GapiLens.get = (fun x -> x.family_name);
    GapiLens.set = (fun v x -> { x with family_name = v });
  }
  let gender = {
    GapiLens.get = (fun x -> x.gender);
    GapiLens.set = (fun v x -> { x with gender = v });
  }
  let given_name = {
    GapiLens.get = (fun x -> x.given_name);
    GapiLens.set = (fun v x -> { x with given_name = v });
  }
  let id = {
    GapiLens.get = (fun x -> x.id);
    GapiLens.set = (fun v x -> { x with id = v });
  }
  let link = {
    GapiLens.get = (fun x -> x.link);
    GapiLens.set = (fun v x -> { x with link = v });
  }
  let locale = {
    GapiLens.get = (fun x -> x.locale);
    GapiLens.set = (fun v x -> { x with locale = v });
  }
  let name = {
    GapiLens.get = (fun x -> x.name);
    GapiLens.set = (fun v x -> { x with name = v });
  }
  let picture = {
    GapiLens.get = (fun x -> x.picture);
    GapiLens.set = (fun v x -> { x with picture = v });
  }
  let timezone = {
    GapiLens.get = (fun x -> x.timezone);
    GapiLens.set = (fun v x -> { x with timezone = v });
  }
  let verified_email = {
    GapiLens.get = (fun x -> x.verified_email);
    GapiLens.set = (fun v x -> { x with verified_email = v });
  }
  
  let empty = {
    birthday = "";
    email = "";
    family_name = "";
    gender = "";
    given_name = "";
    id = "";
    link = "";
    locale = "";
    name = "";
    picture = "";
    timezone = "";
    verified_email = false;
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "birthday" x.birthday;
      GapiJson.render_string_value "email" x.email;
      GapiJson.render_string_value "family_name" x.family_name;
      GapiJson.render_string_value "gender" x.gender;
      GapiJson.render_string_value "given_name" x.given_name;
      GapiJson.render_string_value "id" x.id;
      GapiJson.render_string_value "link" x.link;
      GapiJson.render_string_value "locale" x.locale;
      GapiJson.render_string_value "name" x.name;
      GapiJson.render_string_value "picture" x.picture;
      GapiJson.render_string_value "timezone" x.timezone;
      GapiJson.render_bool_value "verified_email" x.verified_email;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "birthday"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with birthday = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "email"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with email = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "family_name"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with family_name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "gender"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with gender = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "given_name"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with given_name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "id"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with id = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "link"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with link = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "locale"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with locale = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with name = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "picture"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with picture = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "timezone"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with timezone = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "verified_email"; data_type = GapiJson.Scalar },
        Json_type.Bool v) ->
      { x with verified_email = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiOauth2V2Model.Userinfo.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

module Oauth2IssueTokenV2Response =
struct
  module Consent =
  struct
    module Scopes =
    struct
      type t = {
        description : string;
        detail : string;
        
      }
      
      let description = {
        GapiLens.get = (fun x -> x.description);
        GapiLens.set = (fun v x -> { x with description = v });
      }
      let detail = {
        GapiLens.get = (fun x -> x.detail);
        GapiLens.set = (fun v x -> { x with detail = v });
      }
      
      let empty = {
        description = "";
        detail = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "description" x.description;
          GapiJson.render_string_value "detail" x.detail;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "description"; data_type = GapiJson.Scalar },
            Json_type.String v) ->
          { x with description = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "detail"; data_type = GapiJson.Scalar },
            Json_type.String v) ->
          { x with detail = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiOauth2V2Model.Scopes.parse" e x
      
    end
    
    module OauthClient =
    struct
      type t = {
        developerEmail : string;
        iconUri : string;
        name : string;
        
      }
      
      let developerEmail = {
        GapiLens.get = (fun x -> x.developerEmail);
        GapiLens.set = (fun v x -> { x with developerEmail = v });
      }
      let iconUri = {
        GapiLens.get = (fun x -> x.iconUri);
        GapiLens.set = (fun v x -> { x with iconUri = v });
      }
      let name = {
        GapiLens.get = (fun x -> x.name);
        GapiLens.set = (fun v x -> { x with name = v });
      }
      
      let empty = {
        developerEmail = "";
        iconUri = "";
        name = "";
        
      }
      
      let rec render_content x = 
         [
          GapiJson.render_string_value "developerEmail" x.developerEmail;
          GapiJson.render_string_value "iconUri" x.iconUri;
          GapiJson.render_string_value "name" x.name;
          
        ]
      and render x = 
        GapiJson.render_object "" (render_content x)
      
      let rec parse x = function
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "developerEmail"; data_type = GapiJson.Scalar },
            Json_type.String v) ->
          { x with developerEmail = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "iconUri"; data_type = GapiJson.Scalar },
            Json_type.String v) ->
          { x with iconUri = v }
        | GapiCore.AnnotatedTree.Leaf
            ({ GapiJson.name = "name"; data_type = GapiJson.Scalar },
            Json_type.String v) ->
          { x with name = v }
        | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = ""; data_type = GapiJson.Object },
          cs) ->
          GapiJson.parse_children parse empty (fun x -> x) cs
        | e ->
          GapiJson.unexpected "GapiOauth2V2Model.OauthClient.parse" e x
      
    end
    
    type t = {
      oauthClient : OauthClient.t;
      scopes : Scopes.t list;
      
    }
    
    let oauthClient = {
      GapiLens.get = (fun x -> x.oauthClient);
      GapiLens.set = (fun v x -> { x with oauthClient = v });
    }
    let scopes = {
      GapiLens.get = (fun x -> x.scopes);
      GapiLens.set = (fun v x -> { x with scopes = v });
    }
    
    let empty = {
      oauthClient = OauthClient.empty;
      scopes = [];
      
    }
    
    let rec render_content x = 
       [
        (fun v -> GapiJson.render_object "oauthClient" (OauthClient.render_content v)) x.oauthClient;
        GapiJson.render_array "scopes" Scopes.render x.scopes;
        
      ]
    and render x = 
      GapiJson.render_object "" (render_content x)
    
    let rec parse x = function
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "oauthClient"; data_type = GapiJson.Object },
          cs) ->
        GapiJson.parse_children
          OauthClient.parse
          OauthClient.empty
          (fun v -> { x with oauthClient = v })
          cs
      | GapiCore.AnnotatedTree.Node
          ({ GapiJson.name = "scopes"; data_type = GapiJson.Array },
          cs) ->
        GapiJson.parse_collection
          (fun x' -> function
            | GapiCore.AnnotatedTree.Node
                ({ GapiJson.name = ""; data_type = GapiJson.Object },
                cs) ->
              GapiJson.parse_children
                Scopes.parse
                Scopes.empty
                (fun v -> v)
                cs
            | e ->
              GapiJson.unexpected "GapiOauth2V2Model.Consent.parse.parse_collection" e x')
          Scopes.empty
          (fun v -> { x with scopes = v })
          cs
      | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = ""; data_type = GapiJson.Object },
        cs) ->
        GapiJson.parse_children parse empty (fun x -> x) cs
      | e ->
        GapiJson.unexpected "GapiOauth2V2Model.Consent.parse" e x
    
  end
  
  type t = {
    code : string;
    consent : Consent.t;
    idToken : string;
    issueAdvice : string;
    token : string;
    
  }
  
  let code = {
    GapiLens.get = (fun x -> x.code);
    GapiLens.set = (fun v x -> { x with code = v });
  }
  let consent = {
    GapiLens.get = (fun x -> x.consent);
    GapiLens.set = (fun v x -> { x with consent = v });
  }
  let idToken = {
    GapiLens.get = (fun x -> x.idToken);
    GapiLens.set = (fun v x -> { x with idToken = v });
  }
  let issueAdvice = {
    GapiLens.get = (fun x -> x.issueAdvice);
    GapiLens.set = (fun v x -> { x with issueAdvice = v });
  }
  let token = {
    GapiLens.get = (fun x -> x.token);
    GapiLens.set = (fun v x -> { x with token = v });
  }
  
  let empty = {
    code = "";
    consent = Consent.empty;
    idToken = "";
    issueAdvice = "";
    token = "";
    
  }
  
  let rec render_content x = 
     [
      GapiJson.render_string_value "code" x.code;
      (fun v -> GapiJson.render_object "consent" (Consent.render_content v)) x.consent;
      GapiJson.render_string_value "idToken" x.idToken;
      GapiJson.render_string_value "issueAdvice" x.issueAdvice;
      GapiJson.render_string_value "token" x.token;
      
    ]
  and render x = 
    GapiJson.render_object "" (render_content x)
  
  let rec parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "code"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with code = v }
    | GapiCore.AnnotatedTree.Node
        ({ GapiJson.name = "consent"; data_type = GapiJson.Object },
        cs) ->
      GapiJson.parse_children
        Consent.parse
        Consent.empty
        (fun v -> { x with consent = v })
        cs
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "idToken"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with idToken = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "issueAdvice"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with issueAdvice = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "token"; data_type = GapiJson.Scalar },
        Json_type.String v) ->
      { x with token = v }
    | GapiCore.AnnotatedTree.Node
      ({ GapiJson.name = ""; data_type = GapiJson.Object },
      cs) ->
      GapiJson.parse_children parse empty (fun x -> x) cs
    | e ->
      GapiJson.unexpected "GapiOauth2V2Model.Oauth2IssueTokenV2Response.parse" e x
  
  let to_data_model = GapiJson.render_root render
  
  let of_data_model = GapiJson.parse_root parse empty
  
end

