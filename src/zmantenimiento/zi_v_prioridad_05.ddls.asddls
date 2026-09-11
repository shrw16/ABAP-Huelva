@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Desplegable Prioridad'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_V_PRIORIDAD_05 as select from ztprioridad_05
{
    key prioridad as Prioridad,
        descripcion as Descripcion
}
