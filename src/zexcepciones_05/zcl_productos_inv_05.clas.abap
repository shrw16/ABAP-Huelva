CLASS zcl_productos_inv_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_productos_inv_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA: lv_nombre TYPE string VALUE '',
        lv_precio TYPE p DECIMALS 2 VALUE '-10.00',
        lv_stock  TYPE i VALUE 0.


TRY.

*//  " Caso 1: nombre vacío
  IF lv_nombre IS INITIAL.

  RAISE EXCEPTION TYPE zcx_producto_invalido_05
    MESSAGE ID 'ZMSG_PR0DUCTO_05'
    TYPE 'I'
    NUMBER '001'.

  ENDIF.

   CATCH zcx_producto_invalido_05 INTO DATA(lx_error).

      out->write( lx_error->get_text( ) ).

      ENDTRY.

*//   " Caso 2: precio negativo
  TRY.

  IF lv_precio < 0.
  RAISE EXCEPTION TYPE zcx_producto_invalido_05
    MESSAGE ID 'ZMSG_PR0DUCTO_05'
    TYPE 'I'
    NUMBER '002'.
  ENDIF.

  CATCH zcx_producto_invalido_05 INTO lx_error.

      out->write( lx_error->get_text( ) ).
  ENDTRY.

*//  " Caso 3: sin stock

  lv_precio = 500.
  lv_stock = 0.

  TRY.

  IF lv_stock = 0.
  RAISE EXCEPTION TYPE zcx_producto_invalido_05
  MESSAGE ID 'ZMSG_PR0DUCTO_05'
  TYPE 'I'
  NUMBER '003'.
  ENDIF.

  CATCH zcx_producto_invalido_05 INTO lx_error.
      out->write( lx_error->get_text( ) ).
  ENDTRY.


*//  "Caso 4: todo correcto (forzad valores válidos para ver este también)

  lv_precio = 500.
  lv_stock = 10.

  IF lv_nombre IS NOT INITIAL
    AND lv_precio >= 0
    AND lv_stock > 0.


  MESSAGE ID 'ZMSG_PR0DUCTO_05'
  TYPE 'I' NUMBER '004'
  INTO DATA(lv_msg4).

  out->write( lv_msg4 ).

  ENDIF.

*// Caso 5: Producto creado correctamente





  ENDMETHOD.
ENDCLASS.
