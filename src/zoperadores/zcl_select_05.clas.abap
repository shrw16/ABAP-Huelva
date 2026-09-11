CLASS zcl_select_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_select_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  "1) IMPRIME TODOS LOS CAMPOS Y REGISTROS:

SELECT * FROM /dmo/flight
  INTO TABLE @DATA(lt_flights).
  out->write( lt_flights ).


  "2) MUESTRA SOLO LOS CAMPOS CARRIER_ID, CONNECTION_ID Y PRICE_ID:

SELECT CARRIER_ID, CONNECTION_ID, PRICE
  FROM /dmo/flight
  INTO TABLE @DATA(lt_flights1).
  out->write( lt_flights1 ).


  "3) VUELOS DE LA COMPAÑÍA LH:

SELECT CARRIER_ID, CONNECTION_ID, PRICE
  FROM /dmo/flight
  WHERE CARRIER_ID = 'LH'
  INTO TABLE @DATA(lt_flights2).

  IF sy-subrc = 0.
  out->write( lt_flights2 ).
  ELSE.
  out->write( 'No hay vuelos de la compañía LH.' ).
  ENDIF.


  "4) VUELOS CON PRECIO MAYOR A 5000:

  SELECT PRICE, CARRIER_ID, CONNECTION_ID
  FROM /dmo/flight
  WHERE PRICE > 5000
  INTO TABLE @DATA(lt_flights3).

  IF sy-subrc = 0.
  out->write( lt_flights3 ).
  ELSE.
  out->write( 'No hay vuelos con precio superior a 5000. ' ).
  ENDIF.


  "5) VUELOS QUE USAN EL AVIÓN 'A380-800':

  SELECT PLANE_TYPE_ID, CARRIER_ID, CONNECTION_ID, SEATS_MAX
  FROM /dmo/flight
  WHERE PLANE_TYPE_ID = 'A380-800'
  INTO TABLE @DATA(lt_flights4).

  IF sy-subrc = 0.
  out->write( lt_flights4 ).
  ELSE.
  out->write( 'No se encontraron vuelos.' ).
  ENDIF.


  "6) VUELOS DE LA COMPAÑÍA 'AA' CON PRECIO INFERIOR A 1000:

SELECT *
  FROM /dmo/flight
  WHERE CARRIER_ID = 'AA'
    AND PRICE < 1000
  INTO TABLE @DATA(lt_flights5).

  IF sy-subrc = 0.
  out->write( lt_flights5 ).
  ELSE.
  out->write( 'No se encontraron vuelos de AA inferiores a 1000.' ).
  ENDIF.


   "7) VUELOS CON OCUPACIÓN SUPERIOR AL 90%:

*SELECT CARRIER_ID, CONNECTION_ID, SEATS_MAX, SEATS_OCCUPIED
*  FROM /dmo/flight
*  WHERE SEATS_OCCUPIED > seats_max * 0,9
*  INTO TABLE @DATA(lt_flights6)
*
*  IF sy-subrc = 0.
*  out->write( lt_flights6 ).
*  ELSE.
*  out->write( 'No hay vuelos con ocupación superior al 90%' ).


  "8) SELECCIONAR EUR Y USD Y ORDENAR PRECIO DE MAYOR A MENOR:

  SELECT *
  FROM /dmo/flight
  WHERE CURRENCY_CODE = 'EUR'
   OR CURRENCY_CODE = 'USD'
  ORDER BY PRICE DESCENDING
  INTO TABLE @DATA(lt_flights7).

  IF sy-subrc = 0.
  out->write(  lt_flights7 ).
  ELSE.
  out->write( 'Error.' ).
  ENDIF.


  "9) FILTRACIÓN POR COMPAÑÍAS 'SQ', 'UA' y 'LH' QUE USAN EL 767-200:

 SELECT *
  FROM /dmo/flight
  WHERE PLANE_TYPE_ID = '767-200'
   AND CARRIER_ID = 'SQ'
   OR CARRIER_ID = 'UA'
   OR CARRIER_ID = 'LH'
  ORDER BY CARRIER_ID ASCENDING, PRICE DESCENDING
  INTO TABLE @DATA(lt_flights8).
  IF sy-subrc = 0.
  out->write(  lt_flights8 ).
  ELSE.
  out->write( 'Error.' ).
  ENDIF.


  "10) VUELOS CUYO PRECIO ESTÁ ENTRE 2000-6000, EXCLUIR A 'AA' Y QUE TENGAN MÁS DE 200 ASIENTOS:

  SELECT CARRIER_ID, CONNECTION_ID, FLIGHT_DATE, PRICE, SEATS_MAX
  FROM /dmo/flight
  WHERE PRICE BETWEEN 2000 AND 6000
    AND CARRIER_ID <> 'AA'
    AND SEATS_MAX > 200
  ORDER BY PRICE ASCENDING
  INTO TABLE @DATA(lt_flights9).

  IF sy-subrc = 0.
  out->write( lt_flights9 ).
  ELSE.
  out->write( 'Error.' ).
  ENDIF.

