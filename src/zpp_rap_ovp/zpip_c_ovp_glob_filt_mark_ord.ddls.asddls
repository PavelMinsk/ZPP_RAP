@AbapCatalog.sqlViewName: 'ZPIPCGLOBFMTORD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Global Filters for Market Order'

define view zpip_c_ovp_glob_filt_mark_ord
  as select from zpip_i_ovp_market_order
{
      @UI.hidden: true
  key ProdUuid,
      @UI.hidden: true
  key MrktUuid,
      @UI.hidden: true
  key OrderUuid,
      
      @UI:{
            selectionField: [{ position: 10 }] 
          }
      @Consumption.valueHelpDefinition: [{ 
                                           entity: { name:    'zpip_c_prodgr_vh',   
                                                     element: 'pgname' } 
                                        }]
      ProductName,
      
      @UI:{
            selectionField: [{ position: 20 }] 
          }
      @Consumption.valueHelpDefinition: [{ 
                                           entity: { name:    'zpip_c_country_vh',   
                                                     element: 'country'} 
                                        }]
      CountryName,
      
      @Consumption.filter: { selectionType:      #INTERVAL , 
                             multipleSelections:  false      }
      @UI:{
            selectionField: [{ position: 30 }] 
          }
      DeliveryDate,
      
      @UI:{
            selectionField: [{ position: 40 }] 
          }      
      GrossIncom,
      Amountcurr
}
