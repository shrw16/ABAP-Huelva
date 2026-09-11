CLASS zcl_test_farmacia_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_test_farmacia_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

****************  FASE 1 | DATA, VALUE Y FINAL.
*// 1.1) Creación de la estructura que contendrá los datos de cada medicamento:

    TYPES: BEGIN OF ty_medicamento_datos,
             id                   TYPE i,
             nombre               TYPE string,
             laboratorio          TYPE string,
             precio               TYPE zdecimals2,
             stock                TYPE i,
             tipo                 TYPE c LENGTH 1,
             requiere_receta      TYPE abap_bool,
             principio_activo     TYPE string,
             coste_interno        TYPE zdecimals2,
             porcentaje_descuento TYPE i,
             nombre_comercial     TYPE string,
             recargo_marca        TYPE i,
           END OF ty_medicamento_datos.

*// 1.2. Definición de la tabla interna basada en la estructura anterior:

    TYPES tt_medicamentos_datos TYPE STANDARD TABLE OF ty_medicamento_datos WITH EMPTY KEY.

*// 1.3. Declaración y creación de la tabla que rellenaremos y que guardará los datos:
    DATA lt_medicamentos TYPE tt_medicamentos_datos.

*// 1.4. Rellenamos con VALUE y DATA:

    lt_medicamentos = VALUE #(

     ( id = 1
       nombre = 'Paracetamol'
       laboratorio = 'Cinfa'
       precio = '2.50'
       stock = 40
       tipo = 'G'
       requiere_receta = abap_false
       principio_activo = 'Paracetamol'
       coste_interno = '1.20'
       porcentaje_descuento = 0
       nombre_comercial = ''
       recargo_marca = 0 )

     ( id = 2
       nombre = 'Ibuprofeno'
       laboratorio = 'Kern Pharma'
       precio = '3.80'
       stock = 15
       tipo = 'G'
       requiere_receta = abap_false
       principio_activo = 'Ibuprofeno'
       coste_interno = '1.80'
       porcentaje_descuento = 0
       nombre_comercial = ''
       recargo_marca = 0 )

     ( id = 3
       nombre = 'Omeprazol'
       laboratorio = 'Cinfa'
       precio = '5.10'
       stock = 25
       tipo = 'G'
       requiere_receta = abap_false
       principio_activo = 'Omeprazol'
       coste_interno = '2.50'
       porcentaje_descuento = 0
       nombre_comercial = ''
       recargo_marca = 0 )

     ( id = 4
       nombre = 'Amoxicilina'
       laboratorio = 'GSK'
       precio = '6.20'
       stock = 8
       tipo = 'M'
       requiere_receta = abap_true
       principio_activo = 'Amoxicilina + clavulánico'
       coste_interno = '3.10'
       porcentaje_descuento = 0
       nombre_comercial = ''
       recargo_marca = 0 )

     ( id = 5
       nombre = 'Acenocumarol'
       laboratorio = 'Viatris'
       precio = '4.90'
       stock = 3
       tipo = 'M'
       requiere_receta = abap_true
       principio_activo = 'Acenocumarol'
       coste_interno = '2.20'
       porcentaje_descuento = 0
       nombre_comercial = ''
       recargo_marca = 0 )

     ( id = 6
       nombre = 'Salbutamol'
       laboratorio = 'GSK'
       precio = '6.00'
       stock = 0
       tipo = 'M'
       requiere_receta = abap_true
       principio_activo = 'Salbutamol'
       coste_interno = '3.50'
       porcentaje_descuento = 0
       nombre_comercial = ''
       recargo_marca = 0 )

   ).

*// 1.5. Comprobamos y mostramos por pantalla la tabla con los medicamentos agregados:

    out->write( lt_medicamentos ).