*  "11) AVERIGUAR/OBTENER TIPO DE AVIÓN A PARTIR DE UNA RESERVA:
*
**  1 Recupero los datos de la reserva a través de los campos clave (key).
*
*SELECT SINGLE from /dmo/booking
*FIELDS carrier_id, connection_id, flight_date
*WHERE travel_id = '0017'
*AND booking_id = '0002'
*INTO @DATA(ls_reserva).
*
*IF sy-subrc = 0
*out->write( ls_reserva ).
*ELSE.
*out->write( 'Reserva no encontrada' ).
*ENDIF.
*
**  2) Recupero los valores del vuelo con los datos de la reserva extraida arriba con lA_reserva.
*
*SELEC SINGLE from /dmo/flight
*FIELDS *
*WHERE carrier_id = @ls_reserva-carrier_id
*AND connection_id = @ls_reserva-connection_id
*AND flight_date = @ls_reserva-flight_date
*INTO @DATA(ls_vuelo).
*
*IF sy-subrc = 0
*out->write( ls_vuelo-plane_type_id )
*ELSE.
*out->write( 'Vuelo no encontrado' ).

*-----------------------------------------------------------------------------

*SELECT SINGLE from /dmo/travel_m
*FIELDS agency_id
*WHERE travel_id = '00000014'
*INTO @DATA(ls_agencia).
*
*IF sy-subrc = 0.
*  SELECT SINGLE from /dmo/agency
*  FIELDS name
*  WHERE agency_id = @ls_agencia
*  INTO @DATA(lt_name)
*   out->write( name ).
*    ELSE.
*    out->write( 'Agencia inexistente' ).
*    ENDIF.

*------------------------------------------------------------------------------

*QUIERO UNA TABLA CON LOS CAMPOS:
*(carrier_id, connection, flight_date, price, currency code)

*DEFINIR MI TABLA DE SALIDA:
*TYPES: BEGIN OF ty_salida,
*       name TYPE /dmo/carrier-carrier_id,
*       connection_id TYPE /dmo/flight-connection_id,
*       flight_date TYPE /dmo/flight-flight_date,
*       price TYPE /dmo/flight-price,
*       currency_code TYPE /dmo/currency_code,
*       END OF ty_salida.
*
**       CREO LA ESTRUCTURA Y TABLA DE SALIDA:
*       DATA: ls_salida TYPE ty_salida,
*             lt_salidas TYPE TABLE OF ty_salida.
*
**       RECUPERAR DATOS DE LAS BDs:
*SELECT FROM /dmo/flight
*FIELDS carrier_id, connection_id, flight_date, price, currency_code
*INTO TABLE @DATA(lt_flight).
*
*SELECT FROM /dmo/carrier
*FIELDS carrier_id, name
*INTO TABLE @DATA(lt_carrier).
*
**RECORRER LAS TABLAS Y MONTAR MI TABLA CON LOS CAMPOS DE SALIDA REQUERIDOS ARRIBA:
*LOOP AT lt_flight INTO DATA(ls_flight).
*
*READ TABLE lt_carrier INTO DATA(ls_carrier)
*WITH KEY carrier_id = ls_flight-carrier_id.
*
*IF sy-subrc = 0.
* ls_salida-name = ls_carrier-name
* ls_salida-connection_id = ls_flight-carrier_id
* ls_salida-flight_date = ls_flight-flight_date
* ls_salida-price = ls_flight-price
* ls_salida-currency_code = ls_flight-currency_code
* ENDIF.
*APPEND ls_salida TO lt_salidas.

* ----------------------------------------------------------------------------------------------

TYPES: BEGIN OF ty_salida,
       customer_id TYPE /dmo/customer-customer_id,
       first_name TYPE /dmo/customer-first_name,
       last_name TYPE /dmo/customer-last_name,
       travel_id TYPE /dmo/travel-travel_id,
       begin_date TYPE /dmo/travel-begin_date,
       total_price TYPE /dmo/travel-total_price,
       currency_code TYPE /dmo/travel-currency_code,
       END OF ty_salida.

DATA: ls_salida TYPE ty_salida,
      lt_salida TYPE TABLE OF ty_salida.

      SELECT FROM /dmo/travel
      FIELDS travel_id, customer_id, begin_date, total_price, currency_code
      INTO TABLE @DATA(lt_travel).

      SELECT FROM /dmo/customer
      FIELDS customer_id, first_name, last_name
      INTO TABLE @DATA(lt_customer).

      LOOP AT lt_travel INTO DATA(ls_travel).

      READ TABLE lt_customer INTO DATA(ls_customer)
      WITH KEY customer_id = ls_travel-customer_id.

      IF sy-subrc = 0.

    ls_salida-first_name    = ls_customer-first_name.
    ls_salida-last_name     = ls_customer-last_name.
    ls_salida-travel_id     = ls_travel-travel_id.
    ls_salida-begin_date    = ls_travel-begin_date.
    ls_salida-total_price   = ls_travel-total_price.
    ls_salida-currency_code = ls_travel-currency_code.

    APPEND ls_salida TO lt_salida.
  ENDIF.
ENDLOOP.
out->write(  lt_salida ).
  ENDMETHOD.
ENDCLASS.
