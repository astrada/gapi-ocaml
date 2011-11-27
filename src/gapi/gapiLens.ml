open GapiUtils.Op

type ('a, 'b) t = {
  get : 'a -> 'b;
  set : 'b -> 'a -> 'a
}

let update l f a =
  let value = l.get a in
  let new_value = f value in
    l.set new_value a

let _get a l = l.get a

let _set v a l = l.set v a

let _update f l = update l f

let compose l1 l2 = {
  get = l2.get >> l1.get;
  set = l1.set >> update l2
}

let pair l1 l2 = {
  get = (fun (a, b) -> (l1.get a, l2.get b));
  set = (fun (a, c) (b, d) -> (l1.set a b, l2.set c d))
}

let cond pred lt lf =
  let choose a = if pred a then lt else lf in
    { get = (fun a -> choose a |> _get a);
      set = (fun b a -> choose a |> _set b a)
    }

(* TODO: State monad... *)

let first = {
  get = fst;
  set = (fun v a -> v, snd a)
}

let second = {
  get = snd;
  set = (fun v a -> fst a, v)
}

let id = {
  get = (fun a -> a);
  set = (fun b a -> b)
}

let for_hash key = {
  get = (fun h -> try Some (Hashtbl.find h key) with Not_found -> None);
  set = (fun v h ->
           match v with
               Some value -> Hashtbl.add h key value; h
             | None -> Hashtbl.remove h key; h)
}

let for_array i = {
  get = (fun a -> Array.get a i);
  set = (fun v a -> let a' = Array.copy a in Array.set a' i v; a')
}

let for_list i = {
  get = (fun xs -> List.nth xs i);
  set = (fun v xs ->
           List.fold_right
             (fun x k j ->
                let xs' = k (j + 1) in
                  if j = i then v :: xs' else x :: xs')
             xs
             (fun _ -> [])
             0)
}

let list_map l = {
  get = List.map l.get;
  set = List.map2 l.set
}

(* TODO: array_map *)

let xmap f g l = {
  get = l.get >> f;
  set = g >> l.set
}

let ign = {
  get = ignore;
  set = (fun _ a -> a)
}

module Op =
struct
  let (>>|) l1 l2 = compose l2 l1

  let (|<<) l1 l2 = compose l1 l2

  let ( *** ) l1 l2 = pair l1 l2

  let (+=) l v = _update ((+) v) l

  let (-=) l v = _update ((-) v) l

  let (=!) l v = fun a -> _set v a l

end

