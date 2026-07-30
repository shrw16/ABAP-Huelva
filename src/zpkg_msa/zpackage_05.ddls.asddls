@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Views OP'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZPACKAGE_05 as select from zpedidos_05 as p
inner join zclientes_05 as c
on c.cliente_id = p.cliente_id
{
key c.cliente_id,
c.nombre,
c.ciudad,
p.pedido_id,
p.fecha 
}
