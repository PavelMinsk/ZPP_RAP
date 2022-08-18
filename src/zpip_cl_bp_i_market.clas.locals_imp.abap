CLASS lhc_Market DEFINITION INHERITING FROM cl_abap_behavior_handler.
**********************************************************************
  PRIVATE SECTION.


    METHODS validateMarket     FOR VALIDATE ON SAVE IMPORTING keys FOR Market~validateMarket.
    METHODS validateStartDate  FOR VALIDATE ON SAVE IMPORTING keys FOR Market~validateStartDate.
    METHODS validateEndDate    FOR VALIDATE ON SAVE IMPORTING keys FOR Market~validateEndDate.
    METHODS validateMarketDupl FOR VALIDATE ON SAVE IMPORTING keys FOR Market~validateMarketDupl.

    METHODS confirmMarketStatus FOR MODIFY IMPORTING keys FOR ACTION Market~confirmMarketStatus RESULT result.

    METHODS get_instance_features FOR INSTANCE FEATURES IMPORTING keys REQUEST requested_features FOR Market RESULT result.
    METHODS set_iso_code FOR DETERMINE ON SAVE IMPORTING keys FOR Market~set_iso_code.
**********************************************************************
ENDCLASS.

**********************************************************************
**********************************************************************

CLASS lhc_Market IMPLEMENTATION.
**********************************************************************
  METHOD validateMarket.

    DATA lt_marketID TYPE SORTED TABLE OF zpip_i_country WITH UNIQUE KEY Mrktid.

    READ ENTITIES OF zpip_i_product IN LOCAL MODE
      ENTITY Market
        FIELDS ( Mrktid )
          WITH CORRESPONDING #( keys )
      RESULT DATA(marketID).

    lt_marketID = CORRESPONDING #( marketID DISCARDING DUPLICATES MAPPING Mrktid = mrktid EXCEPT * ).

    SELECT FROM zpip_d_country
      FIELDS mrktid
        FOR ALL ENTRIES IN @lt_marketID
          WHERE mrktid = @lt_marketID-Mrktid
      INTO TABLE @DATA(lt_db_picked_mrktID).

    LOOP AT marketID ASSIGNING FIELD-SYMBOL(<fs_marketID>).
      APPEND VALUE #(
                      %tky = <fs_marketID>-%tky
                      %state_area = 'VALIDATE_MARKET'
                    )
                      TO reported-market.

      IF NOT line_exists( lt_db_picked_mrktID[ mrktid = <fs_marketID>-Mrktid ] ).
        APPEND VALUE #( %tky =  <fs_marketID>-%tky ) TO failed-market.
        APPEND VALUE #(
                        %tky        = <fs_marketID>-%tky
                        %state_area = 'VALIDATE_MARKET'
                        %msg        = NEW zcx_pip_product(
                                                           severity = if_abap_behv_message=>severity-error
                                                           textid   = zcx_pip_product=>market_not_exist
                                                           Mrktid   = <fs_marketID>-Mrktid
                                                         )
                        %element-Mrktid = if_abap_behv=>mk-on
                      )
                        TO reported-market.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.
**********************************************************************
  METHOD validatestartdate.

    DATA(lv_today) = cl_abap_context_info=>get_system_date( ).

    READ ENTITIES OF zpip_i_product IN LOCAL MODE
      ENTITY Market
        FIELDS ( Mrktid Startdate ) WITH CORRESPONDING #( keys )
      RESULT DATA(pickedStartdate).


    LOOP AT pickedStartdate ASSIGNING FIELD-SYMBOL(<fs_pickedStartdate>).
      APPEND VALUE #(
                      %tky        = <fs_pickedStartdate>-%tky
                      %state_area = 'VALIDATE_START_DATE'
                    )
                      TO reported-market.

      IF <fs_pickedStartdate>-Startdate < lv_today.
        APPEND VALUE #( %tky = <fs_pickedStartdate>-%tky ) TO failed-market.
        APPEND VALUE #(
                        %tky               = <fs_pickedStartdate>-%tky
                        %state_area        = 'VALIDATE_START_DATE'
                        %msg               = NEW zcx_pip_product(
                                                                  severity  = if_abap_behv_message=>severity-error
                                                                  textid    = zcx_pip_product=>start_date_before_system_date
                                                                  Startdate = <fs_pickedStartdate>-Startdate
                                                                )
                        %element-Startdate = if_abap_behv=>mk-on
                      )
                        TO reported-market.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.
**********************************************************************
  METHOD validateenddate.

    READ ENTITIES OF zpip_i_product IN LOCAL MODE
      ENTITY Market
        FIELDS ( Startdate Enddate ) WITH CORRESPONDING #( keys )
      RESULT DATA(pickeddates).


    LOOP AT pickeddates ASSIGNING FIELD-SYMBOL(<fs_pickeddates>).
      APPEND VALUE #(
                      %tky        = <fs_pickeddates>-%tky
                      %state_area = 'VALIDATE_END_DATE'
                    )
                      TO reported-market.

      IF <fs_pickeddates>-Startdate >= <fs_pickeddates>-Enddate and
         <fs_pickeddates>-Enddate IS NOT INITIAL.
        APPEND VALUE #( %tky = <fs_pickeddates>-%tky ) TO failed-market.
        APPEND VALUE #(
                        %tky               = <fs_pickeddates>-%tky
                        %state_area        = 'VALIDATE_END_DATE'
                        %msg               = NEW zcx_pip_product(
                                                                  severity  = if_abap_behv_message=>severity-error
                                                                  textid    = zcx_pip_product=>end_date_before_start_date
                                                                  Startdate = <fs_pickeddates>-Startdate
                                                                  Enddate   = <fs_pickeddates>-Enddate
                                                                )
                        %element-Startdate = if_abap_behv=>mk-on
                        %element-Enddate   = if_abap_behv=>mk-on
                      )
                        TO reported-market.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.
