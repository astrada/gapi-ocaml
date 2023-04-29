(* $Id$ *)

(** ASN.1 encoder *)

(** Note that the encoder does not check whether the value is
    well-formed, in particular whether the constrained string values
    are correct.
 *)

val encode_ber : Netbuffer.t -> Netasn1.Value.value -> 
                 Netasn1.Value.pc
  (** Appends a BER encoding of the value to the buffer (including the 
      header). Returns whether a primitive or constructed encoding was
      generated.
   *)

val encode_ber_contents : Netbuffer.t -> Netasn1.Value.value -> 
                            Netasn1.Value.pc
  (** Appends a BER encoding of the value to the buffer (excluding the 
      header). Returns whether a primitive or constructed encoding was
      generated.
   *)
