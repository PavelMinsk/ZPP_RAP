CLASS zpip_cl_call_scm_country_info DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
**********************************************************************
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

**********************************************************************
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZPIP_CL_CALL_SCM_COUNTRY_INFO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    try.
       data(destination) =
         cl_soap_destination_provider=>create_by_url( i_url = 'http://webservices.oorsprong.org/websamples.countryinfo/CountryInfoService.wso').

       data(proxy) =
         new zpp_co_country_info_service_so( destination = destination ).

       data(request) =
         value zpp_country_isocode_soap_reque( s_country_name = 'Japan' ).

       proxy->country_isocode(
         exporting
           input = request
         importing
           output = data(response)
       ).

       out->write( |{ response-country_isocode_result }| ).
       "handle response
       catch cx_soap_destination_error.
       "handle error
       catch cx_ai_system_fault.
       "handle error
       endtry.

  ENDMETHOD.
ENDCLASS.
