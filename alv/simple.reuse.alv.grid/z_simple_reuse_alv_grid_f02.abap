*&---------------------------------------------------------------------*
*&  Include           Z_SIMPLE_REUSE_ALV_GRID_F02
*&---------------------------------------------------------------------*
*       Declaration of ALV subroutines
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*&      Form  f_02_build_fieldcat
*&---------------------------------------------------------------------*
*       Create alv fieldcatalog
*----------------------------------------------------------------------*
FORM f_02_build_fieldcat.

  DATA: vl_pos TYPE i VALUE 1.

  PERFORM f_02_add_fieldcat
  USING 'EBELN' 'Número documento de compras' 'KEY,NO_ZERO' CHANGING vl_pos.

  PERFORM f_02_add_fieldcat
  USING 'EBELP' 'Número de posición del documento de compras' 'KEY' CHANGING vl_pos.

  PERFORM f_02_add_fieldcat
  USING 'MATNR' 'Material' '' CHANGING vl_pos.

  PERFORM f_02_add_fieldcat
  USING 'BUKRS' 'Sociedad' '' CHANGING vl_pos.

  PERFORM f_02_add_fieldcat
  USING 'WERKS' 'Centro' '' CHANGING vl_pos.

  PERFORM f_02_add_fieldcat
  USING 'LGORT' 'Almacén' '' CHANGING vl_pos.

  PERFORM f_02_add_fieldcat
  USING 'MENGE' 'Cantidad de pedido' 'DO_SUM' CHANGING vl_pos.

  PERFORM f_02_add_fieldcat
  USING 'MEINS' 'Unidad de medida de pedido' '' CHANGING vl_pos.

ENDFORM.                    " f_02_build_fieldcat


*&---------------------------------------------------------------------*
*&      Form  f_02_build_layout
*&---------------------------------------------------------------------*
*       Create alv layout
*----------------------------------------------------------------------*
FORM f_02_build_layout.

  sg_layout-zebra = c_true.
  sg_layout-colwidth_optimize = c_true.

ENDFORM.                    " f_02_build_layout


*&---------------------------------------------------------------------*
*&      Form  f_02_build_sort
*&---------------------------------------------------------------------*
*       Create alv sort
*----------------------------------------------------------------------*
FORM f_02_build_sort.

  PERFORM f_02_add_sort USING 'EBELN' c_alv_sort_up.

ENDFORM.                    " f_02_build_sort


*&---------------------------------------------------------------------*
*&      Form  f_02_display_alv
*&---------------------------------------------------------------------*
*       Display alv
*----------------------------------------------------------------------*
FORM f_02_display_alv.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = vg_repid
      is_layout          = sg_layout
      it_fieldcat        = tg_fieldcat
      it_sort            = tg_sort
    TABLES
      t_outtab           = tg_alv
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.


ENDFORM.                    " f_02_display_alv


*&---------------------------------------------------------------------*
*&      Utilities
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*&      Form  f_02_add_fieldcat
*&---------------------------------------------------------------------*
*       Add new fields to fieldcat
*----------------------------------------------------------------------*
*      --> piv_fieldname    fieldname
*      --> piv_text         text
*      --> piv_props        properties
*      <-- pov_col_pos      col_pos
*----------------------------------------------------------------------*
FORM f_02_add_fieldcat USING piv_fieldname piv_text piv_props CHANGING pov_col_pos.

  DATA: tl_string TYPE STANDARD TABLE OF string.

  DATA: sl_fieldcat TYPE slis_fieldcat_alv,
        sl_string   TYPE string.

  FIELD-SYMBOLS: <vl_field> TYPE ANY.

  sl_fieldcat-fieldname = piv_fieldname.
  sl_fieldcat-seltext_m = piv_text.
  sl_fieldcat-col_pos   = pov_col_pos.

  IF piv_props <> ''.

    SPLIT piv_props AT ',' INTO TABLE tl_string.

    LOOP AT tl_string INTO sl_string.

      ASSIGN COMPONENT sl_string OF STRUCTURE sl_fieldcat TO <vl_field>.

      IF <vl_field> IS ASSIGNED.

        <vl_field> = 'X'.

      ENDIF.

    ENDLOOP.

  ENDIF.

  APPEND sl_fieldcat TO tg_fieldcat.

  pov_col_pos = pov_col_pos + 1.

ENDFORM.                    " f_02_add_fieldcat


*&---------------------------------------------------------------------*
*&      Form  f_02_add_sort
*&---------------------------------------------------------------------*
*       Add new field to sort
*----------------------------------------------------------------------*
*      --> piv_fieldname    fieldname
*----------------------------------------------------------------------*
FORM f_02_add_sort USING piv_fieldname piv_sort.

  DATA: sl_sort TYPE slis_sortinfo_alv.

  sl_sort-fieldname = piv_fieldname.

  CASE piv_sort.
    WHEN c_alv_sort_up.
      sl_sort-up = c_true.
    WHEN c_alv_sort_down.
      sl_sort-down = c_true.
  ENDCASE.

  APPEND sl_sort TO tg_sort.

ENDFORM.                    " f_02_add_sort
