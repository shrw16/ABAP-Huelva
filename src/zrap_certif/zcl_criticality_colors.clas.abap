CLASS zcl_criticality_colors DEFINITION

  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_criticality_colors IMPLEMENTATION.

  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA lt_data TYPE STANDARD TABLE OF zc_zcertificados
                 WITH DEFAULT KEY.

    lt_data = CORRESPONDING #( it_original_data ).

    DATA(lv_today) = cl_abap_context_info=>get_system_date( ).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<fs_data>).

      IF <fs_data>-FechaCad IS INITIAL.

        <fs_data>-DataCriticality = 0.

      ELSE.

        DATA(lv_days) = <fs_data>-FechaCad - lv_today.

        <fs_data>-DataCriticality =
          COND #(
            WHEN lv_days <= 7  THEN 1
            WHEN lv_days <= 15 THEN 2
            WHEN lv_days <= 30 THEN 3
            ELSE 5
          ).

      ENDIF.

    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_data ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

    LOOP AT it_requested_calc_elements
         ASSIGNING FIELD-SYMBOL(<fs_element>).

      CASE <fs_element>.

        WHEN 'DATACRITICALITY'.

          APPEND 'FECHACAD' TO et_requested_orig_elements.

      ENDCASE.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
