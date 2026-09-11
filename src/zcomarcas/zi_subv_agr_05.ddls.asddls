@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_SUBV_AGR_05 as select from zsubv_agr_05
{
    key id_subvencion as IdSubvencion,
    agricultor as Agricultor,
    comarca as Comarca,
    importe as Importe,
    estado as Estado
    
}
