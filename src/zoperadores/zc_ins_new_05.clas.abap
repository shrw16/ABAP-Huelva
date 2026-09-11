CLASS zc_ins_new_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zc_ins_new_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*// DECLARACIÓN INLINE

    DATA(lv_precio) = 35.
    DATA(lv_entradas) = 4.

    FINAL(lv_total) = ( lv_precio * lv_entradas ).

    out->write( |Precio de una entrada: { lv_precio } €| ).
    out->write( |Número de entradas: { lv_entradas }| ).
    out->write( |Importe total: { lv_total } €| ).



************************************************************************************
*// VALUE SIMPLE:


    TYPES: BEGIN OF ty_videojuego,
             titulo     TYPE string,
             plataforma TYPE string,
             precio     TYPE decfloat34,
           END OF ty_videojuego.

    TYPES tt_videojuegos TYPE TABLE OF ty_videojuego.

    DATA lt_videojuegos TYPE tt_videojuegos.

    lt_videojuegos = VALUE #(
  ( titulo = 'Minecraft' plataforma = 'PC'     precio = 30 )
  ( titulo = 'Zelda'     plataforma = 'Switch' precio = 60 )
  ( titulo = 'FIFA'      plataforma = 'PS5'    precio = 70 )
).

    out->write( lt_videojuegos ).



**************************************************************************************
*// VALUE ANIDADO:


    TYPES: BEGIN OF ty_posicion,
             producto        TYPE string,
             cantidad        TYPE i,
             precio_unitario TYPE decfloat34,
           END OF ty_posicion.

    TYPES lt_posiciones TYPE TABLE OF ty_posicion WITH EMPTY KEY.

    TYPES: BEGIN OF ty_pedido,
             id_pedido  TYPE i,
             cliente    TYPE string,
             ciudad     TYPE string,
             urgente    TYPE abap_bool,
             posiciones TYPE lt_posiciones,
           END OF ty_pedido.

    TYPES lt_pedidos TYPE TABLE OF ty_pedido.

    DATA lt_pedidos TYPE lt_pedidos.
    lt_pedidos = VALUE #(

      ( id_pedido = 1001
        cliente   = 'Empresa Norte'
        ciudad    = 'Sevilla'
        urgente   = abap_true
        posiciones = VALUE #(
          ( producto = 'Portátil' cantidad = 2 precio_unitario = '850.00' )
          ( producto = 'Ratón' cantidad = 5 precio_unitario = '25.00' )
          ( producto = 'Monitor' cantidad = 2 precio_unitario = '220.00' )
        )
      )
      ( id_pedido = 1002
        cliente   = 'Tecnología Sur'
        ciudad    = 'Cádiz'
        urgente   = abap_false
        posiciones = VALUE #(
          ( producto = 'Teclado' cantidad = 10 precio_unitario = '45.00' )
          ( producto = 'Webcam' cantidad = 4 precio_unitario = '75.00' )
        )
      )
      ( id_pedido = 1003
        cliente   = 'Formación Digital'
        ciudad    = 'Huelva'
        urgente   = abap_true
        posiciones = VALUE #(
          ( producto = 'Tablet' cantidad = 6 precio_unitario = '320.00' )
          ( producto = 'Auriculares' cantidad = 8 precio_unitario = '60.00' )
          ( producto = 'Adaptador USB-C' cantidad = 15 precio_unitario = '20.00' )
        )
      )
    ).

    out->write( lt_pedidos ).



***********************************************************************************************
*// OPERADOR CONDICIONAL COND:


    DATA(lv_importe) = 750.

    DATA(lv_descuento) = COND #(
      WHEN lv_importe >= 1000 THEN 20
      WHEN lv_importe >= 500  THEN 10
      WHEN lv_importe >= 200  THEN 5
      ELSE 0
    ).

    DATA(lv_cantidad_descontada) = ( lv_importe * lv_descuento / 100 ).

    DATA(lv_importe_final) = ( lv_importe - lv_cantidad_descontada ).

    out->write( |Importe original: { lv_importe } €| ).
    out->write( |Porcentaje de descuento: { lv_descuento } %| ).
    out->write( |Descuento: { lv_cantidad_descontada } €| ).
    out->write( |Importe final: { lv_importe_final } €| ).




*******************************************************************************************
*// OPERADOR SWITCH:



    DATA(lv_estado) = 'E'.

    DATA(lv_descripcion) = SWITCH string(
      lv_estado
      WHEN 'P' THEN 'Pendiente'
      WHEN 'E' THEN 'Enviado'
      WHEN 'R' THEN 'Recibido'
      WHEN 'C' THEN 'Cancelado'
      ELSE
      'Estado desconocido'
    ).

    DATA(lv_prioridad) = SWITCH #(
      lv_descripcion
      WHEN 'P' THEN 1
      WHEN 'E' THEN 2
      WHEN 'R' THEN 3
      WHEN 'C' THEN 4
      ELSE 0
    ).

    out->write( |Código del estado: { lv_estado }| ).
    out->write( |Descripción del estado: { lv_descripcion }| ).
    out->write( |Prioridad: { lv_prioridad }| ).

ENDMETHOD.
ENDCLASS.

