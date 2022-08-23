CLASS zpip_cl_ext_call DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS:
      get_translation
        IMPORTING
          ip_pgname TYPE zpip_d_prod_grp-pgname
          ip_trcode TYPE zpip_d_product-trans_code
        EXPORTING
          ep_pgname_tr TYPE zpip_d_product-pgname_trans.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZPIP_CL_EXT_CALL IMPLEMENTATION.


  METHOD get_translation.
    DATA: lv_url     TYPE string VALUE 'https://dictionary.yandex.net/api/v1/dicservice.json/lookup?key=dict.1.1.20220623T143041Z.0b3203c74622ca3f.08be8078712fc4e5394443ad7949c34c37ebc57c&lang=en-',
          lv_tr_code LIKE ip_trcode.

    lv_tr_code = ip_trcode.
    TRANSLATE lv_tr_code+0(2) TO LOWER CASE.

    CONCATENATE lv_url
                lv_tr_code
                '&text='
                ip_pgname INTO lv_url.

    REPLACE ALL OCCURRENCES OF ` ` IN lv_url WITH '%20'.

    TRY.
      DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination(
                                                           cl_http_destination_provider=>create_by_url( i_url = lv_url )
                                                         ).
      DATA(lo_request) = lo_http_client->get_http_request( ).
      DATA(lo_response) = lo_http_client->execute( i_method = if_web_http_client=>get ).

      TYPES:
          BEGIN OF ls_tr,
            text TYPE string,
            pos  TYPE string,
          END OF ls_tr,
          lt_tr_table TYPE STANDARD TABLE OF ls_tr WITH EMPTY KEY,

          BEGIN OF ls_def,
            text TYPE string,
            pos  TYPE string,
            ts   TYPE string,
            tr   TYPE lt_tr_table,
          END OF ls_def,
          lt_result_table TYPE STANDARD TABLE OF ls_def WITH EMPTY KEY,

          BEGIN OF ls_complete_result_structure,
            head TYPE string,
            def  TYPE lt_result_table,
          END OF ls_complete_result_structure.

      DATA: ls_json TYPE ls_complete_result_structure.

      CALL METHOD /ui2/cl_json=>deserialize
                                  EXPORTING
                                    json         = lo_response->get_text( )
                                    pretty_name  = /ui2/cl_json=>pretty_mode-camel_case
                                    assoc_arrays = abap_true
                                  CHANGING
                                    data         = ls_json.

       CHECK ls_json IS NOT INITIAL.

       ep_pgname_tr  = ls_json-def[ 1 ]-tr[ 1 ]-text.

       TRANSLATE ep_pgname_tr+0(1) TO UPPER CASE.
    CATCH cx_web_http_client_error cx_http_dest_provider_error.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
