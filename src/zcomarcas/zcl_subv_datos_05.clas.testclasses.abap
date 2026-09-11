*"* use this source file for your ABAP unit test classes
CLASS ltc_testing_05 DEFINITION
FINAL
FOR TESTING
DURATION SHORT
RISK LEVEL HARMLESS.
PRIVATE SECTION.

CLASS-DATA:
      environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS:
      class_setup RAISING cx_static_check,
      class_teardown.

    METHODS:
      setup RAISING cx_static_check,
      preparar_datos,

      test_sur
        FOR TESTING
        RAISING cx_static_check,

      test_nor
        FOR TESTING
        RAISING cx_static_check,

      test_sin_autorizacion
        FOR TESTING
        RAISING cx_static_check.
ENDCLASS.


CLASS ltc_testing_05 IMPLEMENTATION.

METHOD class_setup.
    environment =
      cl_cds_test_environment=>create(
        i_for_entity = 'ZI_SUBV_AGR_05' ).
  ENDMETHOD.

  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.

  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.

  METHOD preparar_datos.
  DATA lt_subvenciones TYPE STANDARD TABLE OF zsubv_agr_05 WITH EMPTY KEY.

    lt_subvenciones = VALUE #(

  ( id_subvencion = 'S001' agricultor = 'Antonio Ruiz'  comarca = 'MAR' importe = 12000 estado = 'P' )
  ( id_subvencion = 'S002' agricultor = 'María López'   comarca = 'CAM' importe =  8500 estado = 'A' )
  ( id_subvencion = 'S003' agricultor = 'José García'   comarca = 'MAR' importe = 15000 estado = 'A' )
  ( id_subvencion = 'S004' agricultor = 'Carmen Pérez'  comarca = 'SIE' importe =  7000 estado = 'P' )
  ( id_subvencion = 'S005' agricultor = 'Manuel Díaz'   comarca = 'CAM' importe = 11000 estado = 'R' )
  ( id_subvencion = 'S006' agricultor = 'Ana Romero'    comarca = 'SIE' importe =  9500 estado = 'A' )
    ).

    environment->insert_test_data(
      i_data = lt_subvenciones
    ).

  ENDMETHOD.

  METHOD test_nor.
    preparar_datos( ).

    DATA(auth_data) =
      cl_cds_test_data=>create_access_control_data(

        i_role_authorizations = VALUE #(

          (
            object = 'ZAUTH_COM5'

            authorizations = VALUE #(

              (
                VALUE #(

                  (
                    fieldname = 'ZCOM_05'
                    fieldvalues = VALUE #(
                      ( lower_value = 'MAR' )
                    )
                  )

                  (
                    fieldname = 'ACTVT'
                    fieldvalues = VALUE #(
                      ( lower_value = '03' )
                    )
                  )

                )
              )

            )

          )

        )

      ).


    environment->get_access_control_double(
      )->enable_access_control(
        i_access_control_data = auth_data
      ).


    SELECT *
      FROM zi_subv_agr_05
      INTO TABLE @DATA(lt_resultado).


    cl_abap_unit_assert=>assert_equals(
      act = lines( lt_resultado )
      exp = 2
    ).

    cl_abap_unit_assert=>assert_true(
      act = xsdbool(
        line_exists(
          lt_resultado[ IdSubvencion = 'S002' ]
        )
      )
    ).

    cl_abap_unit_assert=>assert_true(
      act = xsdbool(
        line_exists(
          lt_resultado[ IdSubvencion = 'S005' ]
        )
      )
    ).

  ENDMETHOD.


  METHOD test_sin_autorizacion.
    preparar_datos( ).
    DATA(auth_data) =
      cl_cds_test_data=>create_access_control_data(
        i_role_authorizations = VALUE #( )
      ).
    environment->get_access_control_double(
      )->enable_access_control(
        i_access_control_data = auth_data
      ).

    SELECT *
      FROM zi_pedido_dcl_05
      INTO TABLE @DATA(lt_resultado).

    cl_abap_unit_assert=>assert_initial(
      act = lt_resultado
    ).

  ENDMETHOD.


  METHOD test_sur.
    preparar_datos( ).

    DATA(auth_data) =
      cl_cds_test_data=>create_access_control_data(

        i_role_authorizations = VALUE #(

          (
            object = 'ZAUTH_COM5'

            authorizations = VALUE #(

              (
                VALUE #(

                  (
                    fieldname = 'ZCOM_05'

                    fieldvalues = VALUE #(
                      ( lower_value = 'SIE' )
                    )
                  )

                  (
                    fieldname = 'ACTVT'

                    fieldvalues = VALUE #(
                      ( lower_value = '03' )
                    )
                  )

                )
              )

            )

          )

        )

      ).

    environment->get_access_control_double(
      )->enable_access_control(
        i_access_control_data = auth_data
      ).

    SELECT *
      FROM zi_pedido_dcl_05
      INTO TABLE @DATA(lt_resultado).

    cl_abap_unit_assert=>assert_equals(
      act = lines( lt_resultado )
      exp = 2
    ).

ENDMETHOD.
ENDCLASS.
