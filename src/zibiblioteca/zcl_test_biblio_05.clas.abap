CLASS zcl_test_biblio_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_test_biblio_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA(lo_biblioteca) = NEW zcl_biblio_05( ).

  DATA: lv_id1 TYPE ztprestamos-id_prestamo,
          lv_id2 TYPE ztprestamos-id_prestamo,
          lv_socio TYPE ztprestamos-socio,
          lv_libro  TYPE ztprestamos-libro,
          lv_estado  TYPE ztprestamos-estado,
          lv_ok      TYPE abap_bool.


         "2 REGISTROS DE PRUEBA:

          lv_id1 = lo_biblioteca->registrar_prestamo( iv_socio = 'SOCIO UNO' iv_libro  = 'Manual ABAP' ).

          lv_id2 = lo_biblioteca->registrar_prestamo( iv_socio = 'SOCIO DOS' iv_libro  = 'manual BTP' ).


          out->write(  lv_id1 ).
          out->write(  lv_id2 ).


          "CONSULTA:

     lo_biblioteca->consultar_prestamo(
     EXPORTING
     iv_id_prestamo = lv_id1
     IMPORTING
     ev_socio = lv_socio
     ev_libro = lv_libro
     ev_estado = lv_estado ).

     IF sy-subrc = 0.
     out->write( lv_socio ).
     out->write(  lv_libro ).
     out->write( lv_estado ).
     ELSE.
     out->write( 'Consulta no encontrada.' ).
     ENDIF.






 ENDMETHOD.
ENDCLASS.
