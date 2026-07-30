CLASS zcl_bombilla_msa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

    DATA: esta_encendida TYPE abap_bool.

    METHODS encender.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_bombilla_msa IMPLEMENTATION.

  METHOD encender.
    esta_encendida = abap_true.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

  ENDMETHOD.

ENDCLASS.
