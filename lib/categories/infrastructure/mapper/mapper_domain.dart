import '/categories/domain/entities/talent.dart';
import '/categories/infrastructure/data/models/talent_dto.dart';
import '/categories/domain/entities/category.dart';
import '/categories/infrastructure/data/models/category_dto.dart';

/// Handle List<CategoryDTO> conversions
extension MapperListCategoryListDTO on List<CategoryDTO> {
  /// DTO to Domain
  List<Category> toDomain() {
    return map((CategoryDTO e) => e.toDomain()).toList();
  }
}

/// Mapper for CategoryDTO
extension MapperLinkDTO on CategoryDTO {
  /// DTO to Entity
  Category toDomain() => Category(
        title: title,
        url: url,
        type: type,
        image: image,
      );
}

/// Handle List<TalentDTO> conversions
extension MapperListTalentListDTO on List<TalentDTO> {
  /// DTO to Domain
  List<Talent> toDomain() {
    return map((TalentDTO e) => e.toDomain()).toList();
  }
}

/// Mapper for TalentDTO
extension MapperTalentDTO on TalentDTO {
  /// DTO to Entity
  Talent toDomain() => Talent(
        avatar: avatar,
        city: city,
        name: name,
        video: video,
      );
}
