CLASS zcl_cert_icon DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit .
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cert_icon IMPLEMENTATION.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~calculate.

    MOVE-CORRESPONDING it_original_data TO ct_calculated_data.

    LOOP AT it_original_data ASSIGNING FIELD-SYMBOL(<ls_data>).

    ASSIGN COMPONENT 'EMPLOYEEICON'
      OF STRUCTURE <ls_data>
      TO FIELD-SYMBOL(<lv_icon>).

    IF sy-subrc = 0.
      <lv_icon> = 'sap-icon://person-placeholder'.
    ENDIF.

  ENDLOOP.

  ct_calculated_data = CORRESPONDING #( it_original_data ).

ENDMETHOD.
ENDCLASS.
