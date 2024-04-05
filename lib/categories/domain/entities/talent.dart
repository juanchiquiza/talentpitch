import 'package:freezed_annotation/freezed_annotation.dart';

part 'talent.freezed.dart';

/// Represents a model Talent
@freezed
class Talent with _$Talent {
  /// Empty constructor
  const Talent._();

  /// Named constructor
  const factory Talent({
    /// Image of talent
    required String avatar,

    /// name of talent
    required String name,

    /// City of talent
    required String city,

    /// Video of talent
    required String video,
  }) = _Talent;
}
