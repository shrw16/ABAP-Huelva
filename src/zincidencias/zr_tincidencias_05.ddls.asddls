@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZTINCIDENCIAS_05'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TINCIDENCIAS_05
  as select from ZTINCIDENCIAS_05
{
  key id_incidence as IdIncidence,
  title as Title,
  description as Description,
  category as Category,
  priority as Priority,
  status as Status,
  responsible as Responsible,
  leave_date as LeaveDate,
  limit_date as LimitDate,
  discharge_date as DischargeDate,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy
}
