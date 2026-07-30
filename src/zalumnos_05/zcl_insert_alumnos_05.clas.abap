CLASS zcl_insert_alumnos_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_insert_alumnos_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

 DATA: lt_alumnos TYPE TABLE OF zalumnos_05,
          ls_alumno  TYPE zalumnos_05.


    CLEAR ls_alumno.
    ls_alumno-client   = sy-mandt.
    ls_alumno-id_curso = 'CUR001'.
    ls_alumno-dni      = '12345678A'.
    ls_alumno-nombre   = 'Ana García'.
    ls_alumno-edad     = 22.
    ls_alumno-nivel    = 'IN'.
    APPEND ls_alumno TO lt_alumnos.


    CLEAR ls_alumno.
    ls_alumno-client   = sy-mandt.
    ls_alumno-id_curso = 'CUR002'.
    ls_alumno-dni      = '12345678A'.
    ls_alumno-nombre   = 'Ana García'.
    ls_alumno-edad     = 22.
    ls_alumno-nivel    = 'AV'.
    APPEND ls_alumno TO lt_alumnos.


    CLEAR ls_alumno.
    ls_alumno-client   = sy-mandt.
    ls_alumno-id_curso = 'CUR001'.
    ls_alumno-dni      = '87654321B'.
    ls_alumno-nombre   = 'Luis Pérez'.
    ls_alumno-edad     = 30.
    ls_alumno-nivel    = 'ME'.
    APPEND ls_alumno TO lt_alumnos.

    INSERT zalumnos_05 FROM TABLE @lt_alumnos.

  ENDMETHOD.
ENDCLASS.
