CLASS zcl_med_generico_05 DEFINITION
  PUBLIC
  INHERITING FROM zmedicamento_05
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA: porcentaje_descuento TYPE i.

  METHODS constructor
      IMPORTING
        iv_id                  TYPE i
        iv_nombre              TYPE string
        iv_laboratorio         TYPE string
        iv_precio              TYPE zdecimals2
        iv_stock               TYPE i
        iv_requiere_receta     TYPE abap_bool
        iv_principio_activo    TYPE string
        iv_porcentaje_descuento TYPE i.

  METHODS calcular_precio_final REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_med_generico_05 IMPLEMENTATION.

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

      porcentaje_descuento = iv_porcentaje_descuento.

ENDMETHOD.

METHOD calcular_precio_final.
       rv_precio_original = precio - ( precio * porcentaje_descuento / 100 ).
ENDMETHOD.
ENDCLASS.
