@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic CDS view for phase'
//@Search.searchable: true

define view entity zpip_i_phase
  as select from zpip_d_phase as Phases
{

  key Phases.phaseid as Phaseid,
      
      Phases.phase   as PhaseName
}
