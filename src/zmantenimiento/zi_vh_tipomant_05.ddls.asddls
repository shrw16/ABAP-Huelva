@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help MANTENIMIENTO'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_VH_TIPOMANT_05 as select from zttpomant_05
{
    key tipo_mantenim  as TipoMantenim,
        descripcion as Descripcion
}
