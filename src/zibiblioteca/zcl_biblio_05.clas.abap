CLASS zcl_biblio_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS: registrar_prestamo
           IMPORTING
           iv_socio TYPE ztprestamos-socio
           iv_libro TYPE ztprestamos-libro
           RETURNING VALUE(rv_id_prestamo) TYPE ztprestamos-id_prestamo.

  METHODS: consultar_prestamo
           IMPORTING
           iv_id_prestamo TYPE ztprestamos-id_prestamo
           EXPORTING
           ev_socio TYPE ztprestamos-socio
           ev_libro TYPE ztprestamos-libro
           ev_estado TYPE ztprestamos-estado.

  METHODS: marcar_devuelto
           IMPORTING
           iv_id_prestamo TYPE ztprestamos-id_prestamo
           RETURNING VALUE(rv_prestado) TYPE abap_bool.

  METHODS: eliminar_prestamo
           IMPORTING
           iv_id_prestamo TYPE ztprestamos-id_prestamo
           RETURNING VALUE(rv_eliminado) TYPE abap_bool.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_biblio_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.

  METHOD registrar_prestamo.

  DATA: lv_max_id TYPE ztprestamos-id_prestamo,
        ls_prestamos TYPE ztprestamos.

        SELECT MAX( id_prestamo )
        FROM ztprestamos
        INTO @lv_max_id.
        IF sy-subrc = 0.
        ENDIF.

      rv_id_prestamo = lv_max_id + 1.

  ls_prestamos-id_prestamo = rv_id_prestamo.
  ls_prestamos-socio = iv_socio.
  ls_prestamos-libro = iv_libro.
  ls_prestamos-estado = 'PRESTADO'.

  INSERT ZTPRESTAMOS FROM @ls_prestamos.

  ENDMETHOD.

  METHOD consultar_prestamo.

  SELECT SINGLE socio, libro, estado
  FROM ZTPRESTAMOS
  WHERE id_prestamo = @iv_id_prestamo
  INTO ( @ev_socio, @ev_libro, @ev_estado ).

  ENDMETHOD.

  METHOD eliminar_prestamo.

  DELETE FROM ZTPRESTAMOS
  WHERE id_prestamo = @iv_id_prestamo.

  IF sy-subrc = 0.
  rv_eliminado = abap_true.
  ELSE.
  rv_eliminado = abap_false.
  ENDIF.

  ENDMETHOD.

  METHOD marcar_devuelto.

UPDATE ZTPRESTAMOS
SET estado = 'DEVUELTO'
WHERE id_prestamo = @iv_id_prestamo.


 IF sy-subrc = 0.
 rv_prestado = abap_true.
 ELSE.
 rv_prestado = abap_false.
 ENDIF.
 ENDMETHOD.

ENDCLASS.
