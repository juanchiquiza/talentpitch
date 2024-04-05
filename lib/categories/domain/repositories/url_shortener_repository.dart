// ignore_for_file: one_member_abstracts
import 'package:dartz/dartz.dart';
import '/categories/domain/entities/talent.dart';
import '/core/domain/failures/failure.dart';
import '/categories/domain/entities/category.dart';

/// Repository for use cases of Categories
abstract class UrlShortenerRepository {
  /// get categories
  Future<Either<Failure, List<Category>>> getCategoriesRepository();

  /// get categories details
  Future<Either<Failure, List<Talent>>> getCategoriesDetailsRepository(String url);
}
