# 🚦 BAPI Protocol

A simple BAPI protocol class based on BAPIRET2 table. I developed the class because most of the time people are just using a BAPIRET2 table instead of an object to work with BAPI messages. That's a little bit like a "primitive obsession" on BAPIRET2 table :wink:. 

## Basics

Class [ZCL_BAPI_PROTOCOL](src/zcl_bapi_protocol.clas.abap) implements two interfaces called [ZIF_BAPI_PROTOCOL_READER](src/zif_bapi_protocol_reader.intf.abap) and [ZIF_BAPI_PROTOCOL_WRITER](src/zif_bapi_protocol_writer.intf.abap). The interfaces allow to deal with the protocol from two perspectives: One perspective is for those who only wants to read the protocol after creation and the other one is for those who want to change the protocol after creation. Please note that because the class implements both interfaces you can switch the perspective at anytime.

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

## Notice

By using a more detailed data structure for protocol entries (therefore not BAPIRET2) you can easily enhance the protocol with more details like time stamp and much more. So maybe the class is a good entry point to build a protocol with a much wider scope than for BAPI messages.
