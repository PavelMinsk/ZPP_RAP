@AbapCatalog.sqlViewName: 'ZPIPIOVPPHASE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Phase'


define view zpip_i_ovp_phase
  as select from zpip_d_phase
{
  key phaseid as Phaseid,
      phase   as Phase
}
