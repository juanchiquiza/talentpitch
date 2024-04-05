import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/core/domain/failures/failure.dart';
import '/core/domain/usecase/base/use_case.dart';
import '/core/application/base_state.dart';

/// Notifier to handle data consuming from dynamic Use Case with Params
///
/// `T` = Entity to get on data state
///
/// `P` = Parameters to handle on UseCase (`K`)
///
/// `K` = A Use Case that extends from UseCaseParams class from Core
class BaseNotifier<T, P, K extends UseCaseParams<Failure, T, P>>
    extends StateNotifier<BaseState<T>> {
  /// Constructor
  BaseNotifier(this._useCase) : super(const BaseState.initial());

  final K _useCase; // Use case that handle data using UseCaseParams

  /// Get data to handle from UseCase
  Future<void> execute({required P params}) async {
    state = const BaseState.loading();

    final result = await _useCase.execute(params);
    state = result.fold(
      BaseState.error,
      (data) => BaseState.data(data: data),
    );
  }
}
