@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZPPT_05'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_PPT_05
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_PPT_05
  association [1..1] to ZR_PPT_05 as _BaseEntity on $projection.IDPARTIDA = _BaseEntity.IDPARTIDA
{
  key IdPartida,
  JugadaJ1,
  JugadaJ2,
  Resultado,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
