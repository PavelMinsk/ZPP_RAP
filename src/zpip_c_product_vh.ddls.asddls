@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Value Help'

define view entity zpip_c_product_vh
  as select from zpip_i_product
{
  key ProdUuid,
      Prodid
}
