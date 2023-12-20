CLASS zcl_bapi_protocol DEFINITION PUBLIC FINAL CREATE PRIVATE.

  PUBLIC SECTION.
    INTERFACES zif_bapi_protocol.

    ALIASES messages_types FOR zif_bapi_protocol~messages_types.

    ALIASES contains_errors FOR zif_bapi_protocol_reader~contains_errors.
    ALIASES contains_aborts FOR zif_bapi_protocol_reader~contains_aborts.

    CLASS-METHODS create_for_read_write
      IMPORTING
        identifier    TYPE string OPTIONAL
        protocol      TYPE any
      RETURNING
        VALUE(result) TYPE REF TO zif_bapi_protocol
      RAISING
        zcx_bapi_protocol.

    CLASS-METHODS create_for_read
      IMPORTING
        identifier    TYPE string OPTIONAL
        protocol      TYPE any
      RETURNING
        VALUE(result) TYPE REF TO zif_bapi_protocol_reader
      RAISING
        zcx_bapi_protocol.

    METHODS constructor
      IMPORTING
        identifier TYPE string OPTIONAL
        protocol   TYPE any
      RAISING
        zcx_bapi_protocol.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA identifier TYPE string.
    DATA timestamp TYPE timestampl.
    DATA protocol TYPE bapirettab.

    METHODS set_protocol_via_rtti
      IMPORTING
        protocol TYPE any
      RAISING
        zcx_bapi_protocol.

ENDCLASS.



CLASS zcl_bapi_protocol IMPLEMENTATION.

  METHOD constructor.
    me->identifier = identifier.
    set_protocol_via_rtti( protocol ).
    GET TIME STAMP FIELD timestamp.
  ENDMETHOD.

  METHOD create_for_read_write.
    result = NEW zcl_bapi_protocol( identifier = identifier
                                    protocol   = protocol ).
  ENDMETHOD.

  METHOD zif_bapi_protocol_reader~contains_errors.
    result = xsdbool( line_exists( protocol[ type = messages_types-error ] ) ).
  ENDMETHOD.

  METHOD zif_bapi_protocol_reader~contains_warnings.
    result = xsdbool( line_exists( protocol[ type = messages_types-warning ] ) ).
  ENDMETHOD.

  METHOD zif_bapi_protocol_reader~get_entries.
    result = protocol.
  ENDMETHOD.

  METHOD zif_bapi_protocol_reader~contains_aborts.
    result = xsdbool( line_exists( protocol[ type = messages_types-abort ] ) ).
  ENDMETHOD.

  METHOD zif_bapi_protocol_reader~count_entries.
    result = lines( protocol ).
  ENDMETHOD.

  METHOD zif_bapi_protocol_reader~get_entries_by_message_type.
    LOOP AT protocol INTO DATA(line) WHERE type = message_type.
      APPEND line TO result.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_bapi_protocol_reader~contains_problems.
    IF contains_errors( ).
      result = abap_true.
    ELSEIF contains_aborts( ).
      result = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD zif_bapi_protocol_reader~get_identifier.
    result = identifier.
  ENDMETHOD.

  METHOD zif_bapi_protocol_reader~get_timestamp.
    result = timestamp.
  ENDMETHOD.

  METHOD zif_bapi_protocol_writer~append_entries.
    APPEND LINES OF entries TO me->protocol.
  ENDMETHOD.

  METHOD zif_bapi_protocol_writer~clear_entries.
    CLEAR protocol.
  ENDMETHOD.

  METHOD create_for_read.
    result = NEW zcl_bapi_protocol( identifier = identifier
                                    protocol   = protocol ).
  ENDMETHOD.

  METHOD zif_bapi_protocol_writer~append_entry.
    APPEND line TO protocol.
  ENDMETHOD.

  METHOD set_protocol_via_rtti.
    DATA(type_description) = cl_abap_typedescr=>describe_by_data( protocol ).

    CASE type_description->get_relative_name( ).
      WHEN 'BAPIRETTAB'.
        me->protocol = protocol.

      WHEN 'BAPIRET2'.
        me->protocol = VALUE bapirettab( ( protocol ) ).

      WHEN OTHERS.
        RAISE EXCEPTION NEW zcx_bapi_protocol( ).
    ENDCASE.
  ENDMETHOD.

ENDCLASS.
