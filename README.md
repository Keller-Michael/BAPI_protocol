# 🚦 BAPI Protocol

A simple BAPI protocol class based on BAPIRET2 table. The basic idea is to escape the "primitive obsession" because most of the time people are just using a BAPIRET2 table instead of an object to work with BAPI messages.

## Basics

Class ZCL_BAPI_PROTOCOL implements two interfaces called ZIF_BAPI_PROTOCOL_WRITER and ZIF_BAPI_PROTOCOL_READER.

## Examples

### Example for read access

```abap
TRY.
    DATA(protocol_entries) = VALUE bapirettab( ( type = 'S' id = 'SY' number = '499' message_v1 = 'Hi Community.' )
                                               ( type = 'E' id = 'SY' number = '499' message_v1 = 'Oh no, problem!' ) ).

    DATA(protocol) = zcl_bapi_protocol=>create_for_read( protocol_entries ).

    DATA(contains_problems) = protocol->contains_problems( ).
  CATCH zcx_bapi_protocol INTO DATA(protocol_exception).
ENDTRY.
```

### Example for read/write access
```abap
TRY.
    DATA(protocol_entries) = VALUE bapirettab( ( type = 'S' id = 'SY' number = '499' message_v1 = 'Hi Community.' )
                                               ( type = 'E' id = 'SY' number = '499' message_v1 = 'Oh no, problem!' ) ).

    DATA(protocol) = zcl_bapi_protocol=>create_for_read_write( protocol_entries ).

    DATA(protocol_entry) = VALUE bapiret2( type = 'S' id = 'SY' number = '499' message_v1 = 'Problem solved.' ).

    protocol->append_entry( protocol_entry ).

  CATCH zcx_bapi_protocol INTO DATA(protocol_exception).
ENDTRY.
```
