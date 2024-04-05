import 'package:dartz/dartz.dart';

/// Class from which use cases that do not need parameters to perform an
/// operation should extend
abstract class UseCase<T, Type> {
  Future<Either<T, Type>> execute();
}

/// A source of asynchronous data events use case without params .
abstract class UseCaseStream<T> {
  Stream<T> execute();
}

/// Parameters have to be put into a container object so that
/// they can be included in this abstract base class method definition.
///
/// The result of an asynchronous computation.
abstract class UseCaseParams<T, Type, Params> {
  Future<Either<T, Type>> execute(Params params);
}

/// Parameters have to be put into a container object so that
/// they can be included in this abstract base class method definition.
///
/// A source of asynchronous data events.
abstract class UseCaseStreamParams<T, Params> {
  Stream<T> execute(Params params);
}
