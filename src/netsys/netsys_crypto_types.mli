(* $Id$ *)

(** Types for crypto providers *)


(** The exceptions the TLS provider may use (in addition to OCaml's built-in
    exception). In Ocamlnet, these exceptions are actually defined in 
    {!Netsys_types}.
 *)
module type TLS_EXCEPTIONS =
  sig
    exception EAGAIN_RD
    exception EAGAIN_WR
      (** A read or write cannot be done because the descriptor is in
      non-blocking mode and would block. This corresponds to the
      [Unix.EAGAIN] error but includes whether it was a read or write.

      When the read or write is possible, the interrupted function should
      simply be again called.

      These two exceptions are preferred by TLS providers.
      *)

    exception TLS_switch_request
      (** The server requested a rehandshake (this exception is thrown
          in the client)
       *)

    exception TLS_switch_response of bool
      (** The client accepted or denied a rehandshake (this exception is thrown
          in the server). [true] means acceptance.
       *)

    exception TLS_error of string
      (** A fatal error occurred (i.e. the session needs to be terminated).
          The string is a symbol identifying the error.
       *)

    exception TLS_warning of string
      (** A non-fatal error occurred. The interrupted function should be
          called again.
          The string is a symbol identifying the warning.
       *)
  end

module type TLS_PROVIDER =
  sig
    (** Provides TLS functionality.

        Users should not call functions of the provider directly, but use
        {!Netsys_tls}, or another higher-level layer.
     *)


    type config
    type credentials
    type endpoint

    module Exc : TLS_EXCEPTIONS
      (** Access to exceptions *)

    val error_message : string -> string
      (** Returns the message for humans (display, log files etc.) when
          called with an error or warning symbol.
       *)

    type dh_params =
        [ `PKCS3_PEM_file of string
        | `PKCS3_DER of string
        | `Generate of int
        ]
      (** Diffie-Hellman parameters:

           - [`PKCS3_PEM_file name]: points to a PEM-encoded PKCS3-file
             ("BEGIN DH PARAMETERS")
           - [`PKCS3_DER data]: the parameters are in a DER-encoded PKCS3
             structure
           - [`Generate bits]: the parameters are generated with the
             passed number of bits
       *)

    val create_config :
          ?algorithms : string ->
          ?dh_params : dh_params ->
          ?verify : (endpoint -> bool -> bool -> bool) ->
          peer_auth : [ `None | `Optional | `Required ] ->
          credentials : credentials ->
          unit ->
            config
      (** The configuration includes:

          - [algorithms]: a string specifying which cryptographic algorithms,
            protocols and protocol options
            are enabled, and in which priority they are used in the negotiation.
            (GnuTLS calls this "priority string".) The syntax is
            implementation-defined.
          - [dh_params]: parameters for Diffie-Hellman key exchange (used for
            DH-based authentication, but only on the server side)
          - [peer_auth]: controls whether the peer is requested to authenticate.
            This can be set to [`None] meaning not to request authentication
            and to ignore credentials, or to [`Optional] meaning not to request
            authentication but to check credentials if they are sent 
            nevertheless, or to [`Required] meaning to request and check
            credentials. For "standard clients" you should set this to
            [`Required], and for "standard servers" to [`None] or
            [`Required].
          - [credentials] describes our own credentials, and the accepted
            credentials of the peer.
          - [verify] is a function called to verify the peer certificate
            in addition to the actions of [peer_auth]. The function must
            return [true] in order to be successful. The arguments of the
            function are the TLS endpoint, and two bools indicating the
            success of previous checks. The first bool says whether the
            certificate is trusted (based on [peer_auth], [trust] and
            [system_trust]), and the second bool says whether the host name
            of the peer matches the name in the certificate. If not
            passed, [verify] defaults to [(fun _ cert_ok name_ok ->
            cert_ok && name_ok)], i.e. both bools must be true.

          A configuration is read-only once created, and can be used for
          several endpoints. In particular, it does not cache TLS sessions.
       *)


    type crt_list =
        [`PEM_file of string | `DER of string list]
      (** Certificates are given either as:

          - [`PEM_file name]: The certs are stored in this file, and are
            PEM-encoded.
          - [`DER l]: The certs are given directly in their DER-encoded form

          See also {!Credentials.tls}.
       *)

    type crl_list =
        [`PEM_file of string | `DER of string list]
      (** Certificate revocation lists are given either as:

          - [`PEM_file name]: The CRLs are stored in this file, and are
            PEM-encoded.
          - [`DER l]: The CRLs are given directly in their DER-encoded form

          See also {!Credentials.tls}.
       *)

    type private_key =
        [ `PEM_file of string 
        | `RSA of string 
        | `DSA of string
        | `EC of string
        | `PKCS8 of string
        | `PKCS8_encrypted of string
        ]
      (** Private keys are given either as:

          - [`PEM_file name]: The key is stored PEM-encoded in this file.
            The PEM header indicates the format.
          - [`RSA data]: The key is a PKCS1 RSA key
          - [`DSA data]: The key is a DSA key
          - [`EC data]: The key is for an elliptic curve
          - [`PKCS8 data]: The key is in a PKCS8 data structure
          - [`PKCS8_encrypted data]: The key is in a PKCS8 data structure,
            and is additionally encrypted.

          See also {!Credentials.tls}.
       *)

    val create_x509_credentials :
          ?system_trust:bool ->
          ?trust : crt_list list ->
          ?revoke : crl_list list ->
          ?keys : (crt_list * private_key * string option) list ->
          unit ->
            credentials
      (** Create X.509 credentials from individual objects:
           - [system_trust]: if set, the system certificates are trusted
           - [trust] specifies the CAs of peers to trust (default: empty)
           - [revoke] specifies CRLs for revocation of peer certificates
             (default: empty)
           - [keys] are our own certificates, as triples
             [(cert_path, private_key, password)] (default: empty)

          A client should set [trust] to the list of CAs it can accept on
          the server side. It is not required to specify a key.

          A server must specify a key (but can also specify several keys).
          If a server requests authentication from the client, it must also
          set [trust].

          The keys must include the certificate path [cert_path], starting
          with the endpoint certificate, and followed by all middle
          certificates, but omitting the certificate of the CA.
          The [private_key]
          is the key of the endpoint. If it is password-encrypted, the
          password must be given.
       *)

    val create_endpoint :
          role : [ `Server | `Client ] ->
          recv : (Netsys_types.memory -> int) ->
          send : (Netsys_types.memory -> int -> int) ->
          peer_name : string option ->
          config ->
            endpoint
      (** Creates a new endpoint for this configuration.

          [peer_name] is the expected common name or DNS name of the
          peer (if set). [peer_name] has an option type as it is not always
          required to check the name. However, keep in mind that clients
          normally authenticate servers ([peer_auth=`Required]). In
          order to do so, they need to check whether the name in the
          server certificate equals the DNS name of the service they
          are connected to. This check is done by comparing [peer_name]
          with the name in the certificate.

          If you set [peer_name] to [None], the name in the certificate
          is not checked.

          [peer_name] is also used for the SNI extension (name-based
          virtual hosting).

          Servers normally need not to set [peer_name]. You can also omit it
          when there is no name-driven authentication at all.

          The endpoint will use the functions [recv] and [send] for I/O, which
          must be user-supplied. [recv buf] is expected to read data into the
          buffer, and to return the number of bytes, or 0 for EOF. 
          [send buf n] is expected to send the [n] first bytes in [buf].

          Both functions may raise [Unix_error]. The codes [Unix.EAGAIN] and
          [Unix.EINTR] are specially interpreted.
       *)

    val stash_endpoint : endpoint -> exn
      (** The endpoint in "stashed" form, encapsulated as an exception.
          This form is intended for keeping the session alive in RAM, but
          without keeping references to the [recv] and [send] functions.

          The endpoint passed in to [stash_endpoint] must no longer be used!
       *)

    val restore_endpoint : 
          recv : (Netsys_types.memory -> int) ->
          send : (Netsys_types.memory -> int -> int) ->
          exn ->
            endpoint
      (** Reconnect the stashed endpoint with [recv] and [send] functions *)

    val resume_client :
          recv : (Netsys_types.memory -> int) ->
          send : (Netsys_types.memory -> int -> int) ->
          peer_name : string option ->
          config ->
          string ->
            endpoint
      (** Creates a new endpoint that will resume an old session. This implies
          the client role.

          The session data is passed as string, which must have been retrieved
          with [get_session_data].
       *)

    type state =
        [ `Start | `Handshake | `Data_rw | `Data_r | `Data_w | `Data_rs
        | `Switching | `Accepting | `Refusing | `End
        ]
      (** The state of a session:

          - [`Start]: Before the session is started
          - [`Handshake]: The handshake is being done (and [hello] needs to
            be called again)
          - [`Data_rw]: The connection exists, and is read/write
          - [`Data_r]: The connection exists, and is read-only
          - [`Data_w]: The connection exists, and is write-only
          - [`Data_rs]: The connection exists, and data can be read.
            There was a switch request (initiated by us), and a response
            is awaited. No data can be sent in the moment.
          - [`Switching]: A rehandshake is being negotiated (and [switch]
            needs to be called again)
          - [`Accepting]: A rehandshake is being accepted (and [accept_switch]
            needs to be called again)
          - [`Refusing]: A rehandshake is being refused (and [refuse_switch]
            needs to be called again)
          - [`End]: After finishing the session
       *)

    val get_state : endpoint -> state
      (** Return the recorded state *)

    type raw_credentials =
      [ `X509 of string
      | `Anonymous
      ]
      (** The encoded credentials:
           - [`X509 s]: The X509 certificate in DER encoding
           - [`Anonymous]: no certificate or other key is available
       *)

    val at_transport_eof : endpoint -> bool
    (** Whether the underlying transport channel has seen the end of
        input. Use this after [recv] or [mem_recv] returned 0 to
        check whether only the TLS enf-of-input message has been read,
       or the underlying channel (usually the file descriptor) has
        indicated EOF.
     *)

    val hello : endpoint -> unit
      (** Performs the initial handshake (exchanges credentials and establishes
          a session).

          [hello] doesn't verify the peer. Use [verify] for that.

          May raise [EAGAIN_RD], [EAGAIN_WR],
          [Unix_error(EINTR,_,_)], [Error] or [Warning].
       *)

    val bye : endpoint -> Unix.shutdown_command -> unit
      (** Performs the final handshake (exchanges close requests).

          If [SHUTDOWN_SEND] is set, the close request is sent to the peer, and
          the TLS tunnel is considered as closed for writing. The application
          can receive further data until [recv] returns zero bytes meaning
          that the peer responded with another close request.

          If [SHUTDOWN_ALL] is passed, it is additionally waited until the peer
          responds with a close request.

          A simple [SHUTDOWN_RECEIVE] is unimplemented and ignored.

          In no case the underlying transport is closed or shut down!

          May raise [EAGAIN_RD], [EAGAIN_WR],
          [Unix_error(EINTR,_,_)], [Error] or [Warning].
       *)

    val verify : endpoint -> unit
      (** [verify ep peer_name]: Checks that:
           - there is a trust chain for the peer's certificate
           - that [peer_name] is the common name of the certificate subject,
             or an alternate name

          {b These checks are not performed if [peer_auth=`None] is set in the
          configuration!}

          Additionally, the [verify] function in the endpoint configuration
          is called back, and a failure is indicated if this function returns
          [false]. This callback is useful to get the certificate of the peer
          and to perform further checks.

          The [verify] function will raise [Failure] on failed checks
          (and [Error]
          for internal processing errors).
       *)

    val get_config : endpoint -> config
      (** Get the current config (possibly modified because of a rehandshake)
       *)

    val get_endpoint_creds : endpoint -> raw_credentials
      (** Get the credentials that was actually used in the handshake, in raw
          format.
       *)

    val get_peer_creds : endpoint -> raw_credentials
      (** Get the credentials of the peer, in raw format. Raises [Not_found]
          if not applicable/no credentials present.
       *)

    val get_peer_creds_list : endpoint -> raw_credentials list
      (** Get the chain that was actually used in the handshake.
       *)

    val switch : endpoint -> config -> unit
      (** The server can use this to request a rehandshake and to use the
          new configuration for cert verification. This function sends the
          request, and expects a soon response from the client. The
          state enters [`Data_rs] meaning that we can still read data,
          and at some point [recv] will raise [TLS_switch_response].

          On the client side, the request will by returned as exception
          [TLS_switch_request] by [recv]. The client should respond with
          [accept_switch] if it accepts the handshake, or [refuse_switch] if
          not.

          May raise [EAGAIN_RD], [EAGAIN_WR],
          [Unix_error(EINTR,_,_)], [Error] or [Warning].
       *)

    val accept_switch : endpoint -> config -> unit
      (** On the client: Enter another handshake round with new configuration
          data.

          May raise [EAGAIN_RD], [EAGAIN_WR],
          [Unix_error(EINTR,_,_)], [Error] or [Warning].
       *)

    val refuse_switch : endpoint -> unit
      (** On the client: Refuse a handshake

          May raise [EAGAIN_RD], [EAGAIN_WR],
          [Unix_error(EINTR,_,_)], [Error] or [Warning].
       *)

    val send : endpoint -> Netsys_types.memory -> int -> int
      (** [send ep buffer n]: Sends the first [n] bytes in the buffer over
          the endpoint, and returns the actual number of processed bytes.

          May raise [EAGAIN_RD], [EAGAIN_WR],
          [Unix_error(EINTR,_,_)], [Error] or [Warning].
       *)

    val recv : endpoint -> Netsys_types.memory -> int
      (** [recv ep buffer n]: Receives data, and puts them into the memory
          buffer, and returns the actual number of received bytes. If 0
          is returned, a close request was received by the peer. For closing
          the tunnel properly this request should be responded by another
          close request with [bye] (unless this has already been done).

          May raise [EAGAIN_RD], [EAGAIN_WR],
          [Unix_error(EINTR,_,_)], [Error] or [Warning].

          The exception [TLS_switch_request] can only occur on the client
          side, and should be responded by [accept_switch] or [refuse_switch].

          The exception [TLS_switch_response] can only occur on the server
          side.
       *)

    val recv_will_not_block : endpoint -> bool
      (** If there is still unprocessed data in the endpoint buffer, 
          [recv] is guaranteed not to block or raise [EAGAIN].
       *)

    val get_session_id : endpoint -> string
      (** The (non-printable) session ID *)

    val get_session_data : endpoint -> string
      (** Get the (non-printable) marshalled session data, for later resumption
          with [resume_client]
       *)

    val get_cipher_suite_type : endpoint -> string
      (** The type of the cipher suite:
         - "X509": X509 certificates are used
         - "OPENPGP": OpenPGP certificates are used
         - "ANON": anonymous credentials
         - "SRP": SRP credentials
         - "PSK": PSK credentials
       *)

    (* TODO: get_cipher_suite_id : endpoint -> int * int
       = get the two bytes identifying the cipher suite
     *)

    val get_cipher_algo : endpoint -> string
      (** Get the name of the cipher *)

    val get_kx_algo : endpoint -> string
      (** Get the name of the key exchange method *)

    val get_mac_algo : endpoint -> string
      (** Get the name of the message authentication code *)

    val get_compression_algo : endpoint -> string
      (** Get the name of the record-level compression method *)

    val get_cert_type : endpoint -> string
      (** Get the type of the certificate *)

    val get_protocol : endpoint -> string
      (** Get the name of the tunnel protocol *)

    type server_name = [ `Domain of string ]

    val get_addressed_servers : endpoint -> server_name list
      (** To be used in servers: The client can address one of several virtual
          servers with the SNI extension, and this function returns which
          was requested. Raises
          [Not_found] if there is nothing appropriate. This information is
          only available after a handshake, and if the client submitted it.
       *)

    val set_session_cache : store:(string -> string -> unit) ->
                            remove:(string -> unit) ->
                            retrieve:(string -> string) ->
                            endpoint ->
                            unit
      (** Sets the three callbacks for storing, removing and retrieving
          sessions (on the server side)
       *)

    (* TODO: DTLS *)
    (* TODO: get channel binding token *)

    val implementation_name : string
      (** String name of the implementation. By convention this is the
          full OCaml module path, e.g. "Nettls_gnutls.TLS"
       *)

    val implementation : unit -> exn
      (** Implementation-defined additional functionality *)
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
  (** Symmetric cryptographic ciphers.

       Users should not call functions of the provider directly, but use
      {!Netsys_ciphers}, or another higher-level layer.
   *)

  type scipher
    (** Describes a cipher *)

  val ciphers : scipher list
    (** List of supported ciphers. OCamlnet implements a number of modes
        anyway, and it is normally only required to implement "ECB" here.
        If there is special hardware acceleration, though, it is an option
        to provide accelerated modes too (e.g. some CPUs support AES-GCM
        specially).
     *)

  val find : (string * string) -> scipher
    (** [find (name,mode)]: Looks up a cipher by name and mode, or
        raises Not_found
     *)

  val name : scipher -> string
    (** Returns the name. This should follow the convention 
        [<uppercasestring>-<size>], e.g. 
        "AES-128" or "TWOFISH-128". The size is normally the key size.
     *)

  val mode : scipher -> string
    (** Returns the mode.  Modes are "ECB", "CBC", "OFB",
        "CTR", "STREAM", "GCM".

        Note that the mode needs not to deal with padding (this is done
        on a higher level).
     *)

  val key_lengths : scipher -> (int * int) list
    (** Supported key lengths as pairs [min,max]. If there is a recommended
        key length, this should be the first.
     *)

  val iv_lengths : scipher -> (int * int) list
    (** Supported iv lengths as pairs [min,max]. If there is a recommended
        iv length, this should be the first.
     *)

  val block_constraint : scipher -> int
    (** The buffers used with encrypt/decrypt must have a length that is a
        multiple of this number. (In ECB mode, this is the block size.)
     *)

  val supports_aead : scipher -> bool
    (** Whether this cipher integrates authentication *)

  type scipher_ctx
    (** A cipher context stores processing data while encrypting or
        decrypting data
     *)

  val create : scipher -> string -> scipher_ctx
    (** [create c key]: create a new cipher context for [key]. If not set,
        the initialization vector is zero, and the header the empty string.
     *)

  val set_iv : scipher_ctx -> string -> unit
    (** [set_iv cctx iv]: Sets the initialization vector. This is only allowed
        before encrypting or decrypting data
     *)

  val set_header : scipher_ctx -> string -> unit
    (** [set_header cctx data]: Sets the additional header that is authenticated
        for AEAD schemes. The header must have been set before starting the
        encryption or decryption (otherwise it is assumed to be the empty
        string).

        For non-AEAD schemes, the header is ignored for encryption, and must
        be empty for decryption.
     *)

  val encrypt : scipher_ctx -> 
                Netsys_types.memory ->
                Netsys_types.memory ->
                  unit
    (** [encrypt cctx inbuf outbuf]: Encrypts the data in [inbuf] and writes
        the result into [outbuf]. Both buffers must have the same size.
        It is not allowed to pass the same buffer as [inbuf] and [outbuf].

        In order to encrypt long texts, it is allowed to call [encrypt] several
        times in sequence.
     *)

  val decrypt : scipher_ctx -> 
                Netsys_types.memory ->
                Netsys_types.memory ->
                  bool
    (** [decrypt cctx inbuf outbuf]: Decrypts the data in [inbuf] and writes
        the result into [outbuf]. Both buffers must have the same size.
        It is not allowed to pass the same buffer as [inbuf] and [outbuf].

        The function returns [true] on success, and [false] if a problem
        is detected.

        In order to decrypt long texts, it is allowed to call [decrypt] several
        times in sequence.
     *)

  val mac : scipher_ctx -> string
    (** Returns the MAC for AEAD ciphers. This is updated after
        [encrypt]/[decrypt]. This function fails for non-AEAD ciphers.
     *)
end


module type DIGESTS = sig
  (** Cryptographic digests.

      Users should not call functions of the provider directly, but use
      {!Netsys_digests}, or another higher-level layer.
   *)

    type digest
      (** Describes a digest *)

    val digests : digest list
      (** returns digests *)

    val find : string -> digest
      (** Returns the digest of this name, or raises [Not_found] *)

    val name : digest -> string
      (** returns the name of the digest. The name follows the format
          [<uppercasename>-<size>], e.g. "MD5-128", "SHA1-160", "SHA2-256".
       *)

    val size : digest -> int
      (** returns the size of the hash output (in bytes) *)

    val block_length : digest -> int
      (** the block length (in bytes) *)

    type digest_ctx
      (** A digest context stores state while digesting data *)

    val create : digest -> digest_ctx
      (** Creates a fresh context *)

    val add : digest_ctx -> Netsys_types.memory -> unit
      (** Adds data *)

    val finish : digest_ctx -> string
      (** Returns the digest *)
end

module type PUBKEY_CRYPTO = sig
    type public_key
    type private_key
    type pin_callback
    type algorithm

    val supported_x509 : int array list
      (** The supported X509 algorithm types as list of OIDs *)

    val algorithm_x509 : int array -> string option -> algorithm
      (** The algorithm is specified by OID. The parameters - if present -
          are DER-encoded. The passed parameters override any parameters
          already contained in the key. Usually, it is only necessary to
          provide parameters that are not yet contained in the key (e.g.
          the hash algorithms of RSASSA-PSS when applied to a normal RSA key).
       *)

    val import_public_key_x509 : string -> public_key
      (** The DER-encoded subjectPublicKeyInfo *)

    val import_public_key_uri : string -> public_key
      (** indirect reference e.g. a PKCS11 URI *)

    val import_public_key_uri_with_pin : pin_callback -> string -> public_key

    type x509_private_key = string * string
      (** [(format,data)], using the formats: "RSA", "DSA", "DH", "EC".
          The [data] is DER-encoded.
       *)

    val import_private_key_x509 : x509_private_key -> private_key
      (** import a private key from DER *)

    val import_private_key_uri : string -> private_key
      (** indirect reference e.g. a PKCS11 URI *)

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
