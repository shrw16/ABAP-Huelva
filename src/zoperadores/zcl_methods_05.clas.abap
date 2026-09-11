CLASS zcl_methods_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA: resultado TYPE i.

  METHODS:
  sumar IMPORTING i_num1 type i
                  i_num2 type i,

  mostrar_resultado_e EXPORTING o_resultado type i,
  mostrar_resultado_r RETURNING VALUE(rv_resultado) TYPE i.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_methods_05 IMPLEMENTATION.

METHOD sumar.
resultado = i_num1 + i_num2.
ENDMETHOD.

METHOD mostrar_resultado_e.
ENDMETHOD.

METHOD mostrar_resultado_r.
ENDMETHOD.

METHOD if_oo_adt_classrun~main.
ENDMETHOD.
ENDCLASS.
