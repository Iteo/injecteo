part of 'task_page_cubit.dart';

@freezed
class TaskPageState with _$TaskPageState {
  factory TaskPageState.loading() = _TaskPageStateLoading;

  factory TaskPageState.idle(
    InputFormData taskName,
    DateTime? dueDate,
  ) = _TaskPageStateIdle;

  const factory TaskPageState.saved() = TaskPageStateSaved;

  factory TaskPageState.error() = _TaskPageStateError;
}
