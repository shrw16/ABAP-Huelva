CLASS zcl_med_marca_05 DEFINITION
  PUBLIC
  INHERITING FROM zmedicamento_05
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA: nombre_comercial TYPE string,
        recargo_marca TYPE i.

  METHODS: constructor

      IMPORTING
        iv_id                  TYPE i
        iv_nombre              TYPE string
        iv_laboratorio         TYPE string
        iv_precio              TYPE zdecimals2
        iv_stock               TYPE i
        iv_requiere_receta     TYPE abap_bool
        iv_principio_activo    TYPE string
        iv_porcentaje_descuento TYPE i
        iv_nombre_comercial TYPE string
        iv_recargo_marca    TYPE i.

 METHODS: calcular_precio_final REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_med_marca_05 IMPLEMENTATION.

METHOD constructor.

super->constructor(

      iv_id               = iv_id
      iv_nombre           = iv_nombre
      iv_laboratorio      = iv_laboratorio
      iv_precio           = iv_precio
      iv_stock            = iv_stock
      iv_requiere_receta  = iv_requiere_receta
      iv_principio_activo = iv_principio_activo
      ).

      nombre_comercial = iv_nombre_comercial.
      recargo_marca = iv_recargo_marca.
ENDMETHOD.

METHOD calcular_precio_final.
rv_precio_original = precio + ( precio * recargo_marca / 100 ).
ENDMETHOD.

ENDCLASS.
