@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZTPENALTIS_05'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TPENALTIS_05
  as select from ZTPENALTIS_05
{
  key numero_lanzamiento as NumeroLanzamiento,
  nombre_jugador as NombreJugador,
  direccion_disparo as DireccionDisparo,
  nombre_portero as NombrePortero,
  direccion_portero as DireccionPortero,
  resultado as Resultado,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
