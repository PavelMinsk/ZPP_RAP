CLASS zbp_pip_change_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
*--------------------------------------------------------------------
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
*--------------------------------------------------------------------
  PROTECTED SECTION.
*--------------------------------------------------------------------
  PRIVATE SECTION.
    METHODS:
      change_phase,
      dell_market,
      dell_order.
*--------------------------------------------------------------------

ENDCLASS.



CLASS ZBP_PIP_CHANGE_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    me->change_phase( ).
*    me->dell_market( ).
*    me->dell_order( ).
  ENDMETHOD.


  METHOD change_phase.

    SELECT  *
        FROM zpip_d_product
        INTO TABLE @DATA(lt_tochange).

    LOOP AT lt_tochange TRANSPORTING NO FIELDS WHERE prod_uuid IS NOT INITIAL.
        lt_tochange[ sy-tabix  ]-phaseid = 1.
    ENDLOOP.

    MODIFY zpip_d_product FROM TABLE @lt_tochange.

  ENDMETHOD.


  METHOD dell_order.
    DELETE FROM zpip_d_mrkt_ordr WHERE order_uuid = '026A5CFF984C1EDBAD8F610CB748D6FC'.
  ENDMETHOD.


  METHOD  dell_market.
    DELETE FROM zpip_d_market WHERE mrktid = '8'.
  ENDMETHOD.
ENDCLASS.
