CLASS zcl_agency_model_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS get_agency
      IMPORTING
        i_agency_id     TYPE /dmo/agency_id
      RETURNING
        VALUE(r_agency) TYPE /dmo/agency
      RAISING
        zcx_05_agency.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_agency_model_05 IMPLEMENTATION.

  METHOD get_agency.

    SELECT SINGLE *
      FROM /dmo/agency
      WHERE agency_id = @i_agency_id
      INTO @r_agency.

*    IF sy-subrc <> 0.
*      RAISE EXCEPTION TYPE zcx_05_agency
*        EXPORTING
*          agency_id = i_agency_id.
*          ENDIF.

ENDMETHOD.
ENDCLASS.
