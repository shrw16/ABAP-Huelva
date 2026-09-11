@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZPPT_05'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_PPT_05
  as select from ZPPT_05
{
  key id_partida as IdPartida,
  jugada_j1 as JugadaJ1,
  jugada_j2 as JugadaJ2,
  resultado as Resultado,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
