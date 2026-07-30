CLASS zexperis_msa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zexperis_msa IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  out->write(  'Hola mundo' ).

  ENDMETHOD.

ENDCLASS.
