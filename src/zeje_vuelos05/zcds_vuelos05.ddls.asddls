@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ops sobre /dmo/carrier'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_VUELOS05 as select from /dmo/carrier 
{
    key carrier_id       as IdAerolinea,
          name              as NombreAerolinea,
          currency_code     as MonedaLocal
}
