/********** GENERATED on 05/20/2021 at 08:38:35 by CB0000000547**************/
 @OData.entitySet.name: 'A_CustomerTaxGrouping' 
 @OData.entityType.name: 'A_CustomerTaxGroupingType' 
 define root abstract entity ZZPIP_A_CUSTOMERTAXGROUPING { 
 key Customer : abap.char( 10 ) ; 
 key CustomerTaxGroupingCode : abap.char( 3 ) ; 
 @Odata.property.valueControl: 'CustTaxGrpExemptionCertific_vc' 
 CustTaxGrpExemptionCertificate : abap.char( 15 ) ; 
 CustTaxGrpExemptionCertific_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustTaxGroupExemptionRate_vc' 
 CustTaxGroupExemptionRate : abap.dec( 5, 2 ) ; 
 CustTaxGroupExemptionRate_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustTaxGroupExemptionStartD_vc' 
 CustTaxGroupExemptionStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CustTaxGroupExemptionStartD_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustTaxGroupExemptionEndDat_vc' 
 CustTaxGroupExemptionEndDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CustTaxGroupExemptionEndDat_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustTaxGroupSubjectedStartD_vc' 
 CustTaxGroupSubjectedStartDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CustTaxGroupSubjectedStartD_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CustTaxGroupSubjectedEndDat_vc' 
 CustTaxGroupSubjectedEndDate : RAP_CP_ODATA_V2_EDM_DATETIME ; 
 CustTaxGroupSubjectedEndDat_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
