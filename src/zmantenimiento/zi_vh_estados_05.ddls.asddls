@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help ESTADOS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_VH_ESTADOS_05 as select from ztestados_05
{
    key estado      as Estado,
      descripcion as Descripcion
}
