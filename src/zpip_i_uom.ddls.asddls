@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic CDS view for UOM'

define view entity zpip_i_UOM
  as select from zpip_d_uom as UOM
{
  key msehi   as Msehi,
      dimid   as Dimid,
      isocode as Isocode
}
