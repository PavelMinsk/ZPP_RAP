@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic CDS view for product groups'


define view entity zpip_i_prod_gr
  as select from zpip_d_prod_grp
{

  key pgid     as Pgid,
      pgname   as Pgname,
      imageurl as Imageurl
}
