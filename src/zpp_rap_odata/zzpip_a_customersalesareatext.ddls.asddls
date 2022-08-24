/********** GENERATED on 05/20/2021 at 08:38:35 by CB0000000547**************/
 @OData.entitySet.name: 'A_CustomerSalesAreaText' 
 @OData.entityType.name: 'A_CustomerSalesAreaTextType' 
 define root abstract entity ZZPIP_A_CUSTOMERSALESAREATEXT { 
 key Customer : abap.char( 10 ) ; 
 key SalesOrganization : abap.char( 4 ) ; 
 key DistributionChannel : abap.char( 2 ) ; 
 key Division : abap.char( 2 ) ; 
 key Language : abap.char( 2 ) ; 
 key LongTextID : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'LongText_vc' 
 LongText : abap.string( 0 ) ; 
 LongText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
