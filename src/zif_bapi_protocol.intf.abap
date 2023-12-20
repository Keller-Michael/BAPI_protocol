INTERFACE zif_bapi_protocol PUBLIC.

  CONSTANTS: BEGIN OF messages_types,
               success TYPE bapi_mtype VALUE 'S',
               info    TYPE bapi_mtype VALUE 'I',
               warning TYPE bapi_mtype VALUE 'W',
               error   TYPE bapi_mtype VALUE 'E',
               abort   TYPE bapi_mtype VALUE 'A',
             END OF messages_types.

  INTERFACES zif_bapi_protocol_reader.
  INTERFACES zif_bapi_protocol_writer.

  ALIASES clear_entries FOR zif_bapi_protocol_writer~clear_entries.
  ALIASES append_entry FOR zif_bapi_protocol_writer~append_entry.
  ALIASES append_entries FOR zif_bapi_protocol_writer~append_entries.

  ALIASES get_identifier FOR zif_bapi_protocol_reader~get_identifier.
  ALIASES get_timestamp FOR zif_bapi_protocol_reader~get_timestamp.
  ALIASES contains_errors FOR zif_bapi_protocol_reader~contains_errors.
  ALIASES contains_warnings FOR zif_bapi_protocol_reader~contains_warnings.
  ALIASES contains_aborts FOR zif_bapi_protocol_reader~contains_aborts.
  ALIASES contains_problems FOR zif_bapi_protocol_reader~contains_problems.
  ALIASES get_entries FOR zif_bapi_protocol_reader~get_entries.
  ALIASES get_entries_by_message_type FOR zif_bapi_protocol_reader~get_entries_by_message_type.
  ALIASES count_entries FOR zif_bapi_protocol_reader~count_entries.

ENDINTERFACE.
