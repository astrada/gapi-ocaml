module type Monad =
sig
  type 'a t

  val return : 'a -> 'a t

  val bind : 'a t -> ('a -> 'b t) -> 'b t

end

module type MonadCombinators =
sig
  type 'a m

  module Infix :
  sig
    val ( >>= ) : 'a m -> ('a -> 'b m) -> 'b m

    val ( >> ) : 'a m -> 'b m -> 'b m

  end

  val join : 'a m m -> 'a m

  val liftM : ('a -> 'b) -> 'a m -> 'b m

  val liftM2 : ('a -> 'b -> 'c m) -> 'a m -> 'b m -> 'c m

  val fmap : ('a -> 'b) -> 'a m -> 'b m

  val sequence : 'a m list -> 'a list m

  val mapM : ('a -> 'b m) -> 'a list -> 'b list m

  val foldM : ('a -> 'b -> 'a m) -> 'a -> 'b list -> 'a m

end

module MakeMonadCombinators(M : Monad) =
struct
  type 'a m = 'a M.t

  module Infix =
  struct
    let (>>=) = M.bind

    let (>>) m n = m >>= (fun _ -> n)
  end

  open Infix

  let join n = n >>= (fun x -> x)

  let liftM f m = m >>= (fun x -> M.return (f x))

  let liftM2 f m1 m2 = m1 >>= (fun a -> m2 >>= (f a))

  let fmap = liftM

  let sequence xs =
    let mcons p q =
      p >>= fun x ->
        q >>= fun y ->
          M.return (x :: y)
    in
      List.fold_right mcons xs (M.return [])

  let mapM f xs =
    sequence (List.map f xs)

  let rec foldM f s = function
      [] ->
        M.return s
    | x :: xs ->
        f s x >>= fun y ->
          foldM f y xs

end

module type StateMonad =
sig
  include Monad

  val get : 'a -> 'a * 'a

  val put : 'a -> 'b -> unit * 'a

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

  let get s = (s, s)

  let put x s = ((), x)

end

module SessionStateMonad =
  MakeStateMonad(struct type s = GapiConversation.Session.t end)

module SessionM =
struct
  include SessionStateMonad

  include MakeMonadCombinators(SessionStateMonad)

end

