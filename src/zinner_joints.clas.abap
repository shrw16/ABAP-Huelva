CLASS zinner_joints DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zinner_joints IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*  *1. Define un tipo de salida ty_salida con estos campos:
*   - first_name (de /dmo/customer-first_name)
*   - last_name (de /dmo/customer-last_name)
*   - travel_id (de /dmo/travel-travel_id)
*   - begin_date (de /dmo/travel-begin_date)
*   - total_price (de /dmo/travel-total_price)
*   - currency_code (de /dmo/travel-currency_code)

*    TYPES: BEGIN OF ty_salida,
*             first_name    TYPE /dmo/customer-first_name,
*             last_name     TYPE /dmo/customer-last_name,
*             travel_id     TYPE /dmo/travel-travel_id,
*             begin_date    TYPE /dmo/travel-begin_date,
*             total_price   TYPE /dmo/travel-total_price,
*             currency_code TYPE /dmo/travel-currency_code,
*           END OF ty_salida.
*
*    DATA ls_salida TYPE ty_salida.
*    DATA lt_salida TYPE TABLE OF ty_salida.

*2. Recupera *todos los viajes de /DMO/TRAVEL
*    (campos: customer_id, travel_id, begin_date, total_price, currency_code)
*    en una tabla interna lt_travel.
*
*    SELECT FROM /dmo/travel
*    FIELDS customer_id, travel_id, begin_date, total_price, currency_code
*    INTO TABLE @DATA(lt_travel).

*3. Recupera *todos los clientes de /DMO/CUSTOMER
*    (campos: customer_id, first_name, last_name) en una tabla interna lt_customer.

*    SELECT FROM /dmo/CUSTOMER
*    FIELDS customer_id, first_name, last_name
*    INTO TABLE @DATA(lt_CUSTOMER).

*4. Recorre lt_travel con un LOOP, y por cada viaje busca
*    (READ TABLE ... WITH KEY) el cliente correspondiente en lt_customer
*    usando customer_id.

*    LOOP AT lt_travel INTO DATA(ls_travel).
*      READ TABLE lt_customer INTO DATA(ls_customer)
*          WITH KEY customer_id = ls_travel-customer_id.

*5. Si lo encuentra (sy-subrc = 0), monta la fila de salida
*    y añádela a la tabla final con APPEND.

*      IF sy-subrc = 0.
*        ls_salida-first_name = ls_customer-first_name.
*        ls_salida-last_name = ls_customer-last_name.
*        ls_salida-travel_id = ls_travel-travel_id.
*        ls_salida-begin_date = ls_travel-begin_date.
*        ls_salida-total_price = ls_travel-total_price.
*        ls_salida-currency_code = ls_travel-currency_code.
*
*        MOVE-CORRESPONDING ls_customer TO ls_salida.
*        MOVE-CORRESPONDING ls_travel TO ls_salida.
*        APPEND ls_salida TO lt_salida.
*      ENDIF.
*    ENDLOOP.

*6. Muestra el resultado con out->write( ).
*    out->write( lt_salida ).

************

    " Ahora lo intentamos con JOINS
*
*    SELECT FROM /dmo/travel AS t
*            INNER JOIN /dmo/customer AS c
*        ON c~customer_id = t~customer_id
*        FIELDS  c~first_name,
*                c~last_name,
*                t~travel_id,
*                t~begin_date,
*                t~total_price,
*                t~currency_code
*        INTO TABLE @DATA(lt_salida_2).
*    IF sy-subrc = 0.
*      out->write( lt_salida_2 ).
*    ENDIF.

"/////////////////////////////////////////////////////////////////////////////////////

"1)

TYPES: BEGIN OF ty_salida3,
         carrier_name  TYPE /dmo/carrier-name,
         connection_id TYPE /dmo/flight-connection_id,
         flight_date   TYPE /dmo/flight-flight_date,
         price         TYPE /dmo/flight-price,
         currency_code TYPE /dmo/flight-currency_code,
         plane_type_id TYPE /dmo/flight-plane_type_id,
       END OF ty_salida3.

