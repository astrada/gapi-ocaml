(* $Id$
 * ----------------------------------------------------------------------
 *
 *)

(** Netmime contains high-level classes and functions to process
 * mail and MIME messages.
 *
 * {b Contents}
 *
 * - {!Netmime.types}
 * - {!Netmime.classes}
 *
 * The tutorial has been moved to {!Netmime_tut}. Parsers for MIME
 * headers are now in {!Netmime_header}. Parser and printers for MIME
 * channels are now in {!Netmime_channels}.
 *)

(* ***************************** Types ******************************** *)

(** {1:types Types} *)

open Netchannels

type store =
  [ `Memory
  | `File of string
      (* The string is the filename of a file containing the (decoded) value
       * of the body
       *)
  ]
  (** Specifies where to store the body of a mail message. [`Memory]
   * means in-memory, [`File name] means in the file [name]. The body
   * is stored in decoded form (i.e. without transfer encoding).
   *)

exception Immutable of string
  (** Raised if it is tried to modify a read-only value. The string denotes
   * the function or method where the incident happened.
   *)


(** MIME headers and bodies are defined in two steps. First the subtype
 * describing read access is defined ([mime_header_ro], and [mime_body_ro]),
 * and after that the full class type including write access is defined
 * ([mime_header], and [mime_body]).
 *
 * The idea is that you can write functions that take an ro value as
 * input to indicate that they do not modify the value. For example:
 * 
 * {[
 * let number_of_fields (h:#mime_header_ro) =
 *   List.length (h#fields) ]}
 *
 * This function accepts both [mime_header], and [mime_header_ro] values as
 * input, but the typing ensures that the function cannot mutate anything.
 *
 * There is another way to ensure that a header or body is not modified.
 * The read-only flag can be set when creating the object, and this flag
 * causes that all trials to modify the value will raise the exception
 * [Immutable]. Of course, such trials of mutation are only detected at
 * run-time.
 *
 * The advantage of the read-only flag is that it even works if 
 * mutation depends on a condition, but it can be ensured that this
 * condition is never true. Furthermore, typing is much simpler (getting
 * subtyping correct can be annoying).
 *)


(** This is the read-only version of a MIME header. There are only methods
 * to read the header fields.
 *)
class type mime_header_ro =             
object
  (* read-only view of a mime_header *)

  method fields : (string * string) list
  method field  : string -> string
  method multiple_field : string -> string list
    (** The current fields of the header. [fields] returns the complete
     * header. [field name] returns the value of the field, or raises
     * [Not_found]. [multiple_field name] returns all fields with the same
     * name.
     *
     * Note that field names are case-insensitive; [field "content-length"],
     * and [field "CONTENT-LENGTH"] will return the same field. However,
     * the method [fields] returns the original field names, without
     * adjustment of the case.
     *
     * The order of the fields is preserved.
     *)

  (** Since OCamlnet-4 the methods [content_length], [content_type],
      [content_dispositions] and [content_transfer_encoding] have been
      moved to {!Netmime_header}.
   *)
end


(** A MIME header with both read and write method. It is still possible,
 * however, to set the read-only flag to make this kind of header
 * immutable, too.
 *)
class type mime_header = 
object
  (* A mutable or immutable mime_header *)

  inherit mime_header_ro
    (** Supports all these read access method, too *)

  method ro : bool
    (** whether the header is read-only or not *)

  method set_fields : (string * string) list -> unit
  method update_field : string -> string -> unit
  method update_multiple_field : string -> string list -> unit
  method delete_field : string -> unit
    (** These methods modify the fields of the header. If the header is
     * read-only, the exception [Immutable] will be raised.
     *
     * [set_fields] replaces the current fields with a new list of
     * (name,value) pairs. [update_field name value] replaces all fields
     * of the passed name with the single setting (name,value), or
     * adds this setting to the list. [update_multiple_field name values]
     * replaces all fields of the passed name with the list of values,
     * or adds this list. Finally, [delete_field name] deletes all
     * fields of the passed name. Nothing happens if there is no such
     * field.
     *
     * Both [update_field] and [update_multiple_field] first replace
     * existing values by the new ones without changing the order
     * of the fields in the header. Additional values are inserted
     * after the last existing value, or at the end of the header.
     *)

end


(** This is the read-only version of a MIME body. There are only methods
 * to read the body contents.
 *
 * The value of the body can be returned either as [string], or as
 * object channel. Both ways are possible independently of where
 * the value is stored, in-memory, or as external file.
 *)
class type mime_body_ro =
object
  (* a read-only view of a mime_body *)

  method value : string
    (** The [value] method returns the _decoded_ body,
     * i.e. transfer encodings are removed before the value is passed
     * back.
     *
     * When the body is stored in an external file, this method
     * reads the complete file into memory.
     *)

  method store : store
    (** Where the body is actually stored. *)

  method open_value_rd : unit -> in_obj_channel
    (** Opens the value for reading. This works independently of where
     * the body is stored. For example, to read the body line by line:
     * {[
     * let ch = body # open_value_rd () in
     * try
     *   while true do
     *     let line = ch # input_line() in
     *     ... (* do something *)
     *   done;
     *   assert false; (* never reached *)
     * with
     *   End_of_file ->
     *     ch # close_in()
     * ]}
     *
     * As [value], this method returns the value in decoded form.
     * This method is quite economical with the resources, and takes
     * only as much memory as needed for the channel operations.
     *)

  method finalize : unit -> unit
    (** After the body has been finalized, it cannot be accessed any longer.
     * External resources (files) are deallocated, if they are seen as
     * temporary.
     *)
end


(** A MIME body with both read and write method. It is still possible,
 * however, to set the read-only flag to make this kind of body
 * immutable, too.
 *
 * The value of the body can be set either by a [string], or by writing
 * to an object channel. Both ways are possible independently of where
 * the value is stored, in-memory, or as external file.
 *)
class type mime_body =
object
  (* A mutable or immutable mime_body *)

  inherit mime_body_ro
    (** Supports all these read access method, too *)

  method ro : bool
    (** whether this body is read-only or not *)

  method set_value : string -> unit
    (** Sets the value. If the value is immutable, the exception
     * [Immutable] will be raised.
     *
     * The passed string must be in decoded form. When the body is
     * stored in an external file, the file is overwritten.
     *)

  method open_value_wr : unit -> out_obj_channel
    (** Opens the value for writing. The current value is overwritten. 
     * If the value is immutable, the exception [Immutable] will be raised.
     *
     * For example, to copy the file [f] into the value:
     * {[ 
     * let ch = body # open_value_wr() in
     * let f_ch = new Netchannels.input_file f in
     * ch # output_channel f_ch;
     * f_ch # close_in();
     * ch # close_out();
     * ]}
     * 
     *)

end


(** One can consider the pair [(mime_header, mime_body)] as simple MIME
 * message with one header and one body. Of course, this simple representation
 * does not support multi-part messages (attachments). For that reason,
 * the [complex_mime_message] was invented: The body can be further
 * structured as a sequence of parts that are complex messages themselves.
 *
 * For example, a mail message with an attachment is usually
 * represented as
 * {[
 * (mail_header, `Parts [ (main_header, `Body main_body);
 *                        (att_header, `Body att_body) ] ) ]}
 *
 * Here, [mail_header] is the real header of the mail message.
 * [main_header] is the header of the main message, usually
 * only containing the content type of [main_body], the body
 * of the main message. The attachment has also its own 
 * [att_header], again usually only containing the content type,
 * and the data of the attachment can be found in [att_body].
 *
 * Nowadays, mails have often even a more complicated structure
 * with [`Parts] containing nested [`Parts]. As [complex_mime_message]
 * is recursive, any kind of nesting can be easily represented.
 *)

type complex_mime_message = mime_header * complex_mime_body
and complex_mime_body =
  [ `Body of mime_body
  | `Parts of complex_mime_message list
  ]
  (* A complex_mime_message can have (nested) multipart structure. *)

type complex_mime_message_ro = mime_header_ro * complex_mime_body_ro
and complex_mime_body_ro =
  [ `Body of mime_body_ro
  | `Parts of complex_mime_message_ro list
  ]
  (** The read-only view of a complex_mime_message *)


(** Note: [`Parts []], i.e. [`Parts] together with an empty list, is 
 * considered as illegal. Such a value cannot be transformed into
 * printable text.
 *)


type mime_message = mime_header * [ `Body of mime_body ]
  (** Simple MIME message, in a form that is compatible with complex
   * ones.
   *)

type mime_message_ro = mime_header_ro * [ `Body of mime_body_ro ]
  (** Read-only variant of simple messages *)


(* ************************* Representations ************************** *)

(** {1:classes Classes} *)

class basic_mime_header : (string * string) list -> mime_header
  (** An implementation of [mime_header].
   *
   * The argument is the list of (name,value) pairs of the header. 
   *
   * Example: Create a MIME header with only the field "Content-type":
   * {[ let h = new basic_mime_header ["content-type", "text/plain"] ]}
   *
   * Example: Set the field "Subject":
   * {[ h # update_field "subject" "The value of this field" ]}
   *
   * This [mime_header] implementation bases on a mixture of a [Map] data
   * structure and a doubly linked list. The efficiency of the operations
   * (n=number of fields; m=average number of values per field; 
   * n*m=total number of values):
   * - [new], [set_fields]: O(m * n * log n), but the construction of the dictionary
   *   is deferred until the first real access
   * - [field]: O(log n)
   * - [multiple_field]: O(log n + m)
   * - [fields]: O(n * m)
   * - [update_field], [update_multiple_field]: O(log n + m)
   * - [delete_field]: O(n + m)
   *)

val basic_mime_header : (string * string) list -> mime_header
  (** Same as function *)

class wrap_mime_header : #mime_header -> mime_header
  (** Wraps the inner header *)

class wrap_mime_header_ro : #mime_header_ro -> mime_header
  (** Wraps the inner header but disallows modifications. In this case,
      [Immutable] is raised.
   *)

val wrap_mime_header_ro : #mime_header_ro -> mime_header
  (** Same as function *)


class memory_mime_body : string -> mime_body
  (** An implementation of [mime_body] where the value is stored
   * in-memory.
   *
   * The argument is the initial (decoded) value of the body.
   * The method [store] returns [`Memory].
   *
   * Example: To create a body from a string, call
   * {[ new memory_mime_body "The value as string" ]}
   *)

val memory_mime_body : string -> mime_body
  (** Same as function *)

class file_mime_body : ?fin:bool -> string -> mime_body
  (** An implementation of [mime_body] where the value is stored
   * in an external file.
   *
   * The argument is the name of the file containing the (decoded) value. 
   * The method [store] returns [`File filename].
   * The method [value] loads the contents of the file and returns them
   * as string.
   *
   * Example: To create a body from the file "f", call
   * {[ new file_mime_body "f" ]}
   *
   * @param fin whether to delete the file when the [finalize] method is called
   *   (default: false)
   *)

val file_mime_body : ?fin:bool -> string -> mime_body
  (** Same as function *)

class wrap_mime_body : #mime_body -> mime_body
  (** Wraps the inner body *)

class wrap_mime_body_ro : #mime_body_ro -> mime_body
  (** Wraps the inner body but disallows modifications. In this case,
      [Immutable] is raised.
   *)

val wrap_mime_body_ro : #mime_body_ro -> mime_body
  (** Same as function *)

val wrap_complex_mime_message_ro : complex_mime_message_ro -> 
                                   complex_mime_message
