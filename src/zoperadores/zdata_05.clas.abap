CLASS zdata_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zdata_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*// COND Y CONV:


*    DATA(lv_precio_texto)   = '125'.
*    DATA(lv_cantidad_texto) = '4'.
*
*    DATA(lv_precio)   = CONV i( lv_precio_texto ).
*    DATA(lv_cantidad) = CONV i( lv_cantidad_texto ).
*
*    DATA(lv_importe_total) = ( lv_precio * lv_cantidad ).
*
*    out->write( |Precio original: { lv_precio_texto }| ).
*
*    out->write( |Precio convertido: { lv_precio }| ).
*
*    out->write( |Cantidad original: { lv_cantidad_texto }| ).
*
*    out->write( |Cantidad convertida: { lv_cantidad }| ).
*
*    out->write( |Importe total: { lv_importe_total }| ).

    "2)

*    DATA(lv_descuento_texto) = '10'.
*
*    DATA(lv_descuento) = CONV i( lv_descuento_texto ).
*
*    DATA(lv_importe_bruto) = ( lv_precio * lv_cantidad ).
*
*    DATA(lv_descuento_aplicado) = lv_importe_bruto * lv_descuento / 100.
*
*    DATA(lv_importe_final) = lv_importe_bruto - lv_descuento_aplicado.
*
*    out->write( |Importe bruto: { lv_importe_bruto }| ).
*
*    out->write( |Descuento aplicado: { lv_descuento_aplicado }| ).
*
*    out->write( |Importe final: { lv_importe_final }| ).

    "3)

*    DATA(lv_edad_texto) = '17'.
*
*    DATA(lv_edad) = CONV i( lv_edad_texto ).
*
*    DATA(lv_resultado_edad) = COND string(
*      WHEN lv_edad >= 18 THEN `Mayor de edad`
*      ELSE `Menor de edad`
*    ).
*
*    out->write( |Edad: { lv_edad }| ).
*
*    out->write( |Resultado: { lv_resultado_edad }| ).

**********************************************************************************************************************

*// CORRESPONDING: (Compartir campos iguales)

*    TYPES: BEGIN OF ty_empleado,
*             id           TYPE i,
*             nombre       TYPE string,
*             email        TYPE string,
*             telefono     TYPE string,
*             departamento TYPE string,
*             salario      TYPE i,
*           END OF ty_empleado.
*
*    TYPES tt_empleados TYPE STANDARD TABLE OF ty_empleado
*      WITH EMPTY KEY.
*
*    TYPES: BEGIN OF ty_contacto,
*             id       TYPE i,
*             nombre   TYPE string,
*             email    TYPE string,
*             telefono TYPE string,
*           END OF ty_contacto.
*
*    TYPES tt_contactos TYPE STANDARD TABLE OF ty_contacto
*      WITH EMPTY KEY.
*
*    DATA(lt_empleados) = VALUE tt_empleados(
*      ( id = 1
*        nombre = `Ana García`
*        email = `ana@empresa.es`
*        telefono = `111111111`
*        departamento = `Desarrollo`
*        salario = 28000 )
*
*      ( id = 2
*        nombre = `Carlos Pérez`
*        email = `carlos@empresa.es`
*        telefono = `222222222`
*        departamento = `Ventas`
*        salario = 32000 )
*
*      ( id = 3
*        nombre = `Marta López`
*        email = `marta@empresa.es`
*        telefono = `333333333`
*        departamento = `Administración`
*        salario = 26000 )
*    ).
*
*    DATA(lt_contactos) =
*      CORRESPONDING tt_contactos( lt_empleados ).
*
*    out->write( lt_empleados ).
*    out->write( lt_contactos ).


*********************************************************************************************************************

*// CORRESPONDING CON MAPPED Y EXCEPT:

TYPES: BEGIN OF ty_usuario,
       id_usuario TYPE i,
       nombre_completo TYPE string,
       correo TYPE string,
       telefono TYPE string,
       password TYPE string,
       salario TYPE string,
       END OF ty_usuario.

TYPES: BEGIN OF ty_ficha_publica,
       id TYPE i,
       nombre TYPE string,
       email TYPE string,
       telefono TYPE string,
       salario TYPE string,
       END OF ty_ficha_publica.

       DATA(ls_usuarios) = VALUE ty_usuario(
        id_usuario = 1
        nombre_completo = `Ana García`
        correo = `ana@empresa.es`
        telefono = `111111111`
        password = 'x1x2x3x4'
        salario = 28000 ).

      DATA(ls_ficha_publica) = CORRESPONDING ty_ficha_publica(
      ls_usuarios
      MAPPING
        id     = id_usuario
        nombre = nombre_completo
        email  = correo
      EXCEPT
        salario
    ).

    out->write( ls_usuarios ).
    out->write( ls_ficha_publica ).

ENDMETHOD.
ENDCLASS.