**********************************************************************
  METHOD validateMarketDupl.

    READ ENTITIES OF zpip_i_product IN LOCAL MODE
      ENTITY Market
        FIELDS ( Mrktid
                 ProdUuid ) WITH CORRESPONDING #( keys )
      RESULT DATA(marketID).

    SELECT FROM zpip_d_market
      FIELDS mrktid,
             prod_uuid
        FOR ALL ENTRIES IN @marketID
        WHERE mrktid    = @marketID-Mrktid
          AND prod_uuid = @marketID-ProdUuid
      INTO TABLE @DATA(lt_db_marketID).

    LOOP AT marketID ASSIGNING FIELD-SYMBOL(<fs_marketID>).
      IF line_exists( lt_db_marketID[
                                      mrktid    = <fs_marketID>-Mrktid
                                      prod_uuid = <fs_marketID>-ProdUuid
                                    ]
                    ).
        APPEND VALUE #( %tky = <fs_marketID>-%tky ) TO failed-market.
        APPEND VALUE #(
                        %tky            = <fs_marketID>-%tky
                        %state_area     = 'VALIDATE_MARKET_DUPL'
                        %element-Mrktid = if_abap_behv=>mk-on
                        %msg            = NEW zcx_pip_product(
                                                               severity = if_abap_behv_message=>severity-error
                                                               textid   = zcx_pip_product=>market_exists
                                                               Mrktid   = <fs_marketID>-Mrktid
                                                             )
                      ) TO reported-market.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.
**********************************************************************
  METHOD confirmMarketStatus.

    MODIFY ENTITIES OF zpip_i_product IN LOCAL MODE
      ENTITY Market
        UPDATE FIELDS ( Status )
          WITH VALUE #( FOR key IN keys
                          (
                            %tky = key-%tky
                            Status   = 'X'
                          )
                      )
      REPORTED reported.

    READ ENTITIES OF zpip_i_product IN LOCAL MODE
      ENTITY Market
        ALL FIELDS WITH VALUE #( FOR key IN keys
                                   ( %tky = key-%tky )
                               )
      RESULT DATA(lt_marketStatus).

      result = VALUE #( FOR ls_marketStatus IN lt_marketStatus
                          (
                            %tky   = ls_marketStatus-%tky
                            %param = ls_marketStatus
                          )
                      ).

  ENDMETHOD.
**********************************************************************
  METHOD get_instance_features.
    READ ENTITIES OF zpip_i_product IN LOCAL MODE
      ENTITY Market
         FIELDS ( Mrktid
                  Status ) WITH CORRESPONDING #( keys )
      RESULT    DATA(lt_marketStatus)
      FAILED failed.

    result = VALUE #( FOR ls_marketStatus IN lt_marketStatus
                        ( %tky                                  = ls_marketStatus-%tky
                          %features-%action-confirmMarketStatus = COND #( WHEN ls_marketStatus-Status = 'X'
                                                                          THEN if_abap_behv=>fc-o-disabled
                                                                          ELSE if_abap_behv=>fc-o-enabled  )
                        )
                    ).

  ENDMETHOD.
**********************************************************************
  METHOD set_iso_code.

    READ ENTITIES OF zpip_i_product IN LOCAL MODE
        ENTITY Market
          FIELDS ( Mrktid ) WITH CORRESPONDING #( keys )
        RESULT DATA(picedMarket).

    LOOP AT picedMarket ASSIGNING FIELD-SYMBOL(<fs_picedMarket>).

      SELECT SINGLE country
        FROM zpip_d_country
          WHERE mrktid = @<fs_picedMarket>-Mrktid
        INTO @DATA(ls_countryName).

      try.
        data(destination) = cl_soap_destination_provider=>create_by_url( i_url = 'http://webservices.oorsprong.org/websamples.countryinfo/CountryInfoService.wso').
        data(proxy) = new zpp_co_country_info_service_so(
                        destination = destination
                      ).
        data(request) = value zpp_country_isocode_soap_reque( s_country_name = ls_countryName ).
        proxy->country_isocode(
          exporting
            input = request
          importing
            output = data(response)
        ).
        catch cx_soap_destination_error.
        catch cx_ai_system_fault.
      endtry.

    ENDLOOP.

   IF response-country_isocode_result = 'No country found by that name' and
      <fs_picedMarket>-ISOCode <> SPACE.

     MODIFY ENTITIES OF zpip_i_product IN LOCAL MODE
       ENTITY Market
         UPDATE FIELDS ( ISOCode ) WITH VALUE #(
           FOR key IN keys (
             %tky    = <fs_picedMarket>-%tky
             ISOCode = SPACE
           )
         ).

   ELSEIF ( <fs_picedMarket>-ISOCode IS INITIAL
            OR <fs_picedMarket>-ISOCode <> response-country_isocode_result )
      AND response-country_isocode_result <> 'No country found by that name'.

     MODIFY ENTITIES OF zpip_i_product IN LOCAL MODE
       ENTITY Market
         UPDATE FIELDS ( ISOCode ) WITH VALUE #(
           FOR key IN keys (
             %tky = <fs_picedMarket>-%tky
             ISOCode = response-country_isocode_result
           )
         ).
   ENDIF.

  ENDMETHOD.
**********************************************************************

ENDCLASS.
