import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Different kind of failures that will be handled
@freezed
class Failure with _$Failure {
  const Failure._();

  /// When something went wrong because of the data that has been sent
  const factory Failure.data({required String message}) = _Data;

  /// When there is no data in the response
  const factory Failure.noData({required String message}) = _NoData;

  /// When something went wrong in the server side
  const factory Failure.server({
    required String message,
    required int code,
  }) = _Server;

  /// When something went wrong in the local database
  const factory Failure.storage({required String message}) = _Storage;

  /// When there is not internet connection
  const factory Failure.noConnection({required String message}) =
      _NoConnection;

  /// When an error occurs due to a specific business exception of a flow
  const factory Failure.other({
    required String message,
    required int code,
  }) = _Other;
}