DATA: ls_salida3 TYPE ty_salida3,
      lt_salida3 TYPE TABLE OF ty_salida3.

SELECT FROM /dmo/carrier
  FIELDS carrier_id, name
  INTO TABLE @DATA(lt_carrier3).

  SELECT FROM /dmo/flight
  FIELDS carrier_id, connection_id, flight_date, price, currency_code, plane_type_id
  WHERE price > 5000
  ORDER BY price DESCENDING
  INTO TABLE @DATA(lt_flight3).

LOOP AT lt_flight3 INTO DATA(ls_flight3).

  READ TABLE lt_carrier3 INTO DATA(ls_carrier3)
       WITH KEY carrier_id = ls_flight3-carrier_id.

  IF sy-subrc = 0.
    ls_salida3-carrier_name  = ls_carrier3-name.
    ls_salida3-connection_id = ls_flight3-connection_id.
    ls_salida3-flight_date   = ls_flight3-flight_date.
    ls_salida3-price         = ls_flight3-price.
    ls_salida3-currency_code = ls_flight3-currency_code.
    ls_salida3-plane_type_id = ls_flight3-plane_type_id.

    APPEND ls_salida3 TO lt_salida3.
  ENDIF.

ENDLOOP.

out->write( lt_salida3 ).

*---------------------------------------------------* USANDO JOIN *------------------------------------------------*

 TYPES: BEGIN OF ty_salida4,
         carrier_name  TYPE /dmo/carrier-name,
         connection_id TYPE /dmo/flight-connection_id,
         flight_date   TYPE /dmo/flight-flight_date,
         price         TYPE /dmo/flight-price,
         currency_code TYPE /dmo/flight-currency_code,
         plane_type_id TYPE /dmo/flight-plane_type_id,
       END OF ty_salida4.

DATA: lt_salida4 TYPE TABLE OF ty_salida4.

SELECT FROM /dmo/flight AS f
INNER JOIN /dmo/carrier AS c
ON f~carrier_id = c~carrier_id

  FIELDS
    c~name           AS carrier_name,
    f~connection_id  AS connection_id,
    f~flight_date    AS flight_date,
    f~price          AS price,
    f~currency_code  AS currency_code,
    f~plane_type_id  AS plane_type_id

  WHERE f~price > 5000
  ORDER BY f~price DESCENDING
  INTO TABLE @lt_salida4.

  IF sy-subrc = 0.
  out->write( lt_salida4 ).
  ELSE.
  out->write(  'Error' ).
  ENDIF.

"2)

TYPES: BEGIN OF ty_salida5,
         first_name   TYPE /dmo/customer-first_name,
         last_name    TYPE /dmo/customer-last_name,
         travel_id    TYPE /dmo/booking-travel_id,
         booking_id   TYPE /dmo/booking-booking_id,
         booking_date TYPE /dmo/booking-booking_date,
       END OF ty_salida5.

       DATA: ls_salida5 TYPE ty_salida5,
             lt_salida5 TYPE TABLE OF ty_salida5.

  SELECT FROM /dmo/customer
  FIELDS customer_id, first_name, last_name
  INTO TABLE @DATA(lt_customer).

  SELECT FROM /dmo/booking
  FIELDS customer_id, travel_id, booking_id, booking_date
  ORDER BY travel_id, booking_id
  INTO TABLE @DATA(lt_booking).

LOOP AT lt_booking INTO DATA(ls_booking).

  READ TABLE lt_customer INTO DATA(ls_customer)
       WITH KEY customer_id = ls_booking-customer_id.

  IF sy-subrc = 0.

    ls_salida5-first_name   = ls_customer-first_name.
    ls_salida5-last_name    = ls_customer-last_name.
    ls_salida5-travel_id    = ls_booking-travel_id.
    ls_salida5-booking_id   = ls_booking-booking_id.
    ls_salida5-booking_date = ls_booking-booking_date.

    APPEND ls_salida5 TO lt_salida5.
  ENDIF.

