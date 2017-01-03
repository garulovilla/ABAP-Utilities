*&---------------------------------------------------------------------*
*&  Include           Z_SIMPLE_REUSE_ALV_GRID_S01
*&---------------------------------------------------------------------*
*       Declaration of selection screen
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-b01.

SELECT-OPTIONS:
  s_ebeln FOR ekko-ebeln.

SELECTION-SCREEN END OF BLOCK b1.
