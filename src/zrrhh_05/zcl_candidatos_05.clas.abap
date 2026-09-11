CLASS zcl_candidatos_05 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA:
      id TYPE i,
      nombre_completo TYPE string,
      anios_experiencia TYPE i,
      dni TYPE string,
      telefono_personal TYPE string,
      salario_actual TYPE DECFLOAT34,
      salario_pretendido TYPE DECFLOAT34,
      puntuacion_entrevista TYPE i VALUE 0.

      METHODS constructor
      IMPORTING
        iv_id                TYPE i
        iv_nombre_completo   TYPE string
        iv_anios_experiencia TYPE i
        iv_dni               TYPE string
        iv_telefono          TYPE string
        iv_salario_actual    TYPE DECFLOAT34
        iv_salario_pretendido TYPE DECFLOAT34.

         METHODS calcular_idoneidad
         RETURNING VALUE(rv_idoneidad) TYPE DECFLOAT34.

         METHODS anadir_puntos_entrevista
         IMPORTING iv_puntos TYPE i.

         METHODS obtener_idoneidad_final
         RETURNING VALUE(rv_idoneidad_final) TYPE i.

         METHODS comparar_con
         IMPORTING io_otro TYPE REF TO zcl_candidatos_05
         RETURNING VALUE(rv_resultado) TYPE string.

         METHODS calcular_banda_salarial
         RETURNING VALUE(rv_banda) TYPE string.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_candidatos_05 IMPLEMENTATION.

  METHOD constructor.
    id                 = iv_id.
    nombre_completo    = iv_nombre_completo.
    anios_experiencia  = iv_anios_experiencia.
    dni                = iv_dni.
    telefono_personal  = iv_telefono.
    salario_actual     = iv_salario_actual.
    salario_pretendido = iv_salario_pretendido.
  ENDMETHOD.

  METHOD calcular_idoneidad.
  rv_idoneidad =  anios_experiencia * '0,5'.
  IF rv_idoneidad > 10.
      rv_idoneidad = 10.
  ENDIF.
  ENDMETHOD.

  METHOD anadir_puntos_entrevista.
  puntuacion_entrevista = puntuacion_entrevista + iv_puntos.
  ENDMETHOD.

  METHOD obtener_idoneidad_final.
  DATA(lv_idoneidad) = me->calcular_idoneidad( ).
  rv_idoneidad_final = round(
    val = lv_idoneidad + ( puntuacion_entrevista / 10 )
    dec = 0
  ).
  ENDMETHOD.

  METHOD comparar_con.
  DATA(lv_primera_idoneidad) =
      me->obtener_idoneidad_final( ).

  DATA(lv_segunda_idoneidad) =
      io_otro->obtener_idoneidad_final( ).

   rv_resultado = COND #(
   WHEN lv_primera_idoneidad > lv_segunda_idoneidad THEN me->nombre_completo
   WHEN lv_segunda_idoneidad > lv_primera_idoneidad THEN io_otro->nombre_completo
   ELSE 'EMPATE'
   ).
  ENDMETHOD.

  METHOD calcular_banda_salarial.

  DATA(lv_salario) = salario_pretendido.

  DATA(lv_inferior) = FLOOR( lv_salario / CONV DECFLOAT34( 5000 ) ) * ( 5000 ).

  DATA(lv_superior) = CEIL( lv_salario / CONV DECFLOAT34( 5000 ) ) * ( 5000 ).

    IF lv_inferior = lv_superior.
    lv_superior = lv_inferior + 5000.
    ELSE.
  ENDIF.

  rv_banda = |{ lv_inferior DECIMALS = 0 } - { lv_superior DECIMALS = 0 }|.

  ENDMETHOD.

METHOD if_oo_adt_classrun~main.

ENDMETHOD.
ENDCLASS.
