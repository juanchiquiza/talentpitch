import 'package:freezed_annotation/freezed_annotation.dart';

part 'talent_dto.freezed.dart';

part 'talent_dto.g.dart';

/// Represents a model Category DTO
@freezed
class TalentDTO with _$TalentDTO {
  /// Constructor
  const factory TalentDTO({
    /// Image of talent
    required String avatar,

    /// name of talent
    required String name,

    /// City of talent
    required String city,

    /// Video of talent
    required String video,
  }) = _TalentDTO;

  /// Generates fromJson and toJson methods
  factory TalentDTO.fromJson(Map<String, dynamic> json) =>
      _$TalentDTOFromJson(json);
}
