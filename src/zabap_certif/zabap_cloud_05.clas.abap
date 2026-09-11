CLASS zabap_cloud_05 DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA:
      carrier_id    TYPE /dmo/carrier_id READ-ONLY,
      connection_id TYPE /dmo/connection_id READ-ONLY,
      airport_from  TYPE /dmo/airport_from_id READ-ONLY,
      airport_to    TYPE /dmo/airport_to_id READ-ONLY.

    METHODS constructor IMPORTING
                        i_carrier_id    TYPE /dmo/carrier_id
                        i_connection_id TYPE /dmo/connection_id
                        i_plane_type_id TYPE /dmo/plane_type_id
                        RAISING   zcx_c_abapd_no_connection.


    METHODS get_connections IMPORTING
                i_departure          TYPE /dmo/airport_from_id
            RETURNING VALUE(r_connections) TYPE zcert_connections.


  PROTECTED SECTION.
    DATA plane_type TYPE /dmo/plane_type_id.

  PRIVATE SECTION.

ENDCLASS.

CLASS zabap_cloud_05 IMPLEMENTATION.

  METHOD constructor.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    plane_type = i_plane_type_id.

    SELECT SINGLE airport_from_id, airport_to_id
        FROM /dmo/connection
        WHERE carrier_id = @i_carrier_id
            AND connection_id = @i_connection_id
        INTO ( @airport_from, @airport_to ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_c_abapd_no_connection.
    ENDIF.

  ENDMETHOD.

  METHOD get_connections.

"DIRECTOS:
SELECT FROM /dmo/connection
FIELDS carrier_id,
       airport_from_id,
       airport_to_id
WHERE airport_from_id = @i_departure
INTO TABLE @r_connections.

LOOP AT r_connections ASSIGNING FIELD-SYMBOL(<connection>).

<connection>-airport_via_id = COND #(
    WHEN <connection>-airport_via_id IS INITIAL THEN '-'
    ELSE <connection>-airport_via_id
  ).
 ENDLOOP.

 "INDIRECTOS:

    SELECT FROM /dmo/connection as conn1
      INNER JOIN /dmo/connection as conn2
        ON conn1~carrier_id = conn2~carrier_id
       AND conn1~airport_to_id = conn2~airport_from_id
      FIELDS conn1~carrier_id,
             conn1~airport_from_id,
             conn2~airport_to_id,
             conn1~airport_to_id as airport_via_id
      WHERE conn1~airport_from_id = @i_departure
        AND conn2~airport_to_id <> @i_departure

      INTO CORRESPONDING FIELDS OF TABLE @r_connections.

ENDMETHOD.
ENDCLASS.
