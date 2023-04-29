(* $Id$ *)

type armor_type = [ `Plain | `Base64 | `OpenPGP ]

type armored_message =
    [ `Plain of Netmime.mime_body
    | `Base64 of Netmime.mime_body
    | `OpenPGP of Netmime.mime_header * Netmime.mime_body * int
    ]

type armored_message_ro =
    [ `Plain of Netmime.mime_body_ro
    | `Base64 of Netmime.mime_body_ro
    | `OpenPGP of Netmime.mime_header_ro * Netmime.mime_body_ro * int
    ]

type armor_spec = (string * armor_type) list 

let begin_re =
  Netstring_str.regexp "^-----BEGIN \\(.*\\)-----[ \t\r]*$"

let end_re =
  Netstring_str.regexp "^-----END \\(.*\\)-----[ \t\r]*$"

let cksum_re =
  Netstring_str.regexp "^=\\([A-Za-z0-9+/=]+\\)[ \t\r]*$"


let parse spec (ch : Netchannels.in_obj_channel) =
  let rec next_begin_boundary() =
    let line_opt = try Some(ch # input_line()) with End_of_file -> None in
    match line_opt with
      | None -> []
      | Some line ->
           if line <> "" && line.[0] = '-' then
             match Netstring_str.string_match begin_re line 0 with
               | None -> next_begin_boundary()
               | Some m ->
                    let tag = Netstring_str.matched_group m 1 line in
                    let armor_type_opt = 
                      try Some(List.assoc tag spec) with Not_found -> None in
                    ( match armor_type_opt with
                        | None -> next_begin_boundary()
                        | Some armor_type ->
                             read_message tag armor_type
                    )
           else
             next_begin_boundary()

    and read_message tag armor_type =
      let body = new Netmime.memory_mime_body "" in
      let body_ch = body # open_value_wr() in
      match armor_type with
        | `Plain ->
             let followup code =
               body_ch # close_out();
               match code with
                 | `Error -> []
                 | `End -> 
                      let body_ro = (body :> Netmime.mime_body_ro) in
                      (tag, `Plain body_ro) :: next_begin_boundary()
                 | `End_cksum _ -> assert false in
             parse_message_body 
               ~enable_checksum:false 
               ~followup
               tag armor_type body_ch
        | `Base64 ->
             let filter = 
               new Netencoding.Base64.decoding_pipe ~accept_spaces:true () in
             let base64_ch =
               new Netchannels.output_filter filter body_ch in
             let followup code =
               base64_ch # close_out();
               body_ch # close_out();
               match code with
                 | `Error -> []
                 | `End -> 
                      let body_ro = (body :> Netmime.mime_body_ro) in
                      (tag, `Base64 body_ro) :: next_begin_boundary()
                 | `End_cksum _ -> assert false in
             parse_message_body 
               ~enable_checksum:false 
               ~followup
               tag armor_type base64_ch
        | `OpenPGP ->
             assert false (* TODO *)

    and is_expected_end_boundary line tag =
      match Netstring_str.string_match end_re line 0 with
        | None ->
             false
        | Some m ->
             let real_tag = Netstring_str.matched_group m 1 line in
             real_tag = tag

    and parse_message_body ~enable_checksum ~followup
                           tag armor_type out_ch =
      let rec parse() =
        let line_opt = try Some(ch # input_line()) with End_of_file -> None in
        match line_opt with
          | None ->
               followup `Error
          | Some line ->
               let checksum_opt =
                 if enable_checksum && line <> "" && line.[0] = '=' then
                   match Netstring_str.string_match cksum_re line 0 with
                     | Some m ->
                          let sum = Netstring_str.matched_group m 1 line in
                          if String.length sum = 4 then
                            try
                              Some(Netencoding.Base64.decode sum)
                            with _ -> None
                          else
                            None
                     | None ->
                          None
                 else
                   None in
               match checksum_opt with
                 | None ->
                      if is_expected_end_boundary line tag then
                        followup `End
                      else (
                        out_ch # output_string line;
                        out_ch # output_string "\n";
                        parse()
                      )
                 | Some checksum ->
                      assert(String.length checksum = 3);
                      let v =
                        ((Char.code checksum.[0]) lsl 16) lor
                          ((Char.code checksum.[1]) lsl 8) lor
                            (Char.code checksum.[2]) in
                      let line_opt = 
                        try Some(ch # input_line()) with End_of_file -> None in
                      ( match line_opt with
                          | None ->
                               followup `Error
                          | Some line ->
                               if is_expected_end_boundary line tag then
                                 followup (`End_cksum v)
                               else
                                 followup `Error
                      )
      in
      parse()
  in
  next_begin_boundary()

