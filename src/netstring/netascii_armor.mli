(* $Id$ *)

(** Messages with ASCII armor *)

(** There are various forms of ASCII-armored messages:

    - PEM messages (privacy enhanced mail) - a historic message format
    - OpenPGP messages. This type of message has a header, a BASE-64-encoded
      body, and a checksum.
    - X.509 keys. These just use BASE-64.
 *)

type armor_type = [ `Plain | `Base64 | `OpenPGP ]

type armored_message =
    [ `Plain of Netmime.mime_body
    | `Base64 of Netmime.mime_body
    | `OpenPGP of Netmime.mime_header * Netmime.mime_body * int
    ]
  (** Messages:
      - [`Plain m]: The body [m] is written as-is
      - [`Base64 m]: The body [m] needs to be BASE-64-encoded in order
        to create the ASCII armor
      - [`OpenPGP(h,m,chksum)]: There is a header [h], a body [m] which
        will be BASE-64-encoded, and a checksum [chksum]
   *)

type armored_message_ro =
    [ `Plain of Netmime.mime_body_ro
    | `Base64 of Netmime.mime_body_ro
    | `OpenPGP of Netmime.mime_header_ro * Netmime.mime_body_ro * int
    ]
  (** The read-only version of [armored_message] *)

type armor_spec = (string * armor_type) list 
  (** Which types of armor to decode, and how. The strings are the
      identifiers in the boundaries, e.g. include
      "PRIVACY-ENHANCED MESSAGE" if the boundaries are
      "-----BEGIN PRIVACY-ENHANCED MESSAGE-----" and
      "-----END PRIVACY-ENHANCED MESSAGE-----". For every type you can
      define the [armor_type].
   *)

val parse : armor_spec -> Netchannels.in_obj_channel -> 
              (string * armored_message_ro) list
  (** Parses the channel, and returns all messages that are enabled in the
      specification.

      The channel is read line-by-line.
   *)

