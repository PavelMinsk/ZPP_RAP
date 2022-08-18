@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order'


define view entity zpip_i_order
  as select from   zpip_d_mrkt_ordr as MarketOrder

  association        to parent zpip_i_market      as _Market  on  $projection.MrktUuid = _Market.MrktUuid
                                                              and $projection.ProdUuid = _Market.ProdUuid

  association [1..1] to zpip_i_product            as _Product         on  $projection.ProdUuid = _Product.ProdUuid
  
  association [0..1] to zpip_i_business_partner_c as _BusinessPartner on  $projection.BusinessPartner = _BusinessPartner.BusinessPartner

{
  key prod_uuid        as ProdUuid,
  key mrkt_uuid        as MrktUuid,
  key order_uuid       as OrderUuid,
      orderid          as Orderid,
      quantity         as Quantity,
      calendar_year    as CalendarYear,
      delivery_date    as DeliveryDate,
      @Semantics.amount.currencyCode: 'Amountcurr'
      netamount        as Netamount,
      @Semantics.amount.currencyCode: 'Amountcurr'
      grossamount      as Grossamount,
      amountcurr       as Amountcurr,
      busspartner      as BusinessPartner,
      busspartnername  as BusinessPartnerName,
      busspartnergroup as BusinessPartnerGroup,
      @Semantics.user.createdBy: true
      created_by       as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      creation_time    as CreationTime,
      @Semantics.user.lastChangedBy: true
      changed_by       as ChangedBy,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      change_time      as ChangeTime,
      1                as OrderCount,

      /*Associasions*/
      _Market,
      _Product,
      _BusinessPartner

}
