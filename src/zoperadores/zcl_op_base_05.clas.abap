CLASS zcl_op_base_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.
CLASS zcl_op_base_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  TYPES: BEGIN OF ty_candidato,
         id          TYPE i,
         nombre      TYPE string,
         experiencia TYPE i,
         salario     TYPE p LENGTH 8 DECIMALS 2,
         ciudad      TYPE string,
       END OF ty_candidato.

    DATA(ls_candidato) = VALUE ty_candidato(
        id          = 1
        nombre      = 'Ana'
        experiencia = 4
        salario     = 28000
        ciudad      = 'Sevilla'
        ).

    DATA(ls_candidato_actualizado) = VALUE ty_candidato(
    BASE ls_candidato
    experiencia = 5
    salario     = 30000
    ).

    out->write( ls_candidato ).
    out->write( ls_candidato_actualizado ).

****************************************************************************************
*//   TABLA NUEVA:

    TYPES tt_candidatos TYPE STANDARD TABLE OF ty_candidato WITH EMPTY KEY.

    DATA(lt_candidatos) = VALUE tt_candidatos(
  ( id = 1
    nombre = 'Ana'
    experiencia = 4
    salario = 28000
    ciudad = 'Sevilla' )

  ( id = 2
    nombre = 'Carlos'
    experiencia = 6
    salario = 32000
    ciudad = 'Huelva' )
    ).

  DATA(lt_candidatos_actualizada) = VALUE tt_candidatos(
  BASE lt_candidatos

  ( id = 3
    nombre = 'Lucía'
    experiencia = 3
    salario = 26000
    ciudad = 'Valencia' )
).

 out->write( lt_candidatos_actualizada ).


ENDMETHOD.
ENDCLASS.
