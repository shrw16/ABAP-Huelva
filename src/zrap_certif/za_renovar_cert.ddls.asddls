@EndUserText.label: 'Parámetros de Renovación'
define root abstract entity ZA_RENOVAR_CERT
{
@EndUserText.label: 'Nueva fecha de expedición'
  @Consumption.filter.mandatory: true
  FechaExp : abap.dats;

  @EndUserText.label: 'Nueva fecha de caducidad'
  @Consumption.filter.mandatory: true
  FechaCad : abap.dats;
}
