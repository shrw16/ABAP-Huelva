CLASS zcl_atraccion_05 DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        iv_nombre TYPE string.

    METHODS: recibir_visitante.

    METHODS: calcular_precio_entrada
      RETURNING VALUE(rv_precio_entrada) TYPE i.

    METHODS: consulta_visitantes
      RETURNING VALUE(total_visitantes) TYPE i.

    METHODS: consultar_nombre
      RETURNING VALUE(rv_nombre) TYPE string.

  PROTECTED SECTION.

    DATA:
      nombre          TYPE string,
      visitantes_dia  TYPE i.

  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_atraccion_05 IMPLEMENTATION.

  METHOD constructor.
    nombre = iv_nombre.
    visitantes_dia = 0.
  ENDMETHOD.

  METHOD recibir_visitante.
    visitantes_dia = visitantes_dia + 1.
  ENDMETHOD.

  METHOD calcular_precio_entrada.
    rv_precio_entrada = '10.00'.
  ENDMETHOD.

  METHOD consulta_visitantes.
    total_visitantes = visitantes_dia.
  ENDMETHOD.

  METHOD consultar_nombre.
    rv_nombre = nombre.
  ENDMETHOD.

ENDCLASS.

