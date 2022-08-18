@AbapCatalog.sqlViewName: 'ZPIPCOUNTRYVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Country Help View'

@ObjectModel:{
               semanticKey: ['country'],
               representativeKey: 'mrktid',
               resultSet.sizeCategory: #XS,
               dataCategory: #VALUE_HELP
             }
@UI.presentationVariant: [{
                            sortOrder: [{ by: 'mrktid', direction: #ASC  }]
                         }]
                         
                         
define view zpip_c_country_vh
  as select from zpip_d_country
{
  @ObjectModel.text.element: ['country']
  key mrktid,
      country  
}
