CLASS zcl_lineindex_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.
CLASS zcl_lineindex_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  TYPES: BEGIN OF ty_candidato,
         id          TYPE i,
         nombre      TYPE string,
         puntuacion  TYPE i,
            END OF ty_candidato.

  TYPES tt_candidatos TYPE STANDARD TABLE OF ty_candidato WITH EMPTY KEY.

  DATA(lt_candidatos) = VALUE tt_candidatos(
  ( id = 10 nombre = 'Ana'    puntuacion = 7 )
  ( id = 20 nombre = 'Carlos' puntuacion = 5 )
  ( id = 30 nombre = 'Marta'  puntuacion = 9 )
  ( id = 40 nombre = 'Juan'   puntuacion = 8 )
).

*// BÚSQUEDAS:

*--> Candidato ID 30:

DATA(lv_posicion) = line_index( lt_candidatos[ id = 30 ] ).
out->write( lv_posicion ).

*--> Candidato ID 99: IF

IF line_exists( lt_candidatos[ id = 99 ] ).

  DATA(lv_posicion_99) = line_index( lt_candidatos[ id = 99 ] ).
  out->write( lv_posicion_99 ).
ELSE.
  out->write( 'Candidato no encontrado' ).
ENDIF.

ENDMETHOD.
ENDCLASS.