ENDLOOP.

out->write( lt_salida5 ).

*---------------------------------------------------* USANDO JOIN *------------------------------------------------*
TYPES: BEGIN OF ty_salida6,
         first_name   TYPE /dmo/customer-first_name,
         last_name    TYPE /dmo/customer-last_name,
         travel_id    TYPE /dmo/booking-travel_id,
         booking_id   TYPE /dmo/booking-booking_id,
         booking_date TYPE /dmo/booking-booking_date,
       END OF ty_salida6.

DATA lt_salida6 TYPE TABLE OF ty_salida6.

SELECT FROM /dmo/booking AS b
  INNER JOIN /dmo/customer AS c
    ON b~customer_id = c~customer_id
  FIELDS
    c~first_name,
    c~last_name,
    b~travel_id,
    b~booking_id,
    b~booking_date
  ORDER BY
    b~travel_id,
    b~booking_id
  INTO TABLE @lt_salida6.

IF sy-subrc = 0.
  out->write( lt_salida6 ).
ELSE.
  out->write( 'Error' ).
ENDIF.

"3)

SELECT FROM /dmo/booking AS b1
  INNER JOIN /dmo/flight AS f1
    ON b1~carrier_id     = f1~carrier_id
   AND b1~connection_id  = f1~connection_id
   AND b1~flight_date    = f1~flight_date
  INNER JOIN /dmo/carrier AS c1
    ON f1~carrier_id = c1~carrier_id
  FIELDS
    c1~name,
    f1~connection_id,
    f1~flight_date,
    f1~plane_type_id,
    b1~booking_id
  INTO TABLE @DATA(lt_tabla_reserva).

    IF sy-subrc = 0.
       out->write( lt_tabla_reserva ).
    ELSE.
    out->write(  'Error' ).
    ENDIF.

"4) EXTRAER AGENCIA POR NUM DE RESERVA:

*Partiendo de ID de reserva y del ID de aerolinea
*Dime que agencia de viaje vendió esa reserva
*Tablas implicadas, /dmo/agency /dmo/booking /dmo/travel

*DATA: lv_booking_id TYPE /dmo/booking_id VALUE '0010',
*      lv_carrier_id TYPE /dmo/carrier_id VALUE 'AA'.
*
*SELECT FROM /dmo/booking AS b2
*INNER JOIN /dmo/travel AS t2 ON b2~travel_id = t2~travel_id
*INNER JOIN /dmo/agency AS a2 ON t2~agency_id = a2~agency_id
*
*FIELDS
*    a2~agency_id,
*    t2~travel_id,
*    b2~booking_id,
*    b2~carrier_id
*WHERE b2~booking_id = @lv_booking_id
*AND b2~carrier_id = @lv_carrier_id
*INTO TABLE @DATA(lt_agencia).
*
*IF sy-subrc = 0.
*  out->write( lt_agencia ).
*ELSE.
*  out->write( 'Agencia inexistente' ).
*ENDIF.


"5) CON WHERE customer_id = '000555' AND connection_id = '0322'.

DATA: lv_customer_id   TYPE /dmo/customer_id   VALUE '000555',
      lv_connection_id TYPE /dmo/connection_id VALUE '0322'.

SELECT FROM /dmo/booking AS b2
  INNER JOIN /dmo/travel AS t2 ON b2~travel_id = t2~travel_id
  INNER JOIN /dmo/agency AS a2 ON t2~agency_id = a2~agency_id
  FIELDS
    a2~agency_id,
    a2~name AS agency_name,
    t2~travel_id,
    b2~booking_id,
    b2~carrier_id,
    b2~customer_id,
    b2~connection_id
WHERE b2~customer_id   = @lv_customer_id
AND b2~connection_id = @lv_connection_id
INTO TABLE @DATA(lt_resultado).

IF sy-subrc = 0.
  out->write( lt_resultado ).
ELSE.
  out->write( 'Agencia inexistente' ).
ENDIF.

ENDMETHOD.
ENDCLASS.


