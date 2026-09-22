@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZCONTROL_DE_CERTIFICADOS'
@EndUserText.label: 'Control de Certificados'
define root view entity ZR_ZCERTIFICADOS
  as select from zzcertif
{
  key id_cert as IdCert,
  id_emp as IdEmp,
  nombre_emp as NombreEmp,
  apellidos_emp as ApellidosEmp,
  nombre_cert as NombreCert,
  org_emisor as OrgEmisor,
  fecha_exp as FechaExp,
  fecha_cad as FechaCad,
  posicion_emp as PosicionEmp,
  area_prof as AreaProf,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
