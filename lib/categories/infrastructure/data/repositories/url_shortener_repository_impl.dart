import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '/categories/infrastructure/data/datasources/remote_services/categories_service.dart';
import '/categories/domain/entities/talent.dart';
import '/categories/domain/entities/category.dart';
import '/categories/domain/repositories/url_shortener_repository.dart';
import '/categories/infrastructure/mapper/mapper_domain.dart';
import '/core/domain/failures/failure.dart';
import '/core/infrastructure/repositories/repository_base.dart';

/// Implementation of [CategoriesRepository]
@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  /// Constructor
  CategoriesRepositoryImpl(
    this._categoriesService,
  );

  final CategoriesService _categoriesService;

  @override
  Future<Either<Failure, List<Category>>> getCategoriesRepository() {
    return RepositoryBase<List<Category>>().remoteRequest(() async {
      final response = await _categoriesService.getCategories();
      return Right(response.toDomain());
    });
  }

  @override
  Future<Either<Failure, List<Talent>>> getCategoriesDetailsRepository(
      String url) {
    return RepositoryBase<List<Talent>>().remoteRequest(() async {
      final response = await _categoriesService.getCategoriesDetails(url);
      return Right(response.toDomain());
    });
  }
}
