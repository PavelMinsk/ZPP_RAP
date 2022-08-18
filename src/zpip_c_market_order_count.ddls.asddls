@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Market Count'
@Metadata.ignorePropagatedAnnotations: true

define view entity zpip_c_market_order_count
  as select from zpip_i_market as MarketCount
  association [0..1] to zpip_i_order as _OrderCount on $projection.ProdUuid = _OrderCount.ProdUuid 
{
  key ProdUuid,
  sum(MarketCount)            as MarcetCount,
  sum(_OrderCount.OrderCount) as OrderCount
}
group by ProdUuid
