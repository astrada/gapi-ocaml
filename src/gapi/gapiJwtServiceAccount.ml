module JwtClaim = struct
  type t = {
    iss : string;
    scope : string;
    aud : string;
    exp : float;
    iat : float;
    sub : string;
  }

  let iss =
    {
      GapiLens.get = (fun x -> x.iss);
      GapiLens.set = (fun v x -> { x with iss = v });
    }

  let scope =
    {
      GapiLens.get = (fun x -> x.scope);
      GapiLens.set = (fun v x -> { x with scope = v });
    }

  let aud =
    {
      GapiLens.get = (fun x -> x.aud);
      GapiLens.set = (fun v x -> { x with aud = v });
    }

  let exp =
    {
      GapiLens.get = (fun x -> x.exp);
      GapiLens.set = (fun v x -> { x with exp = v });
    }

  let iat =
    {
      GapiLens.get = (fun x -> x.iat);
      GapiLens.set = (fun v x -> { x with iat = v });
    }

  let sub =
    {
      GapiLens.get = (fun x -> x.sub);
      GapiLens.set = (fun v x -> { x with sub = v });
    }

  let empty = { iss = ""; scope = ""; aud = ""; exp = 0.0; iat = 0.0; sub = "" }

  let render_content x =
    [
      GapiJson.render_string_value "iss" x.iss;
      GapiJson.render_string_value "scope" x.scope;
      GapiJson.render_string_value "aud" x.aud;
      GapiJson.render_float_value "exp" x.exp;
      GapiJson.render_float_value "iat" x.iat;
      GapiJson.render_string_value "sub" x.sub;
    ]

  let render x = GapiJson.render_object "" (render_content x)

  let parse x = function
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "iss"; data_type = GapiJson.Scalar }, `String v) ->
        { x with iss = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "scope"; data_type = GapiJson.Scalar }, `String v) ->
        { x with scope = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "aud"; data_type = GapiJson.Scalar }, `String v) ->
        { x with aud = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "exp"; data_type = GapiJson.Scalar }, `Float v) ->
        { x with exp = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "iat"; data_type = GapiJson.Scalar }, `Float v) ->
        { x with iat = v }
    | GapiCore.AnnotatedTree.Leaf
        ({ GapiJson.name = "sub"; data_type = GapiJson.Scalar }, `String v) ->
        { x with sub = v }
    | e -> GapiJson.unexpected "GapiJwtServiceAccount.JwtClaim.parse" e x

  let to_data_model = GapiJson.render_root render

  let of_data_model = GapiJson.parse_root parse empty

  let to_json x = to_data_model x |> GapiJson.data_model_to_json
end

(* {"alg":"RS256","typ":"JWT"} *)
let header_base64 = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9"

let jwt_separator = "."

let base64_url_encode str =
  let str_with_padding = Netencoding.Base64.encode ~plus:'-' ~slash:'_' str in
  try
    let padding_pos = String.index str_with_padding '=' in
    String.sub str_with_padding 0 padding_pos
  with Not_found -> str_with_padding

let base64_url_decode str =
  let str_with_padding =
    match String.length str mod 4 with
    | 2 -> str ^ "=="
    | 3 -> str ^ "="
    | _ -> str
  in
  Netencoding.Base64.decode ~plus:'-' ~slash:'_' str_with_padding

