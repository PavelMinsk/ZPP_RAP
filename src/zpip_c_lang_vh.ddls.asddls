@AbapCatalog.sqlViewName: 'ZPIPCLANGVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Language Codes Value Help'

@ObjectModel:{
               resultSet.sizeCategory: #XS,
               dataCategory: #VALUE_HELP
             }
@UI.presentationVariant: [{
                            sortOrder: [{ by: 'code', direction: #ASC  }]
                         }]

define view zpip_c_lang_vh
  as select distinct from zpip_d_country
{
  key code     as Code
}