**************** FASE 2 | SWITCH, COND Y XSDOOL.
*// 2.1. Creamos una nueva tabla interna a partir de lt_medicamentos, con una estructura con 5 registros:

    TYPES: BEGIN OF ty_fase2,
             nombre         TYPE string,
             stock          TYPE i,
             estado         TYPE string,
             tipo           TYPE string,
             disponibilidad TYPE abap_bool,
           END OF ty_fase2.

    TYPES tt_fase2 TYPE TABLE OF ty_fase2 WITH EMPTY KEY.

    DATA(lt_fase2) = VALUE tt_fase2(
        FOR ls_medicamento IN lt_medicamentos
            ( nombre = ls_medicamento-nombre
              stock = ls_medicamento-stock

   " Definición de la categoría STOCK usando COND:

     estado = COND #(
       WHEN ls_medicamento-stock >= 30 THEN 'STOCK ALTO.'
       WHEN ls_medicamento-stock >= 10 THEN 'STOCK MEDIO.'
       WHEN ls_medicamento-stock >= 1 THEN 'STOCK BAJO.'
       ELSE 'SIN STOCK.' )

*// 2.2. Descripción del tipo con SWITCH:

   tipo = SWITCH string(
                     ls_medicamento-tipo
                     WHEN 'G' THEN 'General.'
                     WHEN 'M' THEN 'Marca.'
                     WHEN 'H' THEN 'Hospitalario.'
                     ELSE 'Desconocido.' )

*// 2.3: Disponiblidad con XSDBOOL:

   disponibilidad = xsdbool(
           ls_medicamento-stock > 0
           AND
           ls_medicamento-precio > 0 )
                           )
                   ).

    out->write(  lt_fase2 ).




**************** FASE 3 | CONV Y FUNCIONES CEIL, FLOOR, TRUNC Y ROUND.
*// 3.1: Declaramos las variables como string para luego poder convertirlas, así como otra variable resultado,
*        donde guardaremos la conversión y la operación:

    DATA lv_cantidad_texto TYPE string VALUE '12'.
    DATA lv_precio_texto TYPE string VALUE '3.50'.
    DATA lv_resultado TYPE zdecimals2.

    "Convertimos su valor colocando CONV (tipo) antes de la variable a convertir:

    lv_resultado = CONV zdecimals2( lv_cantidad_texto ) * CONV zdecimals2( lv_precio_texto ).

    out->write( |Precio: { lv_resultado } | ).


*// 3.2: De entero a decimal y viceversa usando el CONV:

    out->write( 'De entero a decimal:  ' && CONV zdecimals2( 25 ) ).
    out->write( 'De decimal a entero:  ' && CONV i( '25.80' ) ).

*// 3.3: TRUNC, CEIL, FLOOR y ROUND. Con números positivos y negativos:

    "Numeros posiivos:

    out->write( 'ROUND:  ' && CONV string( round( val = '25.80' dec = 0 ) ) ).
    out->write( 'TRUNC:  ' && CONV string( trunc( '25.80' ) ) ).
    out->write( 'CEIL:  ' && CONV string( ceil( '25.80' ) ) ).
    out->write( 'FLOOR:  ' && CONV string( floor( '25.80' ) ) ).

    "Números negativos:

    out->write( 'ROUND: ' && CONV string( round( val = '-25.80' dec = 0 ) ) ).
    out->write( 'TRUNC:  ' && CONV string( trunc( '-25.80' ) ) ).
    out->write( 'CEIL:  ' && CONV string( ceil( '-25.80' ) ) ).
    out->write( 'FLOOR:  ' && CONV string( floor( '-25.80' ) ) ).




**************** FASE 4 | EXACT Y EXCEPCIONES.
*// 4.1: EXACT correcto e incorrecto:

    out->write( 'EXACT:  ' && CONV string( EXACT i( '25.00' ) ) ).

    TRY.
        out->write( 'EXACT:  ' && CONV string( EXACT i( '25.75' ) ) ).
      CATCH cx_sy_conversion_error.
        out->write( 'NO SE PUEDE CONVERTIR 25,75 SIN PERDER INFORMACIÓN' ).
    ENDTRY.




***************** FASE 5 | EXPRESIONES DE TABLA.

    TRY.
        out->write( lt_medicamentos[ id = 3 ] ).

        out->write( lt_medicamentos[ id = 4 ] ).

        out->write( lt_medicamentos[ id = 4 ]-nombre ).

        out->write( lt_medicamentos[ id = 2 ]-precio ).

        out->write( lt_medicamentos[ 1 ] ).

        out->write( lt_medicamentos[ 99 ] ).

      CATCH cx_sy_itab_line_not_found.
        out->write( 'MEDICAMENTO NO ENCONTRADO' ).
    ENDTRY.




