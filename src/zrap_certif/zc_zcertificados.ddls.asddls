@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}

@ObjectModel: {
  sapObjectNodeType.name: 'ZCONTROL_DE_CERTIFICADOS'
}

@AccessControl.authorizationCheck: #MANDATORY

define root view entity ZC_ZCERTIFICADOS
  provider contract transactional_query
  as projection on ZR_ZCERTIFICADOS

  association [1..1] to ZR_ZCERTIFICADOS as _BaseEntity
    on $projection.IdCert = _BaseEntity.IdCert

{
  key IdCert,
      IdEmp,
      NombreEmp,
      ApellidosEmp,
      NombreCert,
      OrgEmisor,
      FechaExp,
      FechaCad,
      
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CRITICALITY_COLORS'
      virtual DataCriticality : abap.int1,
      
      PosicionEmp,
      AreaProf,

      @Semantics.systemDateTime.createdAt: true
      CreatedAt,

      @Semantics.user.createdBy: true
      CreatedBy,

      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,

      @Semantics.user.lastChangedBy: true
      LastChangedBy,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,

      _BaseEntity
}


