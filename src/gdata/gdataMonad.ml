module type MONAD =
sig
  type 'a t

  val return : 'a -> 'a t

  val bind : 'a t -> ('a -> 'b t) -> 'b t

end

module type MONAD_COMBINATORS =
sig
  include MONAD

  module Infix :
  sig
    val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t

    val ( >> ) : 'a t -> 'b t -> 'b t

  end

  val join : 'a t t -> 'a t

  val liftM : ('a -> 'b) -> 'a t -> 'b t

  val liftM2 : ('a -> 'b -> 'c t) -> 'a t -> 'b t -> 'c t

  val fmap : ('a -> 'b) -> 'a t -> 'b t

  val sequence : 'a t list -> 'a list t

  val mapM : ('a -> 'b t) -> 'a list -> 'b list t

  val foldM : ('a -> 'b -> 'a t) -> 'a -> 'b list -> 'a t

end

module MakeMonadCombinators(M : MONAD) =
struct
  type 'a t = 'a M.t

  let return = M.return

  let bind = M.bind

  module Infix =
  struct
    let (>>=) = bind

    let (>>) m n = m >>= (fun _ -> n)
  end

  open Infix

  let join n = n >>= (fun x -> x)

  let liftM f m = m >>= (fun x -> return (f x))

  let liftM2 f m1 m2 = m1 >>= (fun a -> m2 >>= (f a))

  let fmap = liftM

  let sequence xs =
    let mcons p q =
      p >>= fun x ->
        q >>= fun y ->
          return (x :: y)
    in
      List.fold_right mcons xs (return [])

  let mapM f xs =
    sequence (List.map f xs)

  let rec foldM f s = function
      [] ->
        return s
    | x :: xs ->
        f s x >>= fun y ->
          foldM f y xs

end

module MakeStateMonad(T : sig type s end) =
struct
  type 'a t = T.s -> 'a * T.s

  let return a =
    (fun s -> (a, s))

  let bind m k =
    (fun s ->
       let (a, s') = m s in
       let m' = k a in
         m' s')

end

module SessionStateMonad =
  MakeStateMonad(struct type s = GapiConversation.Session.t end)

module SessionM =
struct
  include MakeMonadCombinators(SessionStateMonad)

  let get s = (s, s)

  let put x s = ((), x)

end

