CLASS zcl_test_taller_bicis_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_test_taller_bicis_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA(lo_taller) = NEW zcl_taller_bicis_05( ).

    DATA: lv_id1 TYPE ztaller_cli-id_reparacion,
          lv_id2 TYPE ztaller_cli-id_reparacion,
          lv_cliente TYPE ztaller_cli-cliente,
          lv_averia  TYPE ztaller_cli-averia,
          lv_estado  TYPE ztaller_cli-estado,
          lv_ok      TYPE abap_bool.

 " 2 reparaciones

 lv_id1 = lo_taller->registrar_reparacion( iv_cliente = 'Jaime' iv_averia  = 'Pinchazo rueda' ).

 lv_id2 = lo_taller->registrar_reparacion( iv_cliente = 'Salem' iv_averia  = 'Cadena rota' ).


 out->write(  lv_id1 ).
 out->write(  lv_id2 ).

 " consultar reparacion de salem

  lo_taller->consultar_reparacion(
   EXPORTING
    iv_id_reparacion = lv_id2
   IMPORTING
     ev_cliente = lv_cliente
     ev_averia  = lv_averia
     ev_estado  = lv_estado ).

    IF sy-subrc = 0.
     out->write( lv_cliente ).
     out->write(  lv_averia ).
     out->write(  lv_estado ).
    ELSE.
    out->write(  'No se ha encontrado' ).
    ENDIF.

  " cambiar estado a en curso

 lv_ok = lo_taller->cambiar_estado(
               iv_id_reparacion = lv_id2
               iv_estado = 'EN CURSO' ).

 IF lv_ok = abap_true.
      out->write( 'Estado actualizado' ).
 ELSE.
      out->write( 'Error' ).
ENDIF.

   " eliminar reparacion

 lv_ok = lo_taller->eliminar_reparacion(
               iv_id_reparacion = lv_id2 ).

IF lv_ok = abap_true.
      out->write( 'Eliminada' ).
ELSE.
      out->write( 'Error al eliminar' ).
ENDIF.


  ENDMETHOD.
ENDCLASS.
