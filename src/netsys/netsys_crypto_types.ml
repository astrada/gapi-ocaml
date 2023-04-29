(* $Id$ *)

module type TLS_EXCEPTIONS =
  sig
    exception EAGAIN_RD
    exception EAGAIN_WR
    exception TLS_switch_request
    exception TLS_switch_response of bool
    exception TLS_error of string
    exception TLS_warning of string
  end

module type TLS_PROVIDER =
  sig
    type config
    type credentials
    type endpoint

    module Exc : TLS_EXCEPTIONS

    val error_message : string -> string

    type dh_params =
        [ `PKCS3_PEM_file of string
        | `PKCS3_DER of string
        | `Generate of int
        ]

    val create_config :
          ?algorithms : string ->
          ?dh_params : dh_params ->
          ?verify : (endpoint -> bool -> bool -> bool) ->
          peer_auth : [ `None | `Optional | `Required ] ->
          credentials : credentials ->
          unit ->
            config

    type crt_list =
        [`PEM_file of string | `DER of string list]
    type crl_list =
        [`PEM_file of string | `DER of string list]
    type private_key =
        [ `PEM_file of string 
        | `RSA of string 
        | `DSA of string
        | `EC of string
        | `PKCS8 of string
        | `PKCS8_encrypted of string
        ]
    val create_x509_credentials :
          ?system_trust:bool ->
          ?trust : crt_list list ->
          ?revoke : crl_list list ->
          ?keys : (crt_list * private_key * string option) list ->
          unit ->
            credentials

    val create_endpoint :
          role : [ `Server | `Client ] ->
          recv : (Netsys_types.memory -> int) ->
          send : (Netsys_types.memory -> int -> int) ->
          peer_name : string option ->
          config ->
            endpoint
    val stash_endpoint : endpoint -> exn
    val restore_endpoint : 
          recv : (Netsys_types.memory -> int) ->
          send : (Netsys_types.memory -> int -> int) ->
          exn ->
            endpoint
    val resume_client :
          recv : (Netsys_types.memory -> int) ->
          send : (Netsys_types.memory -> int -> int) ->
          peer_name : string option ->
          config ->
          string ->
            endpoint

    type state =
        [ `Start | `Handshake | `Data_rw | `Data_r | `Data_w | `Data_rs
        | `Switching | `Accepting | `Refusing | `End
        ]

    val get_state : endpoint -> state

    type raw_credentials =
      [ `X509 of string
      | `Anonymous
      ]

    val at_transport_eof : endpoint -> bool
    val hello : endpoint -> unit
    val bye : endpoint -> Unix.shutdown_command -> unit
    val verify : endpoint -> unit
    val get_config : endpoint -> config
    val get_endpoint_creds : endpoint -> raw_credentials
    val get_peer_creds : endpoint -> raw_credentials
    val get_peer_creds_list : endpoint -> raw_credentials list
    val switch : endpoint -> config -> unit
    val accept_switch : endpoint -> config -> unit
    val refuse_switch : endpoint -> unit
    val send : endpoint -> Netsys_types.memory -> int -> int
    val recv : endpoint -> Netsys_types.memory -> int
    val recv_will_not_block : endpoint -> bool
    val get_session_id : endpoint -> string
    val get_session_data : endpoint -> string
    val get_cipher_suite_type : endpoint -> string
    val get_cipher_algo : endpoint -> string
    val get_kx_algo : endpoint -> string
    val get_mac_algo : endpoint -> string
    val get_compression_algo : endpoint -> string
    val get_cert_type : endpoint -> string
    val get_protocol : endpoint -> string

    type server_name = [ `Domain of string ]

    val get_addressed_servers : endpoint -> server_name list
    val set_session_cache : store:(string -> string -> unit) ->
                            remove:(string -> unit) ->
                            retrieve:(string -> string) ->
                            endpoint ->
                            unit
    val implementation_name : string
    val implementation : unit -> exn
  end


module type TLS_CONFIG =
  sig
    module TLS : TLS_PROVIDER
    val config : TLS.config
  end


module type TLS_ENDPOINT =
  sig
    module TLS : TLS_PROVIDER
    val endpoint : TLS.endpoint
  end


module type FILE_TLS_ENDPOINT =
  sig
    module TLS : TLS_PROVIDER
    val endpoint : TLS.endpoint
    val rd_file : Unix.file_descr
    val wr_file : Unix.file_descr
  end

module type SYMMETRIC_CRYPTO = sig
  type scipher
  val ciphers : scipher list
  val find : (string * string) -> scipher
  val name : scipher -> string
  val mode : scipher -> string
  val key_lengths : scipher -> (int * int) list
  val iv_lengths : scipher -> (int * int) list
  val block_constraint : scipher -> int
  val supports_aead : scipher -> bool
  type scipher_ctx
  val create : scipher -> string -> scipher_ctx
  val set_iv : scipher_ctx -> string -> unit
  val set_header : scipher_ctx -> string -> unit
  val encrypt : scipher_ctx -> 
                Netsys_types.memory ->
                Netsys_types.memory ->
                  unit
  val decrypt : scipher_ctx -> 
                Netsys_types.memory ->
                Netsys_types.memory ->
                  bool
  val mac : scipher_ctx -> string
end


module type DIGESTS = sig
    type digest
    val digests : digest list
    val find : string -> digest
    val name : digest -> string
    val size : digest -> int
    val block_length : digest -> int
    type digest_ctx
    val create : digest -> digest_ctx
    val add : digest_ctx -> Netsys_types.memory -> unit
    val finish : digest_ctx -> string
end

module type PUBKEY_CRYPTO = sig
    type public_key
    type private_key
    type pin_callback
    type algorithm

    val supported_x509 : int array list
    val algorithm_x509 : int array -> string option -> algorithm
    val import_public_key_x509 : string -> public_key
    val import_public_key_uri : string -> public_key
    val import_public_key_uri_with_pin : pin_callback -> string -> public_key

    type x509_private_key = string * string

    val import_private_key_x509 : x509_private_key -> private_key

    val import_private_key_uri : string -> private_key
    val import_private_key_uri_with_pin : pin_callback -> string -> private_key

    val import_public_key_from_private : private_key -> public_key

    val simple_pin_callback : (unit -> string) -> pin_callback

    val encrypt : algorithm -> public_key -> string -> string
    val decrypt : algorithm -> private_key -> string -> string
    val verify : algorithm -> public_key -> string -> string -> bool
    val sign : algorithm -> private_key -> string -> string
end

type tls_provider = (module TLS_PROVIDER)
type tls_config = (module TLS_CONFIG)
type tls_endpoint = (module TLS_ENDPOINT)
type file_tls_endpoint = (module FILE_TLS_ENDPOINT)
type symmetric_crypto = (module SYMMETRIC_CRYPTO)
type digests = (module DIGESTS)
type pubkey_crypto = (module PUBKEY_CRYPTO)