(* RSASSA-PKCS1-V1_5-SIGN (K, M)
 * https://tools.ietf.org/html/rfc8017#section-8.2 *)

let emsa_pkcs1_v1_5_encode message em_len =
  (* https://tools.ietf.org/html/rfc8017#section-9.2 *)
  let h = Cryptokit.hash_string (Cryptokit.Hash.sha256 ()) message in
  let module V = Netasn1.Value in
  let oid = V.Seq [ V.OID [| 2; 16; 840; 1; 101; 3; 4; 2; 1 |]; V.Null ] in
  let asn1_values = V.Seq [ oid; V.Octetstring h ] in
  let t = Netbuffer.create 64 in
  let _ = Netasn1_encode.encode_ber t asn1_values in
  let t_len = Netbuffer.length t in
  let ps = String.make (em_len - t_len - 3) '\xff' in
  let result = Netbuffer.create 128 in
  Netbuffer.add_char result '\x00';
  Netbuffer.add_char result '\x01';
  Netbuffer.add_string result ps;
  Netbuffer.add_char result '\x00';
  Netbuffer.add_buffer result t;
  Netbuffer.contents result

let rsasp1 rsa_key m =
  let signature = Cryptokit.RSA.sign rsa_key m in
  base64_url_encode signature

(* / *)

let parse_private_key private_key_ascii_armor =
  let get_private_key_der ch =
    let spec = [ ("PRIVATE KEY", `Base64) ] in
    let l = Netascii_armor.parse spec ch in
    match l with
    | [] -> failwith "parse_private_key: no key found"
    | [ (_, `Base64 msg) ] -> msg#value
    | _ -> failwith "parse_private_key: several keys found"
  in
  let in_obj_channel = new Netchannels.input_string private_key_ascii_armor in
  let private_key_der = get_private_key_der in_obj_channel in
  in_obj_channel#close_in ();
  let _, asn1_values = Netasn1.decode_ber private_key_der in
  let module V = Netasn1.Value in
  let rsa_key_der =
    match asn1_values with
    | V.Seq
        [
          V.Integer i;
          V.Seq [ V.OID [| 1; 2; 840; 113549; 1; 1; 1 |]; V.Null ];
          V.Octetstring der;
        ]
      when V.get_int i = 0 ->
        der
    | _ -> failwith "parse_private_key: unexpected DER content"
  in
  let skip_sign_byte int_repr =
    if int_repr.[0] = '\x00' then
      String.sub int_repr 1 (String.length int_repr - 1)
    else int_repr
  in
  let _, asn1_rsa_values = Netasn1.decode_ber rsa_key_der in
  let rsa_key =
    match asn1_rsa_values with
    | V.Seq
        [
          V.Integer i;
          V.Integer modulus;
          V.Integer public_exponent;
          V.Integer private_exponent;
          V.Integer prime1;
          V.Integer prime2;
          V.Integer exponent1;
          V.Integer exponent2;
          V.Integer coefficient;
        ]
      when V.get_int i = 0 ->
        let n = V.get_int_repr modulus |> skip_sign_byte in
        let size = String.length n * 8 in
        let e = V.get_int_repr public_exponent |> skip_sign_byte in
        let d = V.get_int_repr private_exponent |> skip_sign_byte in
        let p = V.get_int_repr prime1 |> skip_sign_byte in
        let q = V.get_int_repr prime2 |> skip_sign_byte in
        let dp = V.get_int_repr exponent1 |> skip_sign_byte in
        let dq = V.get_int_repr exponent2 |> skip_sign_byte in
        let qinv = V.get_int_repr coefficient |> skip_sign_byte in
        { Cryptokit.RSA.size; n; e; d; p; q; dp; dq; qinv }
    | _ -> failwith "parse_private_key: unexpected RSA key DER content"
  in
  rsa_key

let get_encoded_claim jwt_claim =
  let jwt_claim_json = JwtClaim.to_json jwt_claim in
  let jwt_claim_json_string = Yojson.Safe.to_string jwt_claim_json in
  base64_url_encode jwt_claim_json_string

let get_signature encoded_jwt_claim private_key =
  let to_sign = header_base64 ^ jwt_separator ^ encoded_jwt_claim in
  let rsa_key = parse_private_key private_key in
  let em = emsa_pkcs1_v1_5_encode to_sign (rsa_key.Cryptokit.RSA.size / 8) in
  rsasp1 rsa_key em

let get_jwt_token encoded_jwt_claim signature =
  header_base64 ^ jwt_separator ^ encoded_jwt_claim ^ jwt_separator ^ signature
