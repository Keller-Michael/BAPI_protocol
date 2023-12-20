INTERFACE zif_bapi_protocol_reader PUBLIC.

  METHODS get_identifier RETURNING VALUE(result) TYPE string.

  METHODS get_timestamp RETURNING VALUE(result) TYPE timestampl.

  METHODS contains_errors RETURNING VALUE(result) TYPE abap_bool.

  METHODS contains_warnings RETURNING VALUE(result) TYPE abap_bool.

  METHODS contains_aborts RETURNING VALUE(result) TYPE abap_bool.

  METHODS contains_problems RETURNING VALUE(result) TYPE abap_bool.

  METHODS get_entries RETURNING VALUE(result) TYPE bapirettab.

  METHODS get_entries_by_message_type
    IMPORTING
      message_type  TYPE bapi_mtype
    RETURNING
      VALUE(result) TYPE bapirettab.

  METHODS count_entries RETURNING VALUE(result) TYPE i.

ENDINTERFACE.
