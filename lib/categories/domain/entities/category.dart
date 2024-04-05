import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

/// Represents a model Category
@freezed
class Category with _$Category {
  /// Empty constructor
  const Category._();

  /// Named constructor
  const factory Category({
    /// Title of category
    required String title,

    /// Category url detail
    required String url,

    /// Category type
    required String type,

    /// Category image
    required String image,
  }) = _Category;
}
