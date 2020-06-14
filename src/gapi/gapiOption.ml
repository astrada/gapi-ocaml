let iter f o = match o with Some v -> f v | None -> ()

let map f o = match o with Some v -> Some (f v) | None -> None

let is_some o = match o with Some _ -> true | None -> false

let is_none o = match o with Some _ -> false | None -> true

let value o ~default = match o with Some v -> v | None -> default

let get o = match o with Some v -> v | None -> invalid_arg "Option.get"
