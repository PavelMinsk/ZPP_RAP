/********** GENERATED on 05/20/2021 at 08:38:31 by CB0000000547**************/
 @OData.entitySet.name: 'A_BusinessPartnerRole' 
 @OData.entityType.name: 'A_BusinessPartnerRoleType' 
 define root abstract entity ZZPIP_A_BUSINESSPARTNERROLE { 
 key BusinessPartner : abap.char( 10 ) ; 
 key BusinessPartnerRole : abap.char( 6 ) ; 
 @Odata.property.valueControl: 'ValidFrom_vc' 
 ValidFrom : tzntstmpl ; 
 ValidFrom_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ValidTo_vc' 
 ValidTo : tzntstmpl ; 
 ValidTo_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'AuthorizationGroup_vc' 
 AuthorizationGroup : abap.char( 4 ) ; 
 AuthorizationGroup_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
