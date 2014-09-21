let library_version = "0.2.6"

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

module HttpMethod =
struct
  type t =
      GET
    | POST
    | PUT
    | DELETE
    | PATCH
    | HEAD

  let to_string m =
    match m with
        GET -> "GET"
      | POST -> "POST"
      | PUT -> "PUT"
      | DELETE -> "DELETE"
      | PATCH -> "PATCH"
      | HEAD -> "HEAD"

end

module PostData =
struct
  type t =
      (* field list (key/value pair) *)
      Fields of (string * string) list
      (* body, and content type *)
    | Body of string * string

  let empty = Fields []

end

module Header =
struct
  type t =
      HttpStatus of string * int * string
    | ContentType of string
    | Location of string
    | Authorization of string
    | ETag of string
    | IfNoneMatch of string
    | IfMatch of string
    | GdataVersion of string
    | ContentRange of string
    | Range of string
    | UploadContentType of string
    | UploadContentLength of string
    | Slug of string
    | ContentLength of string
    | KeyValueHeader of string * string
    | OtherHeader of string

  let to_string h =
    match h with
        HttpStatus (version, code, reason) ->
          Printf.sprintf "HTTP/%s %d %s" version code reason
      | ContentType value ->
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
      | ContentRange value ->
          "Content-Range: " ^ value
      | Range value ->
          "Range: " ^ value
      | UploadContentType value ->
          "X-Upload-Content-Type: " ^ value
      | UploadContentLength value ->
          "X-Upload-Content-Length: " ^ value
      | Slug value ->
          "Slug: " ^ value
      | ContentLength value ->
          "Content-Length: " ^ value
      | KeyValueHeader (name, value) ->
          name ^ ": " ^ value
      | OtherHeader header ->
          header

  let parse full_header =
    if String.contains full_header ':' then
      let (key, v) = ExtString.String.split full_header ":" in
      let value = ExtString.String.strip v in
        match key with
            "Content-Type" ->
              ContentType value
          | "Location" ->
              Location value
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
          | "Content-Range" ->
              ContentRange value
          | "Range" ->
              Range value
          | "X-Upload-Content-Type" ->
              UploadContentType value
          | "X-Upload-Content-Length" ->
              UploadContentLength value
          | "Slug" ->
              Slug value
          | "Content-Length" ->
              ContentLength value
          | _ ->
              KeyValueHeader (key, value)
    else
      let stripped_header = ExtString.String.strip full_header in
        if ExtString.String.starts_with stripped_header "HTTP" then
          Scanf.sscanf stripped_header "HTTP/%s %d %s@!"
            (fun version code reason ->
               HttpStatus (version, code, reason))
        else
          OtherHeader stripped_header

end

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

