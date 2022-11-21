import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injecteo/injecteo.dart';
import 'package:todeo/core/logger/logger.dart';
import 'package:todeo/domain/task/model/task.dart';
import 'package:todeo/domain/use_cases/add_task_use_case.dart';
import 'package:todeo/domain/use_cases/delete_task_use_case.dart';
import 'package:todeo/domain/use_cases/emit_task_list_change_stream_use_case.dart';
import 'package:todeo/domain/use_cases/get_task_use_case.dart';
import 'package:todeo/domain/use_cases/update_task_use_case.dart';
import 'package:todeo/exports.dart';
import 'package:todeo/presentation/utils/app_const.dart';
import 'package:todeo/presentation/utils/input_from_data.dart';

part 'task_page_cubit.freezed.dart';

part 'task_page_state.dart';

@inject
class TaskPageCubit extends Cubit<TaskPageState> {
  TaskPageCubit(
    this._addTaskUseCase,
    this._getTaskUseCase,
    this._updateTaskUseCase,
    this._deleteTaskUseCase,
    this._emitTaskListChangeStreamUseCase,
  ) : super(TaskPageState.loading());

  String? _taskId;
  final AddTaskUseCase _addTaskUseCase;
  final GetTaskUseCase _getTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final EmitTaskListChangeStreamUseCase _emitTaskListChangeStreamUseCase;

  InputFormData _taskName = InputFormData(value: '', errorText: null);
  DateTime? _dueDate;
  bool _taskDone = false;

  void init(String? taskId) {
    _taskId = taskId;

    if (taskId != null) {
      _loadTask(taskId);
    }

    _emitIdle();
  }

  void setTaskName(String? name) {
    if (name is String && name.length < 3) {
      _taskName = InputFormData(
        value: name,
        errorText: LocaleKeys.task_validation_to_short.tr(),
      );
    } else {
      _taskName = InputFormData(
        value: name ?? '',
        errorText: null,
      );
    }

    _emitIdle();
  }

  void setDueDate(String dateTime) {
    _dueDate = DateTime.parse(dateTime);
    _emitIdle();
  }

  void updateTask(String taskId, String name, bool done, DateTime? dueDate) {
    _updateTaskUseCase(Task(
      id: taskId,
      name: name,
      done: done,
      dueDate: dueDate,
    ));
  }

  void deleteTask(String taskId) {
    try {
      _deleteTaskUseCase(taskId);
      _emitTaskListChangeStreamUseCase('deleted');
      emit(const TaskPageState.saved());
    } catch (e, s) {
      Logger.e('TaskPageCubit[save] - exception', ex: e, stacktrace: s);
      emit(TaskPageState.error());
    }
  }

  void addTask(String name, DateTime? dueDate) {
    _addTaskUseCase(
      Task(
        id: idGenerator.v4(),
        name: name,
        done: false,
        dueDate: _dueDate,
      ),
    );
  }

  void save() {
    try {
      if (_taskId != null) {
        updateTask(
          _taskId!,
          _taskName.value,
          _taskDone,
          _dueDate,
        );
      } else {
        addTask(
          _taskName.value,
          _dueDate,
        );
      }
      _emitTaskListChangeStreamUseCase('saved');
      emit(const TaskPageState.saved());
      return;
    } catch (e, s) {
      Logger.e('TaskPageCubit[save] - exception', ex: e, stacktrace: s);
      emit(TaskPageState.error());
    }
  }

  void _loadTask(String taskId) {
    final task = _getTaskUseCase(taskId);
    _taskName = InputFormData(value: task.name, errorText: null);
    _taskDone = task.done;
    _dueDate = task.dueDate;
  }

  void _emitIdle() {
    emit(TaskPageState.idle(_taskName, _dueDate));
  }
}
