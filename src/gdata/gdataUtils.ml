module Op = struct
  let (|>) x f = f x

  let (<<<) f g x = f (g x)

  let (>>>) f g x = g (f x)

end

let is_weak_etag etag =
  if String.length etag > 2 then
    String.sub etag 0 2 = "W/"
  else
    false

