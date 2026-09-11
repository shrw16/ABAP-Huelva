@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZTICKET_MAINT'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TICKET_MAINT
  as select from ZTICKET_MAINT
{
  key ticket_uuid as TicketUUID,
  ticket_id as TicketID,
  equipment as Equipment,
  description as Description,
  priority as Priority,
  status as Status,
  due_date as DueDate,
  resolution_date as ResolutionDate,
  resolution_notes as ResolutionNotes,
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
