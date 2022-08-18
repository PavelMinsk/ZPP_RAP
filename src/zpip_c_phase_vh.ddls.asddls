@AbapCatalog.sqlViewName: 'ZPIPPHASEVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Phase Value Help'

@ObjectModel:{
               semanticKey: ['PhaseName'],
               representativeKey: 'Phaseid',
               resultSet.sizeCategory: #XS,
               dataCategory: #VALUE_HELP
             }
@UI.presentationVariant: [{
                            sortOrder: [{ by: 'Phaseid', direction: #ASC  }]
                         }]


define view zpip_c_phase_vh
  as select from zpip_i_phase
{
  @ObjectModel.text.element: ['PhaseName'] 
  key Phaseid,
      PhaseName
}
