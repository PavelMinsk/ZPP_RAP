@AbapCatalog.sqlViewName: 'ZPIPIOVPPRODGRP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product groups'


define view zpip_i_ovp_prod_grp
  as select from zpip_d_prod_grp
{
  key pgid     as Pgid,
      pgname   as Pgname,
      imageurl as Imageurl
}
