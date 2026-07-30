CLASS zcl_caseta DEFINITION
  PUBLIC
  INHERITING FROM zcl_atraccion_05
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS: pedir_rebujito.

  PROTECTED SECTION .
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_caseta IMPLEMENTATION.
METHOD pedir_rebujito.
"out->write = ( 'Rebujito servido' ).
ENDMETHOD.
ENDCLASS.
