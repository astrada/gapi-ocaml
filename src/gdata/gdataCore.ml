module AnnotatedTree = struct
  type ('a, 'b) t =
      Leaf of 'a * 'b
    | Node of 'a * ('a, 'b) t list

  (* private *)
  let map f xs =
    let rec loop l k =
      match l with
          [] -> k []
        | h :: t -> loop t (fun acc -> k (f h :: acc))
    in
      loop xs (fun x -> x)

  let kfold nf lf tree =
    let rec loop t k =
      match t with
          Leaf (a, x) -> lf a x t k
        | Node (a, xs) -> nf a (map (fun x -> loop x) xs) t k
    in
      loop tree (fun x -> x)

  let xfold nf lf tree =
    kfold
      (fun a ks t k ->
         let rec loop l cont =
           match l with
               [] -> cont []
             | kh :: kt -> loop kt (fun acc -> kh (fun h -> cont (h :: acc)))
         in
           loop ks (fun xs -> k (nf a xs t))
      )
      (fun a x t k -> k (lf a x t))
      tree

  let fold nf lf tree =
    xfold
      (fun a xs _ -> nf a xs)
      (fun a x _ -> lf a x)
      tree

end

module Value = struct
  type t =
      Int of int
    | String of string
    | List of t list
    | Record of (string * t) list
    | Variant of string * t list
end

module Type = struct
  type t =
      Int
    | String
    | List of t
    | Tuple of t list
    | Option of t
    | Record of (string * t) list
    | Variant of (string * t list) list
end

module Metadata = struct
  type xml_node_type =
      [ `Element
      | `Attribute
      | `Text
      | `Cdata ]

  type xml =
      [ `Name of string
      | `Namespace of string
      | `Prefix of string
      | xml_node_type ] list

  (* TODO: use Set/Hashtbl/record instead of list? *)
  let name metadata =
    let name_element =
      List.find
        (fun element ->
           match element with
               `Name _ -> true
             | _ -> false)
        metadata
    in
      match name_element with
          `Name n -> n
        | _ -> assert false

  let prefix metadata =
    let prefix_element =
      List.find
        (fun element ->
           match element with
               `Prefix _ -> true
             | _ -> false)
        metadata
    in
      match prefix_element with
          `Prefix p -> p
        | _ -> assert false

  let namespace metadata =
    let namespace_element =
      List.find
        (fun element ->
           match element with
               `Namespace _ -> true
             | _ -> false)
        metadata
    in
      match namespace_element with
          `Namespace ns -> ns
        | _ -> assert false

  let node_type metadata =
    List.find
      (fun element ->
         match element with
             `Element
           | `Attribute
           | `Text
           | `Cdata -> true
           | _ -> false)
      metadata

  let description metadata =
    let n = try name metadata with Not_found -> "" in
    let p = try prefix metadata with Not_found -> "" in
    let ns = try namespace metadata with Not_found -> "" in
    let nt =
      try
        match node_type metadata with
            `Element -> "Element"
          | `Attribute -> "Attribute"
          | `Text -> "Text"
          | `Cdata -> "CData"
          | _ -> assert false
      with Not_found -> "" 
    in
      Printf.sprintf "type=%s name=%s prefix=%s namespace=%s" nt n p ns

end

module HttpMethod =
struct
  type t =
      GET
    | POST
    | PUT
    | DELETE
    | PATCH

  let to_string m =
    match m with
        GET -> "GET"
      | POST -> "POST"
      | PUT -> "PUT"
      | DELETE -> "DELETE"
      | PATCH -> "PATCH"

end

module PostData =
struct
  type t =
      Fields of (string * string) list    (* field list (key/value pair) *)
    | Body of string * string             (* body and content type *)

end

module Header =
struct
  type t =
      ContentType of string
    | Location of string
    | Authorization of string
    | ETag of string
    | IfNoneMatch of string
    | IfMatch of string
    | GdataVersion of string
    | KeyValueHeader of string * string
    | OtherHeader of string

  let to_string h =
    match h with
      ContentType value ->
        "Content-Type: " ^ value
    | Location value ->
        "Location: " ^ value
    | Authorization value ->
        "Authorization: " ^ value
    | ETag value ->
        "ETag: " ^ value
    | IfNoneMatch value ->
        "If-None-Match: " ^ value
    | IfMatch value ->
        "If-Match: " ^ value
    | GdataVersion value ->
        "GData-Version: " ^ value
    | KeyValueHeader (name, value) ->
        name ^ ": " ^ value
    | OtherHeader header ->
        header

  let parse full_header =
    if String.contains full_header ':' then
      let (key, v) = ExtString.String.split full_header ":" in
      let value = ExtString.String.strip v in
        match key with
            "Location" ->
              Location value
          | "Content-Type" ->
              ContentType value
          | "Authorization" ->
              Authorization value
          | "ETag" ->
              ETag value
          | "If-None-Match" ->
              IfNoneMatch value
          | "If-Match" ->
              IfMatch value
          | "GData-Version" ->
              GdataVersion value
          | _ ->
              KeyValueHeader (key, value)
    else
      OtherHeader full_header

end

let default_content_type = "application/atom+xml; charset=UTF-8"

module SignatureMethod =
struct
  type t =
      RSA_SHA1
    | HMAC_SHA1
    (*| PLAINTEXT not supported by Google *)

  let to_string signature =
    match signature with
        RSA_SHA1 -> "RSA-SHA1"
      | HMAC_SHA1 -> "HMAC-SHA1"
    (*| PLAINTEXT -> "PLAINTEXT" *)

end

type xml_data_model = (Metadata.xml, string) AnnotatedTree.t

module type ATOMDATA =
sig
  type t

  val empty : t

  val to_xml_data_model : t -> xml_data_model list

  val of_xml_data_model : t -> xml_data_model -> t

end

