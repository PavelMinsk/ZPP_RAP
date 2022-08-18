@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic CDS view for product groups'
@Search.searchable: true

define view entity zpip_i_country
  as select from zpip_d_country as Country
{
      @Search.defaultSearchElement: true
  key mrktid   as Mrktid,
      country  as Country,
      @Consumption.filter.hidden: true
      code     as Code,
      @Consumption.filter.hidden: true
      imageurl as Imageurl
}
