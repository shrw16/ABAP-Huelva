CLASS zcl_pkg05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_pkg05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA: ls_clientes TYPE zclientes_05.

UPDATE zclientes_05
  SET ciudad = 'BURGOS'
  WHERE cliente_id = '0001'.

IF sy-subrc = 0.
COMMIT WORK.
  out->write( |CORRECT UPDATE. ROWS AFFECTED: { sy-dbcnt }| ).
ELSE.
ROLLBACK WORK.
  out->write( 'FAILED UPDATE' ).
ENDIF.

CLEAR ls_clientes.

SELECT SINGLE *
  FROM zclientes_05
  WHERE cliente_id = '0001'
  INTO @ls_clientes.

IF sy-subrc = 0.
 out->write( |AFTER CHANGE:| ).
 out->write( ls_clientes ).
ELSE.
 out->write( 'FAILED CHANGE' ).
ENDIF.

ENDMETHOD.
ENDCLASS.
