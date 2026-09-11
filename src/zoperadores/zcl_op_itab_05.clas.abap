CLASS zcl_op_itab_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_op_itab_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

TYPES: BEGIN OF ty_producto,
id TYPE i,
nombre TYPE string,
precio TYPE DECFLOAT34,
stock TYPE i,
END OF ty_producto.

DATA lt_productos TYPE TABLE OF ty_producto.

lt_productos = VALUE #(
( id = 1 nombre = 'Monitor' precio = 250 stock = 10 )
( id = 2 nombre = 'Teclado' precio = 50 stock = 20 )
( id = 3 nombre = 'Ratón'    precio = 25  stock = 30 )
( id = 4 nombre = 'Webcam'   precio = 80  stock = 15 )
).

* ID 2:
DATA(ls_producto) = lt_productos[ id = 2 ].

* ID 3
DATA(lv_nombre) = lt_productos[ id = 3 ]-nombre.

* ID 1:
DATA(lv_precio) = lt_productos[ id = 1 ]-precio.

* ID 4 ON ITAB:
DATA(ls_cuarta_fila) = lt_productos[ 4 ].

out->write( ls_producto ).
out->write( lv_nombre ).
out->write( lv_precio ).
out->write( ls_cuarta_fila ).

* CON TRY/CATCH:

TRY.

 DATA(ls_producto_fail) = lt_productos[ id = 99 ].

  CATCH cx_sy_itab_line_not_found.

    out->write( 'Producto inexistente' ).

ENDTRY.

*// USANDO OPTIONAL DEFAULT y LINE_EXISTS:

* line_exists: (Devuelve un boolean)

IF line_exists( lt_productos[ id = 99 ] ).

  DATA(ls_existe) = lt_productos[ id = 99 ].

  out->write( ls_existe-nombre ).
  ELSE.
  out->write( 'Producto inexistente' ).
  ENDIF.

* OPTIONAL:

DATA(ls_optional) = VALUE #( lt_productos[ id = 99 ] OPTIONAL ).

out->write( ls_optional-nombre ).

* DEFAULT:

DATA(ls_default) =
  VALUE #(
    lt_productos[ id = 99 ]

    DEFAULT VALUE #(
      id     = 0
      nombre = 'Producto nuevo'
      precio = 0
      stock  = 0
    )
  ).

out->write( ls_default-id - ls_default-nombre - ls_default-precio ).

ENDMETHOD.
ENDCLASS.
