/********** GENERATED on 05/20/2021 at 08:38:26 by CB0000000547**************/
 @OData.entitySet.name: 'A_AddressFaxNumber' 
 @OData.entityType.name: 'A_AddressFaxNumberType' 
 define root abstract entity ZZPIP_A_ADDRESSFAXNUMBER { 
 key AddressID : abap.char( 10 ) ; 
 key Person : abap.char( 10 ) ; 
 key OrdinalNumber : abap.numc( 3 ) ; 
 @Odata.property.valueControl: 'IsDefaultFaxNumber_vc' 
 IsDefaultFaxNumber : abap_boolean ; 
 IsDefaultFaxNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FaxCountry_vc' 
 FaxCountry : abap.char( 3 ) ; 
 FaxCountry_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FaxNumber_vc' 
 FaxNumber : abap.char( 30 ) ; 
 FaxNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'FaxNumberExtension_vc' 
 FaxNumberExtension : abap.char( 10 ) ; 
 FaxNumberExtension_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'InternationalFaxNumber_vc' 
 InternationalFaxNumber : abap.char( 30 ) ; 
 InternationalFaxNumber_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AddressCommunicationRemarkT_vc' 
 AddressCommunicationRemarkText : abap.char( 50 ) ; 
 AddressCommunicationRemarkT_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
