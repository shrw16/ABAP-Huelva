@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZTINCIDENCIAS_05'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TINCIDENCIAS_05
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TINCIDENCIAS_05
  association [1..1] to ZR_TINCIDENCIAS_05 as _BaseEntity on $projection.IDINCIDENCE = _BaseEntity.IDINCIDENCE
{
  key IdIncidence,
  Title,
  Description,
  Category,
  Priority,
  Status,
  Responsible,
  LeaveDate,
  LimitDate,
  DischargeDate,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  _BaseEntity
}
