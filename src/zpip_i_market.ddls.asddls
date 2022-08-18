@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic CDS view for market'

define view entity zpip_i_market
  as select from zpip_d_market as Market

  association        to parent zpip_i_product as _Product on $projection.ProdUuid = _Product.ProdUuid

  composition [0..*] of zpip_i_order          as _MarketOrder

  association [1..1] to zpip_i_country        as _Country    on $projection.Mrktid   = _Country.Mrktid
  association [1..1] to zpip_i_order_aggr     as _OrderAggr  on $projection.MrktUuid = _OrderAggr.MrktUuid
  association [1..1] to zpip_i_order_ch       as _OrderChart on $projection.ProdUuid = _OrderChart.ProdUuid and
                                                                $projection.MrktUuid = _OrderChart.MrktUuid
  
  

{
  key prod_uuid                    as ProdUuid,
  key mrkt_uuid                    as MrktUuid,
      mrktid                       as Mrktid,
      _Country.Country             as CountryName,
      isocode                      as ISOCode,
      status                       as Status,
      case status
        when ''  then 1
        when 'X' then 3
      end                          as StatusCriticality,
      startdate                    as Startdate,
      enddate                      as Enddate,
      _OrderAggr.ItemQuantity      as ItemQuantity,
      _OrderAggr.MarketNetamount   as MarketNetamoun,
      _OrderAggr.MarketGrossamount as MarketGrossamount,
      _OrderAggr.Amountcurr        as Amountcurr,
      @Semantics.user.createdBy: true
      created_by                   as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      creation_time                as CreationTime,
      @Semantics.user.lastChangedBy: true
      changed_by                   as ChangedBy,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      change_time                  as ChangeTime,
      1                            as MarketCount,
 
      /* associations */
      _Product ,
      _MarketOrder,
      _Country ,
      _OrderAggr,
      _OrderChart

}
