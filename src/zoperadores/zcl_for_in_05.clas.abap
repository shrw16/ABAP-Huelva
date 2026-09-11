CLASS zcl_for_in_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_for_in_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

TYPES: BEGIN OF ty_candidato,
         id         TYPE i,
         nombre     TYPE string,
         puntuacion TYPE i,
       END OF ty_candidato.

TYPES tt_candidatos TYPE STANDARD TABLE OF ty_candidato WITH EMPTY KEY.
*TYPES tt_candidatos TYPE SORTED TABLE OF ty_candidato WITH NON-UNIQUE KEY.

DATA(lt_candidatos) = VALUE tt_candidatos(
  ( id = 1 nombre = 'Ana'    puntuacion = 8 )
  ( id = 2 nombre = 'Carlos' puntuacion = 5 )
  ( id = 3 nombre = 'Marta'  puntuacion = 9 )
  ( id = 4 nombre = 'Juan'   puntuacion = 6 )
  ( id = 5 nombre = 'Lucía'  puntuacion = 10 )
).

TYPES: BEGIN OF ty_candidatos2,
         nombre     TYPE string,
         puntuacion TYPE i,
       END OF ty_candidatos2.

TYPES tt_candidatos2 TYPE SORTED TABLE OF ty_candidatos2 WITH NON-UNIQUE KEY puntuacion.

DATA(lt_seleccionados) = VALUE tt_candidatos2(
  FOR ls_candidato IN lt_candidatos WHERE ( puntuacion >= 8 )
    (
      nombre     = ls_candidato-nombre
      puntuacion = ls_candidato-puntuacion
    )
).
out->write( lt_seleccionados ).

*****************************************************************************************************


ENDMETHOD.
ENDCLASS.
