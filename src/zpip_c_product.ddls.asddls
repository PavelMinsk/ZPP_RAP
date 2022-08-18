@EndUserText.label: 'Product projection CDS view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity zpip_c_product
  as projection on zpip_i_product as Product

{
  key ProdUuid,
      
      @Search.defaultSearchElement: true   
      Prodid,
      
      @Consumption.valueHelpDefinition: [{ 
                                           entity : { name:    'zpip_c_prodgr_vh', 
                                                      element: 'pgid' } 
                                        }]
      @ObjectModel.text.element:    ['ProdGrName']
      @Search:{defaultSearchElement: true, fuzzinessThreshold: 0.7}
      @Semantics.text: true
      Pgid,
      _ProdGroup.Pgname as ProdGrName,
      
      @Consumption.valueHelpDefinition: [{ 
                                           entity : { name:    'zpip_c_phase_vh', 
                                                      element: 'Phaseid' } 
                                        }]
      @ObjectModel.text.element:    ['PhaseName']
      @Search.defaultSearchElement: true
      Phaseid,
      _Phases.phase as PhaseName,
      
      @Semantics.quantity.unitOfMeasure: 'SizeUom'
      Height,
     
      @Semantics.quantity.unitOfMeasure: 'SizeUom'
      Depth,
     
      @Semantics.quantity.unitOfMeasure: 'SizeUom'
      Width,
      
      @Consumption.valueHelpDefinition: [{ 
                                           entity : { name: 'zpip_i_UOM', 
                                                      element: 'Msehi' } 
                                        }]
      @ObjectModel.text.element: ['DimName']
      @Search.defaultSearchElement: true
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Units'
      SizeUom,
      _UOM.isocode as DimName,
      
      @Semantics.amount.currencyCode: 'PriceCurrency'
      Price,

      PriceCriticality,
      ProductCriticality,
      PhaseCriticality,
      
      @Consumption.valueHelpDefinition: [{ 
                                           entity : { name:    'I_Currency', 
                                                      element: 'Currency' } 
                                        }]
      PriceCurrency,
      
      Taxrate,
      
      PgnameTrans,
      
      @Consumption.valueHelpDefinition: [{ 
                                           entity : { name:    'zpip_c_lang_vh', 
                                                      element: 'Code' } 
                                        }]
      TransCode,
      
      _ProdGroup.Imageurl,
      
      CreatedBy,
      CreationTime,
      ChangedBy,
      ChangeTime ,
      
      /* Associations */
      _Market : redirected to composition child zpip_c_market,
      _ProdGroup,
      _Phases,
      _UOM
}
