@EndUserText.label: 'Projection for Order'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

@UI.chart: [
            {
              qualifier:             'OrdersQuantity',
              title:                 'Orders Quantity by Delivery Date',
              chartType:              #COLUMN,
              dimensions:          [ 'DeliveryDate'],
              measures:            [ 'Quantity'],
              dimensionAttributes: [{ dimension: 'DeliveryDate', role: #CATEGORY }],
              measureAttributes:   [{ measure:   'Quantity',     role: #AXIS_1 }]
            },
            {
              qualifier:             'OrdersAmounts',
              title:                 'Orders Amounts by Delivery Date',
              chartType:              #BAR,
              dimensions:          [ 'DeliveryDate'],
              measures:            [ 'Grossamount', 'Netamount' ],
              dimensionAttributes: [{ dimension: 'DeliveryDate',  role: #CATEGORY }],
              measureAttributes:   [
                                    { measure: 'Grossamount', role: #AXIS_1 },
                                    { measure: 'Netamount',   role: #AXIS_1 }
                                   ]
            }
           ]


define view entity zpip_c_order
  as projection on zpip_i_order
{
  key ProdUuid,
  key MrktUuid,
  key OrderUuid,
      
      _Product._ProdGroup.Pgname as ProductName,
      
      @Search.defaultSearchElement: true
      Orderid,
      
      Quantity,
      
      @Search.defaultSearchElement: true
      CalendarYear,
      
      @Search.defaultSearchElement: true
      DeliveryDate,
      
      @Semantics.amount.currencyCode: 'Amountcurr'
      Netamount,
      
      @Semantics.amount.currencyCode: 'Amountcurr'
      Grossamount,
      
      @Consumption.valueHelpDefinition: [{ 
                                           entity: { 
                                                     name:    'I_Currency', 
                                                     element: 'Currency' 
                                                   } 
                                        }]
      Amountcurr,
      
      @Consumption.valueHelpDefinition: [{ 
                                           entity : { 
                                                      name:    'zpip_i_business_partner_c', 
                                                      element: 'BusinessPartner' 
                                                    }, 
                                           
                                           additionalBinding: [
                                                               { localElement: 'BusinessPartnerName',  element: 'BusinessPartnerFullName' },
                                                               { localElement: 'BusinessPartnerGroup', element: 'BusinessPartnerGrouping' }
                                                              ]
                                        }]
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Business Partner ID'
      BusinessPartner,     
      @EndUserText.label: 'Business Partner Name'
      BusinessPartnerName, 
      @EndUserText.label: 'Business Partner Group'
      BusinessPartnerGroup,
      
      
      CreatedBy,
      CreationTime,
      ChangedBy,
      ChangeTime ,
      
      /* Associations */
      _Market  : redirected to parent zpip_c_market, 
      _Product : redirected to        zpip_c_product
      
      
      
//      MarketProdUuid,
//      _Product : redirected to        zpip_c_product
}
