part of 'task_list_page_cubit.dart';

@freezed
class TaskListPageState with _$TaskListPageState {
  factory TaskListPageState.loading() = _TaskListPageStateLoading;

  factory TaskListPageState.idle(List<Task> taskList) = _TaskListPageStateIdle;

  factory TaskListPageState.error() = _TaskListPageStateError;
}
