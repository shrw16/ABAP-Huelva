CLASS LHC_ZR_ZCERTIFICADOS DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrZcertificados
        RESULT result.

        METHODS:
        earlynumbering_create FOR NUMBERING
        IMPORTING entities FOR CREATE ZrZcertificados.

        METHODS: UploadFlatFile FOR MODIFY
                  keys FOR ACTION ZrZcertificados~UploadFlatFile.


         METHODS: setUUID FOR DETERMINE ON MODIFY
                   keys FOR ZrZcertificados~setUUID.
ENDCLASS.

CLASS lhc_zr_zcertificados IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD UploadFlatFile.
    LOOP AT keys INTO FINAL(key).
      FINAL(file_content) = xco_cp=>xstring( key-%param-_files-Attachment )->as_string(
          xco_cp_character=>code_page->utf_8 ).
    ENDLOOP.
  ENDMETHOD.

  METHOD earlynumbering_create.

  DATA entity TYPE STRUCTURE FOR CREATE zr_zcertificados.

    LOOP AT entities INTO entity
         WHERE IdCert IS NOT INITIAL.

      APPEND VALUE #(
        %cid      = entity-%cid
        %key      = entity-%key
        %is_draft = entity-%is_draft
      ) TO mapped-ZrZcertificados.

    ENDLOOP.

    DATA(entities_sin_id) = entities.

    DELETE entities_sin_id
      WHERE IdCert IS NOT INITIAL.

    IF entities_sin_id IS INITIAL.
      RETURN.
    ENDIF.

    TRY.

        cl_numberrange_runtime=>number_get(
          EXPORTING
            nr_range_nr       = '01'
            object            = 'ZNRO_ID'
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
          ) TO reported-ZrZcertificados.

          APPEND VALUE #(
            %cid        = entity-%cid
            %key        = entity-%key
            %is_draft   = entity-%is_draft
            %fail-cause = if_abap_behv=>cause-conflict
          ) TO failed-ZrZcertificados.

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
        ) TO failed-ZrZcertificados.

      ENDLOOP.

      RETURN.

    ENDIF.

    DATA(numero_actual) =
      CONV i( numero_final ) - CONV i( cantidad_devuelta ).

    LOOP AT entities_sin_id INTO entity.

      numero_actual += 1.

      entity-IdCert =
        |IDCERT{ numero_actual WIDTH = 4 ALIGN = RIGHT PAD = '0' }|.

      APPEND VALUE #(
        %cid      = entity-%cid
        %key      = entity-%key
        %is_draft = entity-%is_draft
      ) TO mapped-ZrZcertificados.

    ENDLOOP.

  ENDMETHOD.


METHOD setUUID.

  TRY.
      MODIFY ENTITIES OF zr_zcertificados IN LOCAL MODE
        ENTITY zrzcertificados
        UPDATE FIELDS ( idemp )
        WITH VALUE #(
          FOR key IN keys
          ( %tky  = key-%tky
            idemp = cl_system_uuid=>create_uuid_x16_static( ) )
        ).
    CATCH cx_uuid_error.
    " Gestión del error
  ENDTRY.

ENDMETHOD.
ENDCLASS.
