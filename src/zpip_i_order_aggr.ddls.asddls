@AbapCatalog.sqlViewName: 'ZPIPIORDERAGGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Order aggregations'

define view zpip_i_order_aggr
  as select from zpip_i_order
{

  key MrktUuid,
      
      @EndUserText.label: 'Total Quantity'
      sum(Quantity)    as ItemQuantity,
      
      @EndUserText.label: 'Total Net Amount'
      @Semantics.amount.currencyCode: 'Amountcurr'
      sum(Netamount)   as MarketNetamount ,
      
      @EndUserText.label: 'Total Gross Amount'
      @Semantics.amount.currencyCode: 'Amountcurr'
      sum(Grossamount) as MarketGrossamount,

      Amountcurr

}
group by
  MrktUuid,
  Amountcurr
