CLASS LHC_ZR_TINCIDENCIAS_05 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.

       METHODS: earlynumbering_create FOR NUMBERING
                IMPORTING entities FOR CREATE ZrTincidencias05,

      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrTincidencias05
        RESULT result.
ENDCLASS.

CLASS LHC_ZR_TINCIDENCIAS_05 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

  METHOD: earlynumbering_create.

  DATA entity TYPE STRUCTURE FOR CREATE ZR_TINCIDENCIAS_05.

  LOOP AT entities INTO entity
  WHERE IdIncidence IS NOT INITIAL.
    APPEND VALUE #(
        %cid      = entity-%cid
        %key      = entity-%key
        %is_draft = entity-%is_draft
      ) TO mapped-ZrTincidencias05.
    ENDLOOP.

    DATA(entities_without_id) = entities.

    DELETE entities_without_id
      WHERE IdIncidence IS NOT INITIAL.

    IF entities_without_id IS INITIAL.
      RETURN.
    ENDIF.

        TRY.

        cl_numberrange_runtime=>number_get(
          EXPORTING
            nr_range_nr       = '01'
            object            = 'ZINCID_05'
            quantity          = CONV #( lines( entities_without_id ) )

          IMPORTING
            number            = DATA(numero_final)
            returncode        = DATA(codigo_retorno)
            returned_quantity = DATA(cantidad_devuelta)
        ).

      CATCH cx_number_ranges INTO DATA(error_number_range).

        LOOP AT entities_without_id INTO entity.

          APPEND VALUE #(
            %cid      = entity-%cid
            %key      = entity-%key
            %is_draft = entity-%is_draft
            %msg      = error_number_range
          ) TO reported-ZrTincidencias05.

          APPEND VALUE #(
            %cid        = entity-%cid
            %key        = entity-%key
            %is_draft   = entity-%is_draft
            %fail-cause = if_abap_behv=>cause-conflict
          ) TO failed-ZrTIncidenciaS05.

        ENDLOOP.

        RETURN.

    ENDTRY.

      IF cantidad_devuelta <> lines( entities_without_id ).

      LOOP AT entities_without_id INTO entity.

        APPEND VALUE #(
          %cid        = entity-%cid
          %key        = entity-%key
          %is_draft   = entity-%is_draft
          %fail-cause = if_abap_behv=>cause-conflict
        ) TO failed-ZrTincidencias05.
      ENDLOOP.

      RETURN.

    ENDIF.

    DATA(numero_actual) =
      CONV i( numero_final ) - CONV i( cantidad_devuelta ).

      LOOP AT entities_without_id INTO entity.

      numero_actual += 1.

      entity-IdIncidence =
        |ICD{ numero_actual WIDTH = 4 ALIGN = RIGHT PAD = '0' }|.

      APPEND VALUE #(
        %cid      = entity-%cid
        %key      = entity-%key
        %is_draft = entity-%is_draft
      ) TO mapped-ZrTincidencias05.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
