import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '/core/domain/failures/failure.dart';
import '/core/domain/usecase/base/use_case.dart';
import '/categories/domain/entities/category.dart';
import '/categories/domain/repositories/url_shortener_repository.dart';

/// Use case to Get Categories
@injectable
class GetCategories
    extends UseCaseParams<Failure, List<Category>, GetCategoriesParams> {
  /// Constructor
  GetCategories(this._repository);

  final CategoriesRepository _repository;

  @override
  Future<Either<Failure, List<Category>>> execute(
    GetCategoriesParams params,
  ) async =>
      _repository.getCategoriesRepository();
}

/// Params used for [GetCategories]
class GetCategoriesParams {
  /// Constructor
  GetCategoriesParams();
}
