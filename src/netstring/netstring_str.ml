(* $Id$
 * ----------------------------------------------------------------------
 *
*)

open Printf

module Debug = struct
  let enable = ref false
end

let dlog = Netlog.Debug.mk_dlog "Netstring_str" Debug.enable
let dlogr = Netlog.Debug.mk_dlogr "Netstring_str" Debug.enable

let () =
  Netlog.Debug.register_module "Netstring_str" Debug.enable


let explode s =
  let l = String.length s in
  let rec loop k =
    if k < l then
      s.[k] :: loop (k+1)
    else
      [] in
  loop 0

let implode l =
  let n = List.length l in
  let s = Bytes.create n in
  let k = ref 0 in
  List.iter
    (fun c ->
       Bytes.set s !k c;
       incr k
    )
    l;
  Bytes.to_string s


let quote_set s =
  let l = explode s in
  let have_circum = List.mem '^' l in
  let have_minus = List.mem '-' l in
  let have_rbracket = List.mem ']' l in
  let l1 = List.filter (fun c -> c <> '^' && c <> '-' && c <> ']') l in
  let l2 = if have_rbracket then ']' :: l1 else l1 in
  let l3 = if have_circum then l2 @ ['^'] else l2 in
  let l4 = if have_minus then l3 @ ['-'] else l3 in
  let s4 = implode l4 in
  let s' =
    match s4 with
    | "" -> failwith "Netstring_str.quote_set: empty"
    | "^" -> "^"
    | "^-" -> "[-^]"
    | _ -> "[" ^ s4 ^ "]" in
  if !Debug.enable then
    dlogr (fun () ->
        sprintf "quote_set: orig: %s - quoted: %s" s s'
      );
  s'

  (**********************************************************************)
  (* HAVE_PCRE                                                          *)
  (**********************************************************************)

  #ifndef ENABLE_STR_EXTERNALS
          #ifdef HAVE_PCRE

(* This implementation of Netstring_str uses the PCRE engine. The
 * syntax for regular expressions is compatible with previous versions.
*)


(**********************************************************************)
(* Parsing types *)

type setatom =
  | Schar of char
  | Srange of (char * char)

and set = setatom list
;;


