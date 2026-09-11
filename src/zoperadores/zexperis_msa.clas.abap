CLASS zexperis_msa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.
CLASS zexperis_msa IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA(lv_nombre) = 'Monitor'.
    DATA(lv_precio) = '249.00'.
    DATA(lv_unidades) = '6'.
    DATA(lv_total) = 249 * 6.

    out->write( | Nombre: { lv_nombre } Precio: { lv_precio }€ Unidades: { lv_unidades } Precio Total: { lv_total }€ | ).
**********************************************************************************************************************
    DATA(lv_coste) = 35.
    DATA(lv_entradas) = 4.
    FINAL(lv_total1) = lv_coste * lv_entradas.

    out->write( |Precio entrada: { lv_coste }€ - Número de entradas: { lv_entradas } - TOTAL: { lv_total1 }€ | ).

*********************************************************************************************************************
    TYPES: BEGIN OF ty_value,
             title    TYPE string,
             platform TYPE string,
             cost     TYPE decfloat34,
             stock    TYPE abap_bool,
           END OF ty_value.

    TYPES tt_value TYPE STANDARD TABLE OF ty_value WITH EMPTY KEY.

    DATA(lt_values) = VALUE tt_value(
    ( title = 'MNCRFT' platform = 'Station' cost = '29.90' stock = abap_true )
    ( title = 'AFC' platform = 'PSP' cost = '52.20' stock = abap_false )
    ( title = 'NFSMW' platform = 'NIN2' cost = '56.60' stock = abap_true )
    ).
    out->write( '------------VALUES-------------' ).
    out->write( lt_values ).
*// STRUCTURE:
    TYPES: BEGIN OF ty_position,
             order_id  TYPE i,
             client    TYPE string,
             city_from TYPE string,
             prime     TYPE abap_bool,
           END OF ty_position.

    TYPES lt_positions TYPE STANDARD TABLE OF ty_position WITH EMPTY KEY.

    TYPES: BEGIN OF ty_order,
             product       TYPE string,
             stock         TYPE i,
             unitary_price TYPE decfloat34,
             pattern       TYPE abap_bool,
             position      TYPE lt_positions,
           END OF ty_order.

    TYPES lt_orders TYPE TABLE OF ty_order.

    DATA lt_orders TYPE lt_orders.

    lt_orders = VALUE #(
      ( product = 'Monitor'
        stock = 6
        unitary_price = '249.90'
        pattern = abap_true
        position = VALUE #(
          ( order_id = 1001 client = 'Cliente A' city_from = 'Madrid'  prime = abap_true )
          ( order_id = 1002 client = 'Cliente B' city_from = 'Barcelona' prime = abap_false )
        )
      )

      ( product = 'Teclado'
        stock = 15
        unitary_price = '49.90'
        pattern = abap_false
        position = VALUE #(
          ( order_id = 2001 client = 'Cliente C' city_from = 'Valencia' prime = abap_true )
          ( order_id = 2002 client = 'Cliente D' city_from = 'Sevilla'  prime = abap_false )
        )
      )

      ( product = 'Ratón'
        stock = 20
        unitary_price = '29.90'
        pattern = abap_true
        position = VALUE #(
          ( order_id = 3001 client = 'Cliente E' city_from = 'Bilbao' prime = abap_true )
          ( order_id = 3002 client = 'Cliente F' city_from = 'Málaga' prime = abap_true )
        )
      )

      ( product = 'Auriculares'
        stock = 10
        unitary_price = '79.90'
        pattern = abap_false
        position = VALUE #(
          ( order_id = 4001 client = 'Cliente G' city_from = 'Zaragoza' prime = abap_false )
          ( order_id = 4002 client = 'Cliente H' city_from = 'Alicante' prime = abap_true )
        )
      )
    ).
    out->write( '----------------------------------------------ORDERS----------------------------------------------' ).
    out->write( lt_orders ).

    TYPES: BEGIN OF ty_carrier,
             id_fl      TYPE string,
             airport    TYPE string,
             city_from  TYPE string,
             city_to    TYPE string,
             is_delayed TYPE abap_bool,
           END OF ty_carrier.

    TYPES lt_carrier TYPE STANDARD TABLE OF ty_carrier WITH EMPTY KEY.


    TYPES: BEGIN OF ty_operators,
             name      TYPE string,
             id_fis    TYPE i,
             country   TYPE string,
             is_active TYPE abap_bool,
             carrier   TYPE ty_carrier,
           END OF ty_operators.

    TYPES lt_operators TYPE STANDARD TABLE OF ty_operators.

    DATA lt_operators TYPE lt_operators.

    lt_operators = VALUE #(
      ( name = 'Iberia'
        id_fis = 101
        country = 'España'
        is_active = abap_true
        carrier = VALUE #(
          id_fl = 'IB123'
          airport = 'MAD'
          city_from = 'Madrid'
          city_to = 'Roma'
          is_delayed = abap_false
        )
      )

      ( name = 'Lufthansa'
        id_fis = 102
        country = 'Alemania'
        is_active = abap_true
        carrier = VALUE #(
          id_fl = 'LH456'
          airport = 'FRA'
          city_from = 'Frankfurt'
          city_to = 'París'
          is_delayed = abap_true
        )
      )

      ( name = 'Air France'
        id_fis = 103
        country = 'Francia'
        is_active = abap_true
        carrier = VALUE #(
          id_fl = 'AF789'
          airport = 'CDG'
          city_from = 'París'
          city_to = 'Madrid'
          is_delayed = abap_false
        )
      )

      ( name = 'TAP'
        id_fis = 104
        country = 'Portugal'
        is_active = abap_false
        carrier = VALUE #(
          id_fl = 'TP321'
          airport = 'LIS'
          city_from = 'Lisboa'
          city_to = 'Londres'
          is_delayed = abap_true
        )
      )
    ).

    out->write( '----------------------------------------OPERATORS-------------------------------------' ).
    out->write( lt_operators ).

