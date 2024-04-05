import 'package:freezed_annotation/freezed_annotation.dart';
import '/core/shared/constants.dart';

part 'app_config.freezed.dart';

/// In this class you can find all the base configurations for the environments
@freezed
class AppConfig with _$AppConfig {
  /// Empty constructor
  const AppConfig._();

  /// Named Constructor
  const factory AppConfig({
    /// Environment
    required EnvironmentConstants env,

    /// Base URL
    required String baseUrl,
  }) = _AppConfig;

}
