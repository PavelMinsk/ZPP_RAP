@EndUserText.label: 'Market projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

@UI.chart: [
            {
              qualifier:             'MarketQuantity',
              title:                 'Items Quantity by Market',
              chartType:              #DONUT,
              dimensions:          [ 'Mrktid'],
              measures:            [ 'ItemQuantity'],
              dimensionAttributes: [{ dimension: 'Mrktid',       role: #CATEGORY }],
              measureAttributes:   [{ measure:   'ItemQuantity', role: #AXIS_1 }]
            },
            {
              qualifier:             'MarketAmounts',
              title:                 'Total Amounts by Market',
              chartType:              #BAR,
              dimensions:          [ 'Mrktid'],
              measures:            [ 'MarketGrossamount', 'MarketNetamoun' ],
              dimensionAttributes: [{ dimension: 'Mrktid',  role: #CATEGORY }],
              measureAttributes:   [
                                    { measure: 'MarketGrossamount', role: #AXIS_1 },
                                    { measure: 'MarketNetamoun',    role: #AXIS_1 }
                                   ]
            }
           ]

define view entity zpip_c_market
  as projection on zpip_i_market
  
{
  key ProdUuid,
  key MrktUuid,
     
      @Consumption.valueHelpDefinition: [{
                                           entity : { name: 'zpip_c_country_vh', element: 'mrktid' } 
                                        }]
      @ObjectModel.text.element: ['Country']
      @Search.defaultSearchElement: true
      Mrktid,
      
      @EndUserText.label: 'ISO-Code'
      ISOCode,
      
      @Consumption.valueHelpDefinition: [{
                                           entity : { name: 'zpip_c_country_hv', element: 'Country' } 
                                        }]
      _Country.Country  as Country,
      
      _Country.Imageurl as Imageurl,
      
      @Search.defaultSearchElement: true
      @UI.dataPoint.criticality: 'StatusCriticality'
      Status,
      
      StatusCriticality,
      
      @Search.defaultSearchElement: true
      @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  true }
      Startdate,
      
      @Search.defaultSearchElement: true
      @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  true }
      Enddate,
      
      ItemQuantity,     
      MarketNetamoun,   
      MarketGrossamount,
      Amountcurr,       
      
      CreatedBy,
      CreationTime,
      ChangedBy,
      ChangeTime ,
      
      /* Associations */
      _Product     : redirected to parent            zpip_c_product,
      _MarketOrder : redirected to composition child zpip_c_order,
      _Country,
      _OrderAggr 
      
}