type re_term =
    Texact of string            (* literal characters (except NUL) *)
  | Tnullchar                   (* NUL characer *)
  | Tany                        (* . but no newline *)
  | Tnull                       (* emptiness *)
  | Tconcat of re_term list
  | Tstar of re_term            (* x* *)
  | Tplus of re_term            (* x+ *)
  | Toption of re_term          (* x? *)
  | Tset of set                 (* [...] *)
  | Tnegset of set              (* [^...] *)
  | Tbegline                    (* ^ *)
  | Tendline                    (* $ *)
  | Talt of re_term list        (* x\|y *)
  | Tgroup of (int * re_term)   (* \(...\) *)
  | Trefer of int               (* \i *)
  | Tinterval of (re_term * int * int)    (* x{n,m}. m=-1 means infinite *)
  | Twordchar                   (* \w *)
  | Tnowordchar                 (* \W *)
  | Twordbeg                    (* \< *)
  | Twordend                    (* \> *)
  | Twordbound                  (* \b *)
  | Tnowordbound                (* \B *)
  | Tbegbuf                     (* \` *)
  | Tendbuf                     (* \' *)
;;


(**********************************************************************)
(* Final types *)

type regexp = Pcre.regexp;;
type split_result = Str.split_result = Text of string | Delim of string;;

type result = Netstring_pcre.result ;;

(**********************************************************************)
(* Parse Str-style regexps, and convert to Pcre-style regexps *)

let scan_str_regexp re_string =

  let l = String.length re_string in
  let k = ref (-1) in
  let c = ref ' ' in
  let esc = ref false in
  let group = ref 1 in
  let n_open_groups = ref 0 in
  let closed_groups = Array.make 10 false in

  let next() =
    incr k;
    if ( !k < l ) then begin
      let c1 = re_string.[ !k ] in
      if c1 = '\\' then begin
        if !k < l then begin
          incr k;
          c := re_string.[ !k ];
          esc := true
        end
        else
          failwith "regexp: bad backslash"
      end
      else begin
        esc := false;
        c := c1
      end
    end
  in

  let next_noesc() =
    incr k;
    if ( !k < l ) then begin
      c := re_string.[ !k ];
      esc := false
    end
  in

  let rec scan_alternative () =
    let t1 = scan_concatenation () in
    if !k < l then begin
      if !esc & !c = '|' then begin
        next();
        match scan_alternative() with
          Talt alist -> Talt (t1::alist)
        | t          -> Talt [ t1; t]
      end else t1
    end else t1

  and scan_concatenation () =
    let t1 = scan_repetition () in
    if t1 = Tnull then
      t1
    else
      let t2 = scan_concatenation() in
      match t2 with
        Tnull         -> t1
      |	Texact s2     -> begin
          match t1 with
            Texact s1 -> Texact (s1 ^ s2)
          | _         -> Tconcat [t1;t2]
        end
      |	Tconcat clist -> Tconcat (t1::clist)
      |	_             -> Tconcat [ t1; t2 ]

  and scan_repetition () =
    let t1 = ref (scan_literal_or_group ()) in
    let continue = ref true in
    while !continue do
      if !k < l & not !esc then begin
        match !c with
          '*' -> next();
          t1 := Tstar !t1
        | '+' -> next();
          t1 := Tplus !t1
        | '?' -> next();
          t1 := Toption !t1
        (* {...} is not implemented in Str *)
(*
      	| '{' -> next_noesc();
	         let n1 = ref None in
	         let n2 = ref None in

		 let j = ref 0 in
		 if !k < l & !c >= '0' & !c <= '9' then begin
		   while !k < l & !c >= '0' & !c <= '9' do
		     j := 10* !j + (Char.code !c - Char.code '0');
		     next_noesc()
		   done;
		   n1 := Some !j
                 end;

		 if !k < l & !n1 <> None & !c = '}' then begin
		   next();
		   t1 := Tinterval (!t1, !j, !j)
		 end
		 else begin

		   if !k >= l or !c <> ',' then
		     failwith "regexp: error in {...} phrase";

		   next_noesc();
		   j := 0;

		   if !k < l & !c >= '0' & !c <= '9' then begin
		     while !k < l & !c >= '0' & !c <= '9' do
		       j := 10* !j + (Char.code !c - Char.code '0');
		       next_noesc()
		     done;
		     n2 := Some !j
                   end;

		   if !k >= l || !c <> '}' then
		     failwith "regexp: error in {...} phrase";

		   next();
		   ( match !n1 with
		     None ->
		       ( match !n2 with
		           None ->
			     failwith "regexp: error in {...} phrase";
		         | Some m2 ->
			     t1 := Tinterval (!t1, 0, m2)
		       )
		   | Some m1 ->
		       ( match !n2 with
		           None ->
			     t1 := Tinterval (!t1, m1, -1)
		         | Some m2 ->
			     t1 := Tinterval (!t1, m1, m2)
		       )
                   )
		 end
 *)

        | _   -> continue := false
      end
      else continue := false
    done;
    !t1

  and scan_literal_or_group () =
    if !k >= l then
      Tnull
    else
    if !esc then begin
      match !c with
        '(' -> next();
        let n = !group in
        incr group;
        incr n_open_groups;
        let t = scan_alternative() in
        decr n_open_groups;
        if !k < l & !esc & !c = ')' then begin
          next();
          closed_groups.(n) <- true;
          Tgroup (n, t)
        end
        else
          failwith "regexp: closing paranthesis \\) not found"
      |	('1'..'9') -> let n = (Char.code !c - Char.code '0') in 
        if closed_groups.(n) then begin
          next(); 
          Trefer n
        end else 
          failwith "regexp: bad reference to group"
(*
      |	'w' -> next(); Twordchar
      |	'W' -> next(); Tnowordchar
 *)
      |	'b' -> next(); Twordbound
(*
      |	'B' -> next(); Tnowordbound
      |	'<' -> next(); Twordbeg
      |	'>' -> next(); Twordend
      |	'`' -> next(); Tbegbuf
      |	'\'' -> next(); Tendbuf
 *)
      |	'\\' -> next(); Texact (String.make 1 '\\')
      |	'|' -> Tnull
      |	')' -> if !n_open_groups > 0 then
          Tnull
        else
          failwith "regexp: unmatched closing parenthesis"
      |	ch -> next(); Texact (String.make 1 ch)
    end 
    else begin
      match !c with
        '*' -> Tnull
      |	'+' -> Tnull
      |	'?' -> Tnull
      |	'{' -> Tnull
      |	'^' -> next(); Tbegline
      |	'$' -> next(); Tendline
      |	'.' -> next(); Tany
      | '\000' -> next(); Tnullchar

      |	'[' -> next_noesc();
        if !k < l then begin
          let negated = ref false in
          let set = ref [] in

          let add_char c =
            set := Schar c :: !set
          in

          let add_range c1 c2 =
            set := Srange(c1,c2) :: !set
          in

          if !c = '^' then begin
            next_noesc();
            negated := true
          end;

          let continue = ref true in
          let first = ref true in  (* the character after [ or [^ ? *)

          while !continue & !k < l do
            match () with
              () when !c = '[' & !k + 1 < l & re_string.[!k + 1] = ':' ->
              failwith "regexp: Character classes such as [[:digit:]] not implemented";

              (* TODO: check for predefined sets *)

            | () when !c = ']' & not !first ->
              next();
              continue := false

            | () when (!k + 2 < l) & (re_string.[!k + 1] = '-') &
                      (re_string.[!k + 2] <> ']') ->

              (* range *)

              add_range !c (re_string.[!k + 2]);
              next_noesc();
              next_noesc();
              next_noesc();
              first := false;

            | () ->
              add_char !c;
              next_noesc();
              first := false;
          done;

          if !continue then
            failwith "regexp: closing bracket ] not found";

          if !negated then
            Tnegset !set
          else
            Tset !set
        end
        else
          failwith "regexp: closing bracket ] not found"

      |	ch  -> next(); Texact (String.make 1 ch )
    end

  in

  try
    next();
    scan_alternative ()
  with
  | Failure msg ->
    failwith (msg ^ " - regexp: " ^ re_string)
;;


let pcre_safe_quote c = (* for print_set *)
  match c with
  'a'..'z'|'A'..'Z'|'0'..'9'|'_' -> String.make 1 c
          | '\000' -> "\\000"
          | _ -> "\\" ^ String.make 1 c
;;


let rec print_pcre_regexp ret =
  match ret with
    Texact s ->
    Pcre.quote s
  | Tnullchar ->
    (* Pcre.quote "\000" returns nonsense *)
    "[\\000]"
  | Tany ->
    "."
  | Tnull ->
    "(?:)"
  | Tconcat l ->
    String.concat "" (List.map print_pcre_regexp l)
  | Tstar ret' ->
    print_pcre_subregexp ret' ^ "*"
  | Tplus ret' ->
    print_pcre_subregexp ret' ^ "+"
  | Toption ret' ->
    print_pcre_subregexp ret' ^ "?"
  | Tset s ->
    "[" ^ print_set s ^ "]"
  | Tnegset s ->
    "[^" ^ print_set s ^ "]"
  | Talt l ->
    String.concat "|" (List.map print_pcre_subregexp l)
  | Tgroup(_,ret') ->
    "(" ^ print_pcre_regexp ret' ^ ")"
  | Trefer n ->
    (* Put parentheses around \n to disambiguate from \nn *)
    "(?:\\" ^ string_of_int n ^ ")"
  | Tinterval(ret',m,n) ->
    print_pcre_subregexp ret' ^ "{" ^ string_of_int m ^ "," ^ 
    (if n >= 0 then string_of_int n else "") ^ "}"
  | Tbegline ->
    "^"
  | Tendline ->
    "(?:$)"
  | Twordchar ->
    "\\w"
  | Tnowordchar ->
    "\\W"
  | Twordbeg ->
    "\\b(?=\\w)"
  | Twordend ->
    "(?<=\\w)\\b"
  | Twordbound ->
    "\\b"
  | Tnowordbound ->
    "\\B"
  | Tbegbuf ->
    "\\A"
  | Tendbuf ->
    "\\z"

and print_pcre_subregexp ret =
  (* Print ret, but put parentheses around ret *)
  match ret with
    Tset _ 
  | Tnegset _ 
  | Tgroup(_,_) ->
    (* No additional parentheses needed *)
    print_pcre_regexp ret
  | _ ->
    (* Print (?:ret). This is the "neutral" form of grouping that only
       	 * changes precedence
       	 *)
    "(?:" ^ print_pcre_regexp ret ^ ")"

and print_set s =
  String.concat ""
    (List.map
       (function
           Schar c -> pcre_safe_quote c
         | Srange(c1,c2) -> pcre_safe_quote c1 ^ "-" ^ pcre_safe_quote c2
       )
       s
    )
;;

(**********************************************************************)
(* Emulation *)

let regexp s =
  let ret = scan_str_regexp s in
  let s' = print_pcre_regexp ret in
  if !Debug.enable then
    dlogr (fun () ->
        sprintf "regexp: orig: %s - translated: %s" s s'
      );
  Pcre.regexp ~flags:[`MULTILINE] s'
;;

let regexp_case_fold s =
  let ret = scan_str_regexp s in
  let s' = print_pcre_regexp ret in
  if !Debug.enable then
    dlogr (fun () ->
        sprintf "regexp_case_fold: orig: %s - translated: %s" s s'
      );
  Pcre.regexp ~flags:[`MULTILINE; `CASELESS] s'
;;

let pcre_quote s =
  (* Note that Pcre.quote is incorrect for NUL chars, which simply remain
     in place, although they need to be encoded
  *)
  let s1 = Pcre.quote s in
  let s' = Pcre.qreplace ~pat:"\\000" ~templ:"\\000" s1 in
  if !Debug.enable then
    dlogr (fun () ->
        sprintf "quote: orig: %s - quoted: %s" s s'
      );
  s'
;;

let unsafe_str_re = Pcre.regexp "[\\]\\[+*?.\\\\^$]"

let quote s =
  (* This returns, of course, a Str-syntax regexp! *)
  Pcre.replace ~rex:unsafe_str_re ~templ:"\\$&" s 

let regexp_string s =
  Pcre.regexp ~flags:[`MULTILINE] (pcre_quote s)
;;

let regexp_string_case_fold s =
  Pcre.regexp ~flags:[`MULTILINE; `CASELESS] (pcre_quote s)
;;

let string_match = Netstring_pcre.string_match ;;
let bytes_match = Netstring_pcre.bytes_match ;;

(* let string_partial_match = Netstring_pcre.string_partial_match ;; *)
(* N/A *)

let search_forward = Netstring_pcre.search_forward ;;
let search_backward = Netstring_pcre.search_backward ;;
let search_forward_bytes = Netstring_pcre.search_forward_bytes ;;
let search_backward_bytes = Netstring_pcre.search_backward_bytes ;;

let matched_string = Netstring_pcre.matched_string ;;
let matched_bytes = Netstring_pcre.matched_bytes ;;
let match_beginning = Netstring_pcre.match_beginning ;;
let match_end = Netstring_pcre.match_end ;;
let matched_group = Netstring_pcre.matched_group ;;
let matched_group_bytes = Netstring_pcre.matched_group_bytes ;;
let group_beginning = Netstring_pcre.group_beginning ;;
let group_end = Netstring_pcre.group_end ;;

let global_replace pat templ s = 
  Netstring_pcre.global_replace pat templ s;;
let replace_first pat templ s = 
  Netstring_pcre.replace_first pat templ s ;;

let global_substitute = Netstring_pcre.global_substitute ;;
let substitute_first = Netstring_pcre.substitute_first ;;

(* replace_matched: n/a *)

let split = Netstring_pcre.split ;;
let bounded_split = Netstring_pcre.bounded_split ;;
let split_delim = Netstring_pcre.split_delim ;;
let bounded_split_delim = Netstring_pcre.bounded_split_delim ;;

let tr_split_result r =
  List.map
    (function 
        Pcre.Text t   -> Text t
      | Pcre.Delim d  -> Delim d
      | _ -> assert false
    )
    (List.filter
       (function 
           Pcre.Group(_,_)
         | Pcre.NoGroup    -> false
         | _               -> true
       )
       r
    )
;;


let full_split sep s = 
  tr_split_result (Netstring_pcre.full_split sep s);;
let bounded_full_split sep s max = 
  tr_split_result (Netstring_pcre.bounded_full_split sep s max);;

let string_before = Netstring_pcre.string_before ;;
let string_after = Netstring_pcre.string_after ;;
let first_chars = Netstring_pcre.first_chars ;;
let last_chars = Netstring_pcre.last_chars ;;

#endif

#else
  (* i.e. ENABLE_STR_EXTERNALS *)

  (**********************************************************************)
  (* ENABLE_STR_EXTERNALS                                               *)
  (**********************************************************************)

  (* We use here the Str externals directly, and reimplement parts of
     the Str module to make it thread-safe
  *)

type regexp = Str.regexp;;
type split_result = Str.split_result = Text of string | Delim of string;;

type result =
  { pos : int;
    sr : int array;
  }

(* sr.(2*k) is the beginning of group k
   sr.(2*k+1) is the end of group k
   sr.(0) is match beginning
   sr.(1) is match end
*)

let match_beg sr = sr.(0)
let match_e sr = sr.(1)
let group_beg sr k = sr.(k+k)
let group_e sr k = sr.(k+k+1)
let n_groups sr = (Array.length sr - 2) lsr 1

(* Groups are numbered 1 .. n_groups *)

external re_string_match: regexp -> string -> int -> int array
  = "re_string_match"
external re_partial_match: regexp -> string -> int -> int array
  = "re_partial_match"
external re_search_forward: regexp -> string -> int -> int array
  = "re_search_forward"
external re_search_backward: regexp -> string -> int -> int array
  = "re_search_backward"
external re_replacement_text: string -> int array -> string -> string
  = "re_replacement_text"



let regexp s = 
  let re = Str.regexp s in
  if !Debug.enable then
    dlogr (fun () ->
        sprintf "regexp: %s" s
      );
  re


let regexp_case_fold s =
  let re = Str.regexp_case_fold s in
  if !Debug.enable then
    dlogr (fun () ->
        sprintf "regexp_case_fold: %s" s
      );
  re


let quote s = 
  let s' = Str.quote s in
  if !Debug.enable then
    dlogr (fun () ->
        sprintf "quote: orig: %s - quoted: %s" s s'
      );
  s'


let regexp_string = Str.regexp_string
let regexp_string_case_fold = Str.regexp_string_case_fold

let return_result pos sr =
  { pos = pos; sr = sr }

let string_match pat s pos =
  let sr = re_string_match pat s pos in
  if Array.length sr > 0 then
    Some (return_result pos sr)
  else
    None

let bytes_match pat s pos =
  string_match pat (Bytes.unsafe_to_string s) pos

let search_forward pat s pos =
  let sr = re_search_forward pat s pos in
  if Array.length sr = 0 then raise Not_found;
  sr.(0), return_result pos sr

let search_forward_bytes pat s pos =
  search_forward pat (Bytes.unsafe_to_string s) pos

let search_backward pat s pos =
  let sr = re_search_backward pat s pos in
  if Array.length sr = 0 then raise Not_found;
  sr.(0), return_result pos sr

let search_backward_bytes pat s pos =
  search_backward pat (Bytes.unsafe_to_string s) pos

let matched_generic sub result s =
  if match_beg result.sr < 0 || match_e result.sr < 0 then raise Not_found;
  sub s (match_beg result.sr) (match_e result.sr - match_beg result.sr)

let matched_string =
  matched_generic String.sub

let matched_bytes =
  matched_generic Bytes.sub

let match_beginning result =
  if match_beg result.sr < 0 then raise Not_found;
  match_beg result.sr

let match_end result =
  if match_e result.sr < 0 then raise Not_found;
  match_e result.sr

let matched_group_generic sub result n s =
  if n < 0 || n > n_groups result.sr then raise Not_found;
  if n = 0 then
    matched_generic sub result s
  else 
    let gbeg = group_beg result.sr n in
    let gend = group_e result.sr n in
    if gbeg < 0 || gend < 0 then raise Not_found;
    sub s gbeg (gend - gbeg)

let matched_group =
  matched_group_generic String.sub

let matched_group_bytes =
  matched_group_generic Bytes.sub

let group_beginning result n =
  if n < 0 || n > n_groups result.sr then raise Not_found;
  if n = 0 then
    match_beginning result
  else
    let gbeg = group_beg result.sr n in
    if gbeg < 0 then raise Not_found else 
      gbeg

let group_end result n =
  if n < 0 || n > n_groups result.sr then raise Not_found;
  if n = 0 then 
    match_e result.sr 
  else
    let gend = group_e result.sr n in
    if gend < 0 then raise Not_found else 
      gend

let substitute_first pat subst s =
  try
    let pos, m = search_forward pat s 0 in
    String.concat "" 
      [ Str.string_before s pos; 
        subst m s; 
        Str.string_after s (match_end m)
      ]
  with Not_found -> s

exception Cont of int

let global_substitute pat subst s =
  let l = String.length s in
  let b = Buffer.create (l/2) in
  let rec loop k =
    try
      if k <= l then (
        let pos, m = search_forward pat s k in  (* or Not_found *)
        Buffer.add_string b (String.sub s k (pos-k));
        let repl = subst m s in
        Buffer.add_string b repl;
        let pos' = match_end m in
        if pos = pos' then (
          if pos < l then Buffer.add_char b s.[pos];
          raise (Cont (pos'+1))
        )
        else
          raise (Cont pos')
      )
    with
    | Cont k_next ->
      loop k_next
    | Not_found ->
      Buffer.add_string b (String.sub s k (l-k)) in
  loop 0;
  Buffer.contents b

let replace_matched repl m s =
  re_replacement_text repl m.sr s

let global_replace pat repl s =
  global_substitute 
    pat (replace_matched repl) s

let replace_first pat repl s =
  substitute_first
    pat (replace_matched repl) s


(* The splitting functions are practically copied from str.ml *)

let opt_search_forward re s pos =
  try Some(search_forward re s pos) with Not_found -> None

let opt_search_forward_progress expr text start =
  match opt_search_forward expr text start with
  | None -> None
  | Some (pos, m) ->
    if match_end m > start then
      Some (pos,m)
    else if start < String.length text then
      opt_search_forward expr text (start + 1)
    else None

let bounded_split expr text num =
  let start =
    match string_match expr text 0 with
    | Some m -> match_end m
    | None -> 0 in
  let rec split accu start n =
    if start >= String.length text then accu else
    if n = 1 then Str.string_after text start :: accu else
      match opt_search_forward_progress expr text start with
      | None ->
        Str.string_after text start :: accu
      | Some (pos,m) ->
        split 
          (String.sub text start (pos-start) :: accu)
          (match_end m)
          (n-1)
  in
  List.rev (split [] start num)

let split expr text = bounded_split expr text 0

let bounded_split_delim expr text num =
  let rec split accu start n =
    if start > String.length text then accu else
    if n = 1 then Str.string_after text start :: accu else
      match opt_search_forward_progress expr text start with
      | None ->
        Str.string_after text start :: accu
      | Some (pos,m) ->
        split
          (String.sub text start (pos-start) :: accu)
          (match_end m)
          (n-1)
  in
  if text = "" then [] else List.rev (split [] 0 num)


let split_delim expr text = bounded_split_delim expr text 0

let bounded_full_split expr text num =
  let rec split accu start n =
    if start >= String.length text then accu else
    if n = 1 then Text(Str.string_after text start) :: accu else
      match opt_search_forward_progress expr text start with
      | None ->
        Text(Str.string_after text start) :: accu
      | Some (pos,m) ->
        let s = matched_string m text in
        if pos > start then
          split
            (Delim(s) :: Text(String.sub text start (pos-start)) :: accu)
            (match_end m) 
            (n-1)
        else
          split 
            (Delim(s) :: accu)
            (match_end m)
            (n-1)
  in
  List.rev (split [] 0 num)

let full_split expr text = bounded_full_split expr text 0


let string_before = Str.string_before;;
let string_after = Str.string_after;;
let first_chars = Str.first_chars;;
let last_chars = Str.last_chars;;

#endif

#ifndef HAVE_PCRE
        #ifndef ENABLE_STR_EXTERNALS

(**********************************************************************)
(* DEFAULT                                                            *)
(**********************************************************************)

(* Alternate implementation without Pcre: Just use Str directly,
   and ensure thread-safety with mutexes
*)

let mutex = (!Netsys_oothr.provider) # create_mutex()

let protect f arg =
  Netsys_oothr.serialize mutex f arg

type regexp = Str.regexp;;
type split_result = Str.split_result = Text of string | Delim of string;;

type result =
  { pos : int;
    match_beg : int;
    match_end : int;
    group_beg : int array;
    group_end : int array;
  }

let regexp = 
  protect
    (fun s ->
       let re = Str.regexp s in
       if !Debug.enable then
         dlogr (fun () ->
             sprintf "regexp: %s" s
           );
       re
    )

let regexp_case_fold =
  protect
    (fun s ->
       let re = Str.regexp_case_fold s in
       if !Debug.enable then
         dlogr (fun () ->
             sprintf "regexp_case_fold: %s" s
           );
       re
    )

let quote = 
  protect 
    (fun s ->
       let s' = Str.quote s in
       if !Debug.enable then
         dlogr (fun () ->
             sprintf "quote: orig: %s - quoted: %s" s s'
           );
       s'
    )

let regexp_string = protect Str.regexp_string
let regexp_string_case_fold = protect Str.regexp_string_case_fold

let n_groups = 9

let return_result pos =
  let r =
    { pos = pos;
      match_beg = (try Str.match_beginning() with Not_found -> -1);
      match_end = (try Str.match_end()       with Not_found -> -1);
      group_beg = Array.make n_groups (-1);
      group_end = Array.make n_groups (-1);
    }
  in
  for g = 0 to n_groups - 1 do
    r.group_beg.(g) <- 
      (try Str.group_beginning (g+1) with Not_found | Invalid_argument _ -> -1);
    r.group_end.(g) <- 
      (try Str.group_end (g+1)       with Not_found | Invalid_argument _ -> -1);
  done;
  r

let string_match pat s =
  protect
    (fun pos ->
       if Str.string_match pat s pos then
         Some (return_result pos)
       else
         None
    )

let bytes_match pat s pos =
  string_match pat (Bytes.unsafe_to_string s) pos

let search_forward pat s =
  protect
    (fun pos ->
       let i = Str.search_forward pat s pos in
       i, return_result pos
    )

let search_forward_bytes pat s pos =
  search_forward pat (Bytes.unsafe_to_string s) pos

let search_backward pat s =
  protect
    (fun pos ->
       let i = Str.search_backward pat s pos in
       i, return_result pos
    )

let search_backward_bytes pat s pos =
  search_backward pat (Bytes.unsafe_to_string s) pos

let matched_generic sub result s =
  if result.match_beg < 0 || result.match_end < 0 then raise Not_found;
  sub s result.match_beg (result.match_end - result.match_beg)

let matched_string =
  matched_generic String.sub

let matched_bytes =
  matched_generic Bytes.sub

let match_beginning result =
  if result.match_beg < 0 then raise Not_found;
  result.match_beg

let match_end result =
  if result.match_end < 0 then raise Not_found;
  result.match_end

let matched_group_generic sub result n s =
  if n < 0 || n >= Array.length result.group_beg then raise Not_found;
  if n = 0 then
    matched_generic sub result s
  else 
    let gbeg = result.group_beg.(n-1) in
    let gend = result.group_end.(n-1) in
    if gbeg < 0 || gend < 0 then raise Not_found;
    sub s gbeg (gend - gbeg)

let matched_group =
  matched_group_generic String.sub

let matched_group_bytes =
  matched_group_generic Bytes.sub

let group_beginning result n =
  if n < 0 || n >= Array.length result.group_beg then raise Not_found;
  if n = 0 then
    match_beginning result
  else
    let gbeg = result.group_beg.(n-1) in
    if gbeg < 0 then raise Not_found else 
      gbeg

let group_end result n =
  if n < 0 || n >= Array.length result.group_end then raise Not_found;
  if n = 0 then 
    match_end result 
  else
    let gend = result.group_end.(n-1) in
    if gend < 0 then raise Not_found else 
      gend

let global_replace pat templ =
  protect
    (fun s ->
       Str.global_replace pat templ s)

let replace_first pat templ =
  protect
    (fun s ->
       Str.replace_first pat templ s)

let global_substitute pat subst =
  protect
    (fun s ->
       let xsubst s =
         let r = return_result 0 in
         subst r s
       in
       Str.global_substitute pat xsubst s)

let substitute_first pat subst =
  protect
    (fun s ->
       let xsubst s =
         let r = return_result 0 in
         subst r s
       in
       Str.substitute_first pat xsubst s)


let split sep =
  protect
    (fun s ->
       Str.split sep s)

let bounded_split sep s =
  protect
    (fun max ->
       Str.bounded_split sep s max)

let split_delim sep =
  protect
    (fun s ->
       Str.split_delim sep s)

let bounded_split_delim sep s =
  protect
    (fun max ->
       Str.bounded_split_delim sep s max)

let full_split sep =
  protect
    (fun s ->
       Str.full_split sep s)

let bounded_full_split sep s =
  protect
    (fun max ->
       Str.bounded_full_split sep s max)

let string_before = Str.string_before;;
let string_after = Str.string_after;;
let first_chars = Str.first_chars;;
let last_chars = Str.last_chars;;
#endif
#endif
