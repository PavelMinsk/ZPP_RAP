/********** GENERATED on 05/20/2021 at 08:38:32 by CB0000000547**************/
 @OData.entitySet.name: 'A_BusinessPartnerTaxNumber' 
 @OData.entityType.name: 'A_BusinessPartnerTaxNumberType' 
 define root abstract entity ZZPIP_A_BUSINESSPARTNERTAXNUMB { 
 key BusinessPartner : abap.char( 10 ) ; 
 key BPTaxType : abap.char( 4 ) ; 
 @Odata.property.valueControl: 'BPTaxNumber_vc' 
 BPTaxNumber : abap.char( 20 ) ; 
 BPTaxNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'BPTaxLongNumber_vc' 
 BPTaxLongNumber : abap.char( 60 ) ; 
 BPTaxLongNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizationGroup_vc' 
 AuthorizationGroup : abap.char( 4 ) ; 
 AuthorizationGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
