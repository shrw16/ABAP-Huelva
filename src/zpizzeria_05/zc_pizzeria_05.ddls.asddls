@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Pedidos Pizzeria'
@Metadata.allowExtensions: true
define root view entity ZC_PIZZERIA_05
  provider contract transactional_query
  as projection on ZI_PIZZERIA_05
{
  key OrderId,
      NombreCliente,
      FechaPedido,
      Estado,
      PrecioTotal,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt
}
