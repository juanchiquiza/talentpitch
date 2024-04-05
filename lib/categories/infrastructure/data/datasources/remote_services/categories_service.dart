import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import '/categories/infrastructure/data/models/category_dto.dart';
import '/categories/infrastructure/data/models/talent_dto.dart';
import '/core/infrastructure/http/exception.dart';
import '/core/infrastructure/http/status_code.dart';
import '/core/infrastructure/datasources/data_source_base.dart';
import '/core/shared/app_config.dart';
import '/categories/infrastructure/data/datasources/url_shortener_data_const.dart';

/// Remote data source to handle Categories requests
abstract class UrlShortenerService {
  /// Get Categories
  Future<List<CategoryDTO>> getCategories();

  /// Get Categories details
  Future<List<TalentDTO>> getCategoriesDetails(String url);
}

/// Implementation of [UrlShortenerService]
@Injectable(as: UrlShortenerService)
class UrlShortenerImpl extends UrlShortenerService {
  /// Constructor
  UrlShortenerImpl(this._dio, this._appConfig);

  final Dio _dio;
  final AppConfig _appConfig;

  @override
  Future<List<CategoryDTO>> getCategories() {
    return DataSourceBase<List<CategoryDTO>>().serverRequest(() async {
      final requestUri = Uri.https(
        _appConfig.baseUrl,
        UrlShortenerDataConst.urlShortenerEndPoint.value,
      );

      final response = await _dio.getUri(
        requestUri,
      );

      if (response.statusCode == StatusCode.ok) {
        final result = response.data['data'] as List;

        final categoryList = <CategoryDTO>[];

        for (final item in result) {
          categoryList.add(
            CategoryDTO.fromJson(item as Map<String, dynamic>),
          );
        }
        return categoryList;
      } else {
        /// Throws Exception when status code is not 200
        throw RestApiException(
          errorCode: response.statusCode,
          errorMessage: response.statusMessage,
        );
      }
    });
  }

  @override
  Future<List<TalentDTO>> getCategoriesDetails(String url) {
    return DataSourceBase<List<TalentDTO>>().serverRequest(() async {
      final requestUri = Uri.parse(url);

      final response = await _dio.getUri(
        requestUri,
      );

      if (response.statusCode == StatusCode.ok) {
        final result = response.data['data'] as List;

        final talentList = <TalentDTO>[];

        for (final item in result) {
          talentList.add(
            TalentDTO.fromJson(item as Map<String, dynamic>),
          );
        }
        return talentList;
      } else {
        /// Throws Exception when status code is not 200
        throw RestApiException(
          errorCode: response.statusCode,
          errorMessage: response.statusMessage,
        );
      }
    });
  }
}