**************** FASE 6 | line_exists, OPTIONAL, DEFAULT y line_index.

    IF line_exists( lt_medicamentos[ id = 5 ] ).
      out->write( 'Existe' ).
    ELSE .
      out->write( 'No Existe' ).
    ENDIF.

    out->write( COND string(
        WHEN line_exists( lt_medicamentos[ id = 99 ] ) THEN 'Existe'
        ELSE 'No Existe'
        ) ).

    out->write( VALUE ty_medicamento_datos( lt_medicamentos[ id = 99 ] OPTIONAL ) ).
    out->write( VALUE ty_medicamento_datos( lt_medicamentos[ id = 99 ]
        DEFAULT VALUE ty_medicamento_datos(
            nombre = 'MEDICAMENTO NO ENCONTRADO' ) ) ).

    out->write( line_index( lt_medicamentos[ id = 3 ] ) ).
    out->write( line_index( lt_medicamentos[ id = 99 ] ) ).




**************** FASE 7. CORRESPONDING, MAPPING Y EXCEPT.
*// 7.1: Estructura con su correspondiente tabla:

    TYPES: BEGIN OF ty_medicamento_publico,
             id          TYPE i,
             nombre      TYPE string,
             laboratorio TYPE string,
             precio      TYPE zdecimals2,
             stock       TYPE i,
           END OF ty_medicamento_publico.

    TYPES tt_medicamentos_publicos TYPE TABLE OF ty_medicamento_publico.

*// 7.2: CORRESPONDING entre tablas:

    DATA(lt_medicamentos_publicos) = CORRESPONDING tt_medicamentos_publicos( lt_medicamentos ).

    out->write( lt_medicamentos_publicos ).

*// 7.3: Creamos la estructura TY_MEDICAMENTO_EXTERNO con su tabla interna para convertir los datos con MAPPING y CORRESPONDING:

    TYPES: BEGIN OF ty_medicamento_externo,
             codigo      TYPE i,
             descripcion TYPE string,
             fabricante  TYPE string,
             precio      TYPE zdecimals2,
             unidades    TYPE i,
           END OF ty_medicamento_externo.

    TYPES tt_medicamentos_externos TYPE TABLE OF ty_medicamento_externo.
    DATA(lt_medicamentos_externos) = CORRESPONDING tt_medicamentos_externos(
            lt_medicamentos
            MAPPING
                Codigo = id
                descripcion = nombre
                fabricante = laboratorio
                unidades = stock
            ).

    out->write( lt_medicamentos_externos ).

*// 7.4: EXCEPT: Creamos nueva estructura TY_MEDICAMENTO_AUDITORIA para convertir con EXCEPT e impedir que coste_interno sea copiado.

    TYPES: BEGIN OF ty_medicamento_auditoria,
             id            TYPE i,
             nombre        TYPE string,
             precio        TYPE zdecimals2,
             coste_interno TYPE zdecimals2,
           END OF ty_medicamento_auditoria.

    TYPES tt_medicamentos_auditoria TYPE TABLE OF ty_medicamento_auditoria.

    DATA(lt_medicamentos_auditoria) = CORRESPONDING tt_medicamentos_auditoria(
                                      lt_medicamentos
                                        EXCEPT
                                      coste_interno ).

    out->write( lt_medicamentos_auditoria ).




***************** FASE 8 | BASE.
*// 8.1: Actualizar medicamento sin modificar el original.

    DATA(ls_medicamento_ibup) = lt_medicamentos[ id = 2 ].

    DATA(ls_medicamento_ibup_act) = VALUE ty_medicamento_datos(
                BASE
                ls_medicamento_ibup
                stock = 35 ).

    out->write( ls_medicamento_ibup ).

    out->write( ls_medicamento_ibup_act ).




***************** FASE 9 | FOR - IN.
*// 9.1: Estructura y tabla resumen con FOR-IN:

    TYPES: BEGIN OF ty_resumen_medicamento,
             id     TYPE i,
             nombre TYPE string,
             precio TYPE zdecimals2,
             stock  TYPE i,
           END OF ty_resumen_medicamento.

    TYPES tt_resumen_medicamentos TYPE TABLE OF ty_resumen_medicamento WITH EMPTY KEY.

    DATA(lt_resumen) = VALUE tt_resumen_medicamentos(
     FOR ls_medicamento IN lt_medicamentos (
        id = ls_medicamento-id
        nombre = ls_medicamento-nombre
        precio = ls_medicamento-precio
        stock = ls_medicamento-stock ) ).

