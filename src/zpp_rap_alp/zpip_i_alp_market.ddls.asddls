@AbapCatalog.sqlViewName: 'ZPIPIALPMARKET'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Market'
@Analytics.dataCategory: #DIMENSION


define view zpip_i_alp_market
  as select from zpip_d_market
  
  association[1] to zpip_i_alp_country as _Country on $projection.Mrktid = _Country.Mrktid
  
{
  key prod_uuid         as ProdUuid,
  key mrkt_uuid         as MrktUuid,
      mrktid            as Mrktid,
      _Country.Country  as CountryName,
      status            as Status,
      startdate         as Startdate,
      enddate           as Enddate ,

      /*Associations*/
      _Country
}