*//

    TYPES: BEGIN OF ty_metadata,
             ip_address TYPE string,
             country    TYPE string,
             is_blocked TYPE abap_bool,
           END OF ty_metadata.

    TYPES lt_metadata TYPE STANDARD TABLE OF ty_metadata WITH EMPTY KEY.

    TYPES: BEGIN OF ty_profile,
             name        TYPE string,
             source_code TYPE i,
             id_operator TYPE string,
             metadata    TYPE ty_metadata, "(TY_POSITION)"
           END OF ty_profile.

    TYPES lt_profile TYPE STANDARD TABLE OF ty_profile WITH EMPTY KEY.

    DATA lt_profile TYPE lt_profile.

    lt_profile = VALUE #(
    ( name = 'TEKNOM'
      source_code = 9
      id_operator = 'TCK0001'
          metadata = VALUE #(
              ip_address = '192.168.00.1'
              country = 'Norway'
              is_blocked = abap_false
              )
          )
     ).

    TYPES: BEGIN OF ty_order1,
             product TYPE string,
             stock   TYPE i,
             m_cost  TYPE decfloat34,
           END OF ty_order1.

    TYPES: lt_orders1 TYPE STANDARD TABLE OF ty_order1 WITH EMPTY KEY.

    TYPES: BEGIN OF ty_acquisition,
             id_order  TYPE i,
             client    TYPE string,
             city_from TYPE string,
             express   TYPE abap_bool,
             order_inf TYPE ty_order1,
           END OF ty_acquisition.

    TYPES: lt_acquisitions TYPE STANDARD TABLE OF ty_acquisition WITH EMPTY KEY.

    DATA lt_acquisitions TYPE lt_acquisitions.

    lt_acquisitions = VALUE #(
     (
       id_order = 1
       client = 'Juan'
       city_from = 'Madrid'
       express = abap_true
       order_inf = VALUE #(
         product = 'Laptop'
         stock = 10
         m_cost = '1299.99'
       )
     )
     (
       id_order = 2
       client = 'Ana'
       city_from = 'Barcelona'
       express = abap_false
       order_inf = VALUE #(
         product = 'Monitor'
         stock = 5
         m_cost = '299.50'
       )
     )
   ).

***************************************************** | DATA GENERATOR | ***********************************************************

DATA(lv_estado) = 'E'.

DATA(lv_descripcion) = SWITCH string(
lv_estado
WHEN 'E' THEN 'Enviado'
WHEN 'P' THEN 'Pendiente'
WHEN 'R' THEN 'Recibido'
WHEN 'C' THEN 'Cancelado'
ELSE 'Estado Desconocido'
).
out->write( | Estado: { lv_estado } - Descripción: { lv_descripcion } | ).
  ENDMETHOD.
ENDCLASS.

