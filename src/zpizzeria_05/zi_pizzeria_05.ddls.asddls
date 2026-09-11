@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root View Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZI_PIZZERIA_05 as select from ztpizzeria_05
{
     key order_id          as OrderId,
      nombre_cliente    as NombreCliente,
      fecha_pedido      as FechaPedido,
      estado            as Estado,
      precio_total      as PrecioTotal,
      created_by        as CreatedBy,
      created_at        as CreatedAt,
      last_changed_by   as LastChangedBy,
      last_changed_at   as LastChangedAt
}
