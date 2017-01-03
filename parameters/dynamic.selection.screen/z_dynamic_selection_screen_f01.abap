*&---------------------------------------------------------------------*
*&  Include           Z_DYNAMIC_SELECTION_SCREEN_F01
*&---------------------------------------------------------------------*
*         Declaration of subroutines
*----------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*&      Form  f_01_modify_selection_screen
*&---------------------------------------------------------------------*
*       Depending on the option selected displays the necessary
*       parameters
*----------------------------------------------------------------------*
FORM f_01_modify_selection_screen.

  LOOP AT SCREEN.

    IF ( p_rbgl01 EQ c_true AND ( screen-group1 = 'B3' OR screen-group1 = 'B4' ) )
      OR ( p_rbgl02 EQ c_true AND ( screen-group1 = 'B2' OR screen-group1 = 'B4' ) )
      OR ( p_rbgl03 EQ c_true AND ( screen-group1 = 'B2' OR screen-group1 = 'B3' ) ).
      screen-active = '0'.
      MODIFY SCREEN.
    ENDIF.

  ENDLOOP.

ENDFORM.                    " f_01_modify_selection_screen
