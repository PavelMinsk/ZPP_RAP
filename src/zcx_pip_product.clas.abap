CLASS zcx_pip_product DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .
*********
  PUBLIC SECTION.
    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .

    CONSTANTS:
      BEGIN OF prod_group_unknown,
        msgid TYPE symsgid VALUE 'ZPIP_MSG_PRODUCT',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'PGID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF prod_group_unknown,

      BEGIN OF prod_dupl,
        msgid TYPE symsgid VALUE 'ZPIP_MSG_PRODUCT',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'PRODID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF prod_dupl,

      BEGIN OF prod_phase,
        msgid TYPE symsgid VALUE 'ZPIP_MSG_PRODUCT',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'PHASEID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF prod_phase,

      BEGIN OF prod_last_phase,
        msgid TYPE symsgid VALUE 'ZPIP_MSG_PRODUCT',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF prod_last_phase,

      BEGIN OF market_not_exist,
        msgid TYPE symsgid VALUE 'ZPIP_MSG_PRODUCT',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE 'MRKTID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF market_not_exist,

      BEGIN OF start_date_before_system_date,
        msgid TYPE symsgid VALUE 'ZPIP_MSG_PRODUCT',
        msgno TYPE symsgno VALUE '006',
        attr1 TYPE scx_attrname VALUE 'STARTDATE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF start_date_before_system_date,

      BEGIN OF end_date_before_start_date,
        msgid TYPE symsgid VALUE 'ZPIP_MSG_PRODUCT',
        msgno TYPE symsgno VALUE '007',
        attr1 TYPE scx_attrname VALUE 'STARTDATE',
        attr2 TYPE scx_attrname VALUE 'ENDDATE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF end_date_before_start_date,

      BEGIN OF market_exists,
        msgid TYPE symsgid VALUE 'ZPIP_MSG_PRODUCT',
        msgno TYPE symsgno VALUE '008',
        attr1 TYPE scx_attrname VALUE 'MRKTID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF market_exists,

      BEGIN OF invalid_delivery_date,
        msgid TYPE symsgid VALUE 'ZPIP_MSG_PRODUCT',
        msgno TYPE symsgno VALUE '009',
        attr1 TYPE scx_attrname VALUE 'STARTDATE',
        attr2 TYPE scx_attrname VALUE 'ENDDATE',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_delivery_date,

      BEGIN OF invalid_business_partner,
        msgid TYPE symsgid VALUE 'ZPIP_MSG_PRODUCT',
        msgno TYPE symsgno VALUE '010',
        attr1 TYPE scx_attrname VALUE 'BUSINESSPARTNER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_business_partner,

      BEGIN OF translation_info,
        msgid TYPE symsgid VALUE 'ZPIP_MSG_PRODUCT',
        msgno TYPE symsgno VALUE '011',
        attr1 TYPE scx_attrname VALUE 'lang',
        attr2 TYPE scx_attrname VALUE 'text_trans',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF  translation_info.

    METHODS constructor
      IMPORTING
        severity        TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid          LIKE if_t100_message=>t100key OPTIONAL
        previous        TYPE REF TO cx_root           OPTIONAL
        Pgid            TYPE zpip_pg_id               OPTIONAL
        Prodid          TYPE zpip_product_id          OPTIONAL
        Phaseid         TYPE zpip_phase_id            OPTIONAL
        Mrktid          TYPE zpip_market_id           OPTIONAL
        Startdate       TYPE zpip_start_date          OPTIONAL
        Enddate         TYPE zpip_end_date            OPTIONAL
        BusinessPartner TYPE zpip_business_partner    OPTIONAL
        lang            TYPE zpip_lang_code           OPTIONAL
        text_trans      TYPE zpip_pg_name             OPTIONAL.

    DATA Pgid            TYPE zpip_pg_id            READ-ONLY.
    DATA Prodid          TYPE zpip_product_id       READ-ONLY.
    DATA Phaseid         TYPE zpip_phase_id         READ-ONLY.
    DATA Mrktid          TYPE zpip_market_id        READ-ONLY.
    DATA Startdate       TYPE zpip_start_date       READ-ONLY.
    DATA Enddate         TYPE zpip_end_date         READ-ONLY.
    DATA BusinessPartner TYPE zpip_business_partner READ-ONLY.
    DATA lang            TYPE zpip_lang_code        READ-ONLY.
    DATA text_trans      TYPE zpip_pg_name          READ-ONLY.
*********

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCX_PIP_PRODUCT IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.

    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.
    me->Pgid                            = |{ Pgid   ALPHA = OUT }|.
    me->Prodid                          = |{ Prodid ALPHA = OUT }|.
    me->Phaseid                         = |{ Phaseid + 1 }|.
    me->Mrktid                          = |{ Mrktid ALPHA = OUT }|.
    me->Startdate                       = Startdate.
    me->Enddate                         = Enddate.
    me->BusinessPartner                 = |{ BusinessPartner ALPHA = OUT }|.
    me->lang                            = lang.
    me->text_trans                      = text_trans.

  ENDMETHOD.
ENDCLASS.
