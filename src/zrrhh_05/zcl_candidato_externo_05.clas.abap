CLASS zcl_candidato_externo_05 DEFINITION
  PUBLIC
  INHERITING FROM zcl_candidatos_05
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

  DATA num_certificaciones TYPE i.

  METHODS: constructor
  IMPORTING
  iv_id TYPE i
  iv_nombre_completo TYPE string
  iv_anios_experiencia TYPE i
  iv_dni TYPE string
  iv_telefono TYPE string
  iv_salario_actual TYPE DECFLOAT34
  iv_salario_pretendido TYPE DECFLOAT34
  iv_puntuacion_entrevista TYPE i
  iv_num_certificaciones TYPE i.

  METHODS: calcular_idoneidad REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.
CLASS zcl_candidato_externo_05 IMPLEMENTATION.

  METHOD calcular_idoneidad.

 rv_idoneidad = CONV DECFLOAT34( anios_experiencia ) * CONV DECFLOAT34( '0.3' )
                        + CONV DECFLOAT34( num_certificaciones ) * CONV DECFLOAT34( '1.5' ).

    IF rv_idoneidad > 10.
      rv_idoneidad = 10.
    ENDIF.

  ENDMETHOD.

  METHOD constructor.

    super->constructor(
      iv_id                 = iv_id
      iv_nombre_completo    = iv_nombre_completo
      iv_anios_experiencia  = iv_anios_experiencia
      iv_dni                = iv_dni
      iv_telefono           = iv_telefono
      iv_salario_actual     = iv_salario_actual
      iv_salario_pretendido = iv_salario_pretendido ).

    num_certificaciones = iv_num_certificaciones.

  ENDMETHOD.

ENDCLASS.
