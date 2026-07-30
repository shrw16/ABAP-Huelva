CLASS zcl_taller_bicis_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

METHODS registrar_reparacion
 IMPORTING
 iv_cliente TYPE ztaller_cli-cliente
 iv_averia  TYPE ztaller_cli-averia
 RETURNING
 VALUE(rv_id_reparacion) TYPE ztaller_cli-id_reparacion.

METHODS consultar_reparacion
 IMPORTING
 iv_id_reparacion TYPE ztaller_cli-id_reparacion
 EXPORTING
 ev_cliente TYPE ztaller_cli-cliente
 ev_averia  TYPE ztaller_cli-averia
 ev_estado  TYPE ztaller_cli-estado.

METHODS cambiar_estado
 IMPORTING
  iv_id_reparacion TYPE ztaller_cli-id_reparacion
  iv_estado        TYPE ztaller_cli-estado
  RETURNING
    VALUE(rv_ok) TYPE abap_bool.

METHODS eliminar_reparacion
 IMPORTING
  iv_id_reparacion TYPE ztaller_cli-id_reparacion
 RETURNING
  VALUE(rv_ok) TYPE abap_bool.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_taller_bicis_05 IMPLEMENTATION.

METHOD registrar_reparacion.

DATA: lv_max_id TYPE ztaller_cli-id_reparacion,
        ls_reparacion TYPE ztaller_cli.

        SELECT MAX( id_reparacion )
        FROM ztaller_cli
        INTO @lv_max_id.

        rv_id_reparacion = lv_max_id + 1.

  ls_reparacion-id_reparacion = rv_id_reparacion.
  ls_reparacion-cliente = iv_cliente.
  ls_reparacion-averia = iv_averia.
  ls_reparacion-estado = 'PENDIENTE'.

  INSERT ztaller_cli FROM @ls_reparacion.

  ENDMETHOD.

METHOD consultar_reparacion.

  SELECT SINGLE cliente, averia, estado
    FROM ztaller_cli
   WHERE id_reparacion = @iv_id_reparacion
   INTO (@ev_cliente, @ev_averia, @ev_estado).

ENDMETHOD.


METHOD cambiar_estado.

UPDATE ztaller_cli
SET estado = @iv_estado
WHERE id_reparacion = @iv_id_reparacion.

IF sy-subrc = 0.
  rv_ok = abap_true.
ELSE.
 rv_ok = abap_false.
ENDIF.
ENDMETHOD.

METHOD eliminar_reparacion.

DELETE FROM ztaller_cli
WHERE id_reparacion = @iv_id_reparacion.

IF sy-subrc = 0.
 rv_ok = abap_true.
ELSE.
 rv_ok = abap_false.
ENDIF.
ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.
ENDCLASS.
