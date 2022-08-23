@AbapCatalog.sqlViewName: 'ZPIPIALPPHASE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Phase'
@Analytics.dataCategory: #DIMENSION


define view zpip_i_alp_phase
  as select from zpip_d_phase
{
  @ObjectModel.text.element: ['Phase']
  key phaseid as Phaseid,
      
      @Semantics.text: true
      @EndUserText.label: 'Product Life Cycle Phase'
      phase   as Phase
}
