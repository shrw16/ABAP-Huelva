@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZTPENALTIS_05'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TPENALTIS_05
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TPENALTIS_05
  association [1..1] to ZR_TPENALTIS_05 as _BaseEntity on $projection.NUMEROLANZAMIENTO = _BaseEntity.NUMEROLANZAMIENTO
{
  key NumeroLanzamiento,
  NombreJugador,
  DireccionDisparo,
  NombrePortero,
  DireccionPortero,
  Resultado,
  @Semantics: {
    User.Createdby: true
  }
  LocalCreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  LocalCreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
