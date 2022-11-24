import 'package:injecteo/injecteo.dart';
import 'package:todeo/data/task/data_sources/task_data_source.dart';
import 'package:todeo/data/task/dtos/task_dto.dart';
import 'package:todeo/data/task/mappers/task_dto_mapper.dart';
import 'package:todeo/domain/task/model/task.dart';
import 'package:todeo/domain/task/task_repository.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl(
    this._taskDataSource,
    this._taskDtoMapper,
  );

  final TaskDataSource _taskDataSource;
  final TaskDtoMapper _taskDtoMapper;

  @override
  List<Task> getTaskList() {
    return _taskDataSource
        .getTaskList()
        .map((taskDto) => _taskDtoMapper.from(taskDto))
        .toList();
  }

  @override
  Future<void> addTask(Task task) async {
    final taskDto = _taskDtoMapper.to(task);
    return _taskDataSource.addTask(taskDto);
  }

  @override
  Task getTask(String taskId) {
    final taskDto = _taskDataSource.getTask(taskId);
    return _taskDtoMapper.from(taskDto);
  }

  @override
  void updateTask(Task task) {
    List<TaskDto> taskDtoList = _taskDataSource.getTaskList().map((taskDto) {
      if (taskDto.id == task.id) {
        return TaskDto(
          id: task.id,
          name: task.name,
          done: task.done,
          dueDate: task.dueDate,
        );
      }
      return taskDto;
    }).toList();

    _taskDataSource.saveTaskList(taskDtoList);
  }

  @override
  void deleteTask(String taskId) {
    final taskDtoList = _taskDataSource.getTaskList();
    taskDtoList.remove(
      taskDtoList.firstWhere((element) => element.id == taskId),
    );

    _taskDataSource.saveTaskList(taskDtoList);
  }
}
