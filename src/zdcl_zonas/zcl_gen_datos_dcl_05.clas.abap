CLASS zcl_gen_datos_dcl_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_gen_datos_dcl_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA lt_pedidos TYPE TABLE OF ztpedido_dcl_05 WITH EMPTY KEY.

  lt_pedidos = VALUE #(

      ( pedido_id   = 'P001'
        descripcion = 'Ordenadores'
        zona        = 'SUR' )

      ( pedido_id   = 'P002'
        descripcion = 'Monitores'
        zona        = 'NOR' )

      ( pedido_id   = 'P003'
        descripcion = 'Teclados'
        zona        = 'SUR' )

      ( pedido_id   = 'P004'
        descripcion = 'Servidores'
        zona        = 'CEN' )

      ( pedido_id   = 'P005'
        descripcion = 'Ratones'
        zona        = 'NOR' )

    ).

    INSERT ztpedido_dcl_05 FROM TABLE @lt_pedidos.

    IF sy-subrc = 0.
      out->write( 'Datos insertados correctamente.' ).
    ELSE.
      out->write( 'Error.' ).
    ENDIF.

ENDMETHOD.
ENDCLASS.
