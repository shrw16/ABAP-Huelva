CLASS lhc_zr_mantenim_05 DEFINITION
  INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_global_authorizations
      FOR GLOBAL AUTHORIZATION
      IMPORTING
        REQUEST requested_authorizations FOR ZrMantenim05
      RESULT result.

    METHODS inicializar_mantenimiento
      FOR DETERMINE ON MODIFY
      IMPORTING keys FOR ZrMantenim05~InicializarMantenimiento.

    METHODS finalizar_mantenimiento
      FOR MODIFY
      IMPORTING keys FOR ACTION ZrMantenim05~FinalizarMantenimiento RESULT result.

    METHODS earlynumbering_create
    FOR NUMBERING
       entities FOR CREATE ZrMantenim05.

ENDCLASS.

CLASS lhc_zr_mantenim_05 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD inicializar_mantenimiento.

    READ ENTITIES OF zr_mantenim_05 IN LOCAL MODE
      ENTITY ZrMantenim05
      FIELDS ( Estado FechaSolicitud )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_mantenimientos).

    MODIFY ENTITIES OF zr_mantenim_05 IN LOCAL MODE
      ENTITY ZrMantenim05
      UPDATE FIELDS ( Estado FechaSolicitud )
      WITH VALUE #(
        FOR ls_mantenimiento IN lt_mantenimientos
          (
            %tky = ls_mantenimiento-%tky

            Estado = COND #(
              WHEN ls_mantenimiento-Estado IS INITIAL
              THEN 'P'
              ELSE ls_mantenimiento-Estado
            )

            FechaSolicitud = COND #(
              WHEN ls_mantenimiento-FechaSolicitud IS INITIAL
              THEN cl_abap_context_info=>get_system_date( )
              ELSE ls_mantenimiento-FechaSolicitud
            )
          )
      ).

  ENDMETHOD.

  METHOD finalizar_mantenimiento.

    MODIFY ENTITIES OF zr_mantenim_05 IN LOCAL MODE
      ENTITY ZrMantenim05
      UPDATE FIELDS ( Estado FechaFinalizacion )
      WITH VALUE #(
        FOR key IN keys
          (
            %tky = key-%tky
            Estado = 'F'
            FechaFinalizacion = cl_abap_context_info=>get_system_date( )
          )
      ).

  ENDMETHOD.

  METHOD earlynumbering_create.
  ENDMETHOD.

ENDCLASS.


