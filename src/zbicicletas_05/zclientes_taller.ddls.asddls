@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes Tabla'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCLIENTES_TALLER 
as select from ztaller_cli
{
    key id_reparacion,
    cliente,
    averia,
    estado
}
