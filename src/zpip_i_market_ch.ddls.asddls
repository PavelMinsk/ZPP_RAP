@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Chat for Markets'

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
                                    { measure: 'MarketNetamoun',    role: #AXIS_2 }
                                   ]
            }
           ]


define view entity zpip_i_market_ch
  as select from zpip_i_market
{
  key ProdUuid,
      @ObjectModel.text.element: ['Country']
      Mrktid,
      _Country.Country,
      @Aggregation.default: #SUM
      ItemQuantity,
      @Aggregation.default: #SUM
      MarketNetamoun,
      @Aggregation.default: #SUM
      MarketGrossamount,
      Amountcurr
}
