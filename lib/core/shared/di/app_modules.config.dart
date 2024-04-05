// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../categories/domain/repositories/url_shortener_repository.dart'
    as _i6;
import '../../../categories/domain/usecases/get_categories_details_use_case.dart'
    as _i9;
import '../../../categories/domain/usecases/get_categories_use_case.dart'
    as _i8;
import '../../../categories/infrastructure/data/datasources/remote_services/categories_service.dart'
    as _i4;
import '../../../categories/infrastructure/data/repositories/url_shortener_repository_impl.dart'
    as _i7;
import '../app_config.dart' as _i5;
import 'app_modules.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.singleton<_i3.Dio>(injectableModule.authDio);
  gh.factory<_i4.UrlShortenerService>(() => _i4.UrlShortenerImpl(
        gh<_i3.Dio>(),
        gh<_i5.AppConfig>(),
      ));
  gh.factory<_i6.UrlShortenerRepository>(
      () => _i7.UrlShortenerRepositoryImpl(gh<_i4.UrlShortenerService>()));
  gh.factory<_i8.GetCategories>(
      () => _i8.GetCategories(gh<_i6.UrlShortenerRepository>()));
  gh.factory<_i9.GetCategoriesDetails>(
      () => _i9.GetCategoriesDetails(gh<_i6.UrlShortenerRepository>()));
  return getIt;
}

class _$InjectableModule extends _i10.InjectableModule {}
