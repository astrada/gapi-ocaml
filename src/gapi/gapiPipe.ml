module OcamlnetPipe =
struct
  type t = {
    netpipe : Netchannels.pipe;
    outchannel : Netchannels.out_obj_channel option;
    outfilter : Netchannels.output_filter option;
    inchannel : Netchannels.in_obj_channel option;
    infilter : Netchannels.input_filter option;
  }

  let create ?out_channel ?in_channel () =
    let netpipe = new Netchannels.pipe () in
    let outfilter =
      Option.map
        (fun ch -> new Netchannels.output_filter netpipe ch)
        out_channel in
    let infilter =
      Option.map
        (fun ch -> new Netchannels.input_filter ch netpipe)
        in_channel
    in
    { netpipe;
      outchannel = out_channel;
      outfilter;
      inchannel = in_channel;
      infilter;
    }

  let in_ch p =
    Option.value
      ~default:(p.netpipe :> Netchannels.in_obj_channel)
      p.infilter

  let read_byte p =
    let ch = in_ch p in
    ch#input_byte ()

  let read_bytes p len =
    let result = Bytes.create len in
    let ch = in_ch p in
    ignore (ch#input result 0 len);
    result

  let read_line p =
    let ch = in_ch p in
    ch#input_line ()

  let read_all p =
    let ch = in_ch p in
    Netchannels.string_of_in_obj_channel ch

  let out_ch p =
    Option.value
      ~default:(p.netpipe :> Netchannels.out_obj_channel)
      p.outfilter

  let write_byte p b =
    let ch = out_ch p in
    ch#output_byte b

  let write_string p s =
    let ch = out_ch p in
    ch#output_string s

  let end_reading p =
    p.netpipe#close_in ();
    Option.may (fun ch -> ch#close_in ()) p.infilter;
    Option.may (fun ch -> ch#close_in ()) p.inchannel

  let end_writing p =
    p.netpipe#close_out ();
    Option.may (fun ch -> ch#close_out ()) p.outfilter;
    Option.may (fun ch -> ch#close_out ()) p.outchannel

end

