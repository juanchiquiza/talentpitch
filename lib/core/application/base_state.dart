import 'package:freezed_annotation/freezed_annotation.dart';
import '/core/domain/failures/failure.dart';

part 'base_state.freezed.dart';

/// Handle states for notifier when user use wants to handle some data execution
///
/// `T` -> Value to be returned on data state
@freezed
class BaseState<T> with _$BaseState<T> {
  /// Initial State
  const factory BaseState.initial() = _BaseStateInitial;

  /// Loading initial data State
  const factory BaseState.loading() = _BaseStateLoading;

  /// Data obtained from pagination
  const factory BaseState.data({required T data}) = _BaseStateData;

  /// Error obtained data
  const factory BaseState.error(Failure error) = _BaseStateError;
}
