(* $Id$ *)

exception Out_of_range
exception Parse_error of int
exception Header_too_short

module Type_name = struct
  type type_name =
    | Bool
    | Integer
    | Enum
    | Real
    | Bitstring
    | Octetstring
    | Null
    | Seq
    | Set
    | OID
    | ROID
    | ObjectDescriptor
    | External
    | Embedded_PDV
    | NumericString
    | PrintableString
    | TeletexString
    | VideotexString
    | VisibleString
    | IA5String
    | GraphicString
    | GeneralString
    | UniversalString
    | BMPString
    | UTF8String
    | CharString
    | UTCTime
    | GeneralizedTime
end


module Value = struct
  type pc = Primitive | Constructed
  type value =
    | Bool of bool
    | Integer of int_value
    | Enum of int_value
    | Real of real_value
    | Bitstring of bitstring_value
    | Octetstring of string
    | Null
    | Seq of value list
    | Set of value list
    | Tagptr of tag_class * int * pc * Netstring_tstring.tstring_polybox *
                  int * int
    | Tag of tag_class * int * pc * value
    | ITag of tag_class * int * value
    | OID of int array
    | ROID of int array
    | ObjectDescriptor of string
    | External of value list
    | Embedded_PDV of value list
    | NumericString of string
    | PrintableString of string
    | TeletexString of string
    | VideotexString of string
    | VisibleString of string
    | IA5String of string
    | GraphicString of string
    | GeneralString of string
    | UniversalString of string
    | BMPString of string
    | UTF8String of string
    | CharString of string
    | UTCTime of time_value
    | GeneralizedTime of time_value

   and tag_class =
     | Universal | Application | Context | Private

   and int_value = string
   and real_value = string
   and bitstring_value = string
   and time_value = U of string | G of string

  type time_subtype = [ `U | `G ]

  let rec equal v1 v2 =
    let open Netstring_tstring in
    match (v1, v2) with
      | (Seq s1, Seq s2) ->
           List.length s1 = List.length s2 &&
             List.for_all2 equal s1 s2
      | (Set s1, Set s2) ->
           (* FIXME: compare the set *)
           List.length s1 = List.length s2 &&
             List.for_all2 equal s1 s2
      | (Tag(c1,t1,pc1,sub1), Tag(c2,t2,pc2,sub2)) ->
           c1=c2 && t1=t2 && pc1=pc2 && equal sub1 sub2
      | (Tagptr(c1,t1,pc1,box1,pos1,len1), Tagptr(c2,t2,pc2,box2,pos2,len2)) ->
          let Tstring_polybox(ops1,s1) = box1 in
          let Tstring_polybox(ops2,s2) = box2 in
          c1=c2 && t1=t2 && pc1=pc2 && 
            ops1.substring s1 pos1 len1 = ops2.substring s2 pos2 len2
      | (External s1, External s2) ->
           List.length s1 = List.length s2 &&
             List.for_all2 equal s1 s2
      | (Embedded_PDV s1, Embedded_PDV s2) ->
           List.length s1 = List.length s2 &&
             List.for_all2 equal s1 s2
      | _ ->
           v1 = v2


  let type_of_value =
    function
    | Bool _ -> Some Type_name.Bool
    | Integer _ -> Some Type_name.Integer
    | Enum _ -> Some Type_name.Enum
    | Real _ -> Some Type_name.Real
    | Bitstring _ -> Some Type_name.Bitstring
    | Octetstring _ -> Some Type_name.Octetstring
    | Null -> Some Type_name.Null
    | Seq _ -> Some Type_name.Seq
    | Set _ -> Some Type_name.Set
    | OID _ -> Some Type_name.OID
    | ROID _ -> Some Type_name.ROID
    | ObjectDescriptor _ -> Some Type_name.ObjectDescriptor
    | External _ -> Some Type_name.External
    | Embedded_PDV _ -> Some Type_name.Embedded_PDV
    | NumericString _ -> Some Type_name.NumericString
    | PrintableString _ -> Some Type_name.PrintableString
    | TeletexString _ -> Some Type_name.TeletexString
    | VideotexString _ -> Some Type_name.VideotexString
    | VisibleString _ -> Some Type_name.VisibleString
    | IA5String _ -> Some Type_name.IA5String
    | GraphicString _ -> Some Type_name.GraphicString
    | GeneralString _ -> Some Type_name.GeneralString
    | UniversalString _ -> Some Type_name.UniversalString
    | BMPString _ -> Some Type_name.BMPString
    | UTF8String _ -> Some Type_name.UTF8String
    | CharString _ -> Some Type_name.CharString
    | UTCTime _ -> Some Type_name.UTCTime
    | GeneralizedTime _ -> Some Type_name.GeneralizedTime
    | Tagptr _
    | Tag _
    | ITag _ -> None


  let get_int_repr v = v
  let get_int_b256 v =
    if v = "\000" then
      [| |]
    else
      Array.init (String.length v) (fun k -> Char.code v.[k])

  let get_int64 v =
    match get_int_b256 v with
      | [| |] ->
          0L
      | [| x0 |] ->
          Int64.shift_right (Int64.shift_left (Int64.of_int x0) 56) 56
      | i when Array.length i <= 8 ->
          let x = ref 0L in
          let shift = ref 64 in
          for k = 0 to Array.length i - 1 do
            shift := !shift - 8;
            x := Int64.logor !x (Int64.shift_left (Int64.of_int i.(k)) !shift);
          done;
          Int64.shift_right !x !shift
      | _ ->
          raise Out_of_range

  let max_intL = Int64.of_int max_int
  let min_intL = Int64.of_int min_int

  let max_int32L = Int64.of_int32 (Int32.max_int)
  let min_int32L = Int64.of_int32 (Int32.min_int)

  let get_int v =
    let x = get_int64 v in
    if x > max_intL || x < min_intL then raise Out_of_range;
    Int64.to_int x

  let get_int32 v =
    let x = get_int64 v in
    if x > max_int32L || x < min_int32L then raise Out_of_range;
    Int64.to_int32 x

  let int64_a n =
    let rec recurse n p bit7 =
      if n = 0L then
        if bit7 then (
          let a = Array.make (p+1) 0 in
          a.(0) <- 0;
          a
        )
        else
          Array.make p 0
      else if n = (-1L) then
        if bit7 then
          Array.make p 0
        else (
          let a = Array.make (p+1) 0 in
          a.(0) <- 255;
          a          
        )
      else
        let byte = Int64.to_int (Int64.logand n 0xffL) in
        let n' = Int64.shift_right n 8 in  (* arithm. shift *)
        let a = recurse n' (p+1) (byte >= 0x80) in
        let l = Array.length a in
        a.(l-1-p) <- byte;
        a in
    if n = 0L || n = (-1L) then (
      [| Int64.to_int (Int64.logand n 0xffL) |]
    )
    else
      recurse n 0 false

  let intstr a =
    let l = Array.length a in
    let s = Bytes.make l '\x00' in
    for k = 0 to l-1 do
      Bytes.set s k (Char.chr a.(k))
    done;
    Bytes.unsafe_to_string s

  let int64 n =
    intstr(int64_a n)
    
  let int32 n =
    int64 (Int64.of_int32 n)

  let int n =
    int64 (Int64.of_int n)

  let int_b256_a a =
    (* normalize the number (express it with as few bytes as possible) *)
    let l = Array.length a in
    if l=0 then
      [| 0 |]
    else (
      let k = ref 0 in
      while !k < l-1 &&
            ((a.(!k) = 0 && a.(!k+1) < 0x80) ||
               (a.(!k) = 0xff && a.(!k+1) >= 0x80))
      do
        incr k
      done;
      Array.sub a !k (l - !k)
    )

  let int_b256 a =
    intstr (int_b256_a a)

  let get_real_repr v = v

  let get_bitstring_repr v = v

  let get_bitstring_size v =
    let n_unused = Char.code v.[0] in
    (String.length v - 1) * 8 - n_unused

  let get_bitstring_data v =
    String.sub v 1 (String.length v - 1)

  let get_bitstring_bits ?size v =
    let v_size = get_bitstring_size v in
    let size =
      match size with
        | None -> v_size
        | Some n -> n in
    Array.init
      size
      (fun k ->
         if k < v_size then
           let p = k lsr 3 in
           let q = k land 7 in
           let x = Char.code v.[ p + 1 ] in
           (x lsl q) land 0x80 <> 0
         else
           false
      )

  let bitstring_of_bits bits =
    let buf = Buffer.create 80 in
    let l = Array.length bits in
    let p = l land 0x7 in
    Buffer.add_char buf (Char.chr (if p=0 then 0 else 8-p));
    let c = ref 0 in
    let sh = ref 7 in
    Array.iteri
      (fun k bit ->
         let b = if bit then 1 else 0 in
         c := !c lor (b lsl !sh);
         if !sh = 0 then (
           Buffer.add_char buf (Char.chr !c);
           c := 0;
           sh := 7
         )
         else
           decr sh
      )
      bits;
    if !sh < 7 then
      Buffer.add_char buf (Char.chr !c);
    Buffer.contents buf

  let mask =
    [| 0b1000_0000;
       0b1100_0000;
       0b1110_0000;
       0b1111_0000;
       0b1111_1000;
       0b1111_1100;
       0b1111_1110;
       0b1111_1111;
      |]

  let bitstring_of_string s size =
    if size < 0 then invalid_arg "Netasn1.Value.bitstring_of_string";
    let slen = String.length s in
    let buf = Buffer.create 80 in
    let p = size land 0x7 in
    Buffer.add_char buf (Char.chr (if p=0 then 0 else 8-p));
    let q = size / 8 in
    Buffer.add_string buf (String.sub s 0 (min q slen));
    if slen < q then
      Buffer.add_string buf (String.make (q - slen) '\x00');
    if p > 0 then (
      let last =
        if slen > q then Char.code (s.[q]) else 0 in
      let m = mask.(p-1) in
      let last' = last land m in
      Buffer.add_char buf (Char.chr last')
    );
    Buffer.contents buf

  let truncate_trailing_zero_bits s =
    let slen = String.length s in
    let size_in = ((slen - 1) lsl 3) - Char.code s.[0] in
    let size = ref size_in in
    let k = ref (slen-1) in
    let cont = ref true in
    while !cont && !k >= 1 do
      let b =
        8 - (if !k = slen-1 then Char.code s.[0] else 0) in
      if s.[ !k ] = '\x00' then
        size := !size - b
      else (
        let c = Char.code s.[ !k ] in
        let j = ref 0 in
        while (mask.( !j ) land c) <> c do
          incr j
        done;
        size := !size - b + !j + 1;
        cont := false
      );
      decr k;
    done;
    bitstring_of_string (String.sub s 1 (slen-1)) !size


  let utc_re = Netstring_str.regexp
                 "^\\([0-9][0-9]\\)\
                  \\([0-9][0-9]\\)\
                  \\([0-9][0-9]\\)\
                  \\([0-9][0-9]\\)\
                  \\([0-9][0-9]\\)\
                  \\([0-9][0-9]\\)\\(.*\\)$"

  let gentime_re = Netstring_str.regexp
                     "^\\([0-9][0-9][0-9][0-9]\\)\
                      \\([0-9][0-9]\\)\
                      \\([0-9][0-9]\\)\
                      \\([0-9][0-9]\\)\
                      \\([0-9][0-9]\\)\
                      \\([0-9][0-9]\\)\
                      \\(.[0-9]+\\)?\\([-Z+].*\\)$"

  let zone_re = Netstring_str.regexp "^[-+][0-9][0-9][0-9][0-9]$"

  let get_time_subtype =
    function
    | U s -> `U
    | G s -> `G

  let get_time_repr =
    function
    | U s -> s
    | G s -> s

  let get_zone s =
    if s = "Z" then
      0
    else (
      match Netstring_str.string_match zone_re s 0 with
        | None ->
             failwith "Netasn1.Value.get_zone"
        | Some _ ->
             let h = int_of_string (String.sub s 1 2) in
             let m = int_of_string (String.sub s 3 2) in
             let v = h*60 + m in
             if s.[0] = '-' then -v else v
    )

  let get_time =
    function
    | U s ->
        (match Netstring_str.string_match utc_re s 0 with
           | Some m ->
               let y2 = int_of_string (Netstring_str.matched_group m 1 s) in
               let year = if y2 >= 50 then 1950 + y2 else 2000 + y2 in
               let month = int_of_string (Netstring_str.matched_group m 2 s) in
               let day = int_of_string (Netstring_str.matched_group m 3 s) in
               let hour = int_of_string (Netstring_str.matched_group m 4 s) in
               let minute = int_of_string (Netstring_str.matched_group m 5 s) in
               let second = int_of_string (Netstring_str.matched_group m 6 s) in
               let zonestr = Netstring_str.matched_group m 7 s in
               let zone = get_zone zonestr in
               if month = 0 || month > 12 || day = 0 || day > 31 ||
                    hour > 23 || minute > 59 || second > 59 
               then
                 failwith "Netasn1.Value.get_time";
               { Netdate.year; month; day; hour; minute; second;
                 nanos = 0; zone; week_day = (-1)
               }
           | None ->
               failwith "Netasn1.Value.get_time"
        )
        
    | G s ->
        (match Netstring_str.string_match gentime_re s 0 with
           | Some m ->
               let year = int_of_string (Netstring_str.matched_group m 1 s) in
               let month = int_of_string (Netstring_str.matched_group m 2 s) in
               let day = int_of_string (Netstring_str.matched_group m 3 s) in
               let hour = int_of_string (Netstring_str.matched_group m 4 s) in
               let minute = int_of_string (Netstring_str.matched_group m 5 s) in
               let second = int_of_string (Netstring_str.matched_group m 6 s) in
               let zonestr = Netstring_str.matched_group m 8 s in
               let zone = get_zone zonestr in
               if month = 0 || month > 12 || day = 0 || day > 31 ||
                    hour > 23 || minute > 59 || second > 59 
               then
                 failwith "Netasn1.Value.get_time";
               let nanos =
                 try
                   let n1 = Netstring_str.matched_group m 7 s in
                   let n2 = String.sub n1 1 (String.length n1 - 1) in
                   let n3 = 
                     if String.length n2 > 9 then String.sub n2 0 9 else n2 in
                   let n4 =
                     n3 ^ String.make (9 - String.length n3) '0' in
                   int_of_string n4
                 with Not_found -> 0 in
               { Netdate.year; month; day; hour; minute; second;
                 nanos; zone; week_day = (-1)
               }
           | None ->
               failwith "Netasn1.Value.get_time"
        )

  let utctime date =
    let open Netdate in
    if date.year < 1950 || date.year >= 2050 then
      failwith "Netasn1.Value.utctime: year out of valid range";
    let s =
      if date.zone = 0 then
        Netdate.format
          ~fmt:"%y%m%d%H%M%SZ"
          date
      else
        Netdate.format
          ~fmt:"%y%m%d%H%M%S%z"
          date in
    U s

  let gentime ~digits date =
    if digits > 9 then
      invalid_arg "Netasn1.Value.gentime";
    let s =
      if Netdate.(date.zone)=0 then
        Netdate.format
          ~fmt:("%Y%m%d%H%M%." ^ string_of_int digits ^ "SZ")
          date
      else
        Netdate.format
          ~fmt:("%Y%m%d%H%M%." ^ string_of_int digits ^ "S%z")
          date in
    G s

end


let type_of_tag =
  function
    | 1 -> Type_name.Bool
    | 2 -> Type_name.Integer
    | 3 -> Type_name.Bitstring
    | 4 -> Type_name.Octetstring
    | 5 -> Type_name.Null
    | 6 -> Type_name.OID
    | 7 -> Type_name.ObjectDescriptor
    | 8 -> Type_name.External
    | 9 -> Type_name.Real
    | 10 -> Type_name.Enum
    | 11 -> Type_name.Embedded_PDV
    | 12 -> Type_name.UTF8String
    | 13 -> Type_name.ROID
    | 16 -> Type_name.Seq
    | 17 -> Type_name.Set
    | 18 -> Type_name.NumericString
    | 19 -> Type_name.PrintableString
    | 20 -> Type_name.TeletexString
    | 21 -> Type_name.VideotexString
    | 22 -> Type_name.IA5String
    | 23 -> Type_name.UTCTime
    | 24 -> Type_name.GeneralizedTime
    | 25 -> Type_name.GraphicString
    | 26 -> Type_name.VisibleString
    | 27 -> Type_name.GeneralString
    | 28 -> Type_name.UniversalString
    | 29 -> Type_name.CharString
    | 30 -> Type_name.BMPString
    | _ -> raise Not_found




let n_max =
  if Sys.word_size = 32 then
    3
  else
    7


let decode_rel_oid s =
  (* will raise Not_found on parse error *)
  let cur = ref 0 in
  let end_pos = String.length s in
  let l = ref [] in
  while !cur < end_pos do
    let x = ref 0 in
    while s.[ !cur ] >= '\128' do
      x := (!x lsl 7) lor (Char.code s.[ !cur ] - 128);
      incr cur;
      if !cur > end_pos then raise Not_found;
    done;
    x := (!x lsl 7) lor (Char.code s.[ !cur ]);
    l := !x :: !l;
    incr cur;
  done;
  Array.of_list (List.rev !l)



let decode_region_poly ?(pos=0) ?len ops s =
  let open Netstring_tstring in
  let pos_end =
    match len with
      | None -> ops.length s
      | Some n -> pos+n in
  (pos, pos_end)


let decode_ber_header_poly ?pos ?len ?(skip_length_check=false) ops s =
  let open Netstring_tstring in
  let pos, pos_end = decode_region_poly ?pos ?len ops s in
  let cur = ref pos in
  let next() =
    if !cur < pos_end then (
      let c = Char.code (ops.get s !cur) in
      incr cur;
      c
    )
    else
      raise Header_too_short in
  let id0 = next() in
  let pc = 
    if (id0 land 0x20) <> 0 then Value.Constructed else Value.Primitive in
  let tc =
    match id0 land 0xc0 with
      | 0x00 -> Value.Universal
      | 0x40 -> Value.Application
      | 0x80 -> Value.Context
      | 0xc0 -> Value.Private
      | _ -> assert false in
  let tag0 =
    id0 land 0x1f in
  let tag = (
    if tag0 < 31 then
      tag0
    else (
      let tag = ref 0 in
      let b = ref (next()) in
      let n = ref 1 in
      while !b > 127 do
        incr n;
        if !n = 5 then raise(Parse_error !cur);  (* impl limit *)
        tag := (!tag lsl 7) lor (!b land 0x7f);
        b := next();
      done;
      tag := (!tag lsl 7) lor !b;
      !tag
    )
  ) in
  let length_opt = (
    let l0 = next() in
    if l0 < 128 then
      Some l0
    else (
      let n = l0-128 in
      if n=0 then
        None  (* indefinite length *)
      else (
        if n > n_max then raise(Parse_error !cur); (* impl limit *)
        let l = ref 0 in
        for k = 1 to n do
          l := (!l lsl 8) lor (next())
        done;
        Some !l
      ) 
    )
  ) in
  ( match length_opt with
      | None -> if pc = Value.Primitive then raise(Parse_error !cur)
      | Some n ->
          if not skip_length_check && n > pos_end - !cur then
            raise(Parse_error !cur)
  );
  let hdr_len = !cur - pos in
  (hdr_len, tc, pc, tag, length_opt)


let rec decode_ber_length_poly ?pos ?len ops s =
  let open Netstring_tstring in
  let pos, pos_end = decode_region_poly ?pos ?len ops s in
  let (hdr_len, tc, pc, tag, length_opt) =
    try
      decode_ber_header_poly ~pos ~len:(pos_end - pos) ops s
    with
      | Header_too_short -> raise(Parse_error pos_end) in
  match length_opt with
    | Some n ->
        hdr_len + n
    | None ->
        let cur = ref (pos + hdr_len) in
        let at_end_marker() =
          !cur+2 <= pos_end && 
            ops.get s !cur = '\000' && ops.get s (!cur+1) = '\000' in
        while not (at_end_marker()) do
          assert(!cur < pos_end);
          let n =
            decode_ber_length_poly ~pos:!cur ~len:(pos_end - !cur) ops s in
          cur := !cur + n;
        done;
        (!cur - pos) + 2


let rec decode_homo_construction_poly f pos pos_end indefinite expected_tag
                                      ops s =
  (* A construction where the primitives have all the same tag. The
     depth is arbitrary. [f] is called for every found primitive.
   *)
  let open Netstring_tstring in
  let cur = ref pos in
  let at_end() =
    if indefinite then
      !cur+2 <= pos_end && 
        ops.get s !cur = '\000' && ops.get s (!cur+1) = '\000'
    else
      !cur = pos_end in
  while not (at_end()) do
    assert(!cur < pos_end);
    let (hdr_len, tc, pc, tag, length_opt) =
      try
        decode_ber_header_poly ~pos:!cur ~len:(pos_end - !cur) ops s
      with
        | Header_too_short -> raise (Parse_error pos_end) in
    if tc <> Value.Universal then raise (Parse_error !cur);
    if tag <> expected_tag then raise (Parse_error !cur);
    ( match pc with
        | Value.Primitive ->
            let n =
              match length_opt with
                | None -> assert false
                | Some n -> n in
            f (!cur + hdr_len) n;
            cur := !cur + hdr_len + n
        | Value.Constructed ->
            let sub_pos_end =
              match length_opt with
                | None -> pos_end
                | Some n -> !cur + hdr_len + n in
            let real_n =
              decode_homo_construction_poly
                f (!cur + hdr_len) sub_pos_end
                (length_opt = None) expected_tag ops s in
            ( match length_opt with
                | None -> ()
                | Some n -> if n <> real_n then raise (Parse_error !cur)
            );
            cur := !cur + hdr_len + real_n
    );
  done;
  if indefinite then cur := !cur + 2;
  if not indefinite && !cur <> pos_end then raise (Parse_error !cur);
  !cur - pos


let rec decode_ber_poly ?pos ?len ops s =
  let pos, pos_end = decode_region_poly ?pos ?len ops s in
  let (hdr_len, tc, pc, tag, length_opt) =
    try
      decode_ber_header_poly ~pos ~len:(pos_end - pos) ops s
    with
      | Header_too_short -> raise (Parse_error pos_end) in
  match tc with
    | Value.Universal ->
        let cur = pos + hdr_len in
        let ty_name = 
          try type_of_tag tag
          with Not_found -> raise(Parse_error cur) in
        let len =
          match length_opt with
            | None -> pos_end - cur
            | Some n -> n in
        let content_len, value =
          decode_ber_contents_poly
            ~pos:cur
            ~len
            ~indefinite:(length_opt = None)
            ops s pc ty_name in
        ( match length_opt with
            | None -> ()
            | Some n ->
                if content_len <> n then raise(Parse_error cur)
        );
        (content_len + hdr_len, value)
    | _ ->
        let content_len =
          match length_opt with
            | None -> 
                (decode_ber_length_poly
                  ~pos ~len:(pos_end - pos) ops s) - hdr_len - 2
            | Some n -> n in
        let box = Netstring_tstring.Tstring_polybox(ops,s) in
        let value =
          Value.Tagptr(tc, tag, pc, box, pos+hdr_len, content_len) in
        (content_len + hdr_len, value)


and decode_ber_contents_poly ?pos ?len ?(indefinite=false) ops s pc ty =
  let open Netstring_tstring in
  let pos, pos_end = decode_region_poly ?pos ?len ops s in
  let len = pos_end - pos in
  if indefinite && pc=Value.Primitive then
    invalid_arg "Netasn1.decode_ber_contents: only constructed values \
                 permit indefinite length";
  match ty with
    | Type_name.Null ->
        if pc <> Value.Primitive then raise(Parse_error pos);
        if len<>0 then raise(Parse_error pos);
        (0, Value.Null)
    | Type_name.Bool ->
        if pc <> Value.Primitive then raise(Parse_error pos);
        if len=0 then raise(Parse_error pos);
        let v = Value.Bool( ops.get s pos <> '\000' ) in
        (1, v)
    | Type_name.Integer ->
        if pc <> Value.Primitive then raise(Parse_error pos);
        if len=0 then raise(Parse_error pos);
        let u = ops.substring s pos len in
        (* FIXME: value check *)
        let v = Value.Integer u in
        (len, v)
    | Type_name.Enum ->
        if pc <> Value.Primitive then raise(Parse_error pos);
        if len=0 then raise(Parse_error pos);
        let u = ops.substring s pos len in
        (* FIXME: value check *)
        let v = Value.Enum u in
        (len, v)
    | Type_name.Real ->
        if pc <> Value.Primitive then raise(Parse_error pos);
        let u = ops.substring s pos len in
        (* FIXME: value check *)
        let v = Value.Real u in
        (len, v)
    | Type_name.OID ->
        if pc <> Value.Primitive then raise(Parse_error pos);
        let u = ops.substring s pos len in
        let r = 
          try decode_rel_oid u
          with Not_found -> raise(Parse_error pos) in
        if Array.length r < 1 then raise(Parse_error pos);
        let x = if r.(0) < 40 then 0 else if r.(0) < 80 then 1 else 2 in
        let y = if x < 2 then r.(0) mod 40 else r.(0) - 80 in
        let oid = 
          Array.append [| x; y |] (Array.sub r 1 (Array.length r - 1)) in
        let v = Value.OID oid in
        (len, v)
    | Type_name.ROID ->
        if pc <> Value.Primitive then raise(Parse_error pos);
        let u = ops.substring s pos len in
        let r = 
          try decode_rel_oid u
          with Not_found -> raise(Parse_error pos) in
        let v = Value.ROID r in
        (len, v)
    | Type_name.Octetstring ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.Octetstring octets)
    | Type_name.ObjectDescriptor ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.ObjectDescriptor octets)
    | Type_name.UTF8String ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.UTF8String octets)
    | Type_name.NumericString ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.NumericString octets)
    | Type_name.PrintableString ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.PrintableString octets)
    | Type_name.TeletexString ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.TeletexString octets)
    | Type_name.VideotexString ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.VideotexString octets)
    | Type_name.IA5String ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.IA5String octets)
    | Type_name.GraphicString ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.GraphicString octets)
    | Type_name.VisibleString ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.VisibleString octets)
    | Type_name.GeneralString ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.GeneralString octets)
    | Type_name.UniversalString ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.UniversalString octets)
    | Type_name.CharString ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.CharString octets)
    | Type_name.BMPString ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.BMPString octets)
    | Type_name.UTCTime ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.UTCTime (Value.U octets))
    | Type_name.GeneralizedTime ->
        let (len, octets) =
          decode_ber_octets_poly pos pos_end indefinite ops s pc in
        (len, Value.GeneralizedTime (Value.G octets))
    | Type_name.Bitstring ->
        let (len, bitstring) =
          decode_ber_bits_poly pos pos_end indefinite ops s pc in
        (len, Value.Bitstring bitstring)
    | Type_name.Seq ->
        if pc <> Value.Constructed then raise(Parse_error pos);
        let (len, list) =
          decode_list_construction_poly pos pos_end indefinite ops s in
        (len, Value.Seq list)
    | Type_name.Set ->
        if pc <> Value.Constructed then raise(Parse_error pos);
        let (len, list) =
          decode_list_construction_poly pos pos_end indefinite ops s in
        (len, Value.Set list)
    | Type_name.External ->
        if pc <> Value.Constructed then raise(Parse_error pos);
        let (len, list) =
          decode_list_construction_poly pos pos_end indefinite ops s in
        (len, Value.External list)
    | Type_name.Embedded_PDV ->
        if pc <> Value.Constructed then raise(Parse_error pos);
        let (len, list) =
          decode_list_construction_poly pos pos_end indefinite ops s in
        (len, Value.Embedded_PDV list)


        
