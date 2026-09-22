CLASS zcl_registros DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_registros IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA lt_certificados TYPE TABLE OF zzcertif.

  lt_certificados = VALUE #(

    ( nombre_emp     = 'Juan'
      apellidos_emp  = 'García López'
      nombre_cert    = 'Certificación SAP ABAP'
      org_emisor     = 'SAP'
      fecha_exp      = '20250115'
      fecha_cad      = '20280115'
      posicion_emp   = 'B'
      area_prof      = 'DEV' )

    ( nombre_emp     = 'María'
      apellidos_emp  = 'Fernández Martín'
      nombre_cert    = 'SAP Fiori Development'
      org_emisor     = 'SAP'
      fecha_exp      = '20250220'
      fecha_cad      = '20280220'
      posicion_emp   = 'M'
      area_prof      = 'DEV' )

    ( nombre_emp     = 'Carlos'
      apellidos_emp  = 'Rodríguez Sánchez'
      nombre_cert    = 'SAP S/4HANA Development'
      org_emisor     = 'SAP'
      fecha_exp      = '20250310'
      fecha_cad      = '20280310'
      posicion_emp   = 'I'
      area_prof      = 'DEV' )

    ( nombre_emp     = 'Laura'
      apellidos_emp  = 'Martínez Gómez'
      nombre_cert    = 'SAP Integration Suite'
      org_emisor     = 'SAP'
      fecha_exp      = '20250405'
      fecha_cad      = '20280405'
      posicion_emp   = 'S'
      area_prof      = 'DEV' )

    ( nombre_emp     = 'David'
      apellidos_emp  = 'Pérez Romero'
      nombre_cert    = 'SAP Analytics Cloud'
      org_emisor     = 'SAP'
      fecha_exp      = '20250512'
      fecha_cad      = '20280512'
      posicion_emp   = 'B'
      area_prof      = 'DEV' )

    ( nombre_emp     = 'Ana'
      apellidos_emp  = 'Navarro Díaz'
      nombre_cert    = 'Microsoft Azure Fundamentals'
      org_emisor     = 'MSFT'
      fecha_exp      = '20250618'
      fecha_cad      = '20280618'
      posicion_emp   = 'J'
      area_prof      = 'RRHH' )

    ( nombre_emp     = 'Miguel'
      apellidos_emp  = 'Torres Ruiz'
      nombre_cert    = 'AWS Cloud Practitioner'
      org_emisor     = 'AWS'
      fecha_exp      = '20250722'
      fecha_cad      = '20280722'
      posicion_emp   = 'J'
      area_prof      = 'DEV' )

    ( nombre_emp     = 'Elena'
      apellidos_emp  = 'Vázquez Moreno'
      nombre_cert    = 'Scrum Master Certified'
      org_emisor     = 'IBM'
      fecha_exp      = '20250814'
      fecha_cad      = '20280814'
      posicion_emp   = 'S'
      area_prof      = 'ADM' )

    ( nombre_emp     = 'Javier'
      apellidos_emp  = 'Jiménez Castro'
      nombre_cert    = 'ITIL Foundation'
      org_emisor     = 'IBM'
      fecha_exp      = '20250903'
      fecha_cad      = '20280903'
      posicion_emp   = 'M'
      area_prof      = 'QA' )

    ( nombre_emp     = 'Sara'
      apellidos_emp  = 'Morales Ortiz'
      nombre_cert    = 'SAP Business Technology Platform'
      org_emisor     = 'SAP'
      fecha_exp      = '20250925'
      fecha_cad      = '20280925'
      posicion_emp   = 'M'
      area_prof      = 'DEV' )

    ( nombre_emp     = 'Pablo'
      apellidos_emp  = 'Iglesias Molina'
      nombre_cert    = 'SAP HANA Database'
      org_emisor     = 'SAP'
      fecha_exp      = '20251010'
      fecha_cad      = '20281010'
      posicion_emp   = 'S'
      area_prof      = 'IA' )

    ( nombre_emp     = 'Lucía'
      apellidos_emp  = 'Santos Vidal'
      nombre_cert    = 'Google Cloud Digital Leader'
      org_emisor     = 'GOOG'
      fecha_exp      = '20251028'
      fecha_cad      = '20281028'
      posicion_emp   = 'B'
      area_prof      = 'DEV' )

    ( nombre_emp     = 'Daniel'
      apellidos_emp  = 'Ortega Prieto'
      nombre_cert    = 'SAP Activate Project Manager'
      org_emisor     = 'SAP'
      fecha_exp      = '20251105'
      fecha_cad      = '20281105'
      posicion_emp   = 'M'
      area_prof      = 'DEV' )

    ( nombre_emp     = 'Paula'
      apellidos_emp  = 'Rubio Herrera'
      nombre_cert    = 'SAP Fiori Elements'
      org_emisor     = 'SAP'
      fecha_exp      = '20251119'
      fecha_cad      = '20281119'
      posicion_emp   = 'S'
      area_prof      = 'DEV' )

    ( nombre_emp     = 'Sergio'
      apellidos_emp  = 'Méndez Cabrera'
      nombre_cert    = 'SAP ABAP RESTful Application'
      org_emisor     = 'SAP'
      fecha_exp      = '20251202'
      fecha_cad      = '20281202'
      posicion_emp   = 'B'
      area_prof      = 'DEV' )

    ( nombre_emp     = 'Clara'
      apellidos_emp  = 'Delgado León'
      nombre_cert    = 'Microsoft Power Platform'
      org_emisor     = 'MSFT'
      fecha_exp      = '20251215'
      fecha_cad      = '20281215'
      posicion_emp   = 'S'
      area_prof      = 'RRHH' )

    ( nombre_emp     = 'Alberto'
      apellidos_emp  = 'Campos Rey'
      nombre_cert    = 'AWS Solutions Architect'
      org_emisor     = 'AWS'
      fecha_exp      = '20260110'
      fecha_cad      = '20290110'
      posicion_emp   = 'S'
      area_prof      = 'ADM' )

    ( nombre_emp     = 'Nuria'
      apellidos_emp  = 'Ramos Flores'
      nombre_cert    = 'SAP Financial Accounting'
      org_emisor     = 'SAP'
      fecha_exp      = '20260122'
      fecha_cad      = '20290122'
      posicion_emp   = 'M'
      area_prof      = 'FI' )

    ( nombre_emp     = 'Alejandro'
      apellidos_emp  = 'Cortés Blanco'
      nombre_cert    = 'SAP Controlling'
      org_emisor     = 'SAP'
      fecha_exp      = '20260208'
      fecha_cad      = '20290208'
      posicion_emp   = 'B'
      area_prof      = 'FI' )

    ( nombre_emp     = 'Irene'
      apellidos_emp  = 'Fuentes Marín'
      nombre_cert    = 'SAP Human Capital Management'
      org_emisor     = 'SAP'
      fecha_exp      = '20260220'
      fecha_cad      = '20290220'
      posicion_emp   = 'B'
      area_prof      = 'RRHH' )

  ).

  INSERT zzcertif FROM TABLE @lt_certificados.

  IF sy-subrc = 0.
OUT->WRITE( 'Se han insertado 20 registros correctamente.' ).
  ELSE.
OUT->WRITE( 'Error al insertar los registros.' ).
  ENDIF.

  ENDMETHOD.
ENDCLASS.
