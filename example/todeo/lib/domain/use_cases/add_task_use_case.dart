import 'package:injecteo/injecteo.dart';
import 'package:todeo/domain/task/model/task.dart';
import 'package:todeo/domain/task/task_repository.dart';

@inject
class AddTaskUseCase {
  AddTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Future<void> call(Task task) => _taskRepository.addTask(task);
}
