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

module MakeMonadCombinators :
  functor (M : Monad) -> MonadCombinators

module type StateMonad =
sig
  include Monad

  val get : 'a -> 'a * 'a

  val put : 'a -> 'b -> unit * 'a

end

module MakeStateMonad :
  functor (T : sig type s end) -> StateMonad

module SessionM :
sig
  include StateMonad with
    type 'a t = GapiConversation.Session.t -> 'a * GapiConversation.Session.t

  include MonadCombinators with
    type 'a m = GapiConversation.Session.t -> 'a * GapiConversation.Session.t

end

