CLASS zcx_bapi_protocol DEFINITION INHERITING FROM cx_static_check PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_t100_dyn_msg.

    METHODS constructor
      IMPORTING
        textid   LIKE if_t100_message=>t100key OPTIONAL
        previous LIKE previous OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcx_bapi_protocol IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
  ENDMETHOD.

ENDCLASS.
