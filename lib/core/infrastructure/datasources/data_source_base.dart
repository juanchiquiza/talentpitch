import 'dart:io';
import 'package:dio/dio.dart';
import '/core/infrastructure/http/exception.dart';

extension DioErrorX on DioException {
  /// Check if there is internet connection
  bool get isNoConnectionError {
    return type == DioExceptionType.connectionError && error is SocketException;
  }
}

/// No internet connection message
const noInternetConnectionMessage =
    '''No tienes conexión a internet.\nComprueba tu conexión a WiFi o datos móviles e intenta de nuevo''';

/// Class with reusable methods to use in the data source layer
class DataSourceBase<T> {
  /// Generic method that handles common exceptions when making a request
  /// even server [T] type of data to return in the request
  /// [execute] the function that will perform the request
  Future<T> serverRequest(Future<T> Function() execute,
      {String noInternetMessage = noInternetConnectionMessage,
      String errorDefaultMessage = 'Ha ocurrido un error'}) async {
    try {
      return await execute.call();
    } on DioException catch (e) {
      if (e.isNoConnectionError) {
        /// Throws exception caused by internet connection problem
        throw NoInternetConnectionException(noInternetMessage);
      } else {
        /// Throws Exception when something went wrong in the call
        throw RestApiException(
          errorCode: e.response?.statusCode,
          errorMessage: e.response?.statusMessage ?? errorDefaultMessage,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
