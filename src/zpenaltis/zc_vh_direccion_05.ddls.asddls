@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección - Lanzamientos de penaltis'

define root view entity ZC_VH_DIRECCION_05
  provider contract transactional_query
  as projection on ZR_TPENALTIS_05
{
  key NumeroLanzamiento,

      NombreJugador,

      DireccionDisparo,

      NombrePortero,

      DireccionPortero,

      Resultado,

      @Semantics: {
        user.createdBy: true
      }
      LocalCreatedBy,

      @Semantics: {
        systemDateTime.createdAt: true
      }
      LocalCreatedAt,

      @Semantics: {
        user.localInstanceLastChangedBy: true
      }
      LocalLastChangedBy,

      @Semantics: {
        systemDateTime.localInstanceLastChangedAt: true
      }
      LocalLastChangedAt,

      @Semantics: {
        systemDateTime.lastChangedAt: true
      }
      LastChangedAt
}
