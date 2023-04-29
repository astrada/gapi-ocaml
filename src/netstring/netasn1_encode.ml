(* $Id$ *)

(* TODO:
   - verify strings
 *)

open Netasn1

exception Encode_error of string

let tag_of_value =
  function
    | Value.Bool _ -> Value.Universal, 1
    | Value.Integer _ -> Value.Universal, 2
    | Value.Bitstring _ -> Value.Universal, 3
    | Value.Octetstring _ -> Value.Universal, 4
    | Value.Null -> Value.Universal, 5
    | Value.OID _ -> Value.Universal, 6
    | Value.ObjectDescriptor _ -> Value.Universal, 7
    | Value.External _ -> Value.Universal, 8
    | Value.Real _ -> Value.Universal, 9
    | Value.Enum _ -> Value.Universal, 10
    | Value.Embedded_PDV _ -> Value.Universal, 11
    | Value.UTF8String _ -> Value.Universal, 12
    | Value.ROID _ -> Value.Universal, 13
    | Value.Seq _ -> Value.Universal, 16
    | Value.Set _ -> Value.Universal, 17
    | Value.NumericString _ -> Value.Universal, 18
    | Value.PrintableString _ -> Value.Universal, 19
    | Value.TeletexString _ -> Value.Universal, 20
    | Value.VideotexString _ -> Value.Universal, 21
    | Value.IA5String _ -> Value.Universal, 22
    | Value.UTCTime _ -> Value.Universal, 23
    | Value.GeneralizedTime _ -> Value.Universal, 24
    | Value.GraphicString _ -> Value.Universal, 25
    | Value.VisibleString _ -> Value.Universal, 26
    | Value.GeneralString _ -> Value.Universal, 27
    | Value.UniversalString _ -> Value.Universal, 28
    | Value.CharString _ -> Value.Universal, 29
    | Value.BMPString _ -> Value.Universal, 30
    | Value.ITag(tc, tag, _) -> 
         if tag < 0 then failwith "Netasn1_encode.tag_of_value";
         tc, tag
    | Value.Tag(tc, tag, _, _) ->
         if tag < 0 then failwith "Netasn1_encode.tag_of_value";
         tc, tag
    | Value.Tagptr(tc, tag, _, _, _, _) ->
         if tag < 0 then failwith "Netasn1_encode.tag_of_value";
         tc, tag

let encode_error s =
  raise(Encode_error s)


let encode_base128 buf n =
  let rec encode n =
    if n < 128 then
      [ n ]
    else
      (n land 127) :: encode (n lsr 7) in
  if n < 0 then encode_error "bad input";
  let l = List.rev(encode n) in
  let len = List.length l in
  let l =
    List.mapi
      (fun i k ->
         if i < len-1 then Char.chr(k lor 128) else Char.chr k
      )
      l in
  List.iter (Netbuffer.add_char buf) l


let rec encode_ber_contents buf v =
  match v with
    | Value.Null ->
         Value.Primitive
    | Value.Bool b ->
         Netbuffer.add_char buf (if b then '\xff' else '\x00');
         Value.Primitive
    | Value.Integer n 
    | Value.Enum n ->
         let s = Value.get_int_repr n in
         Netbuffer.add_string buf s;
         Value.Primitive
    | Value.Real n ->
         let s = Value.get_real_repr n in
         Netbuffer.add_string buf s;
         Value.Primitive
    | Value.OID oid ->
         if Array.length oid <= 2 then
           encode_error "bad OID in input";
         let x = oid.(0) in
         let y = oid.(1) in
         if x < 0 || x > 2 || y < 0 || y > 39 then
           encode_error "bad OID in input";
         encode_base128 buf (x * 40 + y);
         for k = 2 to Array.length oid - 1 do
           encode_base128 buf oid.(k)
         done;
         Value.Primitive
    | Value.ROID oid ->
         for k = 0 to Array.length oid - 1 do
           encode_base128 buf oid.(k)
         done;
         Value.Primitive
    | Value.Octetstring s
    | Value.ObjectDescriptor s
    | Value.UTF8String s
    | Value.NumericString s
    | Value.PrintableString s
    | Value.TeletexString s
    | Value.VideotexString s
    | Value.IA5String s
    | Value.GraphicString s
    | Value.VisibleString s
    | Value.GeneralString s
    | Value.UniversalString s
    | Value.CharString s
    | Value.BMPString s ->
         Netbuffer.add_string buf s;
         Value.Primitive
    | Value.UTCTime t ->
         if Value.get_time_subtype t <> `U then
           encode_error "wrong time format for UTCTime";
         let s = Value.get_time_repr  t in
         Netbuffer.add_string buf s;
         Value.Primitive
    | Value.GeneralizedTime t ->
         if Value.get_time_subtype t <> `G then
           encode_error "wrong time format for GeneralizedTime";
         let s = Value.get_time_repr  t in
         Netbuffer.add_string buf s;
         Value.Primitive
    | Value.Bitstring bs ->
         let s = Value.get_bitstring_repr bs in
         Netbuffer.add_string buf s;
         Value.Primitive
    | Value.Seq vals
    | Value.Set vals
    | Value.External vals
    | Value.Embedded_PDV vals ->
        List.iter
          (fun v ->
             ignore(encode_ber buf v)
          )
          vals;
        Value.Constructed
    | Value.ITag(_,_,v) ->
         ( match v with
            | Value.ITag _
            | Value.Tagptr _ ->
                encode_ber buf v
            | _ ->
                encode_ber_contents buf v
         )
    | Value.Tag(_,_,_,v) ->
         encode_ber buf v
    | Value.Tagptr(_,_,pc,box,pos,len) ->
         let Netstring_tstring.Tstring_polybox(ops,s) = box in
         Netbuffer.add_subtstring_poly buf ops s pos len;
         pc

  and encode_ber buf v =
    let buf' = Netbuffer.create 80 in
    let pc = encode_ber_contents buf' v in
    let length = Netbuffer.length buf' in
    let tc, tag = tag_of_value v in
    let tc_bits =
      match tc with
        | Value.Universal -> 0
        | Value.Application -> 1
        | Value.Context -> 2
        | Value.Private -> 3 in
    let pc_bit =
      match pc with
        | Value.Primitive -> 0
        | Value.Constructed -> 1 in
    let octet0 =
      (tc_bits lsl 6) lor (pc_bit lsl 5) lor
        (if tag <= 30 then tag else 31) in
    Netbuffer.add_char buf (Char.chr octet0);
    if tag > 30 then
      encode_base128 buf tag;
    if length < 128 then
      Netbuffer.add_char buf (Char.chr length)
    else (
      if length <= 0xff then (
        Netbuffer.add_char buf '\x81';
        Netbuffer.add_char buf (Char.chr length);
      )
      else if length <= 0xffff then (
        Netbuffer.add_char buf '\x82';
        Netbuffer.add_char buf (Char.chr (length lsr 8));
        Netbuffer.add_char buf (Char.chr (length land 0xff));
      )
      else (
        let i = Value.int length in
        let s0 = Value.get_int_repr i in
        let s1 =
          (* integers are signed, but we need here unsigned ints: *)
          if s0.[0] = '\x00' then
            String.sub s0 1 (String.length s0 - 1)
          else
            s0 in
        Netbuffer.add_char buf (Char.chr (0x80 + String.length s1));
        Netbuffer.add_string buf s1;
      )
    );
    Netbuffer.add_buffer buf buf';
    pc