and decode_ber_octets_poly pos pos_end indefinite ops s pc =
  let open Netstring_tstring in
  let len = pos_end - pos in
  match pc with
    | Value.Primitive ->
        (len, ops.substring s pos len)
    | Value.Constructed ->
        let buf = Netbuffer.create 500 in
        let f p l =
          Netbuffer.add_subtstring_poly buf ops s p l in
        let n =
          decode_homo_construction_poly
            f pos pos_end indefinite 4 ops s in
        (n, Netbuffer.contents buf)

and decode_ber_bits_poly pos pos_end indefinite ops s pc =
  let open Netstring_tstring in
  let len = pos_end - pos in
  match pc with
    | Value.Primitive ->
        if len = 0 then raise(Parse_error pos);
        let c0 = ops.get s pos in
        if c0 >= '\008' || (len = 1 && c0 <> '\000') then
          raise(Parse_error pos);
        (len, ops.substring s pos len)
    | Value.Constructed ->
        let c0_prev = ref '\000' in
        let buf = Netbuffer.create 500 in
        Netbuffer.add_char buf '\000';
        let f p l =
          if !c0_prev <> '\000' then raise(Parse_error pos);
          if l = 0 then raise(Parse_error pos);
          let c0 = ops.get s p in
          if c0 >= '\008' || (l = 1 && c0 <> '\000') then
            raise(Parse_error pos);
          c0_prev := c0;
          Netbuffer.add_subtstring_poly buf ops s (p+1) (l-1) in
        let n =
          decode_homo_construction_poly
            f pos pos_end indefinite 3 ops s in
        let bitstring = Netbuffer.to_bytes buf in
        Bytes.set bitstring 0 !c0_prev;
        (n, Bytes.unsafe_to_string bitstring)