*// 9.2: Construcción similar pero con FOR-CORESPOONDING:

    lt_medicamentos_publicos = VALUE #(
         FOR ls_medicamento IN lt_medicamentos (
            CORRESPONDING #( ls_medicamento )
                        )
             ).

    " Mostramos por pantalla ambas tablas:

    out->write( 'TABLA FOR-IN' ).
    out->write( lt_resumen ).
    out->write( 'TABLA FOR-CORRESPONDING' ).
    out->write( lt_medicamentos_publicos ).




***************** FASE 10 | LET-IN.
*// 10.1: Valor económico del stock por medicamento:

    TYPES: BEGIN OF ty_valor_stock,
             id            TYPE i,
             nombre        TYPE string,
             subtotal      TYPE zdecimals2,
             iva           TYPE zdecimals2,
             total_con_iva TYPE zdecimals2,
           END OF ty_valor_stock.

    TYPES tt_valor_stock TYPE TABLE OF ty_valor_stock WITH EMPTY KEY.

    DATA(lt_valor_stock) = VALUE tt_valor_stock(
     FOR ls_medicamento IN lt_medicamentos

            LET
                lv_subtotal = CONV zdecimals2( ls_medicamento-precio * ls_medicamento-stock )
                lv_iva = CONV zdecimals2( lv_subtotal * '0.04' )
                lv_total = CONV zdecimals2( lv_subtotal + lv_iva )
            IN (
                id = ls_medicamento-id
                nombre = ls_medicamento-nombre
                subtotal = lv_subtotal
                iva = lv_iva
                total_con_iva = lv_total )
            ).

    out->write( lt_valor_stock ).




***************** FASE 11 | SORTED TABLE / UNIQUE AND NON-UNIQUE KEYS.
*// 11.1: Tabla ordenada por stock:

    TYPES: tt_medicamentos_por_stock TYPE SORTED TABLE OF ty_medicamento_datos WITH NON-UNIQUE KEY stock.

    DATA(lt_medicamentos_por_stock) = VALUE tt_medicamentos_por_stock(
                FOR ls_medicamentos IN lt_medicamentos_publicos (
                CORRESPONDING #( ls_medicamentos )
                )
    ).

    out->write(  lt_medicamentos_por_stock ).


*// 11.2: Clave compuesta SORTED por laboratorio y nombre:

    TYPES: tt_medicamentos_por_nom_lab TYPE SORTED TABLE OF ty_medicamento_datos
                        WITH NON-UNIQUE KEY laboratorio nombre.

    DATA(lt_medicamentos_por_nom_lab) = VALUE tt_medicamentos_por_nom_lab(
    FOR ls_medicamentos IN lt_medicamentos_publicos (
    CORRESPONDING #( ls_medicamentos )
                    )
    ).

    out->write( lt_medicamentos_por_nom_lab ).


*// 11.3: Agregamos una clave secundaria basada en por_nombre:

    TYPES tt_por_nombre TYPE STANDARD TABLE OF ty_medicamento_datos
      WITH EMPTY KEY
      WITH NON-UNIQUE SORTED KEY por_nombre
      COMPONENTS nombre.

    DATA(lt_sorted_por_nombre) = CORRESPONDING tt_por_nombre( lt_medicamentos ).

    DATA(ls_sorted_por_nombre) =
      lt_sorted_por_nombre[
        KEY por_nombre
        COMPONENTS nombre = 'OMEPRAZOL'
      ].

    out->write( | ID: { ls_sorted_por_nombre-id } | ).




