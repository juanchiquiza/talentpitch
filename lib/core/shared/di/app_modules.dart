import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '/core/infrastructure/remote_services/dio_client.dart';
import '/core/shared/app_config.dart';
import 'app_modules.config.dart';

/// Access to the Singleton instance of GetIt
final GetIt getIt = GetIt.instance;

/// initializes the registration of provided dependencies inside of [GetIt]
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureInjection(AppConfig config) async {
  getIt.registerLazySingleton<AppConfig>(() => config);
  init(getIt);
}

/// Module for inject external dependencies
@module
abstract class InjectableModule {
  /// Injection for [Dio]
  @singleton
  Dio get authDio => DioClient.getInstance();
}
