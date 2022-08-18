@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Charts for Orders'

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

define view entity zpip_i_order_ch
  as select from zpip_d_mrkt_ordr
{
  key prod_uuid     as ProdUuid,
  key mrkt_uuid     as MrktUuid,
  key order_uuid    as OrderUuid,
      orderid       as Orderid,
      delivery_date as DeliveryDate,
      @Aggregation.default: #SUM
      quantity      as Quantity,
      @Aggregation.default: #SUM
      netamount     as Netamount,
      @Aggregation.default: #SUM
      grossamount   as Grossamount,
      amountcurr    as Currency
}
