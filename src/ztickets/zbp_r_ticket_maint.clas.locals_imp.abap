CLASS LHC_ZR_TICKET_MAINT DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.

    METHODS: earlynumbering_create FOR NUMBERING
            entities FOR CREATE ZrTicketMaint.

      METHODS: GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrTicketMaint
        RESULT result.

ENDCLASS.

CLASS LHC_ZR_TICKET_MAINT IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

  METHOD earlynumbering_create.

  DATA entity TYPE STRUCTURE FOR CREATE ZR_TICKET_MAINT.
  LOOP AT entities INTO entity
     WHERE TicketID IS NOT INITIAL.

     APPEND VALUE #(
  %cid      = entity-%cid
  %key      = entity-%key
  %is_draft = entity-%is_draft
) TO mapped-ZrTicketMaint.

  ENDLOOP.

    DATA(entities_without_id) = entities.
    DELETE entities_without_id
  WHERE TicketID IS NOT INITIAL.

  IF entities_without_id IS INITIAL.
  RETURN.
ENDIF.

TRY.

    cl_numberrange_runtime=>number_get(
      EXPORTING
        nr_range_nr       = '01'
        object            = 'ZRN_RANGOS'
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
        ) TO reported-ZrTicketMaint.

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
        ) TO failed-ZrTicketMaint.

      ENDLOOP.

      RETURN.

    ENDIF.

    DATA(numero_actual) =
      CONV i( numero_final ) - CONV i( cantidad_devuelta ).

      LOOP AT entities_without_id INTO entity.

      numero_actual += 1.

      entity-TicketID =
        |TCK{ numero_actual WIDTH = 4 ALIGN = RIGHT PAD = '0' }|.

      APPEND VALUE #(
        %cid      = entity-%cid
        %key      = entity-%key
        %is_draft = entity-%is_draft
      ) TO mapped-ZrTicketMaint.

    ENDLOOP.


ENDMETHOD.

ENDCLASS.
