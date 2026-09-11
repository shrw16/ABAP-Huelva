CLASS zcl_sorted_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.
CLASS zcl_sorted_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  TYPES: BEGIN OF ty_candidato,
         id         TYPE i,
         nombre     TYPE string,
         puntuacion TYPE i,
       END OF ty_candidato.

 TYPES tt_candidatos TYPE SORTED TABLE OF ty_candidato WITH NON-UNIQUE KEY puntuacion.

    DATA(lt_candidatos) = VALUE tt_candidatos(
  ( id = 1 nombre = 'Ana'    puntuacion = 8 )
  ( id = 2 nombre = 'Carlos' puntuacion = 5 )
  ( id = 3 nombre = 'Marta'  puntuacion = 9 )
  ( id = 4 nombre = 'Juan'   puntuacion = 6 )
  ( id = 5 nombre = 'Lucía'  puntuacion = 10 )
).

DATA(lt_sup_ocho) = FILTER #(
  lt_candidatos
  WHERE puntuacion >= 8
).

DATA(lt_inf_ocho) = FILTER #(
  lt_candidatos
  EXCEPT WHERE puntuacion >= 8
).

out->write( lt_sup_ocho ).
out->write( lt_inf_ocho ).

**********************************************************************


*// REDUCE:

DATA(lv_total_puntuaciones) = REDUCE i(
  INIT total = 0
  FOR candidato IN lt_candidatos
  NEXT total = total + candidato-puntuacion
).

out->write( |TOTAL PUNTUACIONES: { lv_total_puntuaciones } | ).

*// REDUCE CON WHERE:

DATA(lv_total_ocho) = REDUCE i(
  INIT total = 0
  FOR candidato IN lt_candidatos
  WHERE ( puntuacion >= 8 )
  NEXT total = total + candidato-puntuacion
).

out->write( | MAYORES QUE 8: { lv_total_ocho } | ).

  ENDMETHOD.
ENDCLASS.
