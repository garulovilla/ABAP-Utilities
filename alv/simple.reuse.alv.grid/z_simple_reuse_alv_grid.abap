*&---------------------------------------------------------------------*
*& Report Z_SIMPLE_REUSE_ALV_GRID.
*&---------------------------------------------------------------------*
* Program             : Z_SIMPLE_REUSE_ALV_GRID
* Description         :
* Developer           :
* Date                : DD.MM.AAAA
* Transportation order:
* Request ID          :
*&---------------------------------------------------------------------*
* Modifications
*&---------------------------------------------------------------------*
* Developer           :
* Date                : DD.MM.AAAA
* Transportation order:
* Request ID          :
* Description         :
*&---------------------------------------------------------------------*

REPORT z_simple_reuse_alv_grid.

*&---------------------------------------------------------------------*
*& Includes
*&---------------------------------------------------------------------*
INCLUDE z_simple_reuse_alv_grid_top.
INCLUDE z_simple_reuse_alv_grid_s01.
INCLUDE z_simple_reuse_alv_grid_f01.
INCLUDE z_simple_reuse_alv_grid_f02.

*&---------------------------------------------------------------------*
*& START-OF-SELECTION
*&---------------------------------------------------------------------*
START-OF-SELECTION.

  vg_error = c_false.
  vg_repid = sy-repid.

  PERFORM f_01_search_data.
  CHECK vg_error = c_false.

  PERFORM f_01_create_alv.
