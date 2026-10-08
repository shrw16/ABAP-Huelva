CLASS zcl_area_icono DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_sadl_exit.
    INTERFACES if_sadl_exit_calc_element_read.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_area_icono IMPLEMENTATION.

METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  LOOP AT it_requested_calc_elements
       ASSIGNING FIELD-SYMBOL(<element>).

    CASE <element>.

      WHEN 'AREAICON'.

        APPEND 'AREAPROF'
          TO et_requested_orig_elements.

    ENDCASE.

  ENDLOOP.

ENDMETHOD.

METHOD if_sadl_exit_calc_element_read~calculate.

  LOOP AT it_original_data ASSIGNING FIELD-SYMBOL(<original>).

    ASSIGN COMPONENT 'AREAPROF'
      OF STRUCTURE <original>
      TO FIELD-SYMBOL(<area>).

    IF <area> IS NOT ASSIGNED.
      CONTINUE.
    ENDIF.

    READ TABLE ct_calculated_data
      ASSIGNING FIELD-SYMBOL(<calculated>)
      INDEX sy-tabix.

    IF <calculated> IS NOT ASSIGNED.
      CONTINUE.
    ENDIF.

    ASSIGN COMPONENT 'AREAICON'
      OF STRUCTURE <calculated>
      TO FIELD-SYMBOL(<icon>).

    IF <icon> IS NOT ASSIGNED.
      CONTINUE.
    ENDIF.

    "Utilizamos un CASE con los valores de AREA_PROF

    CASE <area>.

      WHEN 'DEV'.
        <icon> = 'sap-icon://arobase'.

      WHEN 'IA'.
        <icon> = 'sap-icon://ai'.

      WHEN 'QA'.
        <icon> = 'sap-icon://approvals'.

      WHEN 'UI/UX'.
        <icon> = 'sap-icon://palette'.

      WHEN 'RRHH'.
        <icon> = 'sap-icon://company-view'.

      WHEN 'LG'.
        <icon> = 'sap-icon://compare'.

      WHEN 'FI'.
        <icon> = 'sap-icon://loan'.

      WHEN 'ADM'.
        <icon> = 'sap-icon://action-settings'.

      WHEN OTHERS.
        <icon> = 'sap-icon://question-mark'.

    ENDCASE.

  ENDLOOP.

ENDMETHOD.

ENDCLASS.
