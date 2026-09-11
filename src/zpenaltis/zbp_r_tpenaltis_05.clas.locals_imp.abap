CLASS LHC_ZR_TPENALTIS_05 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrTpenaltis05
        RESULT result.
        METHODS:
       earlynumbering_create FOR NUMBERING
            entities FOR CREATE ZrTpenaltis05.
ENDCLASS.

CLASS LHC_ZR_TPENALTIS_05 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

  METHOD earlynumbering_create.

  DATA entity TYPE STRUCTURE FOR CREATE ZR_TPENALTIS_05.

  DATA(entities_sin_id) = entities.

  DELETE entities_sin_id
    WHERE NumeroLanzamiento IS NOT INITIAL.
    IF entities_sin_id IS INITIAL.
    RETURN.
    ENDIF.

  TRY.
      cl_numberrange_runtime=>number_get(
        EXPORTING
          nr_range_nr       = '01'
          object            = 'ZNR_LANZ05'
          quantity          = CONV #( lines( entities_sin_id ) )

        IMPORTING
          number            = DATA(numero_final)
          returncode        = DATA(codigo_retorno)
          returned_quantity = DATA(cantidad_devuelta)
      ).

    CATCH cx_number_ranges INTO DATA(error_number_range).

      LOOP AT entities_sin_id INTO entity.

        APPEND VALUE #(
          %cid      = entity-%cid
          %key      = entity-%key
          %is_draft = entity-%is_draft
          %msg      = error_number_range
        ) TO reported-ZrTpenaltis05.

        APPEND VALUE #(
          %cid        = entity-%cid
          %key        = entity-%key
          %is_draft   = entity-%is_draft
          %fail-cause = if_abap_behv=>cause-conflict
        ) TO failed-ZrTpenaltis05.

      ENDLOOP.

      RETURN.

  ENDTRY.

  IF cantidad_devuelta <> lines( entities_sin_id ).

    LOOP AT entities_sin_id INTO entity.

      APPEND VALUE #(
        %cid        = entity-%cid
        %key        = entity-%key
        %is_draft   = entity-%is_draft
        %fail-cause = if_abap_behv=>cause-conflict
      ) TO failed-ZrTpenaltis05.

    ENDLOOP.

    RETURN.

  ENDIF.

  DATA(numero_actual) =
    CONV i( numero_final ) - CONV i( cantidad_devuelta ).


  LOOP AT entities_sin_id INTO entity.

    numero_actual += 1.


    entity-NumeroLanzamiento =
      |PEN { numero_actual WIDTH = 3 ALIGN = RIGHT PAD = '0' }|.


    APPEND VALUE #(
      %cid      = entity-%cid
      %key      = entity-%key
      %is_draft = entity-%is_draft
    ) TO mapped-ZrTpenaltis05.

  ENDLOOP.

ENDMETHOD.
ENDCLASS.

