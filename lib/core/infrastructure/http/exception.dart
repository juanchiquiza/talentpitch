/// Exceptions caused when calling API
class RestApiException implements Exception {
  /// Constructor
  const RestApiException({this.errorCode, this.errorMessage});

  /// Error status code https
  final int? errorCode;

  /// Error message
  final String? errorMessage;
}

/// Exception when there is not internet connection
class NoInternetConnectionException implements Exception {
  /// Constructor
  const NoInternetConnectionException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused when there is not data found
class DataNotFoundException implements Exception {
  /// Constructor
  const DataNotFoundException(this.message);

  /// Error message
  final String message;
}

/// Exceptions caused when there is not data found
class DataException implements Exception {
  /// Constructor
  const DataException(this.message);

  /// Error message
  final String message;
}