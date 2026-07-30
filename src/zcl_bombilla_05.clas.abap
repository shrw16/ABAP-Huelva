CLASS zcl_bombilla_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    DATA esta_encendida TYPE abap_bool.
    METHODS encender.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_bombilla_05 IMPLEMENTATION.

  METHOD encender.
  esta_encendida = abap_true.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

  "DECLARACIÓN + CONSTRUCTOR  (FORMA ANTIGUA)
*  DATA lo_bombilla TYPE REF TO zcl_bombilla_05.
*  CREATE OBJECT lo_bombilla.

  DATA(lo_bombilla_1) = NEW zcl_bombilla_05( ).
  DATA(lo_bombilla_2) = NEW zcl_bombilla_05( ). "(FORMA MODERNA)

  "LLAMA AL MÉTODO A ENCENDER:
  lo_bombilla_2->encender( ).

 out->write( lo_bombilla_1->esta_encendida ).
 out->write( lo_bombilla_2->esta_encendida ).

ENDMETHOD.
ENDCLASS.
