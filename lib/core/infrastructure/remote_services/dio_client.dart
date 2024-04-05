import 'package:dio/dio.dart';

/// This is the general Dio client to which we can add a custom base
///
/// The static method getInstance is used to retrieve an instance
/// asynchronously for this class.
class DioClient {
  /// Constructor
  DioClient();

  /// The getInstance method is used by GetIt to retrieve an
  /// asynchronous instance.
  /// The [contentType] is the content element to set on the client. Check dio/src/headers.dart for more info.
  /// The [interceptors] is the array of interceptors to add to this client.
  static Dio getInstance({
    String contentType = Headers.jsonContentType,
    List<Interceptor>? interceptors,
  }) {
    final dioClient = DioClient();
    return dioClient._createInstance(
      contentType,
      interceptors,
    );
  }

  /// Method that creates the instance and adds the interceptors
  Dio _createInstance(
    String contentType,
    List<Interceptor>? interceptors,
  ) {
    final dio = Dio()..options = _configureDio(contentType);
    return dio;
  }

  BaseOptions _configureDio(String contentType) => BaseOptions(
        contentType: contentType,
      );
}