and decode_list_construction_poly pos pos_end indefinite ops s =
  let open Netstring_tstring in
  let acc = ref [] in
  let cur = ref pos in
  let at_end() =
    if indefinite then
      !cur+2 <= pos_end && 
        ops.get s !cur = '\000' && ops.get s (!cur+1) = '\000'
    else
      !cur = pos_end in
  while not(at_end()) do
    assert(!cur < pos_end);
    let (ber_len, value) =
      decode_ber_poly ~pos:!cur ~len:(pos_end - !cur) ops s in
    acc := value :: !acc;
    cur := !cur + ber_len;
  done;
  if indefinite then cur := !cur + 2;
  if not indefinite && !cur <> pos_end then raise (Parse_error !cur);
  (!cur - pos, List.rev !acc)


let decode_ber ?pos ?len s =
  decode_ber_poly ?pos ?len Netstring_tstring.string_ops s

let decode_ber_tstring ?pos ?len ts =
  Netstring_tstring.with_tstring
    { Netstring_tstring.with_fun =
        (fun ops s ->
           decode_ber_poly ?pos ?len ops s
        )
    }
    ts

let decode_ber_contents ?pos ?len ?indefinite s v ty =
  let ops = Netstring_tstring.string_ops in
  decode_ber_contents_poly ?pos ?len ?indefinite ops s v ty

