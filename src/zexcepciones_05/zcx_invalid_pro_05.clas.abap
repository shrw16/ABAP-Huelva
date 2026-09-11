CLASS zcx_invalid_pro_05 DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
  BEGIN OF nombre_vacio,
    msgid TYPE symsgid VALUE 'ZMSG_PRODUCTO_05',
    msgno TYPE symsgno VALUE '001',
    attr1 TYPE scx_attrname VALUE '',
    attr2 TYPE scx_attrname VALUE '',
    attr3 TYPE scx_attrname VALUE '',
    attr4 TYPE scx_attrname VALUE '',
  END OF nombre_vacio,

  BEGIN OF precio_negativo,
    msgid TYPE symsgid VALUE 'ZMSG_PRODUCTO_05',
    msgno TYPE symsgno VALUE '002',
    attr1 TYPE scx_attrname VALUE '',
    attr2 TYPE scx_attrname VALUE '',
    attr3 TYPE scx_attrname VALUE '',
    attr4 TYPE scx_attrname VALUE '',
  END OF precio_negativo,

  BEGIN OF stock_insuficiente,
    msgid TYPE symsgid VALUE 'ZMSG_PRODUCTO_05',
    msgno TYPE symsgno VALUE '003',
    attr1 TYPE scx_attrname VALUE '',
    attr2 TYPE scx_attrname VALUE '',
    attr3 TYPE scx_attrname VALUE '',
    attr4 TYPE scx_attrname VALUE '',
  END OF stock_insuficiente.

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcx_invalid_pro_05 IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    previous = previous
    ).
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
