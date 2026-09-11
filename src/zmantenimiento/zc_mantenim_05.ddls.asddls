@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZMANTENIM_05'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_MANTENIM_05
  provider contract transactional_query
  as projection on ZR_MANTENIM_05
  association [1..1] to ZR_MANTENIM_05 as _BaseEntity on $projection.IdMantenim = _BaseEntity.IdMantenim
{
  key IdMantenim,
  Equipo,
  Descripcion,
  TipoMantenim,

//  @ObjectModel.text.element: ['PrioridadTexto']
  Prioridad,
  Color,

//  _Prioridad.Descripcion as PrioridadTexto,

  Estado,
  Tecnico,
  FechaSolicitud,
  FechaProgramada,
  FechaFinalizacion,

  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,

  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreateAt,

  @Semantics: {
    user.lastChangedBy: true
  }
  LastChangedBy,

  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,

  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,

  _BaseEntity
}
