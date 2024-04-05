import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/categories/domain/entities/talent.dart';
import '/categories/domain/usecases/get_categories_details_use_case.dart';
import '/categories/domain/entities/category.dart';
import '/core/application/base_notifier.dart';
import '/core/application/base_state.dart';
import '/core/shared/di/app_modules.dart';
export '/core/application/base_notifier.dart';
import '/categories/domain/usecases/get_categories_use_case.dart';

/// State notifier to handle data from Put Contest Params
final categoriesProvider = StateNotifierProvider<
    BaseNotifier<List<Category>, GetCategoriesParams, GetCategories>,
    BaseState<List<Category>>>(
  (_) => BaseNotifier(getIt<GetCategories>()),
);

/// State notifier to handle data from Put Contest Params
final categoryDetailsProvider = StateNotifierProvider<
    BaseNotifier<List<Talent>, GetCategoriesDetailsParams,
        GetCategoriesDetails>,
    BaseState<List<Talent>>>(
  (_) => BaseNotifier(getIt<GetCategoriesDetails>()),
);
