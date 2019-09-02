open OUnit
open GapiJwtServiceAccount

let private_key =
  "-----BEGIN PRIVATE KEY-----\n\
   MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAOIGxguhwCoxg+oM\n\
   jS3ZEiOBjJCPoM0zmXXBIopKf68OlE//a+v3aYNfszMrrPUqxWOWZXtfrjJF3711\n\
   aaqfkNZUsriomKU5xLkRz3Wa9lY4cfZOYT21gZEUaXsMcgl50DUXz1slNeIyvuj9\n\
   8xurff2kM1rFqkZOUBl9e+lR9Y8tAgMBAAECgYAR1Xz83/dcnOmOpwzgqDcBLDCe\n\
   G2cRqdea7fE+viAS/PCA22N1i+D8Z6mpCPItqgFHGU/Ki0MgXlkIBuKeftabnLae\n\
   oss9Q48pI6ktXdh1A5kDxD3dOrXmm9+D0nbBUDfxoMJ4y9q29hKVJSJZp6YDt3PJ\n\
   O8Xr7AZ+PlAaI/VnQQJBAPsOu6Fg8e9Q+TJhQDMB/qFx21yEB7pOPsqdfMZzvDVq\n\
   i4v2zSF9G4bNY+JN79DqXr76mFiG8qgW0DZmdLYV2JECQQDmeePoYYfiHsLaHhrr\n\
   NLVBDhkAVqC9NiCk4iNOO4DayUcXf/Wdwwh6ECdnz86h6Fu9sLrsUD6cjKR6mnU/\n\
   3PrdAkBWg6U032t/xK+bJNgyu6U7jTjCkNz43q3UtKCi4o8g+S5NdScLO0mZEn4x\n\
   JhpWK+2qckC9gQNt2S63EGd3t9+BAkByVDjIR8leVCAYjyKPVsArG1Evp8lo0vby\n\
   k/Mrlbzfy0Tm1WUD84G6+1Rw3NcF3fvUZ1zyaQQGKIZXA1PycC5JAkARV7G4PnKk\n\
   KMa+4HQN4kKoAZNUUJLm3u2mUra0xqzL3FGkSmKRHQsbJ9WsKjjA8nKM/GlpQHAA\n\
   mb7dsoasvrUJ\n\
   -----END PRIVATE KEY-----"

let test_parse_private_key () =
  let rsa_key = parse_private_key private_key in
  assert_equal
    ~printer:string_of_int
    1024
    rsa_key.Cryptokit.RSA.size;
  assert_equal
    ~printer:Char.escaped
    '\xe2'
    rsa_key.Cryptokit.RSA.n.[0];
  assert_equal
    ~printer:Char.escaped
    '\x2d'
    rsa_key.Cryptokit.RSA.n.[127];
  assert_equal
    ~printer:Char.escaped
    '\x01'
    rsa_key.Cryptokit.RSA.e.[0];
  assert_equal
    ~printer:Char.escaped
    '\x00'
    rsa_key.Cryptokit.RSA.e.[1];
  assert_equal
    ~printer:Char.escaped
    '\x01'
    rsa_key.Cryptokit.RSA.e.[2]

let test_get_encoded_claim () =
  let jwt_claim = {
    JwtClaim.iss = "761326798069-r5mljlln1rd4lrbhg75efgigp36m78j5@developer.gserviceaccount.com";
    scope = "https://www.googleapis.com/auth/prediction";
    aud = "https://www.googleapis.com/oauth2/v4/token";
    exp = 1328554385.0;
    iat = 1328550785.0;
    sub = "";
  } in
  let encoded_claim = get_encoded_claim jwt_claim in
  assert_equal
    ~printer:TestHelper.id
    "eyJpc3MiOiI3NjEzMjY3OTgwNjktcjVtbGpsbG4xcmQ0bHJiaGc3NWVmZ2lncDM2bTc4ajVAZGV2ZWxvcGVyLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzY29wZSI6Imh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL2F1dGgvcHJlZGljdGlvbiIsImF1ZCI6Imh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL29hdXRoMi92NC90b2tlbiIsImV4cCI6MTMyODU1NDM4NS4wLCJpYXQiOjEzMjg1NTA3ODUuMH0"
    encoded_claim

(* Commented out tests of private functions

let test_emsa_pkcs1_v1_5_encode () =
  let message = "test" in
  let key_length = 128 in (* 1024 bit *)
  let em = emsa_pkcs1_v1_5_encode message key_length in
  (* tlen = 51, emLen = 128, psLen = 128 - 51 - 3 = 74 ' *)
  assert_equal
    ~printer:TestHelper.string_to_hex
    "\x00\
     \x01\
     \xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\
     \x00\
     \x30\x31\x30\x0d\x06\x09\x60\x86\x48\x01\x65\x03\x04\x02\x01\x05\x00\x04\x20\x9f\x86\xd0\x81\x88\x4c\x7d\x65\x9a\x2f\xea\xa0\xc5\x5a\xd0\x15\xa3\xbf\x4f\x1b\x2b\x0b\x82\x2c\xd1\x5d\x6c\x15\xb0\xf0\x0a\x08"
    em

let test_rsasp1 () =
  let em = emsa_pkcs1_v1_5_encode "test" 128 in
  let rsa_key = parse_private_key private_key in
  let signature = rsasp1 rsa_key em in
  assert_equal
    ~printer:TestHelper.id
    "Y11MeE0wfvSc2nfBSr_aDEmeryOioAL7cIvBjYg44zp_rKsfBbBVkocm7b1oxITBoGBzIbB92Suunrg7wVjM1M5iIp5BZfvzmGEMLSObsE0BsNf1UHGJ-TuAnro-FGHEGcCe_r4hupI0d4pMl-Cdcwr-RWu9Ekj10dUntnYVO_8"
    signature
*)

let test_get_signature () =
  let encoded_jwt_claim =
    "eyJpc3MiOiI3NjEzMjY3OTgwNjktcjVtbGpsbG4xcmQ0bHJiaGc3NWVmZ2lncDM2bTc4ajVAZGV2ZWxvcGVyLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzY29wZSI6Imh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL2F1dGgvcHJlZGljdGlvbiIsImF1ZCI6Imh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL29hdXRoMi92NC90b2tlbiIsImV4cCI6MTMyODU1NDM4NS4wLCJpYXQiOjEzMjg1NTA3ODUuMH0" in
  let signature = get_signature encoded_jwt_claim private_key in
  assert_equal
    ~printer:TestHelper.id
    "X1sq8hTgNYbOeZHx7GR39WPmCm5fH3SgBbbL_NZX8ELrXq2ftNf9CmU4d_p-zPj5E8_uuSDNkGPxigDBLc_5pBKUhUDbA_OsLwuk553wMedmoaJwdQrKBOBcu5GMTMPHDuk2P57N1iwkRQLHofl9tOye1etfBDQQ6yvWMrh2GZE"
    signature

let suite = "JWT helper module for service accounts test" >:::
  ["test_parse_private_key" >:: test_parse_private_key;
   "test_get_encoded_claim" >:: test_get_encoded_claim;
   (* "test_emsa_pkcs1_v1_5_encode" >:: test_emsa_pkcs1_v1_5_encode;
   "test_rsasp1" >:: test_rsasp1; *)
   "test_get_signature" >:: test_get_signature;
  ]

