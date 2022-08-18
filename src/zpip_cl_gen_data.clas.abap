CLASS zpip_cl_gen_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZPIP_CL_GEN_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*---------------------------------------------------------------------
*                  fill in -zpip_d_prod_grp-

    DELETE FROM zpip_d_prod_grp.

    INSERT zpip_d_prod_grp FROM TABLE @(
      VALUE #(
          ( pgid  = '1' pgname = 'Microwave'      imageurl = 'https://assets.dryicons.com/uploads/icon/svg/6676/ce9bd43b-e390-4a79-a216-47f5c9bb1c8c.svg' )
          ( pgid  = '2' pgname = 'Coffee Machine' imageurl = 'https://assets.dryicons.com/uploads/icon/svg/6655/49bdf99f-1bdd-4cca-8480-182aabab75a5.svg' )
          ( pgid  = '3' pgname = 'Waffle Iron'    imageurl = 'https://assets.dryicons.com/uploads/icon/svg/6691/6459344e-ec66-4aa6-ac86-c4c868c7075d.svg' )
          ( pgid  = '4' pgname = 'Blender'        imageurl = 'https://cdn0.iconfinder.com/data/icons/coffee-brewing-glyph/16/5-512.png' )
          ( pgid  = '5' pgname = 'Cooker'         imageurl = 'https://assets.dryicons.com/uploads/icon/svg/6691/6459344e-ec66-4aa6-ac86-c4c868c7075d.svg')
      )
    ).

*    SELECT * FROM zpip_d_prod_grp INTO TABLE @DATA(lt_prod_grs).
*    out->write( sy-dbcnt ).
*    out->write( 'Product groups data inserted successfully!').
*    out->write( '--------------------------------------------- ' ).
*---------------------------------------------------------------------
*                  fill in -zpip_d_phase-

    DELETE FROM zpip_d_phase.

    INSERT zpip_d_phase FROM TABLE @(
      VALUE #(
        ( phaseid  = '1' phase = 'PLAN' )
        ( phaseid  = '2' phase = 'DEV'  )
        ( phaseid  = '3' phase = 'PROD' )
        ( phaseid  = '4' phase = 'OUT'  )
      )
    ).
*---------------------------------------------------------------------
*                  fill in -zpip_d_uom-

    DELETE FROM zpip_d_uom.

    INSERT zpip_d_uom FROM TABLE @(
      VALUE #(
        ( msehi = 'CM'  dimid = 'LENGTH' isocode = 'CMT')
        ( msehi = 'DM'  dimid = 'LENGTH' isocode = 'DMT')
        ( msehi = 'FT'  dimid = 'LENGTH' isocode = 'FOT')
        ( msehi = 'IN'  dimid = 'LENGTH' isocode = 'INH')
        ( msehi = 'KM'  dimid = 'LENGTH' isocode = 'KMT')
        ( msehi = 'M'   dimid = 'LENGTH' isocode = 'MTR')
        ( msehi = 'MI'  dimid = 'LENGTH' isocode = 'SMI')
        ( msehi = 'MIM' dimid = 'LENGTH' isocode = '4H' )
        ( msehi = 'MM'  dimid = 'LENGTH' isocode = 'MMT')
        ( msehi = 'NAM' dimid = 'LENGTH' isocode = 'C45')
        ( msehi = 'YD'  dimid = 'LENGTH' isocode = 'YRD')
      )
    ).
*---------------------------------------------------------------------
*                  fill in -zpip_d_country-

    DELETE FROM zpip_d_country.

    INSERT zpip_d_country FROM TABLE @(
      value #(
        ( mrktid  ='1'  country = 'Russia'          code = 'RU' imageurl = 'https://cdn.webshopapp.com/shops/94414/files/54940426/russia-flag-image-free-download.jpg' )
        ( mrktid  ='2'  country = 'Belarus'         code = 'RU' imageurl = 'https://cdn.countryflags.com/thumbs/belarus/flag-400.png' )
        ( mrktid  ='3'  country = 'United Kingdom'  code = 'EN' imageurl = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Flag_of_the_United_Kingdom.svg/640px-Flag_of_the_United_Kingdom.svg.png' )
        ( mrktid  ='4'  country = 'France'          code = 'FR' imageurl = 'https://cdn.webshopapp.com/shops/94414/files/54002660/france-flag-image-free-download.jpg' )
        ( mrktid  ='5'  country = 'Germany'         code = 'DE' imageurl = 'https://cdn.webshopapp.com/shops/94414/files/54006402/germany-flag-image-free-download.jpg' )
        ( mrktid  ='6'  country = 'Italy'           code = 'IT' imageurl = 'https://cdn.countryflags.com/thumbs/italy/flag-400.png' )
        ( mrktid  ='7'  country = 'USA'             code = 'EN' imageurl = 'https://cdn.webshopapp.com/shops/94414/files/54958906/the-united-states-flag-image-free-download.jpg' )
        ( mrktid  ='8'  country = 'Japan'           code = 'EN' imageurl = 'https://image.freepik.com/free-vector/illustration-japan-flag_53876-27128.jpg' )
        ( mrktid  ='9'  country = 'Poland'          code = 'EN' imageurl = 'https://cdn.webshopapp.com/shops/94414/files/54940016/poland-flag-image-free-download.jpg' )
        ( mrktid  ='10' country = 'Spain'           code = 'ES' imageurl = 'https://cdn.webshopapp.com/shops/94414/files/54940016/poland-flag-image-free-download.jpg' )
      )
    ).


**********************************************************************
  ENDMETHOD.
ENDCLASS.
