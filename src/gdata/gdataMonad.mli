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

module MakeMonadCombinators :
  functor (M : MONAD) -> MONAD_COMBINATORS

module MakeStateMonad :
  functor (T : sig type s end) -> MONAD

module SessionM :
sig
  include MONAD_COMBINATORS
    with type 'a t = GdataConversation.Session.t -> 'a * GdataConversation.Session.t

  val get : 'a -> 'a * 'a

  val put : 'a -> 'b -> unit * 'a

end

