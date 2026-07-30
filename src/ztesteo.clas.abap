CLASS ztesteo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ztesteo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*TYPES: BEGIN OF ty_reservas,
*       carrier_id TYPE /dmo/booking-carrier_id,
*       booking_id TYPE /dmo/booking-booking_id,
*       travel_id TYPE /dmo/booking-travel_id,
*       connection_id TYPE /dmo/booking-connection_id,
*       flight_date TYPE /dmo/booking-flight_date,
*       name TYPE /dmo/carrier-name,
*       END OF ty_reservas.
*
*       DATA: lt_reservas TYPE TABLE OF ty_reservas.
*
*       SELECT FROM /dmo/booking as b
*       INNER JOIN /dmo/carrier as c
*       ON b~carrier_id = c~carrier_id
*       FIELDS
*       b~carrier_id,
*       b~booking_id,
*       b~travel_id,
*       b~connection_id,
*       b~flight_date,
*       c~name
*       INTO TABLE @lt_reservas.
*
*       IF sy-subrc = 0.
*       out->write( lt_reservas ).
*       ELSE.
*       out->write(  'Error' ).
*       ENDIF.

**----------------------------------------------------------------------------------------------*
* /DMO/TRAVEL y /DMO/CUSTOMER:
*
*"Viajes registrados en el sistema

*TYPES: BEGIN OF: ty_passengers,
*       customer_id TYPE /dmo/customer-customer_id,
*       first_name TYPE /dmo/customer-first_name,
*       last_name TYPE /dmo/customer-last_name,
*       travel_id TYPE /dmo/travel-travel_id,
*       begin_date TYPE /dmo/travel-begin_date,
*       END OF ty_passengers.
*
*       DATA: lt_passengers TYPE TABLE OF ty_passengers.
*
*       SELECT FROM /DMO/CUSTOMER AS c2
*       LEFT OUTER JOIN /DMO/TRAVEL AS t2
*       ON c2~customer_id = t2~customer_id
*
*       FIELDS
*          c2~customer_id,
*          c2~first_name,
*          c2~last_name,
*          t2~travel_id,
*          t2~begin_date
*          INTO TABLE @lt_passengers.
*
*          IF sy-subrc = 0.
*          out->write( lt_passengers ).
*          ELSE.
*          out->write( 'Error' ).
*          ENDIF.
*---------------------------------------------------------------------------------------------

*Con /DMO/FLIGHT y /DMO/CARRIER,
*SHOW connection_id, flight_date & price de "Lufthansa"
*price superior a 1000.
**

*TYPES: BEGIN OF ty_carrier_name,
*    connection_id TYPE /dmo/flight-connection_id,
*      flight_date TYPE /dmo/flight-flight_date,
*            price TYPE /dmo/flight-price,
*       END OF ty_carrier_name.
*
*       DATA: lt_carrier_name TYPE TABLE OF ty_carrier_name.
*
*       SELECT FROM /DMO/FLIGHT AS f3
*       INNER JOIN /DMO/CARRIER AS c4
*       ON f3~carrier_id = c4~carrier_id
*
*        FIELDS
*          f3~connection_id,
*          f3~flight_date,
*          f3~price
*
*          WHERE c4~name = 'Lufthansa'
*          AND f3~price > 1000
*          ORDER BY f3~price DESCENDING
*          INTO TABLE @lt_carrier_name.
*
*          IF sy-subrc = 0.
*          out->write( lt_carrier_name ).
*          ELSE.
*          out->write( 'Error' ).
*          ENDIF.

*********************************************************************************************************

*Ejercicio 1 — INNER JOIN
*"Reservas de un cliente concreto"
*Usando /DMO/BOOKING y /DMO/CUSTOMER, muestra booking_id, travel_id, connection_id y flight_date
*de todas las reservas cuyo cliente tenga de apellido (last_name) "Smith".
*
*Pistas:
*
*¿En qué tabla vive last_name? Ese alias es el que necesitas en el WHERE.
*¿Tiene sentido aquí un LEFT OUTER JOIN? Piensa: si filtras por un dato que solo existe en la tabla derecha,
* ¿qué pasaría con las reservas que no tuvieran cliente emparejado?

*TYPES: BEGIN OF ty_smith,
*       first_name TYPE /dmo/customer-first_name,
*       last_name TYPE /dmo/customer-last_name,
*       booking_id TYPE /dmo/booking-booking_id,
*       travel_id TYPE /dmo/booking-travel_id,
*       connection_id TYPE /dmo/booking-connection_id,
*       flight_date TYPE /dmo/booking-flight_date,
*       END OF ty_smith.
*
*       DATA lt_smith TYPE TABLE OF ty_smith.
*
*       SELECT FROM /dmo/customer AS c5
*       INNER JOIN /dmo/booking AS b5
*       ON c5~customer_id = b5~customer_id
*
*       FIELDS
*        c5~first_name,
*        c5~last_name,
*        b5~booking_id,
*        b5~travel_id,
*        b5~connection_id,
*        b5~flight_date
*
*        WHERE c5~last_name = 'Smith'
*        INTO TABLE @lt_smith.
*
*        IF sy-subrc = 0.
*        out->write( lt_smith ).
*        ELSE.
*        out->write(  'Error' ).
*        ENDIF.
********************************************************************************************************


