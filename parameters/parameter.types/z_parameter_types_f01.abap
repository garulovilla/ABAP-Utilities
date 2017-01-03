*&---------------------------------------------------------------------*
*&  Include           Z_PARAMETER_TYPES_F01
*&---------------------------------------------------------------------*
*       Declaración de subrutinas
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*&      Form  f_01_set_values_listbox
*&---------------------------------------------------------------------*
*       Coloca los valores para el listbox
*----------------------------------------------------------------------*
FORM f_01_set_values_listbox.

  DATA: values  TYPE vrm_values,
        value   TYPE vrm_value.

  value-key = '1'.
  value-text = 'Text 1'.
  APPEND value TO values.

  value-key = '2'.
  value-text = 'Text 2'.
  APPEND value TO values.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id              = 'P_LBGL01'
      values          = values
    EXCEPTIONS
      id_illegal_name = 0
      OTHERS          = 0.

ENDFORM.                    " f_01_set_values_listbox
