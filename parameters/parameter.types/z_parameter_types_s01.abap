*&---------------------------------------------------------------------*
*&  Include           Z_PARAMETER_TYPES_S01
*&---------------------------------------------------------------------*
*       Declaración de pantalla de selección
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-b01.

PARAMETERS:
  p_ebeln   TYPE ebeln,
  p_ebeln2  TYPE ebeln OBLIGATORY,
  p_ebeln3  TYPE ebeln DEFAULT '3000000004'.

SELECTION-SCREEN END OF BLOCK b1.


SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-b02.

SELECT-OPTIONS:
  s_ebeln   FOR ekko-ebeln,
  s_ebeln2  FOR ekko-ebeln OBLIGATORY,
  s_ebeln3  FOR ekko-ebeln DEFAULT '3000000004'.

SELECTION-SCREEN END OF BLOCK b2.


SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE text-b03.

PARAMETERS:
  p_cbgl01 AS CHECKBOX,
  p_cbgl02 AS CHECKBOX DEFAULT 'X'.

SELECTION-SCREEN END OF BLOCK b3.


SELECTION-SCREEN BEGIN OF BLOCK b4 WITH FRAME TITLE text-b04.

PARAMETERS:
  p_rbgl01 RADIOBUTTON GROUP gr01 DEFAULT 'X',
  p_rbgl02 RADIOBUTTON GROUP gr01,
  p_rbgl03 RADIOBUTTON GROUP gr01.

SELECTION-SCREEN END OF BLOCK b4.


SELECTION-SCREEN BEGIN OF BLOCK b5 WITH FRAME TITLE text-b05.

PARAMETERS:
  p_lbgl01 AS LISTBOX VISIBLE LENGTH 20 OBLIGATORY DEFAULT '1'.

SELECTION-SCREEN END OF BLOCK b5.
