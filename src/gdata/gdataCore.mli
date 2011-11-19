module Metadata :
sig
  type xml_node_type =
      [ `Attribute
      | `Cdata
      | `Element
      | `Text ]

  type xml =
      [ `Name of string
      | `Namespace of string
      | `Prefix of string
      | xml_node_type ] list

  val name : [> `Name of 'a ] list -> 'a

  val prefix : [> `Prefix of 'a ] list -> 'a

  val namespace : [> `Namespace of 'a ] list -> 'a

  val node_type : ([> xml_node_type ] as 'a) list -> 'a

  val description : xml -> string

end

val default_content_type : string

module SignatureMethod :
sig
  type t =
      RSA_SHA1
    | HMAC_SHA1
  
  val to_string : t -> string

end

type xml_data_model = (Metadata.xml, string) GapiCore.AnnotatedTree.t