***************** FASE 12 | FILTER.
*// 12.1: Tabla ordenada por número de stock:

    "Reutilizamos la tabla SORTED del apartado 11.1 --> LT_MEDICAMENTOS_POR_STOCK:

    out->write( '-------------------------------------------------- MEDICAMENTOS CON STOCK BAJO --------------------------------------------------' ).
    out->write( FILTER #( lt_medicamentos_por_stock WHERE stock <= 10 ) ).
    out->write(  '-------------------------------------------------- MEDICAMENTOS CON STOCK SUPERIOR A 10 --------------------------------------------------' ).
    out->write( FILTER #( lt_medicamentos_por_stock WHERE stock > 10 ) ).




***************** FASE 13 | REDUCE.
*// 13.1: Reutilizamos la misma tabla y, a través del REDUCE obtenemos el total de unidades almacenadas.

    out->write( 'TOTAL UNIDADES: ' && REDUCE i(
           INIT total = 0
           FOR ls_medicamento IN lt_medicamentos_por_stock
           NEXT total += ls_medicamento-stock )
       ).

*// 13.2: Calcular el valor total del inventario (todos los medicamentos) utilizando REDUCE:

    DATA(lv_total_inventario) = REDUCE zdecimals2(
         INIT total_inventario = CONV zdecimals2( '0.00' )
         FOR ls_medicamento IN lt_medicamentos_por_stock
         NEXT total_inventario = total_inventario +
             CONV zdecimals2( ls_medicamento-precio * ls_medicamento-stock )
     ).

    out->write( |VALOR TOTAL DEL INVENTARIO: { lv_total_inventario } €| ).

*// 13.3: Calcular el valor total del inventario cuyo STOCK sea superior a 10 (medicamentos apartado 12.1):

    FINAL(lv_valor_stock_sup10) = REDUCE zdecimals2(
            INIT total_inventario = CONV zdecimals2( '0.00' )
            FOR ls_medicamento IN lt_medicamentos_por_stock
            WHERE ( nombre = 'Paracetamol' OR nombre = 'Ibuprofeno' OR nombre = 'Omeprazol' )
            NEXT total_inventario = total_inventario +
                CONV zdecimals2( ls_medicamento-precio * ls_medicamento-stock )
        ).

    out->write( |VALOR TOTAL TOMANDO STOCK >10: { lv_valor_stock_sup10 } €| ).

***************** FASE 14 | NEW / POLIMORFISMO.

*// 14.1 | Crear seis nuevos medicamentos con DATA y NEW:

    " 3 nuevos medicamentos genéricos (ZCL_MED_GENERICO_05):

    DATA(lo_paracetamol) = NEW zcl_med_generico_05(
      iv_id = 1  iv_nombre = 'Paracetamol'  iv_laboratorio = 'Cinfa'
      iv_precio = '2.50'  iv_stock = 40  iv_requiere_receta = abap_false
      iv_principio_activo = 'Paracetamol'  iv_porcentaje_descuento = '10' ).

    DATA(lo_ibuprofeno) = NEW zcl_med_generico_05(
      iv_id = 2  iv_nombre = 'Ibuprofeno'  iv_laboratorio = 'Kern Pharma'
      iv_precio = '3.80'  iv_stock = 15  iv_requiere_receta = abap_false
      iv_principio_activo = 'Ibuprofeno'  iv_porcentaje_descuento = '5' ).

    DATA(lo_omeprazol) = NEW zcl_med_generico_05(
      iv_id = 3  iv_nombre = 'Omeprazol'  iv_laboratorio = 'Cinfa'
      iv_precio = '5.10'  iv_stock = 25  iv_requiere_receta = abap_false
      iv_principio_activo = 'Omeprazol'  iv_porcentaje_descuento = '20' ).

    " 3 nuevos medicamentos de marca (ZCL_MED_MARCA_05):

    DATA(lo_amoxicilina) = NEW zcl_med_marca_05(
      iv_id = 4  iv_nombre = 'Amoxicilina'  iv_laboratorio = 'GSK'
      iv_precio = '6.20'  iv_stock = 8  iv_requiere_receta = abap_true
      iv_principio_activo = 'Amoxicilina + clavulánico' iv_porcentaje_descuento = '10'
      iv_nombre_comercial = 'Augmentine'  iv_recargo_marca = 10 ).

    DATA(lo_acenocumarol) = NEW zcl_med_marca_05(
      iv_id = 5  iv_nombre = 'Acenocumarol'  iv_laboratorio = 'Viatris'
      iv_precio = '4.90'  iv_stock = 3  iv_requiere_receta = abap_true
      iv_principio_activo = 'Acenocumarol' iv_porcentaje_descuento = '7'
      iv_nombre_comercial = 'Sintrom'  iv_recargo_marca = 20 ).

    DATA(lo_salbutamol) = NEW zcl_med_marca_05(
      iv_id = 6  iv_nombre = 'Salbutamol'  iv_laboratorio = 'GSK'
      iv_precio = '6.00'  iv_stock = 0  iv_requiere_receta = abap_true
      iv_principio_activo = 'Salbutamol' iv_porcentaje_descuento = '15'
      iv_nombre_comercial = 'Ventolin'  iv_recargo_marca = 15 ).

*// 14.2 | Tabla de referencias para guardar los medicamentos creados:

    TYPES: tt_obj_medicamentos_05 TYPE STANDARD TABLE OF REF TO zmedicamento_05 WITH EMPTY KEY.

    DATA(lt_obj_medicamentos_05) = VALUE tt_obj_medicamentos_05(
    ( lo_paracetamol )
    ( lo_ibuprofeno )
    ( lo_omeprazol )
    ( lo_amoxicilina )
    ( lo_acenocumarol )
    ( lo_salbutamol )
    ).

    out->write( lt_obj_medicamentos_05 ).


*// 14.3 | Probar UPCAST de la clase padre:

    LOOP AT lt_obj_medicamentos_05 INTO DATA(lo_medicamento).
      out->write( | Fármaco: { lo_medicamento->nombre } Importe: { lo_medicamento->calcular_precio_final( ) } € | ).
    ENDLOOP.


**************** FASE 15 | CAST.
*// 15.1: Comprobar si un medicamento es genérico:

    DATA(lo_med_obj1) = lt_obj_medicamentos_05[ 1 ].

    IF lo_med_obj1 IS INSTANCE OF zcl_med_generico_05.
      DATA(lo_generico_id1) = CAST zcl_med_generico_05( lo_med_obj1 ).
      out->write( | Descuento: { lo_generico_id1->porcentaje_descuento } % | ).
    ELSE.
      out->write( 'ID 1 no es un medicamento genérico' ).
    ENDIF.


*// 15.2: Comprobar si un medicamento es de marca:

    DATA(lo_med_obj5) = lt_obj_medicamentos_05[ 5 ].

    IF lo_med_obj5 IS INSTANCE OF zcl_med_marca_05.
      DATA(lo_marca_id5) = CAST zcl_med_marca_05( lo_med_obj5 ).
      out->write( | Nombre Comercial: { lo_marca_id5->nombre_comercial } - Recargo Marca: { lo_marca_id5->recargo_marca } | ).
    ELSE.
      out->write( 'ID 5 no es un medicamento de marca.' ).
    ENDIF.


*// 15.3: Conversión fallida entre clases hermanas capturada por un TRY/CATCH:

    "UPCAST ZMEDICAMENTO_05 (padre):

    TRY.
        DATA(lo_cast_medicamento) = CAST zmedicamento_05( lo_med_obj1 ).
        out->write( 'Conversión realizada correctamente' ).
      CATCH cx_sy_move_cast_error.
        out->write( 'NO SE PUEDE CONVERTIR UN GENÉRICO EN UN MEDICAMENTO DE MARCA' ).
    ENDTRY.

    "CAST ZCL_MED_MARCA_05:

    TRY.
        DATA(lo_cast_marca) = CAST zcl_med_marca_05( lo_med_obj1 ).
        out->write( 'Conversión realizada correctamente' ).

      CATCH cx_sy_move_cast_error.
        out->write( 'NO SE PUEDE CONVERTIR UN GENÉRICO EN UN MEDICAMENTO DE MARCA' ).

    ENDTRY.




*************** FASE 16 | POLIMORFISMO / REDEFINITION.
*// 16.1: CALCULAR_PRECIO_FINAL:

    CLEAR lo_medicamento.
    LOOP AT lt_obj_medicamentos_05 INTO lo_medicamento.
      out->write( |{ lo_medicamento->nombre } - Importe: { lo_medicamento->calcular_precio_final( ) } €| ).
    ENDLOOP.




**************** FASE 17 | REF TO.
*// 17.1: Referencia y modificación de una fila, creando para ello una tabla copia de la inicial:

    DATA(lt_copia_medicamentos) = lt_medicamentos.
    DATA(lo_ref) = REF #( lt_copia_medicamentos[ id = 2 ] ).

    lo_ref->stock = 99.

    out->write( '-----------------TABLA ANTES DEL REF----------' ).
    out->write( lt_medicamentos ).
    out->write( '-----------------TABLA CON EL REF----------------' ).
    out->write( lt_copia_medicamentos ).

  ENDMETHOD.
ENDCLASS.
