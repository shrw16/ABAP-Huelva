@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZTICKET_MAINT'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TICKET_MAINT
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TICKET_MAINT
  association [1..1] to ZR_TICKET_MAINT as _BaseEntity on $projection.TICKETUUID = _BaseEntity.TICKETUUID
{
  key TicketUUID,
  TicketID,
  Equipment,
  Description,
  Priority,
  Status,
  DueDate,
  ResolutionDate,
  ResolutionNotes,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreateAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
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
