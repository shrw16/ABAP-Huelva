@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Op. sobre clientes'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_CLIENTES_BASICO as select from /dmo/customer
{
  key customer_id,
      first_name,
      last_name,
      city,
      country_code
}
