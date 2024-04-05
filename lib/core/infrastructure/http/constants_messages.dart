/// Constant message in the layer infrastructure
class ConstantMessage {
  /// Used to when there is not internet connection
  static const noInternetConnectionMessage =
      'No tienes conexión a internet.\nComprueba tu conexión a WiFi o datos móviles e intenta de nuevo';

  /// Used to when there is not data found
  static const dataNotFoundMessage = 'Datos no encontrados';

  /// Used to when calling API
  static const serverErrorMessage =
      '¡Lo sentimos! Ha ocurrido un problema con el servidor. Por favor intenta más tarde';

  /// Used to when calling API
  static const dioErrorMessage = 'Error no especificado de DIO';

  /// Used to when when firebase its wrong
  static const errorMessage = 'Ha ocurrido un error';
}
