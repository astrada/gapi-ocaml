(* $Id$ *)

class type mtprovider =
object
  method single_threaded : bool
  method create_thread : 's 't . ('s -> 't) -> 's -> thread
  method self : thread
  method yield : unit -> unit
  method create_mutex : unit -> mutex
  method create_condition : unit -> condition
end

and thread =
object
  method id : int
  method join : unit -> unit
  method repr : exn
end

and mutex =
object
  method lock : unit -> unit
  method unlock : unit -> unit
  method try_lock : unit -> bool
  method repr : exn
end

and condition =
object
  method wait : mutex -> unit
  method signal : unit -> unit
  method broadcast : unit -> unit
  method repr : exn
end

(* single-threaded dummy stuff: *)

exception Dummy

let stthread() : thread =
  ( object
      method id = 0
      method join() = 
	failwith "Netsys_oothr: join not possible in single-threaded program"
      method repr = Dummy
    end
  )

let stmutex() : mutex =
  ( object
      method lock() = ()
      method unlock() = ()
      method try_lock() = true
      method repr = Dummy
    end
  )

let stcondition() : condition =
  ( object
      method wait _ = ()
      method signal() = ()
      method broadcast() = ()
      method repr = Dummy
    end
  )

let stprovider : mtprovider =
  ( object
      method single_threaded = true
      method create_thread : 's 't . ('s -> 't) -> 's -> thread =
	fun _ _ -> failwith "Netsys_oothr: create_thread not possible in single-threaded program"
      method self = stthread()
      method yield() = ()
      method create_mutex() = stmutex()
      method create_condition() = stcondition()
    end
  )

let provider = ref stprovider
let single_threaded = ref false  (* whether we know this for sure *)
let st_init = ref false

let serialize  mutex f arg =
  if !single_threaded then (
    f arg
  )
  else (
    if not !st_init then (
      single_threaded := !provider # single_threaded;
      st_init := true
    );
    mutex # lock();
    let r = 
      try f arg
      with e -> mutex # unlock(); raise e in
    mutex # unlock();
    r
  )

let atomic_init var new_val =
  let new_val_opt = Some new_val in
  match !var with
    | None -> var := new_val_opt; new_val
    | Some x -> x

let compare_and_swap var old_value new_value =
  !var == old_value && (var := new_value; true)