let decode_ber_contents_tstring ?pos ?len ?indefinite ts v ty =
  Netstring_tstring.with_tstring
    { Netstring_tstring.with_fun =
        (fun ops s ->
           decode_ber_contents_poly ?pos ?len ?indefinite ops s v ty
        )
    }
    ts

let decode_ber_length ?pos ?len s =
  let ops = Netstring_tstring.string_ops in
  decode_ber_length_poly ?pos ?len ops s

let decode_ber_length_tstring ?pos ?len ts =
  Netstring_tstring.with_tstring
    { Netstring_tstring.with_fun =
        (fun ops s ->
           decode_ber_length_poly ?pos ?len ops s
        )
    }
    ts

let decode_ber_header ?pos ?len ?skip_length_check s =
  let ops = Netstring_tstring.string_ops in
  decode_ber_header_poly ?pos ?len ?skip_length_check ops s

let decode_ber_header_tstring ?pos ?len ?skip_length_check ts =
  Netstring_tstring.with_tstring
    { Netstring_tstring.with_fun =
        (fun ops s ->
           decode_ber_header_poly ?pos ?len ?skip_length_check ops s
        )
    }
    ts

let rec streamline_seq expected seq =
  let open Netstring_tstring in
  match expected, seq with
    | [], [] ->
        []

    | [], _ ->
        failwith "Netasn1.streamline_seq [1]"

    | ((exp_tc, exp_tag, exp_ty)::expected1),
      (Value.ITag(act_tc, act_tag, act_v)::seq1)
          when exp_tc=act_tc && exp_tag=act_tag ->
        if Value.type_of_value act_v <> Some exp_ty then
          failwith "Netasn1.streamline_seq [2]";
        Some act_v :: streamline_seq expected1 seq1

    | ((exp_tc, exp_tag, exp_ty)::expected1),
      (Value.Tagptr(act_tc,act_tag,pc,box,pos,len)::seq1)
          when exp_tc=act_tc && exp_tag=act_tag ->
        let Tstring_polybox(ops,s) = box in
        let act_len, v = decode_ber_contents_poly ~pos ~len ops s pc exp_ty in
        if act_len <> len then
          failwith "Netasn1.streamline_seq [3]";
        Some v :: streamline_seq expected1 seq1

    | _, (Value.Tag _ :: _) ->
        failwith "Netasn1.streamline_seq [4]"

    | ((Value.Universal, exp_tag, exp_ty)::expected1),
      (v::seq1) 
          when Value.type_of_value v = Some exp_ty ->
        Some v :: streamline_seq expected1 seq1
               
    | (_ :: expected1), _ ->
        None :: streamline_seq expected1 seq


let streamline_set typeinfo set =
  let open Netstring_tstring in
  let ht = Hashtbl.create 5 in
  List.iter
    (fun (tc,tag,ty) -> Hashtbl.replace ht (tc,tag) ty)
    typeinfo;
  List.map
    (function
      | Value.ITag(tc, tag, v) ->
          let ty =
            try Hashtbl.find ht (tc,tag)
            with Not_found ->
              failwith "Netasn1.streamline_set" in
          if Value.type_of_value v <> Some ty then
            failwith "Netasn1.streamline_set";
          v
      | Value.Tagptr(tc, tag, pc, box, pos, len) ->
          let ty =
            try Hashtbl.find ht (tc,tag)
            with Not_found ->
              failwith "Netasn1.streamline_set" in
          let Tstring_polybox(ops,s) = box in
          let act_len, v = decode_ber_contents_poly ~pos ~len ops s pc ty in
          if act_len <> len then
            failwith "Netasn1.streamline_set";
          v
      | v ->
          v
    )
    set
