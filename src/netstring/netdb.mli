(* $Id$
 * ----------------------------------------------------------------------
 *
 *)


(* This is an internal interface of ocamlnet! Do not use outside! *)

(* This module manages persistent values (often lookup tables). These
 * values can be stored in external files, or they can be initialized
 * from string values.
 *)

val read_db : string -> string
  (* Reads the value with the given name, and returns it.
   *
   * First it is checked whether there was a set_db call, and if so,
   * this value is unmarshalled and returned. Otherwise, it is checked
   * whether there is a loader, and if so, it is called.
   *
   * In both cases the checksum is checked.
   *)

val exists_db : string -> bool
  (* Checks whether the named value is available, i.e. read_db would
   * be able to find it
   *)

val set_db_checksum : string -> string -> unit
  (* [set_db_checksum key cksum]: sets the MD5 digest of this key *)

val set_db : string -> string -> unit
  (* Sets the persistent value with the given name (1st arg) to the 
   * passed value (2nd arg). The value must be marshalled as string.
   *)

val set_db_loader : string -> (string -> string) -> unit
  (* [set_db_loader key loader]: sets a loader for this key, which is called
     when set_db has not been set for this key. The arg of the loader is the
     key.
   *)

val enable_db_loaders : bool -> unit
  (* Whether dynamic loading is enabled *)
