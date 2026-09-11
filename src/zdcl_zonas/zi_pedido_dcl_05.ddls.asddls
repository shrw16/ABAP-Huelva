@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista CDS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_PEDIDO_DCL_05 as select from ztpedido_dcl_05
{
      key pedido_id as PedidoId,
      descripcion as Descripcion,
      zona  as zona
}
