CLASS zcl_candidato_interno_05 DEFINITION
  PUBLIC
  INHERITING FROM zcl_candidatos_05
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS calcular_idoneidad REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.

  CONSTANTS: gc_puntuacion_interna TYPE i VALUE 5.

ENDCLASS.

CLASS zcl_candidato_interno_05 IMPLEMENTATION.

METHOD calcular_idoneidad.
rv_idoneidad =
    CONV DECFLOAT34( anios_experiencia ) * CONV DECFLOAT34( '0.6' )
    +
    CONV DECFLOAT34( gc_puntuacion_interna ) * CONV DECFLOAT34( '0.4' ).

    IF rv_idoneidad > 10.
       rv_idoneidad = 10.
       ENDIF.
ENDMETHOD.
ENDCLASS.
