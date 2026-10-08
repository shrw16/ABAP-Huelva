CLASS lhc_zr_zcertificados DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
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

    METHODS: SendMail FOR MODIFY
       keys FOR ACTION ZrZcertificados~SendMail.

    METHODS Renovar FOR MODIFY
      IMPORTING keys FOR ACTION ZrZcertificados~Renovar RESULT result.

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

      APPEND VALUE #(
        %cid      = entity-%cid
        %key      = VALUE #(
          IdCert = |IDCERT{ numero_actual WIDTH = 4 ALIGN = RIGHT PAD = '0' }|
        )
        %is_draft = entity-%is_draft
      ) TO mapped-ZrZcertificados.

    ENDLOOP.

  ENDMETHOD.

  METHOD setUUID.

    TRY.

        MODIFY ENTITIES OF zr_zcertificados IN LOCAL MODE
          ENTITY zrzcertificados
          UPDATE FIELDS ( IdEmp )
          WITH VALUE #(
            FOR key IN keys
            ( %tky  = key-%tky
              IdEmp = cl_system_uuid=>create_uuid_x16_static( ) )
          )
          FAILED DATA(failed2)
          REPORTED DATA(reported2).

      CATCH cx_uuid_error INTO DATA(lx_uuid).


    ENDTRY.

  ENDMETHOD.


METHOD SendMail.

    DATA(ls_key) = VALUE #( keys[ 1 ] OPTIONAL ).

    DATA(lv_mail) = CONV string( ls_key-%param-Correo ).

    TRY.

        DATA(lo_mail_address) =
            cl_mail_address=>create_instance(
                iv_address_string = lv_mail
            ).

        IF lo_mail_address->validate( ) = abap_false.
            RETURN.
        ENDIF.

        "Crear mensaje
        DATA(lo_mail) =
            cl_bcs_mail_message=>create_instance( ).


        "Remitente
        lo_mail->set_sender(
            'noreply@miempresa.com'
        ).


        "Destinatario
        lo_mail->add_recipient(
            CONV cl_bcs_mail_message=>ty_address(
                lv_mail
            )
        ).


        "Asunto
        lo_mail->set_subject(
            'Prueba desde RAP'
        ).


        "Contenido HTML
        lo_mail->set_main(
            cl_bcs_mail_textpart=>create_instance(
                iv_content =
                    '<h2>Hola</h2><p>Email enviado desde RAP.</p>'
                iv_content_type = 'text/html'
            )
        ).


        "Enviar de forma asíncrona
        lo_mail->send_async( ).


    CATCH cx_bcs_mail INTO DATA(lx_mail).

        "Devolver el error a RAP

    ENDTRY.

ENDMETHOD.

  METHOD renovar.

DATA lt_upd TYPE TABLE FOR UPDATE zr_zcertificados.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).
      IF <key>-%param-FechaCad <= <key>-%param-FechaExp.
        APPEND VALUE #( %tky = <key>-%tky ) TO failed-zrzcertificados.
        APPEND VALUE #( %tky = <key>-%tky
                        %msg = new_message_with_text(
                                 severity = if_abap_behv_message=>severity-error
                                 text     = 'La fecha de caducidad debe ser posterior a la de expedición' ) )
               TO reported-zrzcertificados.
        CONTINUE.
      ENDIF.

      APPEND VALUE #( %tky     = <key>-%tky
                      FechaExp = <key>-%param-FechaExp
                      FechaCad = <key>-%param-FechaCad ) TO lt_upd.
    ENDLOOP.

    CHECK lt_upd IS NOT INITIAL.

    MODIFY ENTITIES OF zr_zcertificados IN LOCAL MODE
      ENTITY ZrZcertificados
        UPDATE FIELDS ( FechaExp FechaCad )
        WITH lt_upd.

    READ ENTITIES OF zr_zcertificados IN LOCAL MODE
      ENTITY ZrZcertificados
        ALL FIELDS WITH CORRESPONDING #( lt_upd )
      RESULT DATA(lt_certs).

    result = VALUE #( FOR c IN lt_certs ( %tky = c-%tky %param = c ) ).

    LOOP AT lt_certs ASSIGNING FIELD-SYMBOL(<c>).
      APPEND VALUE #( %tky = <c>-%tky
                      %msg = new_message_with_text(
                               severity = if_abap_behv_message=>severity-success
                               text     = 'Certificado renovado correctamente' ) )
             TO reported-zrzcertificados.
    ENDLOOP.

ENDMETHOD.
ENDCLASS.
