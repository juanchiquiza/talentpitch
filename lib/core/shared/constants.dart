/// Environment constant values
enum EnvironmentConstants {
  /// Value for 'dev'
  development('dev'),

  /// Value for 'qa'
  quality('qa'),

  /// Value for 'prod'
  production('prod');

  /// Constructor
  const EnvironmentConstants(this.value);

  /// Represents the value of each enum
  final String value;
}

/// Keys names storage on env files to get data and services secrets
enum EnvironmentApiKeys {
  /// Value for 'BASE_URL'
  baseUrl('BASE_URL');

  /// Constructor
  const EnvironmentApiKeys(this.value);

  /// Represents the value of each enum
  final String value;
}

/// Server error mesage
const serverErrorMessage =
'''¡Lo sentimos! Ha ocurrido un problema con el servidor. Por favor intenta más tarde''';

/// Server error code
const serverErrorCode = 500;