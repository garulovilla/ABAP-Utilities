*&---------------------------------------------------------------------*
*&  Include           Z_SIMPLE_REUSE_ALV_GRID_F01
*&---------------------------------------------------------------------*
*       Declaration of subroutines
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*&      Form  f_01_search_data
*&---------------------------------------------------------------------*
*       Search data
*----------------------------------------------------------------------*
FORM f_01_search_data.

  SELECT p~ebeln p~ebelp p~matnr p~bukrs p~werks p~lgort p~menge p~meins
    FROM ekko AS k
    INNER JOIN ekpo AS p
      ON k~ebeln = p~ebeln
    INTO TABLE tg_alv
    WHERE k~ebeln IN s_ebeln
    ORDER BY p~ebeln.

  IF sy-subrc <> 0.
    vg_error = c_true.
    MESSAGE 'No hay datos para la selección' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.

ENDFORM.                    " f_01_search_data


*&---------------------------------------------------------------------*
*&      Form  f_01_create_alv
*&---------------------------------------------------------------------*
*       Create alv
*----------------------------------------------------------------------*
FORM f_01_create_alv.

  PERFORM:
    f_02_build_fieldcat,
    f_02_build_layout,
    f_02_build_sort,
    f_02_display_alv.

ENDFORM.                    " f_01_create_alv
