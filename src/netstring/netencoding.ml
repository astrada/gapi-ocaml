(* $Id$
 * ----------------------------------------------------------------------
 *
 *)

let hexdigit_uc =
  [| '0'; '1'; '2'; '3'; '4'; '5'; '6'; '7';
     '8'; '9'; 'A'; 'B'; 'C'; 'D'; 'E'; 'F'; |]

let hexdigit_lc =
  [| '0'; '1'; '2'; '3'; '4'; '5'; '6'; '7';
     '8'; '9'; 'a'; 'b'; 'c'; 'd'; 'e'; 'f'; |]


let to_hex ?(lc=false) s =
  let hexdigit = if lc then hexdigit_lc else hexdigit_uc in
  let l = String.length s in
  let u = Bytes.create (2*l) in
  for k = 0 to l-1 do
    let c = String.unsafe_get s k in
    let j = k lsl 1 in
    Bytes.unsafe_set u j     hexdigit.(Char.code c lsr 4);
    Bytes.unsafe_set u (j+1) hexdigit.(Char.code c land 15);
  done;
  Bytes.unsafe_to_string u


module Base64 = struct
  let alphabet =
    [| 'A'; 'B'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H'; 'I'; 'J'; 'K'; 'L'; 'M';
       'N'; 'O'; 'P'; 'Q'; 'R'; 'S'; 'T'; 'U'; 'V'; 'W'; 'X'; 'Y'; 'Z';
       'a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm';
       'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z';
       '0'; '1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; '+'; '/' |];;

  let mod_alphabet plus slash =
    if plus <> '+' || slash <> '/' then (
      let a = Array.copy alphabet in
      a.(62) <- plus;
      a.(63) <- slash;
      a
    ) else
      alphabet

  let encode_with_options ops b64 equal s pos len 
                          linelen first_linelen crlf =
  (* encode using "base64".
   * 'b64': The encoding table, created by b64_pattern.
   * 'equal': The character that should be used instead of '=' in the original
   *          encoding scheme. Pass '=' to get the original encoding scheme.
   * s, pos, len, linelen: See the interface description of encode_substring.
   * first_linelen: The length of the first line.
   *
   * Returns: (s,last_linelen) where [s] is the encoded string, and 
   *   [last_linelen] is the length of the last line
   *)
    let open Netstring_tstring in
    assert (Array.length b64 = 64);
    if len < 0 || pos < 0 || pos > ops.length s || linelen < 0 then
      invalid_arg "Netencoding.Base64.encode";
    if pos + len > ops.length s then
      invalid_arg "Netencoding.Base64.encode";

    let linelen = (linelen asr 2) lsl 2 in
    let first_linelen = (first_linelen asr 2) lsl 2 in

    let l_t = if len = 0 then 0 else ((len - 1) / 3 + 1) * 4 in
    (* l_t: length of the result without additional line endings *)

    let factor = if crlf then 2 else 1 in
    let l_t' = 
      if linelen < 4 then
	l_t
      else
	if l_t <= first_linelen then 
	  ( if l_t = 0 then 0 else l_t + factor )
	else 
	  let n_lines = ((l_t - first_linelen - 1) / linelen) + 2 in
	  l_t + n_lines * factor
    in
    (* l_t': length of the result with CRLF or LF characters *)
    
    let t = Bytes.make l_t' equal in
    let j = ref 0 in
    let q = ref (linelen - first_linelen) in
    for k = 0 to len / 3 - 1 do
      let p = pos + 3*k in
      (* p >= pos >= 0: this is evident
       * p+2 < pos+len <= String.length s:
       *   Because k <= len/3-1
       *         3*k <= 3*(len/3-1) = len - 3
       *   pos+3*k+2 <= pos + len - 3 + 2 = pos + len - 1 < pos + len
       * So it is proved that the following unsafe string accesses always
       * work.
       *)
      let bits = ops.unsafe_get3 s p in
      (* Obviously, 'bits' is a 24 bit entity (i.e. bits < 2**24) *)
      assert(!j + 3 < l_t');
      Bytes.unsafe_set t !j     (Array.unsafe_get b64 ( bits lsr 18));
      Bytes.unsafe_set t (!j+1) (Array.unsafe_get b64 ((bits lsr 12) land 63));
      Bytes.unsafe_set t (!j+2) (Array.unsafe_get b64 ((bits lsr  6) land 63));
      Bytes.unsafe_set t (!j+3) (Array.unsafe_get b64 ( bits         land 63));
      j := !j + 4;
      if linelen > 3 then begin
	q := !q + 4;
	if !q + 4 > linelen then begin
	  (* The next 4 characters won't fit on the current line. So insert
	   * a line ending.
	   *)
	  if crlf then begin
	    Bytes.set t !j '\013';
	    Bytes.set t (!j+1) '\010';
	    j := !j + 2;
	  end
	  else begin 
	    Bytes.set t !j '\010';
	    incr j
	  end;
	  q := 0;
	end;
      end;
    done;
    (* padding if needed: *)
    let m = len mod 3 in
    begin
      match m with
	  0 -> ()
	| 1 ->
            let bits = Char.code (ops.get s (pos + len - 1)) in
	    Bytes.set t !j b64.( bits lsr 2);
	    Bytes.set t (!j + 1) b64.( (bits land 0x03) lsl 4);
	    j := !j + 4;
	    q := !q + 4;
	| 2 ->
	    let bits = (Char.code (ops.get s (pos + len - 2)) lsl 8) lor
                       (Char.code (ops.get s (pos + len - 1))) in
	    Bytes.set t !j b64.( bits lsr 10);
	    Bytes.set t (!j + 1) b64.((bits lsr  4) land 0x3f);
	    Bytes.set t (!j + 2) b64.((bits lsl  2) land 0x3f);
	    j := !j + 4;
	    q := !q + 4;
	| _ -> assert false
    end;

    (* If required, add another line end: *)

    if linelen > 3 && !q > 0 && len > 0 then begin
      if crlf then begin
	Bytes.set t !j '\013';
	Bytes.set t (!j+1) '\010';
	j := !j + 2;
      end
      else begin 
	Bytes.set t !j '\010';
	incr j;
      end;	
    end;

    (t, !q) ;;



  let encode_poly ?(pos=0) ?len ?(linelength=0) ?(crlf=false) ?(plus='+')
                  ?(slash='/') ops s =
    let open Netstring_tstring in
    let alpha = mod_alphabet plus slash in
    let l = match len with None -> ops.length s - pos | Some x -> x in
    let s,_ = 
      encode_with_options
        ops alpha '=' s pos l linelength linelength crlf in
    s
  ;;


  let encode ?pos ?len ?linelength ?crlf ?plus ?slash s =
    let ops = Netstring_tstring.string_ops in
    let s = encode_poly ?pos ?len ?linelength ?crlf ?plus ?slash ops s in
    Bytes.unsafe_to_string s


  let encode_tstring ?pos ?len ?linelength ?crlf ?plus ?slash ts =
    Netstring_tstring.with_tstring
      { Netstring_tstring.with_fun =
          (fun ops s ->
             encode_poly ?pos ?len ?linelength ?crlf ?plus ?slash ops s
          )
      }
      ts

  let encoding_pipe_conv ?(linelength = 0) ?(crlf = false) ~plus ~slash
                         alpha lastlen 
                         incoming incoming_eof outgoing =
    let ops = Netstring_tstring.bytes_ops in
    let linelength = (linelength asr 2) lsl 2 in
    let len = Netbuffer.length incoming in
    let len' =
      if incoming_eof then 
	len
      else
	len - (len mod 3)    (* only process a multiple of three characters *)
    in
    let (s,ll) = 
      encode_with_options 
	ops alpha '=' (Netbuffer.unsafe_buffer incoming) 0 len' 
	linelength (linelength - !lastlen) crlf
    in
    Netbuffer.delete incoming 0 len';
    (* LF/CRLF: Unless s = "", s ends with a LF/CRLF. This is only right
     * if ll = 0 or at EOF. In the other cases, this additional LF/CRLF
     * must not be added to [outgoing].
     *)
    if linelength < 3  ||  ll=0  ||  Bytes.length s = 0 then begin
      Netbuffer.add_bytes outgoing s;
    end
    else begin
      let sl = Bytes.length s in
      assert(Bytes.get s (sl-1) = '\n');
      let sl' = if crlf then sl-2 else sl-1 in
      Netbuffer.add_subbytes outgoing s 0 sl';
    end;
    lastlen := ll;
    (* Ensure there is a LF/CRLF at the end: *)
    if incoming_eof && linelength > 3 && ll > 0 then
      Netbuffer.add_string outgoing (if crlf then "\r\n" else "\n");

      (* TODO: Can be improved by using Netbuffer.add_inplace
       *)


  class encoding_pipe ?linelength ?crlf  ?(plus='+') ?(slash='/') () =
    let alpha = mod_alphabet plus slash in
    let lastlen = ref 0 in
    let conv = 
      encoding_pipe_conv ?linelength ?crlf ~plus ~slash alpha lastlen in
    Netchannels.pipe ~conv ()
    

  let decode_prefix ops t pos len plus slash p_spaces p_full p_null =
    (* Decodes the prefix of a Base64-encoded string. Returns a triple
     * (s,n,eof) where s is the decoded prefix, and n is the number of 
     * processed characters from t (i.e. the characters pos to pos+n-1 have
     * been processed), and where eof is the boolean flag whether the
     * padding '=' characters at the end of the string have been seen.
     *
     * p_spaces: accepts spaces in [t] (at the price of reduced speed)
     * p_full: [t] must be a closed encoded string (i.e. no prefix)
     * p_null: [t] must be an encoded null string
     *)
    let open Netstring_tstring in

    if len < 0 || pos < 0 || pos > ops.length t then
      invalid_arg "Netencoding.Base64.decode";
    if pos + len > ops.length t then
      invalid_arg "Netencoding.Base64.decode";

    (* Compute the number of effective characters l_t in 't';
     * pad_chars: number of '=' characters at the end of the string.
     *)
    let l_t, pad_chars =
      if p_spaces then begin
	(* Count all non-whitespace characters: *)
	let c = ref 0 in
	let p = ref 0 in
	for i = pos to pos + len - 1 do
	  match ops.unsafe_get t i with
	      (' '|'\t'|'\r'|'\n'|'>') -> ()
	    | '=' ->
		incr c;
		incr p;
		if !p > 2 then
		  invalid_arg "Netencoding.Base64.decode";
		for j = i+1 to pos + len - 1 do
		  match ops.unsafe_get t j with
		      (' '|'\t'|'\r'|'\n'|'=') -> ()
		    | _ ->
			(* Only another '=' or spaces allowed *)
			invalid_arg "Netencoding.Base64.decode";
		done
	    | _ -> incr c
	done;
	!c, !p
      end
      else
	len,
	( if len > 0 then (
	    if ops.substring t (len - 2) 2 = "==" then 2
	    else 
	      if ops.substring t (len - 1) 1 = "=" then 1
	      else
		0
	  )
	  else 0 
	)
    in

    if p_null && l_t <> 0 then invalid_arg "Netencoding.Base64.decode";

    (* Compute the number of characters [l_t] that can be processed now
     * (i.e. the effective prefix)
     *)
    let l_t, pad_chars =
      let m = l_t mod 4 in
      if m = 0 then (
	(l_t, pad_chars)         (* a multiple of 4 *)
      ) else (
	if p_full then invalid_arg "Netencoding.Base64.decode";
	(l_t - m, 0)             (* rounded to a multiple of 4 *)
      )
    in

    let l_s = (l_t / 4) * 3 - pad_chars in
    let s = Bytes.create l_s in

    let decode_char c =
      match c with
	  'A' .. 'Z'  -> Char.code(c) - 65     (* 65 = Char.code 'A' *)
	| 'a' .. 'z'  -> Char.code(c) - 71     (* 71 = Char.code 'a' - 26 *)
	| '0' .. '9'  -> Char.code(c) + 4      (* -4 = Char.code '0' - 52 *)
        | _ ->
            if c = plus then 62
            else if c = slash then 63
            else invalid_arg "Netencoding.Base64.decode";
    in

    (* Decode all but the last quartet: *)

    let cursor = ref pos in
    let rec next_char() = 
      match ops.get t !cursor with
	  (' '|'\t'|'\r'|'\n'|'>') -> 
	    if p_spaces then (incr cursor; next_char())
	    else invalid_arg "Netencoding.Base64.decode"
	| c ->
	    incr cursor; c
    in

    if p_spaces then begin
      for k = 0 to l_t / 4 - 2 do
	let q = 3*k in
	let c0 = next_char() in
	let c1 = next_char() in
	let c2 = next_char() in
	let c3 = next_char() in
	let n0 = decode_char c0 in
	let n1 = decode_char c1 in
	let n2 = decode_char c2 in
	let n3 = decode_char c3 in
	let x0 = (n0 lsl 2) lor (n1 lsr 4) in
	let x1 = ((n1 lsl 4) land 0xf0) lor (n2 lsr 2) in
	let x2 = ((n2 lsl 6) land 0xc0) lor n3 in
	Bytes.unsafe_set s q     (Char.chr x0);
	Bytes.unsafe_set s (q+1) (Char.chr x1);
	Bytes.unsafe_set s (q+2) (Char.chr x2);
      done;
    end
    else begin
      (* Much faster: *)
      for k = 0 to l_t / 4 - 2 do
	let p = pos + 4*k in
	let q = 3*k in
        let c012 = ops.unsafe_get3 t p in
        let c0 = c012 lsr 16 in
        let c1 = (c012 lsr 8) land 0xff in
        let c2 = c012 land 0xff in
	let c3 = ops.unsafe_get t (p + 3) in
	let n0 = decode_char (Char.unsafe_chr c0) in
	let n1 = decode_char (Char.unsafe_chr c1) in
	let n2 = decode_char (Char.unsafe_chr c2) in
	let n3 = decode_char c3 in
	let x0 = (n0 lsl 2) lor (n1 lsr 4) in
	let x1 = ((n1 lsl 4) land 0xf0) lor (n2 lsr 2) in
	let x2 = ((n2 lsl 6) land 0xc0) lor n3 in
	Bytes.unsafe_set s q     (Char.chr x0);
	Bytes.unsafe_set s (q+1) (Char.chr x1);
	Bytes.unsafe_set s (q+2) (Char.chr x2);
      done;
      cursor := pos + l_t - 4;
    end;

    (* Decode the last quartet: *)

    if l_t > 0 then begin
      let q = 3*(l_t / 4 - 1) in
      let c0 = next_char() in
      let c1 = next_char() in
      let c2 = next_char() in
      let c3 = next_char() in

      if (c2 = '=' && c3 = '=') then begin
	let n0 = decode_char c0 in
	let n1 = decode_char c1 in
	let x0 = (n0 lsl 2) lor (n1 lsr 4) in
	Bytes.set s q (Char.chr x0);
      end
      else
	if (c3 = '=') then begin
	  let n0 = decode_char c0 in
	  let n1 = decode_char c1 in
	  let n2 = decode_char c2 in
	  let x0 = (n0 lsl 2) lor (n1 lsr 4) in
	  let x1 = ((n1 lsl 4) land 0xf0) lor (n2 lsr 2) in
	  Bytes.set s q (Char.chr x0);
	  Bytes.set s (q+1) (Char.chr x1);
	end
	else begin
	  let n0 = decode_char c0 in
	  let n1 = decode_char c1 in
	  let n2 = decode_char c2 in
	  let n3 = decode_char c3 in
	  let x0 = (n0 lsl 2) lor (n1 lsr 4) in
	  let x1 = ((n1 lsl 4) land 0xf0) lor (n2 lsr 2) in
	  let x2 = ((n2 lsl 6) land 0xc0) lor n3 in
	  Bytes.set s q (Char.chr x0);
	  Bytes.set s (q+1) (Char.chr x1);
	  Bytes.set s (q+2) (Char.chr x2);
	end

    end
    else cursor := 0;

    (s, !cursor - pos, pad_chars > 0) 
  ;;


  let decode_poly ?(pos=0) ?len ?(accept_spaces=false) ?(plus='+') ?(slash='/')
                  ops s =
    let open Netstring_tstring in
    let l = match len with None -> ops.length s - pos | Some x -> x in
    let (s,_,_) =
      decode_prefix ops s pos l plus slash accept_spaces true false in
    s    

  let decode ?pos ?len ?accept_spaces ?plus ?slash s =
    let ops = Netstring_tstring.string_ops in
    let s' = decode_poly ?pos ?len ?accept_spaces ?plus ?slash ops s in
    Bytes.unsafe_to_string s'


  let decode_tstring ?pos ?len ?accept_spaces ?plus ?slash ts =
    Netstring_tstring.with_tstring
      { Netstring_tstring.with_fun =
          (fun ops s ->
             decode_poly ?pos ?len ?accept_spaces ?plus ?slash ops s
          )
      }
      ts


  (* TODO: Use Netbuffer.add_inplace instead of creating an intermediate 
   * string s in [decoding_pipe_conv].
   *)

  let decoding_pipe_conv plus slash accept_spaces padding_seen
                         incoming incoming_eof outgoing =
    let ops = Netstring_tstring.bytes_ops in
    let len = Netbuffer.length incoming in
    let t = Netbuffer.unsafe_buffer incoming in
    if !padding_seen then begin
      (* Only accept the null string: *)
      let _,_,_ =
        decode_prefix ops t 0 len plus slash accept_spaces false true in
      Netbuffer.clear incoming
    end 
    else begin
      let (s,n,ps) = 
	decode_prefix ops t 0 len plus slash accept_spaces incoming_eof false in
      padding_seen := ps;
      if incoming_eof then 
	Netbuffer.clear incoming
      else
	Netbuffer.delete incoming 0 n;
      Netbuffer.add_bytes outgoing s
    end;


  class decoding_pipe ?(accept_spaces=false) ?(plus='+') ?(slash='/') () =
    let padding_seen = ref false in
    let conv =
      decoding_pipe_conv plus slash accept_spaces padding_seen in
    Netchannels.pipe ~conv ()
end



module QuotedPrintable = struct

  let encode_sub ?(crlf = true) ?(eot = false) ?(line_length = ref 0) ~pos ~len
                 ops s =
    (* line_length:
     * - on input, the length of the line where the encoding starts
     * - on output, the length of the last written line
     * eot:
     * - false: it is known that the chunk is not at the end of text
     * - true: the chunk may be at the end of the text
     * eot has only an effect on trailing spaces
     *)
    let open Netstring_tstring in
    
    if len < 0 || pos < 0 || pos > ops.length s then
      invalid_arg "Netencoding.QuotedPrintable.encode";
    if pos + len > ops.length s then
      invalid_arg "Netencoding.QuotedPrintable.encode";

    let eol_len = if crlf then 2 else 1 in    (* length of eol *)

    (* Note: The [count] algorithm must strictly correspond to the
     * "for" loop below.
     *)

    let rec count l n i =
      (* l: output line length
       * n: output byte count
       * i: input byte count
       *)
      if i < len then
	match ops.unsafe_get s (pos+i) with
	    '\r' ->              (* CR is deleted *)
	      count l n (i+1)
	  | '\n' ->              (* LF may be expanded to CR/LF *)
	      count 0 (n+eol_len) (i+1)
	  | ('\000'..'\031'|'\127'..'\255'|
	     '!'|'"'|'#'|'$'|'@'|'['|']'|'^'|'\''|'{'|'|'|'}'|'~'|'=') ->
	      if l <= 69 then
		count (l+3) (n+3) (i+1)
	      else
		(* Add soft line break after the encoded char: *)
		count 0 (n+4+eol_len) (i+1)
	  | 'F' when l=0 ->
	      (* Protect 'F' at the beginning of lines *)
	      count (l+3) (n+3) (i+1)
	  | ' ' when (i=len-1 && eot) ||   (* at end of text *)
	             l>69 ||               (* line too long *)
                     (i<len-1 && (ops.get s (pos+i+1) = '\r' ||
                                    ops.get s (pos+i+1) = '\n')) 
		        (* end of line *)
		     ->
	      (* Protect spaces only if they occur at the end of a line,
	       * or just before soft line breaks
	       *)
	      if l <= 69 then
		count (l+3) (n+3) (i+1)
	      else
		(* Add soft line after the encoded space: *)
		count 0 (n+4+eol_len) (i+1)
	  | _ ->
	      if l>71 then
		(* Add soft line break after the char: *)
		count 0 (n+2+eol_len) (i+1)
	      else
		count (l+1) (n+1) (i+1)
      else
	n
    in

    let t_len = count !line_length 0 0 in
    let t = Bytes.create t_len in
    
    let k = ref 0 in

    let add_quoted c =
      Bytes.set t !k '=';
      Bytes.set t (!k+1) (hexdigit_uc.( Char.code c lsr 4 ));
      Bytes.set t (!k+2) (hexdigit_uc.( Char.code c land 15 ))
    in

    let add_soft_break() =
      Bytes.set t !k '=';
      if crlf then (
	Bytes.set t (!k+1) '\r';
	Bytes.set t (!k+2) '\n';
      )
      else
	Bytes.set t (!k+1) '\n';
    in

    (* In the following, the soft break criterion is [!l > 72]. Why?
     * We need to be able to add at least an encoded char (3 bytes)
     * plus the "=" sign for the soft break. So we are on the safe side
     * when there are four bytes space on the line. Lines must not be
     * longer than 76 chars (w/o CRLF), so 76-4=72.
     *)

    let l = ref !line_length in
    for i = 0 to len - 1 do
      match ops.unsafe_get s i with
	  '\r' ->   (* CR is deleted *)
	    ()
	| '\n' ->   (* LF is expanded to CR/LF *)
	    if crlf then (
	      Bytes.set t !k '\r';
	      Bytes.set t (!k+1) '\n';
	      k := !k + 2;
	    ) else (
	      Bytes.set t !k '\n';
	      k := !k + 1;
	    );
	    l := 0
	| ('\000'..'\031'|'\127'..'\255'|
	   '!'|'"'|'#'|'$'|'@'|'['|']'|'^'|'\''|'{'|'|'|'}'|'~'|'=') as c ->
	    add_quoted c;
	    k := !k + 3;
	    l := !l + 3;
	    if !l > 72 then (
	      (* Add soft line break: *)
	      add_soft_break();
	      k := !k + 1 + eol_len;
	      l := 0
	    )
	| 'F' when !l = 0 ->
	    (* Protect 'F' at the beginning of lines *)
	    add_quoted 'F';
	    k := !k + 3;
	    l := !l + 3;
	| ' ' when ((i=len-1 && eot) ||
	              !l > 69 ||
                     (i<len-1 && (ops.get s (pos+i+1) = '\r' || 
                                    ops.get s (pos+i+1) = '\n'))) ->
	    add_quoted ' ';
	    k := !k + 3;
	    l := !l + 3;
	    if !l > 72 then (
	      add_soft_break();
	      k := !k + 1 + eol_len;
	      l := 0;
	    )
	| c ->
	    Bytes.unsafe_set t !k c;
	    incr k;
	    incr l;
	    if !l > 72 then (
	      add_soft_break();
	      k := !k + 1 + eol_len;
	      l := 0;
	    )
    done;

    assert(!k == t_len);

    line_length := !l;

    t ;;


  let encode_poly ?crlf ?(pos=0) ?len ops s =
    let open Netstring_tstring in
    let l = match len with None -> ops.length s - pos | Some x -> x in 
    encode_sub ?crlf ~eot:true ~pos ~len:l ops s;;


  let encode ?crlf ?pos ?len s =
    let ops = Netstring_tstring.string_ops in
    let s' = encode_poly ?crlf ?pos ?len ops s in
    Bytes.unsafe_to_string s'


  let encode_tstring ?crlf ?pos ?len ts =
    Netstring_tstring.with_tstring
      { Netstring_tstring.with_fun =
          (fun ops s ->
             encode_poly ?crlf ?pos ?len ops s
          )
      }
      ts

  let encoding_pipe_conv ?crlf line_length incoming incoming_eof outgoing =
    (* Problematic case: the incoming buffer ends with a space, but we are
     * not at EOF. It is possible that a LF immediately follows, and that
     * the space needs to be quoted.
     * Solution: Do not convert such spaces, they remain in the buffer.
     *)
    let open Netstring_tstring in
    let ops = Netstring_tstring.bytes_ops in
    let s = Netbuffer.unsafe_buffer incoming in
    let len = Netbuffer.length incoming in
    let (len',eot) =
      if not incoming_eof && len > 0 && ops.get s (len-1) = ' ' then
	(len-1, false)
      else
	(len, true)
    in
    let s' = encode_sub ?crlf ~eot ~line_length ~pos:0 ~len:len' ops s in
    Netbuffer.add_bytes outgoing s';
    Netbuffer.delete incoming 0 len'
  ;;
    

  class encoding_pipe ?crlf () =
    let line_length = ref 0 in
    Netchannels.pipe ~conv:(encoding_pipe_conv ?crlf line_length) ()


  let decode_sub ~pos ~len ops s =
    let open Netstring_tstring in

    if len < 0 || pos < 0 || pos > ops.length s then
      invalid_arg "Netencoding.QuotedPrintable.decode";
    if pos + len > ops.length s then
      invalid_arg "Netencoding.QuotedPrintable.decode";

    let decode_hex c =
      match c with
	  '0'..'9' -> Char.code c - 48
	| 'A'..'F' -> Char.code c - 55
	| 'a'..'f' -> Char.code c - 87
	| _ ->
	   invalid_arg "Netencoding.QuotedPrintable.decode";
    in 

    let rec count n i =
      if i < len then
	match ops.unsafe_get s (pos+i) with
	    '=' ->
	      if i+1 = len then
		(* A '=' at EOF is ignored *)
		count n (i+1)
	      else
		if i+1 < len then
		  match ops.get s (pos+i+1) with
		      '\r' ->
			(* Official soft break *)
			if i+2 < len && ops.get s (pos+i+2) = '\n' then
			  count n (i+3)
			else
			  count n (i+2)
		    | '\n' ->
			(* Inofficial soft break *)
			count n (i+2)
		    | _ ->
			if i+2 >= len then
			  invalid_arg 
			    "Netencoding.QuotedPrintable.decode";
			let _ = decode_hex (ops.get s (pos+i+1)) in
			let _ = decode_hex (ops.get s (pos+i+2)) in
			count (n+1) (i+3)
		else
		  invalid_arg "Netencoding.QuotedPrintable.decode"
	  | _ ->
	      count (n+1) (i+1)
      else
	n
    in

    let l = count 0 0 in
    let t = Bytes.create l in
    let k = ref pos in
    let e = pos + len in
    let i = ref 0 in

    while !i < l do
      match ops.unsafe_get s !k with
	  '=' ->
	    if !k+1 = e then
	      (* A '=' at EOF is ignored *)
	      ()
	    else
	      if !k+1 < e then
		match ops.get s (!k+1) with
		    '\r' ->
		      (* Official soft break *)
		      if !k+2 < e && ops.get s (!k+2) = '\n' then
			k := !k + 3
		      else
			k := !k + 2
		  | '\n' ->
		      (* Inofficial soft break *)
		      k := !k + 2
		  | _ ->
		      if !k+2 >= e then
			invalid_arg 
			  "Netencoding.QuotedPrintable.decode_substring";
		      let x1 = decode_hex (ops.get s (!k+1)) in
		      let x2 = decode_hex (ops.get s (!k+2)) in
		      Bytes.set t !i (Char.chr ((x1 lsl 4) lor x2));
		      k := !k + 3;
		      incr i
	      else
		invalid_arg "Netencoding.QuotedPrintable.decode_substring"
	| c ->
	    Bytes.unsafe_set t !i c;
	    incr k;
	    incr i
    done;

    t ;;


  let decode_poly ?(pos=0) ?len ops s =
    let open Netstring_tstring in
    let l = match len with None -> ops.length s - pos | Some x -> x in 
    decode_sub ~pos ~len:l ops s;;


  let decode ?pos ?len s =
    let ops = Netstring_tstring.string_ops in
    let s' = decode_poly ?pos ?len ops s in
    Bytes.unsafe_to_string s'


  let decode_tstring ?pos ?len ts =
    Netstring_tstring.with_tstring
      { Netstring_tstring.with_fun =
          (fun ops s ->
             decode_poly ?pos ?len ops s
          )
      }
      ts


  let decoding_pipe_conv incoming incoming_eof outgoing =
    (* Problematic case: The incoming buffer ends with '=' or '=X'. In this
     * case these characters remain in the buffer, because they will be
     * completed to a full hex sequence by the next conversion call.
     *)
    let open Netstring_tstring in
    let ops = Netstring_tstring.bytes_ops in
    let s = Netbuffer.unsafe_buffer incoming in
    let len = Netbuffer.length incoming in
    let len' =
      if not incoming_eof then begin
	if len > 0 && ops.get s (len-1) = '=' then
	  len - 1  
	else
	  if len > 1 && ops.get s (len-2) = '=' then
	    len - 2
	  else
	    len
      end
      else
	len
    in
    let s' = decode_poly ~len:len' ops s in
    Netbuffer.add_bytes outgoing s';
    Netbuffer.delete incoming 0 len'
  ;;

    
  class decoding_pipe () =
    Netchannels.pipe ~conv:decoding_pipe_conv ()
end

	      
module Q = struct

  let encode_sub ~pos ~len ops s =
    let open Netstring_tstring in

    if len < 0 || pos < 0 || pos > ops.length s then
      invalid_arg "Netencoding.Q.encode_substring";
    if pos + len > ops.length s then
      invalid_arg "Netencoding.Q.encode_substring";

    let rec count n i =
      if i < len then
	match ops.unsafe_get s (pos+i) with
	  | ('A'..'Z'|'a'..'z'|'0'..'9') ->
	      count (n+1) (i+1)
	  | _ ->
	      count (n+3) (i+1)
      else
	n
    in

    let l = count 0 0 in
    let t = Bytes.create l in
    
    let k = ref 0 in

    let add_quoted c =
      Bytes.set t !k '=';
      Bytes.set t (!k+1) (hexdigit_uc.( Char.code c lsr 4 ));
      Bytes.set t (!k+2) (hexdigit_uc.( Char.code c land 15 ))
    in

    for i = 0 to len - 1 do
      match ops.unsafe_get s i with
	| ('A'..'Z'|'a'..'z'|'0'..'9') as c ->
	    Bytes.unsafe_set t !k c;
	    incr k
	| c ->
	    add_quoted c;
	    k := !k + 3
    done;

    t ;;


  let encode_poly ?(pos=0) ?len ops s =
    let open Netstring_tstring in
    let l = match len with None -> ops.length s - pos | Some x -> x in 
    encode_sub ~pos ~len:l ops s;;


  let encode ?pos ?len s =
    let ops = Netstring_tstring.string_ops in
    let s' = encode_poly ?pos ?len ops s in
    Bytes.unsafe_to_string s'


  let encode_tstring ?pos ?len ts =
    Netstring_tstring.with_tstring
      { Netstring_tstring.with_fun =
          (fun ops s ->
             encode_poly ?pos ?len ops s
          )
      }
      ts



  let decode_sub ~pos ~len ops s =
    let open Netstring_tstring in

    if len < 0 || pos < 0 || pos > ops.length s then
      invalid_arg "Netencoding.Q.decode_substring";
    if pos + len > ops.length s then
      invalid_arg "Netencoding.Q.decode_substring";

    let decode_hex c =
      match c with
	  '0'..'9' -> Char.code c - 48
	| 'A'..'F' -> Char.code c - 55
	| 'a'..'f' -> Char.code c - 87
	| _ ->
	   invalid_arg "Netencoding.Q.decode_substring";
    in 

    let rec count n i =
      if i < len then
	match ops.unsafe_get s (pos+i) with
	    '=' ->
	      if i+2 >= len then
		invalid_arg "Netencoding.Q.decode_substring";
	      let _ = decode_hex (ops.get s (pos+i+1)) in
	      let _ = decode_hex (ops.get s (pos+i+2)) in
	      count (n+1) (i+3)
	  | _ ->  (* including '_' *)
	      count (n+1) (i+1)
      else
	n
    in

    let l = count 0 0 in
    let t = Bytes.create l in
    let k = ref pos in
    let e = pos + len in
    let i = ref 0 in

    while !i < l do
      match ops.unsafe_get s !k with
	  '=' ->
	    if !k+2 >= e then
	      invalid_arg "Netencoding.Q.decode_substring";
	    let x1 = decode_hex (ops.get s (!k+1)) in
	    let x2 = decode_hex (ops.get s (!k+2)) in
	    Bytes.set t !i (Char.chr ((x1 lsl 4) lor x2));
	    k := !k + 3;
	    incr i
	| '_' ->
	    Bytes.unsafe_set t !i ' ';
	    incr k;
	    incr i
	| c ->
	    Bytes.unsafe_set t !i c;
	    incr k;
	    incr i
    done;

    t ;;

  let decode_poly ?(pos=0) ?len ops s =
    let open Netstring_tstring in
    let l = match len with None -> ops.length s - pos | Some x -> x in 
    decode_sub ~pos ~len:l ops s;;


  let decode ?pos ?len s =
    let ops = Netstring_tstring.string_ops in
    let s' = decode_poly ?pos ?len ops s in
    Bytes.unsafe_to_string s'


  let decode_tstring ?pos ?len ts =
    Netstring_tstring.with_tstring
      { Netstring_tstring.with_fun =
          (fun ops s ->
             decode_poly ?pos ?len ops s
          )
      }
      ts
end


module Url = struct
  let hex_digits =
    [| '0'; '1'; '2'; '3'; '4'; '5'; '6'; '7';
       '8'; '9'; 'A'; 'B'; 'C'; 'D'; 'E'; 'F' |];;

  let to_hex2 k =
    (* Converts k to a 2-digit hex string *)
    let s = Bytes.create 2 in
    Bytes.set s 0 (hex_digits.( (k lsr 4) land 15 ));
    Bytes.set s 1 (hex_digits.( k land 15 ));
    Bytes.unsafe_to_string s ;;


  let of_hex1 c =
    match c with
	('0'..'9') -> Char.code c - Char.code '0'
      | ('A'..'F') -> Char.code c - Char.code 'A' + 10
      | ('a'..'f') -> Char.code c - Char.code 'a' + 10
      | _ ->
	raise Not_found ;;



  let url_encoding_re =
    Netstring_str.regexp "[^A-Za-z0-9_.!*-]";;

  let url_decoding_re =
    Netstring_str.regexp "\\+\\|%..\\|%.\\|%";;


  let encode ?(plus = true) s =
    Netstring_str.global_substitute
      url_encoding_re
      (fun r _ ->
	 match Netstring_str.matched_string r s with
	     " " when plus -> "+"
	   | x ->
	       let k = Char.code(x.[0]) in
	       "%" ^ to_hex2 k
      )
      s ;;


  let decode ?(plus = true) ?(pos=0) ?len s =
    let s_l = String.length s in
    let s1 = 
      if pos = 0 && len=None then s else 
	let len = match len with Some n -> n | None -> s_l in
	String.sub s pos len in
    let l = String.length s1 in
    Netstring_str.global_substitute
      url_decoding_re
      (fun r _ ->
	 match Netstring_str.matched_string r s1 with
	   | "+" -> if plus then " " else "+"
	   | _ ->
	       let i = Netstring_str.match_beginning r in
	       (* Assertion: s1.[i] = '%' *)
	       if i+2 >= l then failwith "Netencoding.Url.decode";
	       let c1 = s1.[i+1] in
	       let c2 = s1.[i+2] in
	       begin
		 try
		   let k1 = of_hex1 c1 in
		   let k2 = of_hex1 c2 in
		   String.make 1 (Char.chr((k1 lsl 4) lor k2))
		 with
		     Not_found ->
		       failwith "Netencoding.Url.decode"
	       end
      )
      s1 ;;

  let url_split_re =
    Netstring_str.regexp "[&=]";;

  let mk_url_encoded_parameters nv_pairs =
    String.concat "&"
      (List.map
	 (fun (name,value) ->
	    let name_encoded = encode name in
	    let value_encoded = encode value in
	    name_encoded ^ "=" ^ value_encoded
	 )
	 nv_pairs
      )
  ;;

  let dest_url_encoded_parameters parstr =
    let rec parse_after_amp tl =
      match tl with
	  Netstring_str.Text name :: Netstring_str.Delim "=" :: Netstring_str.Text value :: tl' ->
	    (decode name, decode value) :: parse_next tl'
	| Netstring_str.Text name :: Netstring_str.Delim "=" :: Netstring_str.Delim "&" :: tl' ->
	    (decode name, "") :: parse_after_amp tl'
	| Netstring_str.Text name :: Netstring_str.Delim "=" :: [] ->
	    [decode name, ""]
	| _ ->
	    failwith "Netencoding.Url.dest_url_encoded_parameters"
    and parse_next tl =
      match tl with
	  [] -> []
	| Netstring_str.Delim "&" :: tl' ->
	    parse_after_amp tl'
	| _ ->
	    failwith "Netencoding.Url.dest_url_encoded_parameters"
    in
    let toklist = Netstring_str.full_split url_split_re parstr in
    match toklist with
	[] -> []
      | _ -> parse_after_amp toklist
  ;;

  let mk_url_encoded_parameters params =
    String.concat "&"
      (List.map (fun (name, value) -> encode name ^ "=" ^ encode value) params)

end


module Html = struct

  let etable =
    [ "lt", 60;
      "gt", 62;
      "amp", 38;
      "quot", 34;     
         (* Note: &quot; is new in HTML-4.0, but it has been widely used
	  * much earlier.
	  *)
      "apos", 39;
         (* Only used if contained in unsafe_chars *)
      (* ISO-8859-1: *)
      "nbsp", 160;
      "iexcl", 161;
      "cent", 162;
      "pound", 163;
      "curren", 164;
      "yen", 165;
      "brvbar", 166;
      "sect", 167;
      "uml", 168;
      "copy", 169;
      "ordf", 170;
      "laquo", 171;
      "not", 172;
      "shy", 173;
      "reg", 174;
      "macr", 175;
      "deg", 176;
      "plusmn", 177;
      "sup2", 178;
      "sup3", 179;
      "acute", 180;
      "micro", 181;
      "para", 182;
      "middot", 183;
      "cedil", 184;
      "sup1", 185;
      "ordm", 186;
      "raquo", 187;
      "frac14", 188;
      "frac12", 189;
      "frac34", 190;
      "iquest", 191;
      "Agrave", 192;
      "Aacute", 193;
      "Acirc", 194;
      "Atilde", 195;
      "Auml", 196;
      "Aring", 197;
      "AElig", 198;
      "Ccedil", 199;
      "Egrave", 200;
      "Eacute", 201;
      "Ecirc", 202;
      "Euml", 203;
      "Igrave", 204;
      "Iacute", 205;
      "Icirc", 206;
      "Iuml", 207;
      "ETH", 208;
      "Ntilde", 209;
      "Ograve", 210;
      "Oacute", 211;
      "Ocirc", 212;
      "Otilde", 213;
      "Ouml", 214;
      "times", 215;
      "Oslash", 216;
      "Ugrave", 217;
      "Uacute", 218;
      "Ucirc", 219;
      "Uuml", 220;
      "Yacute", 221;
      "THORN", 222;
      "szlig", 223;
      "agrave", 224;
      "aacute", 225;
      "acirc", 226;
      "atilde", 227;
      "auml", 228;
      "aring", 229;
      "aelig", 230;
      "ccedil", 231;
      "egrave", 232;
      "eacute", 233;
      "ecirc", 234;
      "euml", 235;
      "igrave", 236;
      "iacute", 237;
      "icirc", 238;
      "iuml", 239;
      "eth", 240;
      "ntilde", 241;
      "ograve", 242;
      "oacute", 243;
      "ocirc", 244;
      "otilde", 245;
      "ouml", 246;
      "divide", 247;
      "oslash", 248;
      "ugrave", 249;
      "uacute", 250;
      "ucirc", 251;
      "uuml", 252;
      "yacute", 253;
      "thorn", 254;
      "yuml", 255;
      (* Other: *)
      "fnof", 402;
      "Alpha", 913;
      "Beta", 914;
      "Gamma", 915;
      "Delta", 916;
      "Epsilon", 917;
      "Zeta", 918;
      "Eta", 919;
      "Theta", 920;
      "Iota", 921;
      "Kappa", 922;
      "Lambda", 923;
      "Mu", 924;
      "Nu", 925;
      "Xi", 926;
      "Omicron", 927;
      "Pi", 928;
      "Rho", 929;
      "Sigma", 931;
      "Tau", 932;
      "Upsilon", 933;
      "Phi", 934;
      "Chi", 935;
      "Psi", 936;
      "Omega", 937;
      "alpha", 945;
      "beta", 946;
      "gamma", 947;
      "delta", 948;
      "epsilon", 949;
      "zeta", 950;
      "eta", 951;
      "theta", 952;
      "iota", 953;
      "kappa", 954;
      "lambda", 955;
      "mu", 956;
      "nu", 957;
      "xi", 958;
      "omicron", 959;
      "pi", 960;
      "rho", 961;
      "sigmaf", 962;
      "sigma", 963;
      "tau", 964;
      "upsilon", 965;
      "phi", 966;
      "chi", 967;
      "psi", 968;
      "omega", 969;
      "thetasym", 977;
      "upsih", 978;
      "piv", 982;
      "bull", 8226;
      "hellip", 8230;
      "prime", 8242;
      "Prime", 8243;
      "oline", 8254;
      "frasl", 8260;
      "weierp", 8472;
      "image", 8465;
      "real", 8476;
      "trade", 8482;
      "alefsym", 8501;
      "larr", 8592;
      "uarr", 8593;
      "rarr", 8594;
      "darr", 8595;
      "harr", 8596;
      "crarr", 8629;
      "lArr", 8656;
      "uArr", 8657;
      "rArr", 8658;
      "dArr", 8659;
      "hArr", 8660;
      "forall", 8704;
      "part", 8706;
      "exist", 8707;
      "empty", 8709;
      "nabla", 8711;
      "isin", 8712;
      "notin", 8713;
      "ni", 8715;
      "prod", 8719;
      "sum", 8721;
      "minus", 8722;
      "lowast", 8727;
      "radic", 8730;
      "prop", 8733;
      "infin", 8734;
      "ang", 8736;
      "and", 8743;
      "or", 8744;
      "cap", 8745;
      "cup", 8746;
      "int", 8747;
      "there4", 8756;
      "sim", 8764;
      "cong", 8773;
      "asymp", 8776;
      "ne", 8800;
      "equiv", 8801;
      "le", 8804;
      "ge", 8805;
      "sub", 8834;
      "sup", 8835;
      "nsub", 8836;
      "sube", 8838;
      "supe", 8839;
      "oplus", 8853;
      "otimes", 8855;
      "perp", 8869;
      "sdot", 8901;
      "lceil", 8968;
      "rceil", 8969;
      "lfloor", 8970;
      "rfloor", 8971;
      "lang", 9001;
      "rang", 9002;
      "loz", 9674;
      "spades", 9824;
      "clubs", 9827;
      "hearts", 9829;
      "diams", 9830;
      "OElig", 338;
      "oelig", 339;
      "Scaron", 352;
      "scaron", 353;
      "Yuml", 376;
      "circ", 710;
      "tilde", 732;
      "ensp", 8194;
      "emsp", 8195;
      "thinsp", 8201;
      "zwnj", 8204;
      "zwj", 8205;
      "lrm", 8206;
      "rlm", 8207;
      "ndash", 8211;
      "mdash", 8212;
      "lsquo", 8216;
      "rsquo", 8217;
      "sbquo", 8218;
      "ldquo", 8220;
      "rdquo", 8221;
      "bdquo", 8222;
      "dagger", 8224;
      "Dagger", 8225;
      "permil", 8240;
      "lsaquo", 8249;
      "rsaquo", 8250;
      "euro", 8364;
    ] ;;

  let quick_etable_html =
    let ht = Hashtbl.create 50 in
    List.iter (fun (name,value) -> 
		 Hashtbl.add ht name value
	      ) 
              etable;
    ht ;;

  let quick_etable_xml =
    let ht = Hashtbl.create 5 in
    List.iter (fun name -> 
		 let value = List.assoc name etable in
		 Hashtbl.add ht name value
	      ) 
              [ "lt"; "gt"; "amp"; "quot"; "apos"];
    ht ;;


  let rev_etable =
    (* Only code points 0 to 255: *)
    let a = Array.make 256 "" in
    List.iter (fun (name,value) -> 
		 if value <= 255 then
		   a.(value) <- "&" ^ name ^ ";"
	      ) etable;
    a ;;

  let rev_etable_rest =
    (* Only code points >= 256: *)
    let ht = Hashtbl.create 150 in
    List.iter (fun (name,value) -> 
		 if value >= 256 then
		   Hashtbl.add ht value ("&" ^ name ^ ";")
	      ) etable;
    ht ;;


  let unsafe_chars_html4 = "<>\"&\000\001\002\003\004\005\006\007\008\011\012\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031\127" ;;


  let regexp_ht = Hashtbl.create 7
  let regexp_ht_mutex = !Netsys_oothr.provider # create_mutex()

  let regexp_set s =
    Netsys_oothr.serialize
      regexp_ht_mutex
      (fun () ->
	 try
	   Hashtbl.find regexp_ht s
	 with
	   | Not_found ->
	       let re = Netstring_str.regexp (Netstring_str.quote_set s) in
	       if Hashtbl.length regexp_ht < 100 then  (* avoid leak *)
		 Hashtbl.replace regexp_ht s re;
	       re
      )
      ()


  (* The functions [encode_quickly] and [encode_ascii] are special cases of 
   * [encode] that can be implemented by regular expressions.
   *)

  let encode_quickly ~prefer_name ~unsafe_chars () =
    (* Preconditions: in_enc = out_enc, and the encoding must be a single-byte,
     * ASCII-compatible encoding.
     *)
    if unsafe_chars = "" then
      (fun s -> s)
    else
      let unsafe_re = 
	regexp_set unsafe_chars in
      Netstring_str.global_substitute
	unsafe_re
	(fun r s ->
	   let t = Netstring_str.matched_string r s in
	   let p = Char.code (t.[0]) in    (* p is an ASCII code point *)
	   let name = rev_etable.(p) in
	   if prefer_name && name <> "" then
	     name
	   else
	     "&#" ^ string_of_int p ^ ";"
	)
  ;;


  let encode_quickly_poly ~prefer_name ~unsafe_chars ~ops ~out_kind () =
    Netstring_tstring.polymorph_string_transformation
      (encode_quickly ~prefer_name ~unsafe_chars ())
      ops
      out_kind

  let msb_set = (
    let s = Bytes.create 128 in
    for k = 0 to 127 do Bytes.set s k (Char.chr (128+k)) done;
    Bytes.unsafe_to_string s
  )

  let encode_ascii ~in_enc ~prefer_name ~unsafe_chars () =
    (* Preconditions: out_enc = `Enc_usascii, and in_enc must be a single-byte,
     * ASCII-compatible encoding.
     *)
    let unsafe_chars1 = unsafe_chars ^ msb_set in
    let unsafe_re = 
      regexp_set unsafe_chars1 in
    (* unicode_of.[q] = p: the code point q+128 of in_enc is the same as the
     * Unicode code point p
     *)
    let unicode_of = Array.make 128 (-1) in
    for i = 0 to 127 do
      try
	let s = String.make 1 (Char.chr (i+128)) in
	let u = Netconversion.uarray_of_ustring in_enc s in
	match u with
	    [| u0 |] -> unicode_of.(i) <- u0
	  | _ -> assert false
      with
	  Netconversion.Malformed_code -> 
	    unicode_of.(i) <- (-1)
    done;
    Netstring_str.global_substitute
      unsafe_re
      (fun r s ->
	 let t = Netstring_str.matched_string r s in
	 (* p is the code point in the encoding ~in_enc; p' is the Unicode
	  * code point:
	  *)
	 let p = Char.code (t.[0]) in
	 let p' = if p < 128 then p else unicode_of.(p - 128) in
	 if p' < 0 then raise Netconversion.Malformed_code;
	 let name = 
	   if prefer_name then begin
	     if p' <= 255 then rev_etable.(p') else
	       try
		 Hashtbl.find rev_etable_rest p'
	       with
		   Not_found -> ""
	   end
	   else "" in
	 if name = "" then
	   "&#" ^ string_of_int p' ^ ";"
	 else
	   name
      )
  ;;


  let encode_ascii_poly ~in_enc ~prefer_name ~unsafe_chars ~ops ~out_kind () =
    Netstring_tstring.polymorph_string_transformation
      (encode_ascii ~in_enc ~prefer_name ~unsafe_chars ())
      ops
      out_kind



  let encode_from_latin1 =            (* backwards compatible *)
    encode_ascii 
      ~in_enc:`Enc_iso88591 ~prefer_name:true ~unsafe_chars:unsafe_chars_html4
      ()
  ;;


  let encode_poly
        ~in_enc
        ~in_ops
        ~out_kind
        ?(out_enc = `Enc_usascii)
	?(prefer_name = true)
	?(unsafe_chars = unsafe_chars_html4)
	() =
    (* This function implements the general case *)
    (* Check arguments: *)
    if not (Netconversion.is_ascii_compatible out_enc) then
      invalid_arg "Netencoding.Html.encode: out_enc not ASCII-compatible";
    for i = 0 to String.length unsafe_chars - 1 do
      if Char.code(unsafe_chars.[i]) >= 128 then
	invalid_arg "Netencoding.Html.encode: non-ASCII character in unsafe_chars";
    done;
    (* Are there better implementations than the general one? *)
    let in_single = Netconversion.is_single_byte in_enc in
    let in_subset = match in_enc with `Enc_subset(_,_) -> true | _ -> false in
    if not in_subset && in_enc=out_enc && in_single then 
      encode_quickly_poly
        ~prefer_name ~unsafe_chars ~ops:in_ops ~out_kind ()
    else if not in_subset && out_enc=`Enc_usascii && in_single then
      encode_ascii_poly
        ~in_enc ~prefer_name ~unsafe_chars ~ops:in_ops ~out_kind ()
    else begin
      (* ... only the general implementation is applicable. *)
      (* Create the domain function: *)
      let dom_array = Array.make 128 true in
      let dom p =  p >= 128 || dom_array.(p) in
      (* Set dom_array from unsafe_chars: *)
      for i = 0 to String.length unsafe_chars - 1 do
	let c = Char.code(unsafe_chars.[i]) in
	dom_array.(c) <- false
      done;
      (* Create the substitution function: *)
      let subst p =
	let name = 
	  if prefer_name then begin
	    if p <= 255 then rev_etable.(p) else
	       try
		 Hashtbl.find rev_etable_rest p
	       with
		   Not_found -> ""
	  end
	  else "" in
	if name = "" then
	  "&#" ^ string_of_int p ^ ";"
	else
	  name
      in
      (* Recode: *)
      (fun s ->
         Netconversion.convert_poly
           ~in_ops ~out_kind ~subst ~in_enc ~out_enc:(`Enc_subset(out_enc,dom))
           s
      )
    end
  ;;

  let encode ~in_enc ?out_enc ?prefer_name ?unsafe_chars () =
    let in_ops = Netstring_tstring.string_ops in
    let out_kind = Netstring_tstring.String_kind in
    encode_poly ~in_enc ~in_ops ~out_kind ?out_enc ?prefer_name ?unsafe_chars ()


  let encode_tstring ~in_enc ~out_kind ?out_enc ?prefer_name ?unsafe_chars () =
    Netstring_tstring.with_tstring
    { Netstring_tstring.with_fun =
        (fun in_ops s ->
           encode_poly
             ~in_enc ~in_ops ~out_kind ?out_enc ?prefer_name ?unsafe_chars ()
             s
        )
    }

  type entity_set = [ `Html | `Xml | `Empty ];;

  let eref_re = 
    Netstring_str.regexp "&\\(\
                            #\\([0-9]+\\);\\|\
                            #[xX]\\([0-9a-fA-F]+\\);\\|\
                            \\([a-zA-Z]+\\);\
                          \\)" ;;

  let total_enc =
    (* every byte must have a corresponding Unicode code point, i.e. the
     * encoding must be "byte-total"
     *)
    function
	`Enc_iso88591
      | `Enc_iso88592
      | `Enc_iso88593
      | `Enc_iso88594
      | `Enc_iso88595
      | `Enc_iso88599
      | `Enc_iso885910
      | `Enc_iso885913
      | `Enc_iso885914
      | `Enc_iso885915
      | `Enc_iso885916  -> true
      | _ -> false
  ;;

  let hex_digit_of_char c =
    match c with
       '0'..'9' -> Char.code c - 48
      | 'A'..'F' -> Char.code c - 55
      | 'a'..'f' -> Char.code c - 87
      | _ -> assert false

  let hex_of_string s =
    let n = ref 0 in
    for i = 0 to String.length s - 1 do
      let d = hex_digit_of_char s.[i] in
      n := (!n lsl 4) lor d
    done;
    !n


  let search_all re s pos =
    let rec search p acc =
      match 
	try Some(Netstring_str.search_forward re s p) with Not_found -> None
      with
	| Some (k,r) ->
	    search (k+1) ( (k,r) :: acc )
	| None ->
	    List.rev acc in
    search pos []
      

  let decode_half_poly
        ~in_enc
        ~out_kind
        ~out_enc
        ?(lookup=fun name -> 
	    failwith ("Netencoding.Html.decode: Unknown entity `" ^ name ^ "'"))
        ?(subst=fun p ->
	    failwith ("Netencoding.Html.decode: Character cannot be represented: " ^ string_of_int p))
	?(entity_base = (`Html : entity_set))
	() =
    (* Argument checks: *)
    if not (Netconversion.is_ascii_compatible in_enc) then
      invalid_arg "Netencoding.Html.decode: in_enc not ASCII-compatible";
    (* makechar: *)
    let raw_makechar = Netconversion.makechar out_enc in
    let makechar p =
      try raw_makechar p
      with Not_found -> subst p
    in
    (* Entity lookup: *)
    let lookup_entity =
      match entity_base with
	  `Html	    
	| `Xml ->
	    let ht = 
	      if entity_base = `Html 
	      then quick_etable_html 
	      else quick_etable_xml in
	    ( fun name ->
		try 
		  makechar(Hashtbl.find ht name)
		with
		    Not_found -> lookup name
	    )
	| `Empty ->
	    lookup
    in
    (* Recode strings: *)
    let recode_str =
      if total_enc in_enc && in_enc = out_enc then
	(fun s pos len ->
           if pos=0 && len=(String.length s) then
             s
           else
             String.sub s pos len
        )
      else
	(fun s range_pos range_len ->
           Netconversion.convert
             ~in_enc ~out_enc ~subst ~range_pos ~range_len s)
    in
    (fun s ->
       (* Find all occurrences of &name; or &#num; or &#xnum; *)
       let occurrences = search_all eref_re s 0  in
       (* Collect the resulting string in a buffer *)
       let buf = Netbuffer.create 250 in
       let n = ref 0 in
       List.iter
	 (fun (n0,r) ->
	    let n1 = Netstring_str.match_end r in
	    if n0 > !n then
	      Netbuffer.add_string buf (recode_str s !n (n0 - !n));
	    let replacement =
	      let num = 
		try Netstring_str.matched_group r 2 s with Not_found -> "" in
	      (* Note: Older versions of Pcre return "" when the substring
	       * did not match, newer versions raise Not_found  
	       *)
	      if num <> "" then begin
		let n = int_of_string num in
		makechar n
	      end
	      else begin
		let xnum = 
		  try Netstring_str.matched_group r 3 s with Not_found -> "" in
		(* Note: Older versions of Pcre return "" when the substring
		 * did not match, newer versions raise Not_found  
		 *)
		if xnum <> "" then begin
		  let n = hex_of_string xnum in
		  makechar n
		end
		else begin
		  let name = 
		    try Netstring_str.matched_group r 4 s with Not_found -> "" in
		  (* Note: Older versions of Pcre return "" when the substring
	           * did not match, newer versions raise Not_found  
	           *)
		  assert(name <> "");
		  lookup_entity name
		end
	      end
	    in
	    Netbuffer.add_string buf replacement;
	    n := n1;
	 )
	 occurrences;
       let n0 = String.length s in
       if n0 > !n then
	 Netbuffer.add_string buf (recode_str s !n (n0 - !n));
       (* Return *)
       Netbuffer.to_tstring_poly buf out_kind
    )
  ;;

  let decode_poly
        ~in_enc ~in_ops ~out_kind ~out_enc ?lookup ?subst ?entity_base () s =
    let open Netstring_tstring in
    decode_half_poly
      ~in_enc ~out_kind ~out_enc ?lookup ?subst ?entity_base () 
      (in_ops.string s)


  let decode ~in_enc ~out_enc ?lookup ?subst ?entity_base () =
    let out_kind = Netstring_tstring.String_kind in
    decode_half_poly
      ~in_enc ~out_kind ~out_enc ?lookup ?subst ?entity_base ()


  let decode_tstring ~in_enc ~out_kind ~out_enc ?lookup ?subst ?entity_base () =
    Netstring_tstring.with_tstring
    { Netstring_tstring.with_fun =
        (fun in_ops s ->
           decode_poly
             ~in_enc ~in_ops ~out_kind ~out_enc ?lookup ?subst ?entity_base ()
             s
        )
    }

     
  let decode_to_latin1 =
    decode ~in_enc:`Enc_iso88591 ~out_enc:`Enc_iso88591 
           ~lookup:(fun s -> "&" ^ s ^ ";")
           ~subst:(fun p -> "&#" ^ string_of_int p ^ ";")
           ()

end
