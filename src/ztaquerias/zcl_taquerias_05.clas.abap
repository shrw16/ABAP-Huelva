CLASS zcl_taquerias_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_taquerias_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA ls_taqueria TYPE ztaquerias_05.

ls_taqueria-id_taqueria = '001'.
ls_taqueria-nombre = 'Taquería El Buen Sabor'.
ls_taqueria-estado = 'OA'.
ls_taqueria-especialidad = 'CA'.
ls_taqueria-nivel_picante = '3'.
ls_taqueria-precio_taco = '4.50'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '002'.
ls_taqueria-nombre = 'Taquería La Esquina'.
ls_taqueria-estado = 'JA'.
ls_taqueria-especialidad = 'PA'.
ls_taqueria-nivel_picante = '4'.
ls_taqueria-precio_taco = '5.00'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '003'.
ls_taqueria-nombre = 'El Compadre'.
ls_taqueria-estado = 'PU'.
ls_taqueria-especialidad = 'SU'.
ls_taqueria-nivel_picante = '2'.
ls_taqueria-precio_taco = '3.80'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '004'.
ls_taqueria-nombre = 'Taquería Los Compadres'.
ls_taqueria-estado = 'YU'.
ls_taqueria-especialidad = 'CO'.
ls_taqueria-nivel_picante = '3'.
ls_taqueria-precio_taco = '5.50'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '005'.
ls_taqueria-nombre = 'Doña Lupita'.
ls_taqueria-estado = 'OA'.
ls_taqueria-especialidad = 'CO'.
ls_taqueria-nivel_picante = '2'.
ls_taqueria-precio_taco = '4.20'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '006'.
ls_taqueria-nombre = 'El Fogón'.
ls_taqueria-estado = 'YU'.
ls_taqueria-especialidad = 'PA'.
ls_taqueria-nivel_picante = '1'.
ls_taqueria-precio_taco = '4.00'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '007'.
ls_taqueria-nombre = 'Tacos El Güero'.
ls_taqueria-estado = 'OA'.
ls_taqueria-especialidad = 'SU'.
ls_taqueria-nivel_picante = '3'.
ls_taqueria-precio_taco = '4.80'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '008'.
ls_taqueria-nombre = 'Taquería La Popular'.
ls_taqueria-estado = 'JA'.
ls_taqueria-especialidad = 'CH'.
ls_taqueria-nivel_picante = '2'.
ls_taqueria-precio_taco = '3.90'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '009'.
ls_taqueria-nombre = 'Tacos El Paisa'.
ls_taqueria-estado = 'CM'.
ls_taqueria-especialidad = 'PA'.
ls_taqueria-nivel_picante = '4'.
ls_taqueria-precio_taco = '5.75'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '010'.
ls_taqueria-nombre = 'Taquería El Trompo'.
ls_taqueria-estado = 'CM'.
ls_taqueria-especialidad = 'CO'.
ls_taqueria-nivel_picante = '5'.
ls_taqueria-precio_taco = '5.20'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '011'.
ls_taqueria-nombre = 'Tacos La Michoacana'.
ls_taqueria-estado = 'YU'.
ls_taqueria-especialidad = 'CA'.
ls_taqueria-nivel_picante = '2'.
ls_taqueria-precio_taco = '4.60'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '012'.
ls_taqueria-nombre = 'Taquería El Rey del Taco'.
ls_taqueria-estado = 'PU'.
ls_taqueria-especialidad = 'SU'.
ls_taqueria-nivel_picante = '4'.
ls_taqueria-precio_taco = '4.90'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '013'.
ls_taqueria-nombre = 'Tacos Los Arbolitos'.
ls_taqueria-estado = 'OA'.
ls_taqueria-especialidad = 'BA'.
ls_taqueria-nivel_picante = '3'.
ls_taqueria-precio_taco = '5.10'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '014'.
ls_taqueria-nombre = 'Taquería La Roja'.
ls_taqueria-estado = 'JA'.
ls_taqueria-especialidad = 'SU'.
ls_taqueria-nivel_picante = '5'.
ls_taqueria-precio_taco = '6.00'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '015'.
ls_taqueria-nombre = 'Tacos El Norteño'.
ls_taqueria-estado = 'CM'.
ls_taqueria-especialidad = 'PA'.
ls_taqueria-nivel_picante = '3'.
ls_taqueria-precio_taco = '5.30'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '016'.
ls_taqueria-nombre = 'Doña Chuy'.
ls_taqueria-estado = 'PU'.
ls_taqueria-especialidad = 'CO'.
ls_taqueria-nivel_picante = '2'.
ls_taqueria-precio_taco = '4.10'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '017'.
ls_taqueria-nombre = 'Tacos El Jarocho'.
ls_taqueria-estado = 'CM'.
ls_taqueria-especialidad = 'CO'.
ls_taqueria-nivel_picante = '3'.
ls_taqueria-precio_taco = '4.40'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '018'.
ls_taqueria-nombre = 'Taquería La Sabrosita'.
ls_taqueria-estado = 'OA'.
ls_taqueria-especialidad = 'BA'.
ls_taqueria-nivel_picante = '4'.
ls_taqueria-precio_taco = '4.70'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '019'.
ls_taqueria-nombre = 'El Tío de los Tacos'.
ls_taqueria-estado = 'JA'.
ls_taqueria-especialidad = 'PA'.
ls_taqueria-nivel_picante = '4'.
ls_taqueria-precio_taco = '5.60'.

INSERT ztaquerias_05 FROM @ls_taqueria.

ls_taqueria-id_taqueria = '020'.
ls_taqueria-nombre = 'Taquería El Sazón'.
ls_taqueria-estado = 'YU'.
ls_taqueria-especialidad = 'CA'.
ls_taqueria-nivel_picante = '2'.
ls_taqueria-precio_taco = '4.30'.

INSERT ztaquerias_05 FROM @ls_taqueria.



  ENDMETHOD.
ENDCLASS.
