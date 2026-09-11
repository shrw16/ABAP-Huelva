CLASS LHC_ZR_PPT_05 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrPpt05
        RESULT result.

      METHODS Jugar FOR MODIFY
            IMPORTING keys FOR ACTION ZrPpt05~Jugar
            RESULT result.
      METHODS earlynumbering_create FOR NUMBERING
        entities FOR CREATE ZrPpt05.
ENDCLASS.

CLASS LHC_ZR_PPT_05 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

 METHOD Jugar.

  "------------------------------------------------------------
  " 1. LEER LAS PARTIDAS SOBRE LAS QUE SE HA EJECUTADO JUGAR
  "------------------------------------------------------------

  READ ENTITIES OF zr_ppt_05 IN LOCAL MODE

    ENTITY ZrPpt05

      FIELDS ( JugadaJ1 JugadaJ2 Resultado )

      WITH CORRESPONDING #( keys )

    RESULT DATA(partidas_jugadas).


  "------------------------------------------------------------
  " 2. PROCESAR CADA PARTIDA
  "------------------------------------------------------------

  LOOP AT partidas_jugadas INTO DATA(partida).


    "----------------------------------------------------------
    " 3. VALIDAR JUGADA DEL JUGADOR 1
    "----------------------------------------------------------

    IF partida-JugadaJ1 IS INITIAL.

      APPEND VALUE #(

        %tky = partida-%tky

      ) TO failed-ZrPpt05.


      APPEND VALUE #(

        %tky = partida-%tky

        %msg = new_message(

          id       = 'ZPPT_MSG'

          number   = '001'

          severity = if_abap_behv_message=>severity-error

        )

      ) TO reported-ZrPpt05.

      CONTINUE.

    ENDIF.


    "----------------------------------------------------------
    " 4. VALIDAR JUGADA DEL JUGADOR 2
    "----------------------------------------------------------

    IF partida-JugadaJ2 IS INITIAL.

      APPEND VALUE #(

        %tky = partida-%tky

      ) TO failed-ZrPpt05.


      APPEND VALUE #(

        %tky = partida-%tky

        %msg = new_message(

          id       = 'ZPPT_MSG'

          number   = '002'

          severity = if_abap_behv_message=>severity-error

        )

      ) TO reported-ZrPpt05.

      CONTINUE.

    ENDIF.


    "----------------------------------------------------------
    " 5. VALIDAR VALOR DEL JUGADOR 1
    "
    " P = Piedra
    " T = Tijera
    " A = Papel
    "----------------------------------------------------------

    IF partida-JugadaJ1 <> 'P'
       AND partida-JugadaJ1 <> 'T'
       AND partida-JugadaJ1 <> 'A'.

      APPEND VALUE #(

        %tky = partida-%tky

      ) TO failed-ZrPpt05.


      APPEND VALUE #(

        %tky = partida-%tky

        %msg = new_message(

          id       = 'ZPPT_MSG'

          number   = '003'

          severity = if_abap_behv_message=>severity-error

        )

      ) TO reported-ZrPpt05.

      CONTINUE.

    ENDIF.


    "----------------------------------------------------------
    " 6. VALIDAR VALOR DEL JUGADOR 2
    "
    " P = Piedra
    " T = Tijera
    " A = Papel
    "----------------------------------------------------------

    IF partida-JugadaJ2 <> 'P'
       AND partida-JugadaJ2 <> 'T'
       AND partida-JugadaJ2 <> 'A'.

      APPEND VALUE #(

        %tky = partida-%tky

      ) TO failed-ZrPpt05.


      APPEND VALUE #(

        %tky = partida-%tky

        %msg = new_message(

          id       = 'ZPPT_MSG'

          number   = '004'

          severity = if_abap_behv_message=>severity-error

        )

      ) TO reported-ZrPpt05.

      CONTINUE.

    ENDIF.


    "----------------------------------------------------------
    " 7. DETERMINAR EL RESULTADO
    "
    " 1 = Gana Jugador 1
    " 2 = Gana Jugador 2
    " E = Empate
    "
    " P = Piedra
    " T = Tijera
    " A = Papel
    "----------------------------------------------------------

    DATA(resultado) = COND #(
WHEN partida-JugadaJ1 = partida-JugadaJ2
THEN 'E'
WHEN partida-JugadaJ1 = 'P'
AND partida-JugadaJ2 = 'T'
THEN '1'
WHEN partida-JugadaJ1 = 'T'
AND partida-JugadaJ2 = 'A'
THEN '1'
WHEN partida-JugadaJ1 = 'A'
AND partida-JugadaJ2 = 'P'
THEN '1'
ELSE '2'
).


    "----------------------------------------------------------
    " 8. ACTUALIZAR EL RESULTADO
    "----------------------------------------------------------

    MODIFY ENTITIES OF zr_ppt_05 IN LOCAL MODE

      ENTITY ZrPpt05

      UPDATE FIELDS ( Resultado )

      WITH VALUE #(

        (

          %tky      = partida-%tky

          Resultado = resultado

        )

      ).


    "----------------------------------------------------------
    " 9. INFORMAR DEL RESULTADO AL USUARIO
    "----------------------------------------------------------

APPEND VALUE #(
  %tky = partida-%tky
  %msg = new_message_with_text(
    severity = if_abap_behv_message=>severity-success
    text = COND #(
      WHEN resultado = '1'
        THEN |Gana el jugador 1. { partida-JugadaJ1 } vence a { partida-JugadaJ2 }.|
      WHEN resultado = '2'
        THEN |Gana el jugador 2. { partida-JugadaJ2 } vence a { partida-JugadaJ1 }.|
      ELSE |Empate. Ambos jugadores han elegido { partida-JugadaJ1 }.|
    )
  )
) TO reported-ZrPpt05.

  "------------------------------------------------------------
  " 10. LEER DE NUEVO LAS PARTIDAS ACTUALIZADAS
  "------------------------------------------------------------

  READ ENTITIES OF zr_ppt_05 IN LOCAL MODE

    ENTITY ZrPpt05

      ALL FIELDS

      WITH CORRESPONDING #( keys )

    RESULT DATA(partidas_actualizadas).


  "------------------------------------------------------------
  " 11. DEVOLVER EL RESULTADO DE LA ACCION
  "------------------------------------------------------------

  result = VALUE #(

    FOR partida_actualizada IN partidas_actualizadas

    (

      %tky   = partida_actualizada-%tky

      %param = partida_actualizada

    )

  ).

 ENDLOOP.

 ENDMETHOD.

   METHOD earlynumbering_create.

   DATA entity TYPE STRUCTURE FOR CREATE ZR_INCIDENCIA_00.
        DATA(entities_sin_id) = entities.
        DELETE entities_sin_id
        WHERE IdPartida IS NOT INITIAL.
IF entities_sin_id IS INITIAL.
RETURN.

ENDIF.
ENDMETHOD.
 ENDCLASS.
