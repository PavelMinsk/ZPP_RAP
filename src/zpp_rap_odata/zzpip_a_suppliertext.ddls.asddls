/********** GENERATED on 05/20/2021 at 08:38:40 by CB0000000547**************/
 @OData.entitySet.name: 'A_SupplierText' 
 @OData.entityType.name: 'A_SupplierTextType' 
 define root abstract entity ZZPIP_A_SUPPLIERTEXT { 
 key Supplier : abap.char( 10 ) ; 
 key Language : abap.char( 2 ) ; 
 key LongTextID : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'LongText_vc' 
 LongText : abap.string( 0 ) ; 
 LongText_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
