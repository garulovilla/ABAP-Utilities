*&---------------------------------------------------------------------*
*& Report Z_PARAMETER_TYPES
*&---------------------------------------------------------------------*
* Programa            : Z_PARAMETER_TYPES
* Descripción         :
* Programador         :
* Fecha               : DD.MM.AAAA
* Orden de Transporte :
* ID requerimiento    :
*&---------------------------------------------------------------------*
* Modificaciones
*&---------------------------------------------------------------------*
* Programador         :
* Fecha               : DD.MM.AAAA
* Orden de Transporte :
* ID requerimiento    :
* Descripción					:
*&---------------------------------------------------------------------*

REPORT  z_parameter_types.

INCLUDE z_parameter_types_top.  " Declaración de variables
INCLUDE z_parameter_types_s01.  " Declaración de pantalla de selección
INCLUDE z_parameter_types_f01.  " Declaración de subrutinas

AT SELECTION-SCREEN OUTPUT.
  PERFORM f_01_set_values_listbox.
