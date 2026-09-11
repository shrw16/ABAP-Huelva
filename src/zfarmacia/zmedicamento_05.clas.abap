CLASS zmedicamento_05 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

DATA: id TYPE i,
      nombre TYPE string,
      laboratorio TYPE string,
      precio TYPE zdecimals2,
      stock TYPE i,
      requiere_receta TYPE abap_bool,
      principio_activo TYPE string.

METHODS: constructor
     IMPORTING
     iv_id TYPE i
     iv_nombre TYPE string
     iv_laboratorio TYPE string
     iv_precio TYPE zdecimals2
     iv_stock TYPE i
     iv_requiere_receta TYPE abap_bool
     iv_principio_activo TYPE string.

     METHODS: calcular_precio_final
     RETURNING VALUE(rv_precio_original) TYPE zdecimals2.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.
CLASS zmedicamento_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.
  METHOD calcular_precio_final.
        rv_precio_original = precio.
  ENDMETHOD.

  METHOD constructor.
  id = iv_id.
  nombre = iv_nombre.
  laboratorio = iv_laboratorio.
  precio = iv_precio.
  stock = iv_stock.
  requiere_receta = iv_requiere_receta.
  principio_activo = iv_principio_activo.

  ENDMETHOD.

ENDCLASS.
