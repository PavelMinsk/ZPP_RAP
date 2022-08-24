/********** GENERATED on 05/20/2021 at 08:38:31 by CB0000000547**************/
 @OData.entitySet.name: 'A_BusinessPartnerContact' 
 @OData.entityType.name: 'A_BusinessPartnerContactType' 
 define root abstract entity ZZPIP_A_BUSINESSPARTNERCONTACT { 
 key RelationshipNumber : abap.char( 12 ) ; 
 key BusinessPartnerCompany : abap.char( 10 ) ; 
 key BusinessPartnerPerson : abap.char( 10 ) ; 
 key ValidityEndDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 @Odata.property.valueControl: 'ValidityStartDate_vc' 
 ValidityStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 ValidityStartDate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'IsStandardRelationship_vc' 
 IsStandardRelationship : abap_boolean ; 
 IsStandardRelationship_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'RelationshipCategory_vc' 
 RelationshipCategory : abap.char( 6 ) ; 
 RelationshipCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 @OData.property.name: 'to_ContactAddress' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ContactAddress : association [0..*] to ZZPIP_A_BPCONTACTTOADDRESS on 1 = 1; 
 @OData.property.name: 'to_ContactRelationship' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ContactRelationship : association [1] to ZZPIP_A_BPCONTACTTOFUNCANDDEPT on 1 = 1; 
 } 
