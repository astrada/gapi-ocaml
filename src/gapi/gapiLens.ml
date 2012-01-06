open GapiUtils.Infix

type ('a, 'b) t = {
  get : 'a -> 'b;
  set : 'b -> 'a -> 'a
}

let modify l f a =
  let value = l.get a in
  let new_value = f value in
    l.set new_value a

let _get a l = l.get a

let _set v a l = l.set v a

let _modify f l = modify l f

let compose l1 l2 = {
  get = l2.get |- l1.get;
  set = l1.set |- modify l2
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

let get_state l =
  fun a -> _get a l, a

let put_state l v =
  fun a -> (), _set v a l

let modify_state l f =
  fun a -> (), _modify f l a

let ignore = {
  get = ignore;
  set = (fun _ a -> a)
}

let id = {
  get = (fun a -> a);
  set = (fun b a -> b)
}

let first = {
  get = fst;
  set = (fun v a -> v, snd a)
}

let second = {
  get = snd;
  set = (fun v a -> fst a, v)
}

let head = {
  get = List.hd;
  set = (fun v xs -> v :: List.tl xs)
}

let tail = {
  get = List.tl;
  set = (fun v xs -> List.hd xs :: v)
}

let for_hash key = {
  get = (fun h ->
           try
             Some (Hashtbl.find h key)
           with Not_found -> None);
  set = (fun v h ->
           match v with
               Some value -> Hashtbl.add h key value; h
             | None -> Hashtbl.remove h key; h)
}

let for_assoc key = {
  get = (fun l ->
           try
             Some (List.assoc key l)
           with Not_found -> None);
  set = (fun v l ->
           match v with
               Some value ->
                 let l' = List.remove_assoc key l in
                   (key, value) :: l'
             | None -> List.remove_assoc key l)
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

let option_get = {
  get = Option.get;
  set = (fun v _ -> Some v)
}

let list_map l = {
  get = List.map l.get;
  set = List.map2 l.set
}

(* TODO: array_map *)

let xmap f g l = {
  get = l.get |- f;
  set = g |- l.set
}

module Infix =
struct
  let (|.) = _get

  let (^=) l v = fun a -> _set v a l

  let (^%=) l f = _modify f l

  let (|--) l1 l2 = compose l2 l1

  let (--|) = compose

  let ( *** ) l1 l2 = pair l1 l2

  let (+=) l v = _modify ((+) v) l

  let (-=) l v = _modify ((-) v) l

end

module StateInfix =
struct
  let (^=!) l v = put_state l v

  let (+=!) l v = modify_state l ((+) v)

  let (-=!) l v = modify_state l ((-) v)

  let (@=!) l v = modify_state l (fun a -> a @ v)

end

