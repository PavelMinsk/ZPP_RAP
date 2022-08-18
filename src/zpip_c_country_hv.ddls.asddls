@AbapCatalog.sqlViewName: 'ZPIPCOUNTRYHV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Country Help View'


define view zpip_c_country_hv
  as select from zpip_d_country
{
  key mrktid   as Mrktid,
      country  as Country
}
