CLASS zcl_test_carrefour_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_test_carrefour_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*  // PRIMERA VENTA:

  DATA lo_planta TYPE REF TO ZPLANTAS_05.

    lo_planta = NEW zplantas_05( iv_nombre = 'Margarita' iv_stock = 10 iv_riego = 80 ).

    TRY.
        lo_planta->vender( 3 ).
        MESSAGE ID 'ZMSG_CARREFOUR'
              TYPE 'I'
              NUMBER '003'
              INTO DATA(lv_msg).

      out->write( lv_msg ).

    CATCH zcx_invalid_carrefour INTO DATA(lx_error).

      out->write( lx_error->get_text( ) ).

  ENDTRY.

*  // STOCK INSUFICIENTE

  lo_planta = NEW zplantas_05( iv_nombre = 'Tulipan' iv_stock = 2 iv_riego = 80 ).

  TRY.

      lo_planta->vender( 5 ).

      MESSAGE ID 'ZMSG_CARREFOUR'
              TYPE 'I'
              NUMBER '003'
              INTO DATA(lv_msg2).

      out->write( lv_msg2 ).

    CATCH zcx_invalid_carrefour INTO DATA(lx_error2).

      out->write( lx_error2->get_text( ) ).

  ENDTRY.

*  // RIEGO INSUFICIENTE:

  lo_planta = NEW zplantas_05( iv_nombre = 'Orquídea' iv_stock = 10 iv_riego = 10 ).

  TRY.

      lo_planta->vender( 2 ).

      MESSAGE ID 'ZMSG_CARREFOUR'
              TYPE 'I'
              NUMBER '003'
              INTO DATA(lv_msg3).

      out->write( lv_msg3 ).

    CATCH zcx_invalid_carrefour INTO DATA(lx_error3).

      out->write( lx_error3->get_text( ) ).

  ENDTRY.

*  // RIEGO REALIZADO:

  lo_planta = NEW zplantas_05( iv_nombre = 'Rosas' iv_stock = 10 iv_riego = 10 ).

  TRY.
      lo_planta->regar( 30 ).

  MESSAGE ID 'ZMSG_CARREFOUR'
          TYPE 'I'
          NUMBER '004'
          INTO DATA(lv_msg4).

  out->write( lv_msg4 ).

    CATCH zcx_invalid_carrefour.

ENDTRY.

  ENDMETHOD.
ENDCLASS.
