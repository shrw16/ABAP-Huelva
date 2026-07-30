CLASS zcl_bodegas_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_bodegas_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA: ls_bodega TYPE zbod_05.

ls_bodega-id_bodega = '01'.
ls_bodega-nombre = 'Virgen del Socorro'.
ls_bodega-denominacion = 'RI'.
ls_bodega-tipo_vino = 'TI'.
ls_bodega-anyo_fundacion = '1957'.
ls_bodega-precio_botella = '5'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '02'.
ls_bodega-nombre = 'Marqués de Alavera'.
ls_bodega-denominacion = 'RI'.
ls_bodega-tipo_vino = 'TI'.
ls_bodega-anyo_fundacion = '1912'.
ls_bodega-precio_botella = '9'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '03'.
ls_bodega-nombre = 'Pago del Encinar'.
ls_bodega-denominacion = 'RD'.
ls_bodega-tipo_vino = 'TI'.
ls_bodega-anyo_fundacion = '1965'.
ls_bodega-precio_botella = '14'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '04'.
ls_bodega-nombre = 'Bodegas Alto Cantábrico'.
ls_bodega-denominacion = 'RS'.
ls_bodega-tipo_vino = 'BL'.
ls_bodega-anyo_fundacion = '1983'.
ls_bodega-precio_botella = '8'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '05'.
ls_bodega-nombre = 'Finca La Solana'.
ls_bodega-denominacion = 'PR'.
ls_bodega-tipo_vino = 'ES'.
ls_bodega-anyo_fundacion = '1998'.
ls_bodega-precio_botella = '6'.

ls_bodega-id_bodega = '06'.
ls_bodega-nombre = 'Bodegas Montearena'.
ls_bodega-denominacion = 'JE'.
ls_bodega-tipo_vino = 'GE'.
ls_bodega-anyo_fundacion = '2001'.
ls_bodega-precio_botella = '16'.

ls_bodega-id_bodega = '07'.
ls_bodega-nombre = 'Celler Vall de Prades'.
ls_bodega-denominacion = 'PR'.
ls_bodega-tipo_vino = 'RO'.
ls_bodega-anyo_fundacion = '1974'.
ls_bodega-precio_botella = '28'.

ls_bodega-id_bodega = '08'.
ls_bodega-nombre = 'Bodegas Fuente Real'.
ls_bodega-denominacion = 'RD'.
ls_bodega-tipo_vino = 'BL'.
ls_bodega-anyo_fundacion = '1990'.
ls_bodega-precio_botella = '5'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '09'.
ls_bodega-nombre = 'Bodegas Cepa Vieja'.
ls_bodega-denominacion = 'RS'.
ls_bodega-tipo_vino = 'RO'.
ls_bodega-anyo_fundacion = '1955'.
ls_bodega-precio_botella = '4'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '10'.
ls_bodega-nombre = 'Bodegas Costa Brava'.
ls_bodega-denominacion = 'RD'.
ls_bodega-tipo_vino = 'ES'.
ls_bodega-anyo_fundacion = '1968'.
ls_bodega-precio_botella = '10'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '11'.
ls_bodega-nombre = 'Celler Muntanya Blava'.
ls_bodega-denominacion = 'PR'.
ls_bodega-tipo_vino = 'BL'.
ls_bodega-anyo_fundacion = '1889'.
ls_bodega-precio_botella = '9'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '12'.
ls_bodega-nombre = 'Bodegas Torre del Águila'.
ls_bodega-denominacion = 'RI'.
ls_bodega-tipo_vino = 'RO'.
ls_bodega-anyo_fundacion = '1993'.
ls_bodega-precio_botella = '13'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '13'.
ls_bodega-nombre = 'Bodegas San Marcial'.
ls_bodega-denominacion = 'RS'.
ls_bodega-tipo_vino = 'RO'.
ls_bodega-anyo_fundacion = '1947'.
ls_bodega-precio_botella = '7'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '14'.
ls_bodega-nombre = 'Bodegas Marisma'.
ls_bodega-denominacion = 'JE'.
ls_bodega-tipo_vino = 'GE'.
ls_bodega-anyo_fundacion = '1801'.
ls_bodega-precio_botella = '11'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '15'.
ls_bodega-nombre = 'Bodegas Sierra Alta'.
ls_bodega-denominacion = 'RD'.
ls_bodega-tipo_vino = 'ES'.
ls_bodega-anyo_fundacion = '1962'.
ls_bodega-precio_botella = '6'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '16'.
ls_bodega-nombre = 'Celler Vinya Antiga'.
ls_bodega-denominacion = 'RS'.
ls_bodega-tipo_vino = 'BL'.
ls_bodega-anyo_fundacion = '2005'.
ls_bodega-precio_botella = '19'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '17'.
ls_bodega-nombre = 'Bodegas Río Frío'.
ls_bodega-denominacion = 'PR'.
ls_bodega-tipo_vino = 'RO'.
ls_bodega-anyo_fundacion = '1978'.
ls_bodega-precio_botella = '15'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '18'.
ls_bodega-nombre = 'Bodegas Pinar del Rey'.
ls_bodega-denominacion = 'RI'.
ls_bodega-tipo_vino = 'RO'.
ls_bodega-anyo_fundacion = '1936'.
ls_bodega-precio_botella = '4'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '19'.
ls_bodega-nombre = 'Bodegas Levante Sur'.
ls_bodega-denominacion = 'PR'.
ls_bodega-tipo_vino = 'GE'.
ls_bodega-anyo_fundacion = '1959'.
ls_bodega-precio_botella = '8'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '20'.
ls_bodega-nombre = 'Bodegas Valle Umbrío'.
ls_bodega-denominacion = 'RD'.
ls_bodega-tipo_vino = 'ES'.
ls_bodega-anyo_fundacion = '1971'.
ls_bodega-precio_botella = '7'.

INSERT zbod_05 FROM @ls_bodega.

ls_bodega-id_bodega = '21'.
ls_bodega-nombre = 'Bodegas Altos del Duero'.
ls_bodega-denominacion = 'RD'.
ls_bodega-tipo_vino = 'RO'.
ls_bodega-anyo_fundacion = '2010'.
ls_bodega-precio_botella = '23'.

INSERT zbod_05 FROM @ls_bodega.

IF sy-subrc = 0.
out->write(  'Añadidas 21 bodegas nuevas. ' ).
ELSE.
out->write(  'ERROR'  ).
ENDIF.

  ENDMETHOD.
ENDCLASS.
