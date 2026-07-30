@AbapCatalog.sqlViewName: 'ZCDS_05SQL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Views de PCKG_05'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDS_05
  as select from zpedidos_05 as p
    inner join zclientes_05 as c
      on p.cliente_id = c.cliente_id
{
 c.nombre,
 sum( p.importe ) as suma
}

group by
c.nombre
