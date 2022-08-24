@AbapCatalog.sqlViewName: 'ZPIPIOVPCTRY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Country'


define view zpip_i_ovp_country
  as select from zpip_d_country
{
  key mrktid   as Mrktid,
      country  as Country,
      code     as Code,
      imageurl as Imageurl
}
