import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '/categories/domain/entities/talent.dart';
import '/core/domain/failures/failure.dart';
import '/core/domain/usecase/base/use_case.dart';
import '/categories/domain/repositories/url_shortener_repository.dart';

/// Use case to Get Categories details
@injectable
class GetCategoriesDetails
    extends UseCaseParams<Failure, List<Talent>, GetCategoriesDetailsParams> {
  /// Constructor
  GetCategoriesDetails(this._repository);

  final CategoriesRepository _repository;

  @override
  Future<Either<Failure, List<Talent>>> execute(
      GetCategoriesDetailsParams params,
  ) async =>
      _repository.getCategoriesDetailsRepository(params.url);
}

/// Params used for [GetCategoriesDetails]
class GetCategoriesDetailsParams {
  /// Constructor
  GetCategoriesDetailsParams(this.url);

  /// Url ofShortener Repository
  final String url;
}
