CLASS zcl_concierto_05 DEFINITION
  PUBLIC
  INHERITING FROM zcl_atraccion_05
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

  METHODS calcular_precio_entrada REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_concierto_05 IMPLEMENTATION.

  METHOD calcular_precio_entrada.

  IF consulta_visitantes( ) < 500.
      rv_precio_entrada = 10.
  ELSE.
      rv_precio_entrada = 5.
  ENDIF.
  ENDMETHOD.

ENDCLASS.

