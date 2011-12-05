module ScopeData :
sig
  type t = {
    _type : string;
    value : string
  }

  val _type : (t, string) GapiLens.t
  val value : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

end

module AclRule :
sig
  type t = {
    kind : string;
    etag : string;
    id : string;
    scope : ScopeData.t;
    role : string;
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val scope : (t, ScopeData.t) GapiLens.t
  val role : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module Acl :
sig
  type t = {
    kind : string;
    etag : string;
    nextPageToken : string;
    items : AclRule.t list;
  }

  val kind : (t, string) GapiLens.t
  val etag : (t, string) GapiLens.t
  val nextPageToken : (t, string) GapiLens.t
  val items : (t, AclRule.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

