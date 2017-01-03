*&---------------------------------------------------------------------*
*&  Include           Z_DYNAMIC_SELECTION_SCREEN_S01
*&---------------------------------------------------------------------*
*         Declaration of selection screen
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-b01.

PARAMETERS:
  p_rbgl01 RADIOBUTTON GROUP b1 USER-COMMAND usr DEFAULT 'X',
  p_rbgl02 RADIOBUTTON GROUP b1,
  p_rbgl03 RADIOBUTTON GROUP b1.

SELECTION-SCREEN END OF BLOCK b1.


SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-b02.

PARAMETERS:
  p_ebeln TYPE ebeln MODIF ID b2.

SELECTION-SCREEN END OF BLOCK b2.


SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE text-b03.

PARAMETERS:
  p_matnr TYPE matnr MODIF ID b3.

SELECTION-SCREEN END OF BLOCK b3.


SELECTION-SCREEN BEGIN OF BLOCK b4 WITH FRAME TITLE text-b04.

PARAMETERS:
  p_vbeln TYPE vbeln_vl MODIF ID b4.

SELECTION-SCREEN END OF BLOCK b4.
