@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZMANTENIM_05'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_MANTENIM_05
  as select from zmantenim_05
{
  key id_mantenim as IdMantenim,
  equipo as Equipo,
  descripcion as Descripcion,
  tipo_mantenim as TipoMantenim,
  prioridad as Prioridad,
  estado as Estado,
  tecnico as Tecnico,
  fecha_solicitud as FechaSolicitud,
  fecha_programada as FechaProgramada,
  fecha_finalizacion as FechaFinalizacion,
  
  prioridad as PrioridadCriticality,
 
  case prioridad
          when 'A' then 1
          when 'M' then 2
          when 'B' then 3
          else 0
              end as Color,
  
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  create_at as CreateAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
