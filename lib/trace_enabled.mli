(* Copyright (C) 2014, Thomas Leonard *)

(** The extended profiling interface available when compiled with tracing enabled. *)

include (module type of Trace_stubs)

open Bigarray
type log_buffer = (char, int8_unsigned_elt, c_layout) Array1.t

type timestamper = log_buffer -> int -> unit

module Control : sig
  type t

  val make : log_buffer -> timestamper -> t
  (** Create a new trace log, backed by the given array.
   * Use [MProf_unix] or [MProf_xen] to get the buffer and timestamper. *)

  val start : t -> unit
  (** Start logging to the given buffer. *)

  val stop : t -> unit
  (** Stop recording. *)
end
