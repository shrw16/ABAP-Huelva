CLASS zplantas_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS:
  constructor
      IMPORTING iv_nombre TYPE string
                iv_stock TYPE i
                iv_riego TYPE i,

    vender
      IMPORTING iv_cantidad TYPE i
      RAISING zcx_invalid_carrefour,

    regar IMPORTING iv_cantidad TYPE i
      RAISING zcx_invalid_carrefour.

    INTERFACES if_oo_adt_classrun_out .
  PROTECTED SECTION.

 PRIVATE SECTION.

  DATA:
  lv_nombre TYPE string,
  lv_stock TYPE i,
  lv_riego TYPE i.

ENDCLASS.

CLASS zplantas_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun_out~get.
  ENDMETHOD.

  METHOD if_oo_adt_classrun_out~write.
  ENDMETHOD.

  METHOD constructor.

    lv_nombre = iv_nombre.
    lv_stock  = iv_stock.
    lv_riego  = iv_riego.

  ENDMETHOD.


    METHOD vender.

    IF iv_cantidad > lv_stock.

      RAISE EXCEPTION TYPE zcx_invalid_carrefour
        EXPORTING textid = zcx_invalid_carrefour=>stock_insuficiente.
    ENDIF.

    IF lv_riego < 20.

      RAISE EXCEPTION TYPE zcx_invalid_carrefour
        EXPORTING textid = zcx_invalid_carrefour=>riego_insuficiente.
    ENDIF.

    lv_stock = lv_stock - iv_cantidad.
  ENDMETHOD.


    METHOD regar.

    lv_riego = lv_riego + iv_cantidad.

    IF lv_riego > 100.
       lv_riego = 100.
    ENDIF.

  ENDMETHOD.

ENDCLASS.


