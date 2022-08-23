@AbapCatalog.sqlViewName: 'ZPIPIALPCTRY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Country'
@Analytics.dataCategory: #DIMENSION


define view zpip_i_alp_country
  as select from zpip_d_country
{
  key mrktid   as Mrktid,
      country  as Country,
      code     as Code,
      imageurl as Imageurl
}
