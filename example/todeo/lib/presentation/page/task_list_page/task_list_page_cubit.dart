import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injecteo/injecteo.dart';
import 'package:todeo/core/logger/logger.dart';
import 'package:todeo/domain/notifiaction/use_cases/register_local_notification_use_case.dart';
import 'package:todeo/domain/task/model/task.dart';
import 'package:todeo/domain/use_cases/get_task_list_change_stream_use_case.dart';
import 'package:todeo/domain/use_cases/get_task_list_use_case.dart';
import 'package:todeo/domain/use_cases/update_task_use_case.dart';

part 'task_list_page_cubit.freezed.dart';

part 'task_list_page_state.dart';

@inject
class TaskListPageCubit extends Cubit<TaskListPageState> {
  TaskListPageCubit(
    this._getTaskListUseCase,
    this._updateTaskUseCase,
    this._getTaskListChangeStreamUseCase,
    this._registerLocalNotificationUseCase,
  ) : super(TaskListPageState.loading());

  final GetTaskListUseCase _getTaskListUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final GetTaskListChangeStreamUseCase _getTaskListChangeStreamUseCase;
  final RegisterLocalNotificationUseCase _registerLocalNotificationUseCase;

  StreamSubscription<String>? _listChangeStreamSubscription;

  late List<Task> _taskList;

  Future<void> init() async {
    _registerLocalNotificationUseCase();
    _loadTaskList();
    emit(TaskListPageState.idle(_taskList));
    _listChangeStreamSubscription =
        _getTaskListChangeStreamUseCase().listen((_) => _reloadTaskList());
  }

  void changeTaskStatus(Task task) {
    _updateTaskUseCase(task);
    _reloadTaskList();
  }

  void _loadTaskList() {
    try {
      _taskList = _getTaskListUseCase();
    } catch (e, s) {
      Logger.e(
        'GiftListPageCubit[_loadGifts] - failed get task list',
        ex: e,
        stacktrace: s,
      );
      emit(TaskListPageState.error());
    }
  }

  void _reloadTaskList() {
    emit(TaskListPageState.loading());
    _loadTaskList();
    emit(TaskListPageState.idle(_taskList));
  }

  @override
  Future<void> close() async {
    _listChangeStreamSubscription?.cancel();
    super.close();
  }
}
