(* $Id$ *)

(** ASN.1 support functions *)

(** See below for a little intro into ASN.1: {!Netasn1.intro} *)

open Netsys_types

exception Out_of_range
exception Parse_error of int (** Byte position in string *)
exception Header_too_short

module Type_name : sig
  type type_name =
    | Bool
    | Integer
    | Enum
    | Real
    | Bitstring
    | Octetstring
    | Null
    | Seq
    | Set
    | OID
    | ROID
    | ObjectDescriptor
    | External
    | Embedded_PDV
    | NumericString
    | PrintableString
    | TeletexString
    | VideotexString
    | VisibleString
    | IA5String
    | GraphicString
    | GeneralString
    | UniversalString
    | BMPString
    | UTF8String
    | CharString
    | UTCTime
    | GeneralizedTime
end

module Value : sig
  type pc = Primitive | Constructed


  type value =
    | Bool of bool
        (** Boolean (primitive) *)
    | Integer of int_value
        (** Integer (primitive) *)
    | Enum of int_value
        (** Enumeration (primitive) *)
    | Real of real_value
        (** Floating-point number, using either base 2 or base 10 (primitive) *)
    | Bitstring of bitstring_value
        (** Bit strings (primitive or constructed) *)
    | Octetstring of string
        (** Octet strings (primitive or constructed) *)
    | Null
        (** Null (primitive) *)
    | Seq of value list
        (** Sequences (records or arrays) (constructed) *)
    | Set of value list
        (** Sets (constructed) *)
    | Tagptr of tag_class * int * pc * Netstring_tstring.tstring_polybox *
                  int * int
        (** Pointer to an undecoded value that was implicitly tagged.
            The [tag_class] can be [Application], [Context], or [Private].
         *)
    | Tag of tag_class * int * pc * value
        (** Explicit tag (primitive or constructed depending on inner value) *)
    | ITag of tag_class * int * value
        (** Implicit tag (never returned by the decoder, but needed for
            encoding such tags)
         *)
    | OID of int array
        (* Object IDs (primitive) *)
    | ROID of int array
        (* Relative Object IDs (primitive) *)
    | ObjectDescriptor of string
        (** A placeholder with a comment (primitive) *)
    | External of value list
        (** Something complex I don't understand (constructed) *)
    | Embedded_PDV of value list
        (** Something complex I don't understand (constructed) *)
    | NumericString of string
        (** String made of digits and spaces (primitive or constructed) *)
    | PrintableString of string
        (** A small subset of ASCII (primitive or constructed) *)
    | TeletexString of string
    | VideotexString of string
    | VisibleString of string
        (** 7 bit ASCII w/o control characters (primitive or constructed) *)
    | IA5String of string
        (** 7 bit ASCII (primitive or constructed) *)
    | GraphicString of string
        (** ISO-2022-encoded string w/o control characters *)
    | GeneralString of string
        (** ISO-2022-encoded string *)
    | UniversalString of string
        (** Any ISO-10646-1 character string represented as UTF-32-BE
            (primitive or constructed). Roughly, ISO-10646-1 equals to
            Unicode.
         *)
    | BMPString of string
        (** Any ISO-10646-1 character string from only the basic multilingual
            plane, i.e. with code points <= 65535, represented as UTF-16-BE
            (primitive or constructed)
         *)
    | UTF8String of string
        (** Any ISO-10646-1 character string represented as UTF-8
            (primitive or constructed)
         *)
    | CharString of string
        (** A complicated description of an arbitrary charset encoding
            (primitive or constructed) *)
    | UTCTime of time_value
        (** Like GeneralizedTime but less precise, and with 2-digit year *)
    | GeneralizedTime of time_value
        (** Calendar date with time of day, including timezone (primitive) *)

   and tag_class =
     | Universal | Application | Context | Private

   and int_value
   and real_value
   and bitstring_value
   and time_value

  type time_subtype = [ `U | `G ]

  val type_of_value : value -> Type_name.type_name option
    (** Returns the type, or [None] for [Tag], [ITag] and [Tagptr] *)

  (** {3 Integer} *)

  val get_int_repr : int_value -> string
    (** Get an integer as bytes *)
  val get_int_b256 : int_value -> int array
    (** Get an integer in base 256 notation, big endian. Negative values are
        represented using two's complement (i.e. the first array element is
        >= 128). The empty array means 0.
     *)
  val get_int : int_value -> int
    (** Get an integer as [int] if representable, or raise [Out_of_range] *)
  val get_int32 : int_value -> int32
    (** Get an integer as [int32] if representable, or raise [Out_of_range] *)
  val get_int64 : int_value -> int64
    (** Get an integer as [int64] if representable, or raise [Out_of_range] *)
  val int : int -> int_value
    (** Create an int *)
  val int32 : int32 -> int_value
    (** Create an int *)
  val int64 : int64 -> int_value
    (** Create an int *)
  val int_b256 : int array -> int_value
    (** Create an int from a base 256 number, big endian, signed *)

  (** {3 Real} *)

  (** Reals are not really supported ;-( *)

  val get_real_repr : real_value -> string
    (** Get the byte representation of the real *)

  (** {3 Bitstring} *)

  (** In some contexts it is usual that trailing zero bits are truncated.
   *)

  val get_bitstring_size : bitstring_value -> int
    (** Get the number of bits *)
  val get_bitstring_data : bitstring_value -> string
    (** Get the data. The last byte may be partial. The order of the bits
        in every byte: bit 7 (MSB) contains the first bit
     *)
  val get_bitstring_bits : ?size:int -> bitstring_value -> bool array
    (** Get the bitstring as bool array. If [size] is specified the array
        will have exactly this number of bits (by dropping exceeding data,
        or by adding [false] at the end)
     *)
  val get_bitstring_repr : bitstring_value -> string
    (** Get the representation *)
  val bitstring_of_bits : bool array -> bitstring_value
    (** Get the bitstring from a bool array *)
  val bitstring_of_string : string -> int -> bitstring_value
    (** Get the bitstring from a string and the total number of bits.
        The bits are taken from the beginning of the string (MSB first).
        If the string is shorter than the number of bits suggests, the
        remaining bits are assumed to be zero. If the string is longer
        than the number of bits suggests, the exceeding data is ignored.
     *)
  val truncate_trailing_zero_bits : bitstring_value -> bitstring_value
    (** Truncates the biggest trailing part that only consist of 0 bits *)

  (** {3 Time} *)

  (** Time values referring to the local time zone are not supported *)

  val get_time_subtype : time_value -> time_subtype
    (** Whether this is for UTCTime ([`U]) or GeneralizedTime ([`G]) *)
  val get_time_repr : time_value -> string
    (** Get the raw time string *)
  val get_time : time_value -> Netdate.t
    (** Get the time. Notes:

        - UTCTime years are two-digit years, and
          interpreted so that 0-49 is understood as 2000-2049, and 50-99 
          is understood as 1950-1999 (as required by X.509).
        - This function is restricted to the time formats occurring in DER
          (string terminates with "Z", i.e. UTC time zone)
     *)
  val utctime : Netdate.t -> time_value
    (** Create a time value for UTCTime. This function is restricted to years
        between 1950 and 2049.
     *)
  val gentime : digits:int -> Netdate.t -> time_value
    (** Create a time value for GeneralizedTime. [digits] is the number
        of fractional (subsecond) digits
     *)

  (** {3 Equality} *)

  val equal : value -> value -> bool
    (** Checks for equality. Notes:

          - [Tag] and [Tagptr] are considered different
          - [Tagptr] is checked by comparing the equality of the substring
          - [Set] is so far not compared as set, but as sequence (i.e. order
            matters)
     *)
end


val decode_ber :
      ?pos:int ->
      ?len:int ->
      string ->
        int * Value.value
  (** Decodes a BER-encoded ASN.1 value. Note that DER is a subset of BER,
      and can also be decoded.

      [pos] and [len] may select a substring for the decoder. By default,
      [pos=0], and [len] as large as necessary to reach to the end of the
      string.

      The function returns the number of interpreted bytes, and the value.
      It is not considered as an error if less than [len] bytes are consumed.

      The returned value represents implicitly tagged values as
      [Tagptr(class,tag,pc,pos,len)]. [pos] and [len] denote the substring
      containting the contents. Use {!Netasn1.decode_ber_contents} to
      further decode the value. You can use [ITag] to put the
      decoded value back into the tree.

      A number of values are not verified (i.e. nonsense values can be
      returned):
       - for all string types it is not checked whether the constraints
         are satisfied (e.g. whether an UTF8String really contains UTF-8).
       - [External], [Embedded_PDV] and [Real] are unchecked
       - Other values may first be checked on first access (e.g.
         [GeneralizedTime]).
   *)

val decode_ber_tstring :
      ?pos:int ->
      ?len:int ->
      tstring ->
        int * Value.value
  (** Same for tagged strings *)

val decode_ber_poly :
      ?pos:int ->
      ?len:int ->
      's Netstring_tstring.tstring_ops ->
      's ->
        int * Value.value
  (** polymorphic version *)

val decode_ber_contents :
      ?pos:int ->
      ?len:int ->
      ?indefinite:bool ->
      string ->
      Value.pc ->
      Type_name.type_name ->
        int * Value.value
  (** Decodes the BER-encoded contents of a data field. The contents are
      assumed to have the type denoted by [type_name].

      [pos] and [len] may select a substring for the decoder. By default,
      [pos=0], and [len] as large as necessary to reach to the end of the
      string.

      If [indefinite], the extent of the contents region is considered as
      indefinite, and the special end marker is required. This is only
      allowed when [pc = Constructed].

      The function returns the number of interpreted bytes, and the value.
      It is not considered as an error if less than [len] bytes are consumed.

      You need to use this function to recursively decode tagged values.
      If you get a [Tagptr(class,tag,pc,s,pos,len)] value, it depends on the
      kind of the tag how to proceed:

      - For explicit tags just invoke {!Netasn1.decode_ber} again with
        the given [pos] and [len] parameters.
      - For implicit tags you need to know the type of the field. Now
        call {!Netasn1.decode_ber_contents} with the right type name.

      The BER encoding doesn't include whether the tag is implicit or
      explicit, so the decode cannot do by itself the right thing here.
   *)

val decode_ber_contents_tstring :
      ?pos:int ->
      ?len:int ->
      ?indefinite:bool ->
      tstring ->
      Value.pc ->
      Type_name.type_name ->
        int * Value.value
  (** Same for tagged strings *)
      
val decode_ber_contents_poly :
      ?pos:int ->
      ?len:int ->
      ?indefinite:bool ->
      's Netstring_tstring.tstring_ops ->
      's ->
      Value.pc ->
      Type_name.type_name ->
        int * Value.value
  (** Polymorphic version *)

val decode_ber_length : ?pos:int -> ?len:int -> string -> int
  (** Like [decode_ber], but returns only the length.

      This function skips many consistency checks.
   *)

val decode_ber_length_tstring : ?pos:int -> ?len:int -> tstring -> int
  (** Same for tagged strings *)

val decode_ber_length_poly : ?pos:int -> ?len:int -> 
                             's Netstring_tstring.tstring_ops -> 's -> int
  (** Polymorphic version *)

val decode_ber_header : ?pos:int -> ?len:int -> ?skip_length_check:bool ->
                        string -> 
                        (int * Value.tag_class * Value.pc * int * int option)
  (** [let (hdr_len, tc, pc, tag, len_opt) = decode_ber_header s]:
      Decodes only the header:
       - [hdr_len] will be the length of the header in bytes
       - [tc] is the tag class
       - [pc] whether primitive or constructed
       - [tag] is the numeric tag value
       - [len_opt] is the length field, or [None] if the header selects
         indefinite length

      If [skip_length_check] is set, the function does not check whether
      the string is long enough to hold the whole data part.

      If the string is a valid beginning of a header, the special exception
      [Header_too_short] is raised (instead of [Parse_error]).
   *)

val decode_ber_header_tstring
    : ?pos:int -> ?len:int -> ?skip_length_check:bool ->
      tstring -> 
      (int * Value.tag_class * Value.pc * int * int option)
  (** Same for tagged strings *)

val decode_ber_header_poly
    : ?pos:int -> ?len:int -> ?skip_length_check:bool ->
      's Netstring_tstring.tstring_ops -> 's ->
      (int * Value.tag_class * Value.pc * int * int option)
  (** Polymorphic version *)

val streamline_seq : (Value.tag_class * int * Type_name.type_name) list ->
                     Value.value list ->
                     Value.value option list
  (** [streamline_seq expected seq]: This function can be called for a list of
      values [Value.Seq seq], and will compare the list [seq] with the
      [expected] list, and will mark missing elements in the sequence, and
      will recursively decode the occurring elements with the type information
      from [expected].

      For example, if [expected] is 
      {[ [Context,0,Integer; Context,1,Octetstring; Context,2,IA5String] ]}
      and the passed [seq] is just
      {[ [Tagptr(Context,1,...)] ]}
      the function assumes that the elements with tags 0 and 2 are optional
      and it assumes that the element with tag 1 is decoded as [Octetstring],
      leading to
      {[ None; Some(Octetstring ...); None ]}

      It is allowed to put [Universal] tags into the [expected] list. The
      tag number is ignored in this case (for simplicity).
   *)

val streamline_set : (Value.tag_class * int * Type_name.type_name) list ->
                     Value.value list ->
                     Value.value list
  (** [streamline_set typeinfo set]:  This function can be called for a list of
      values [Value.Set seq], and decodes the list with the type information
      from [typeinfo].

      For example, if [typeinfo] is 
      {[ [Context,0,Integer; Context,1,Octetstring; Context,2,IA5String] ]}
      and the passed [set] is just
      {[ [Tagptr(Context,1,...); Tagptr(Context 0,...)] ]}
      the function decodes the elements as
      {[ [ Octetstring ...; Integer ... ] ]}
   *)

(** {1:intro The Abstract Syntax Notation 1 (ASN.1)}

ASN.1 allows you to represent structured values as octet streams.  The
values can be composed from a wide range of base types (e.g. numbers
and many different kinds of strings) and can be arranged as sequences
(records and arrays), sets, and tagged values (a concept fairly close
to OCaml variant types). There is a definition language allowing you
to define types and values. This language is not covered here (and
there is no IDL compiler). Look for ITU X.680 standard if you want to
know more.  We focus here on the octet representation, which is
sufficient for parsing and printing ASN.1 values.

{2 Encoding rules}

There are three variants on the representation level:

 - BER: Basic Encoding Rules
 - CER: Canonical Encoding Rules
 - DER: Distinguished Encoding Rules

BER describes the basic way how the octets are obtained, but leaves
several details up to the sender of an ASN.1 message. CER and DER use
stricter rules that are subsets of BER so that a given value can only
be represented in a single way. CER targets at large messages,
whereas DER is optimized for small messages. This module includes a generic
decoder for all BER messages, and {!Netasn1_encode} supports DER encoding.
The ASN.1 octet representations are described in ITU X.690.

{2 The TLV representation}

ASN.1 uses a type-length-value (TLV) style representation, i.e. there
is a header containing type information and the length of the data, followed
by the payload data. The data can be primitive (e.g. a number) or
"constructed" (i.e. a composition of further values). For certain data 
types the user can choose whether to prefer a primitive representation or
a construction from several part values (e.g. a very long string can be
given as a sequence of string chunks). Because of this, there is a
{!Netasn1.Value.pc} bit in the representation so that this choice is
available at runtime.

The type is given as a numeric tag (a small number), and a tag class
({!Netasn1.Value.tag_class}). There are four tag classes:

 - Universal: These tags are used for types defined by the ASN.1 standard,
   and should not be used for anything else. For example the type
   OctetString gets the universal tag 3. 
 - Application: These tags are intended for marking newly defined types. E.g.
   if you have a definition [type filename = string] and you would like to
   have filenames specially tagged to distinguish them from other uses
   of strings, the runtime representation of filenames could get an
   application tag (e.g. the number 8). In ASN.1 syntax:
   {[
   Filename ::= [APPLICATION 8] IA5String
   ]}
 - Context-specific: These tags are intended for marking variants, i.e.
   tags that are local to a specific use. An example in ASN.1 syntax:
   {[
CustomerRecord ::= SET { name            [0] VisibleString,
                         mailingAddress  [1] VisibleString,
                         accountNumber   [2] INTEGER,
                         balanceDue      [3] INTEGER }
   ]}
   The numbers in brackets are the context-specific tags.
 - Private: These are reserved for site-specific extensions of
   standardized message formats.

Conceptionally, universal and application tags identify types, whereas
context-specific tags identify variants (local cases). Both concepts
are not cleanly separated, though. If you e.g. define a set of values,
and one value variant is a string and another variant is an integer,
there is no strict need to use context-specific tags, because the tags
for the type "string" and for the type "integer" are already
different. In ASN.1 syntax:

{[
Example ::= SET { x VisibleString,
                  y INTEGER }
]}

A VisibleString has universal tag 26, and an INTEGER has universal tag 3.

Note that the bracket notation includes a keyword "UNIVERSAL",
"APPLICATION", or "PRIVATE" for these three classes, and that a
plain number indicates context-specific tags.

Finally, there are two ways of applying tags: Explicit and implicit.
Explicit tagging is used when the binary values should retain the complete
type information: If a tag is applied to an existing value, another
header with tag and length field is created, and the value is seen as
the contents of this construction. In other words, tagging is an
explicit construction like others (e.g. like a record).

Implicit tagging means that the tag of the existing value is replaced
by the new tag. As tags also encode the types, this means that type
information is lost, and you need apriori knowledge about the possible
tags to decode such values (e.g. that an application tag 8 always means
an IA5String).

{2 How to decode values}

The function {!Netasn1.decode_ber} will happily decode any BER data
and return a complex {!Netasn1.Value.value} unless implicit tagging is
used. Implicit tags cannot be decoded in one go because the type
information is missing. Instead of completely decoding such tags, only
a marker [Tagptr(tag_class,tag,pc,data,pos,len)] is created. Here,
[tag_class] and [tag] describe the tag. The value to which the tag is
applied is not yet parsed, but only a "pointer" in form of the string
[data], the position [pos] and the byte length [len] is returned.
This range inside [data] represents the inner value.

After determining the type of this value (by knowing which type is
applicable for [tag] and [tag_class]), you can call
{!Netasn1.decode_ber_contents} to decode the value. This function is
different from {!Netasn1.decode_ber} because it doesn't start at the
header of the BER representation but after the header. The type needs
to be passed explicitly because it isn't retrieved from the header.


 *)

