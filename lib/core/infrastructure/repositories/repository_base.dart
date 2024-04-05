import 'dart:async';

import 'package:dartz/dartz.dart';
import '/core/infrastructure/http/constants_messages.dart';
import '/core/domain/failures/failure.dart';
import '/core/infrastructure/http/exception.dart';
import '/core/infrastructure/http/status_code.dart';

/// Class with methods to reuse code in the repository layer
class RepositoryBase<T> {
  /// Generic function that handles exceptions in the repository layer
  /// [execute] is the function that will be executed in which the
  /// handle exceptions
  Future<Either<Failure, T>> remoteRequest(
    FutureOr<Either<Failure, T>> Function() execute,
  ) async {
    try {
      return await execute();
    } on NoInternetConnectionException catch (e) {
      /// returns failure if there was internet connection problem
      return left(Failure.noConnection(message: e.message));
    } on RestApiException catch (e) {
      /// returns failure caused by server exception
      return left(
        Failure.server(
          code: e.errorCode ?? StatusCode.badRequest,
          message: e.errorMessage ?? ConstantMessage.serverErrorMessage,
        ),
      );
    } on DataNotFoundException catch (e) {
      return left(Failure.noData(message: e.message));
    }
  }
}
