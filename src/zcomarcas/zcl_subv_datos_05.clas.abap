CLASS zcl_subv_datos_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_subv_datos_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

 DATA lt_subvenciones TYPE TABLE OF zsubv_agr_05 WITH EMPTY KEY.

  lt_subvenciones = VALUE #(
  ( id_subvencion = 'S001' agricultor = 'Antonio Ruiz'  comarca = 'MAR' importe = 12000 estado = 'P' )
  ( id_subvencion = 'S002' agricultor = 'María López'   comarca = 'CAM' importe =  8500 estado = 'A' )
  ( id_subvencion = 'S003' agricultor = 'José García'   comarca = 'MAR' importe = 15000 estado = 'A' )
  ( id_subvencion = 'S004' agricultor = 'Carmen Pérez'  comarca = 'SIE' importe =  7000 estado = 'P' )
  ( id_subvencion = 'S005' agricultor = 'Manuel Díaz'   comarca = 'CAM' importe = 11000 estado = 'R' )
  ( id_subvencion = 'S006' agricultor = 'Ana Romero'    comarca = 'SIE' importe =  9500 estado = 'A' )
).

    INSERT zsubv_agr_05 FROM TABLE @lt_subvenciones.

    IF sy-subrc = 0.
    out->write( 'Datos agregados correctamente.' ).
    ELSEIF
    out->write( 'Error.' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