*Usando /DMO/CARRIER y /DMO/FLIGHT, muestra name (de la aerolínea), connection_id, flight_date y price,
*incluyendo también aquellas aerolíneas que no tengan ningún vuelo registrado en /DMO/FLIGHT.

*        TYPES: BEGIN OF ty_aero_name,
*               carrier_id TYPE /dmo/carrier-carrier_id,
*               name TYPE /dmo/carrier-name,
*               connection_id TYPE /dmo/flight-connection_id,
*               flight_date TYPE /dmo/flight-flight_date,
*               price TYPE /dmo/flight-price,
*               END OF ty_aero_name.
*
*               DATA: lt_aero_name TYPE TABLE OF ty_aero_name.
*
*               SELECT FROM /DMO/CARRIER AS c6
*               LEFT OUTER JOIN /DMO/FLIGHT AS f6
*               ON c6~carrier_id = f6~carrier_id
*               FIELDS
*               c6~carrier_id,
*               c6~name,
*               f6~connection_id,
*               f6~flight_date,
*               f6~price
*
*               INTO TABLE @lt_aero_name.
*
*               IF sy-subrc = 0.
*               out->write( lt_aero_name ).
*               ELSE.
*               out->write( 'Error' ).
*               ENDIF.

"******"
*Ejercicio 3 — LEFT OUTER JOIN (preparando el terreno para el reto de los dos ON)
*"Todos los viajes, tengan reservas o no"
*Usando /DMO/TRAVEL y /DMO/BOOKING, muestra travel_id, begin_date, end_date (de TRAVEL)
*junto con booking_id y connection_id (de BOOKING), incluyendo también los viajes que
*todavía no tengan ninguna reserva asociada.
*Pistas:
*Mismo razonamiento que el ejercicio 2: ¿qué tabla va a la izquierda?
*Este ejercicio nos va a servir de base: en la siguiente ronda vamos a complicar
*el JOIN entre /DMO/BOOKING y /DMO/FLIGHT, porque ahí la relación no se hace por un
*solo campo, sino por varios a la vez (carrier_id, connection_id y flight_date juntos).
* Ahí es donde entrará el ON ... AND ... con dos (o tres) condiciones que mencionabas.


*TYPES: BEGIN OF ty_viajes,
*       travel_id TYPE /dmo/travel-travel_id,
*       begin_date TYPE /dmo/travel-begin_date,
*       end_date TYPE /dmo/travel-end_date,
*       booking_id TYPE /dmo/booking-booking_id,
*       connection_id TYPE /dmo/booking-connection_id,
*       END OF ty_viajes.
*
*       DATA: lt_viajes TYPE TABLE OF ty_viajes.
*
*       SELECT FROM /dmo/travel AS t7
*       LEFT OUTER JOIN /dmo/booking AS b7
*       ON t7~travel_id = b7~travel_id
*       FIELDS
*       t7~travel_id,
*       t7~begin_date,
*       t7~end_date,
*       b7~booking_id,
*       b7~connection_id
*       INTO TABLE @lt_viajes.
*
*       IF sy-subrc = 0.
*       out->write(  lt_viajes ).
*       ELSE.
*       out->write( 'Error' ).
*       ENDIF.


** -----------------------------------------------------------------------------

TYPES: BEGIN OF ty_booking_price,
       booking_id TYPE /dmo/booking-booking_id,
       travel_id TYPE /dmo/booking-travel_id,
       carrier_id TYPE /dmo/flight-carrier_id,
       connection_id TYPE /dmo/flight-connection_id,
       flight_date TYPE /dmo/flight-flight_date,
       flight_price TYPE /dmo/flight-price,
       END OF ty_booking_price.

       DATA: lt_booking_price TYPE TABLE OF ty_booking_price.

       SELECT FROM /DMO/BOOKING AS b8
       INNER JOIN /DMO/FLIGHT AS f8
       ON b8~carrier_id = f8~carrier_id
       AND b8~connection_id = f8~connection_id
       AND b8~flight_date = f8~flight_date

       FIELDS
       b8~booking_id,
       b8~travel_id,
       f8~carrier_id,
       f8~connection_id,
       f8~flight_date,
       f8~price AS flight_price
       INTO TABLE @lt_booking_price.

       IF sy-subrc = 0.
       out->write(  lt_booking_price ).
       ELSE.
       out->write( 'Error' ).
       ENDIF.



*       >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>













ENDMETHOD.
ENDCLASS.
