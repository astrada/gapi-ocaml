(** Data definition for APIs Discovery Service (v1).
  
  For more information about this data model, see the
  {{:http://code.google.com/apis/discovery/v1/reference.html}API Documentation}

  *)

(** Links to 16x16 and 32x32 icons representing the API. *)
module IconsData :
sig
  type t = {
    x16 : string;
    (** The url of the 16x16 icon. *)
    x32 : string
    (** The url of the 32x32 icon. *)
  }

  val x16 : (t, string) GapiLens.t
  val x32 : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : t -> GapiJson.json_data_model -> t

end

(** The individual directory entries. One entry per api/version pair. *)
module ItemsData :
sig
  type t = {
    kind : string;
    (** The kind for this response. *)
    id : string;
    (** The id of this API. *)
    name : string;
    (** The name of the API. *)
    version : string;
    (** The version of the API. *)
    title : string;
    (** The title of this API. *)
    description : string;
    (** The description of this API. *)
    discoveryLink : string;
    (** A link to the discovery document. *)
    icons : IconsData.t;
    (** Links to 16x16 and 32x32 icons representing the API. *)
    documentationLink : string;
    (** A link to human readable documentation for the API. *)
    labels : string list;
    (** Labels for the status of this API, such as labs or deprecated. *)
    preferred : string;
    (** True if this version is the preferred version to use. *)
  }

  val kind : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val version : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val discoveryLink : (t, string) GapiLens.t
  val icons : (t, IconsData.t) GapiLens.t
  val documentationLink : (t, string) GapiLens.t
  val labels : (t, string list) GapiLens.t
  val preferred : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

module DirectoryList :
sig
  type t = {
    kind : string;
    (** The kind for this response. *)
    items : ItemsData.t list
    (** The individual directory entries. One entry per api/version pair. *)
  }

  val kind : (t, string) GapiLens.t
  val items : (t, ItemsData.t list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

(** The scope value. *)
module ScopesData :
sig
  type t = {
    description : string
    (** Description of scope. *)
  }

  val description : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : 'a -> GapiJson.json_data_model -> t

end

(** OAuth 2.0 authentication information. *)
module Oauth2Data :
sig
  type t = {
    scopes : (string * ScopesData.t) list
    (** Available OAuth 2.0 scopes. *)
  }

  val scopes : (t, (string * ScopesData.t) list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : 'a -> GapiJson.json_data_model -> t

end

module JsonSchema :
sig
  type t = {
    id : string;
    (** Unique identifier for this schema. *)
    _type : string;
    (** The value type for this schema. A list of values can be found {{:http://tools.ietf.org/html/draft-zyp-json-schema-03#section-5.1}here}. *)
    _ref : string;
    (** A reference to another schema. The value of this property is the [id] of another schema. *)
    description : string;
    (** A description of this object. *)
    default : string;
    (** The default value of this property (if one exists). *)
    required : bool;
    (** Whether the parameter is required. *)
    format : string;
    (** An additional regular expression or key that helps constrain the value. For more details see {{:http://tools.ietf.org/html/draft-zyp-json-schema-03#section-5.23}here}. *)
    pattern : string;
    (** The regular expression this parameter must conform to. *)
    minimum : string;
    (** The minimum value of this parameter. *)
    maximum : string;
    (** The maximum value of this parameter. *)
    enum : string list;
    (** Values this parameter may take (if it is an enum). *)
    enumDescriptions : string list;
    (** The descriptions for the enums. Each position maps to the corresponding value in the [enum] array. *)
    repeated : bool;
    (** Whether this parameter may appear multiple times. *)
    location : string;
    (** Whether this parameter goes in the query or the path for REST requests. *)
    properties : (string * t) list;
    (** If this is a schema for an object, list the schema for each property of this object. *)
    additionalProperties : t option;
    (** If this is a schema for an object, this property is the schema for any
      * additional properties with dynamic keys on this object. *)
    items : t option;
    (** If this is a schema for an array, this property is the schema for each element in the array. *)
  }

  val id : (t, string) GapiLens.t
  val _type : (t, string) GapiLens.t
  val _ref : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val default : (t, string) GapiLens.t
  val required : (t, bool) GapiLens.t
  val format : (t, string) GapiLens.t
  val pattern : (t, string) GapiLens.t
  val minimum : (t, string) GapiLens.t
  val maximum : (t, string) GapiLens.t
  val enum : (t, string list) GapiLens.t
  val enumDescriptions : (t, string list) GapiLens.t
  val repeated : (t, bool) GapiLens.t
  val location : (t, string) GapiLens.t
  val properties : (t, (string * t) list) GapiLens.t
  val additionalProperties : (t, t option) GapiLens.t
  val items : (t, t option) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : t -> GapiJson.json_data_model -> t

end

module RefData :
sig
  type t = {
    _ref : string
    (** Schema ID for the request/response schema. *)
  }

  val _ref : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : 'a -> GapiJson.json_data_model -> t

end

module ProtocolData :
sig
  type t = {
    multipart : bool;
    (** True if this endpoint supports uploading multipart media. *)
    path : string
    (** The URI path to be used for upload. Should be used in conjunction with the basePath property at the api-level. *)
  }

  val multipart : (t, bool) GapiLens.t
  val path : (t, string) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : t -> GapiJson.json_data_model -> t

end

(** Supported upload protocols. *)
module ProtocolsData :
sig
  type t = {
    simple : ProtocolData.t;
    (** Supports uploading as a single HTTP request. *)
    resumable : ProtocolData.t
    (** Supports the Resumable Media Upload protocol. *)
  }

  val simple : (t, ProtocolData.t) GapiLens.t
  val resumable : (t, ProtocolData.t) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : t -> GapiJson.json_data_model -> t

end

(** Media upload parameters. *)
module MediaUploadData :
sig
  type t = {
    accept : string list;
    (** MIME Media Ranges for acceptable media uploads to this method. *)
    maxSize : string;
    (** Maximum size of a media upload, such as [1MB], [2GB] or [3TB]. *)
    protocols : ProtocolsData.t;
    (** Supported upload protocols. *)
  }

  val accept : (t, string list) GapiLens.t
  val maxSize : (t, string) GapiLens.t
  val protocols : (t, ProtocolsData.t) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : t -> GapiJson.json_data_model -> t

end

module RestMethod :
sig
  type t = {
    id : string;
    (** A unique ID for this method. This property can be used to match methods between different versions of Discovery. *)
    path : string;
    (** The URI path of this REST method. Should be used in conjunction with the basePath property at the api-level. *)
    httpMethod : string;
    (** HTTP method used by this method. *)
    description : string;
    (** Description of this method. *)
    parameters : (string * JsonSchema.t) list;
    (** Details for all parameters in this method. *)
    parameterOrder : string list;
    (** Ordered list of required parameters, serves as a hint to clients on how to structure their method signatures. The array is ordered such that the {e most-significant} parameter appears first. *)
    request : RefData.t;
    (** The schema for the request. *)
    response : RefData.t;
    (** The schema for the response. *)
    scopes : string list;
    (** OAuth 2.0 scopes applicable to this method. *)
    mediaUpload : MediaUploadData.t
    (** Media upload parameters. *)
  }

  val id : (t, string) GapiLens.t
  val path : (t, string) GapiLens.t
  val httpMethod : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val parameters : (t, (string * JsonSchema.t) list) GapiLens.t
  val parameterOrder : (t, string list) GapiLens.t
  val request : (t, RefData.t) GapiLens.t
  val response : (t, RefData.t) GapiLens.t
  val scopes : (t, string list) GapiLens.t
  val mediaUpload : (t, MediaUploadData.t) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : t -> GapiJson.json_data_model -> t

end

module RestResource :
sig
  type t = {
    methods : (string * RestMethod.t) list;
    (** Methods on this resource. *)
    resources : (string * t) list
    (** Sub-resources on this resource. *)
  }

  val methods : (t, (string * RestMethod.t) list) GapiLens.t
  val resources : (t, (string * t) list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list list

  val parse : t -> GapiJson.json_data_model -> t

end

module RestDescription :
sig
  type t = {
    kind : string;
    (** The kind for this response. *)
    id : string;
    (** The id of this API. *)
    name : string;
    (** The name of this API. *)
    version : string;
    (** The version of this API. *)
    title : string;
    (** The title of this API. *)
    description : string;
    (** The description of this API. *)
    icons : IconsData.t;
    (** Links to 16x16 and 32x32 icons representing the API. *)
    documentationLink : string;
    (** A link to human readable documentation for the API. *)
    labels : string list;
    (** Labels for the status of this API, such as labs or deprecated. *)
    protocol : string;
    (** The protocol described by this document. *)
    basePath : string;
    (** The base URI path for REST requests. *)
    parameters : (string * JsonSchema.t) list;
    (** Common parameters that apply across all apis. *)
    auth : Oauth2Data.t;
    (** Authentication information. *)
    features : string list;
    (** A list of supported features for this API. *)
    schemas : (string * JsonSchema.t) list;
    (** The schemas for this API. *)
    methods : (string * RestMethod.t) list;
    (** API-level methods for this API. *)
    resources : (string * RestResource.t) list;
    (** The resources in this API. *)
  }

  val kind : (t, string) GapiLens.t
  val id : (t, string) GapiLens.t
  val name : (t, string) GapiLens.t
  val version : (t, string) GapiLens.t
  val title : (t, string) GapiLens.t
  val description : (t, string) GapiLens.t
  val icons : (t, IconsData.t) GapiLens.t
  val documentationLink : (t, string) GapiLens.t
  val labels : (t, string list) GapiLens.t
  val protocol : (t, string) GapiLens.t
  val basePath : (t, string) GapiLens.t
  val parameters : (t, (string * JsonSchema.t) list) GapiLens.t
  val auth : (t, Oauth2Data.t) GapiLens.t
  val features : (t, string list) GapiLens.t
  val schemas : (t, (string * JsonSchema.t) list) GapiLens.t
  val methods : (t, (string * RestMethod.t) list) GapiLens.t
  val resources : (t, (string * RestResource.t) list) GapiLens.t

  val empty : t

  val render : t -> GapiJson.json_data_model list

  val parse : t -> GapiJson.json_data_model -> t

  val to_data_model : t -> GapiJson.json_data_model

  val of_data_model : GapiJson.json_data_model -> t

end

