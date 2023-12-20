INTERFACE zif_bapi_protocol_writer PUBLIC.

  METHODS clear_entries.

  METHODS append_entries IMPORTING entries TYPE bapirettab.

  METHODS append_entry IMPORTING line TYPE bapiret2.

ENDINTERFACE.
