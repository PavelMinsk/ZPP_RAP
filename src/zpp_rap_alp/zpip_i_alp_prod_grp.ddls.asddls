@AbapCatalog.sqlViewName: 'ZPIPIALPPRODGRP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product groups'
@Analytics.dataCategory: #DIMENSION


define view zpip_i_alp_prod_grp
  as select from zpip_d_prod_grp
{
  key pgid     as Pgid,
      pgname   as Pgname,
      imageurl as Imageurl
}
