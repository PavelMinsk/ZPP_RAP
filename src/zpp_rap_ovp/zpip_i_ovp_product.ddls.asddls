@AbapCatalog.sqlViewName: 'ZPIPIOVPPRODUCT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product'


define view zpip_i_ovp_product
  as select from zpip_d_product
  
  association[1] to zpip_i_ovp_prod_grp  as _ProdGrp on $projection.Pgid    = _ProdGrp.Pgid
  association[1] to zpip_i_ovp_phase     as _Phase   on $projection.Phaseid = _Phase.Phaseid
  
{
  key prod_uuid       as ProdUuid,
      prodid          as Prodid,
      @ObjectModel.text.element: ['ProdGrpName']
      pgid            as Pgid,
      _ProdGrp.Pgname as ProdGrpName,
      @ObjectModel.text.element: ['PhaseName']
      phaseid         as Phaseid,
      _Phase.Phase    as PhaseName,
      height          as Height,
      depth           as Depth,
      width           as Width,
      size_uom        as SizeUom,
      price           as Price,
      price_currency  as PriceCurrency,
      taxrate         as Taxrate,
      
      /*Associations*/
      _ProdGrp,
      _Phase

}
