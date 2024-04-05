import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_dto.freezed.dart';

part 'category_dto.g.dart';

/// Represents a model Category DTO
@freezed
class CategoryDTO with _$CategoryDTO {
  /// Constructor
  const factory CategoryDTO({
    /// Title of category
    required String title,

    /// Category url detail
    required String url,

    /// Category type
    required String type,

    /// Category image
    required String image,
  }) = _CategoryDTO;

  /// Generates fromJson and toJson methods
  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);
}
