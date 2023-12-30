CLASS ltc_bapi_protocol DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA success_protocol TYPE bapirettab.
    CLASS-DATA error_protocol TYPE bapirettab.
    CLASS-DATA warning_protocol TYPE bapirettab.
    CLASS-DATA abort_protocol TYPE bapirettab.
    CLASS-DATA mixed_protocol TYPE bapirettab.

    DATA cut TYPE REF TO zif_bapi_protocol_reader.

    CLASS-METHODS class_setup.

    METHODS contains_errors FOR TESTING RAISING zcx_bapi_protocol.

    METHODS contains_problems FOR TESTING RAISING zcx_bapi_protocol.

    METHODS contains_aborts FOR TESTING RAISING zcx_bapi_protocol.

    METHODS contains_warnings FOR TESTING RAISING zcx_bapi_protocol.

ENDCLASS.

CLASS ltc_bapi_protocol IMPLEMENTATION.

  METHOD contains_errors.
    cut = zcl_bapi_protocol=>create_for_read( mixed_protocol ).
    DATA(result) = cut->contains_errors( ).
    cl_abap_unit_assert=>assert_true( result ).
  ENDMETHOD.

  METHOD class_setup.
    success_protocol = VALUE #( ( type = 'S' id = 'SY' number = '499' ) ).
    error_protocol = VALUE #( ( type = 'E' id = 'SY' number = '499' ) ).
    abort_protocol = VALUE #( ( type = 'A' id = 'SY' number = '499' ) ).
    warning_protocol = VALUE #( ( type = 'W' id = 'SY' number = '499' ) ).

    APPEND LINES OF success_protocol TO mixed_protocol.
    APPEND LINES OF error_protocol TO mixed_protocol.
    APPEND LINES OF abort_protocol TO mixed_protocol.
    APPEND LINES OF warning_protocol TO mixed_protocol.
  ENDMETHOD.

  METHOD contains_problems.
    cut = zcl_bapi_protocol=>create_for_read( mixed_protocol ).
    DATA(result) = cut->contains_problems( ).
    cl_abap_unit_assert=>assert_true( result ).
  ENDMETHOD.

  METHOD contains_aborts.
    cut = zcl_bapi_protocol=>create_for_read( mixed_protocol ).
    DATA(result) = cut->contains_aborts( ).
    cl_abap_unit_assert=>assert_true( result ).
  ENDMETHOD.

  METHOD contains_warnings.
    cut = zcl_bapi_protocol=>create_for_read( mixed_protocol ).
    DATA(result) = cut->contains_warnings( ).
    cl_abap_unit_assert=>assert_true( result ).
  ENDMETHOD.

ENDCLASS.
