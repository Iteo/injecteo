import 'package:injecteo/injecteo.dart';
import 'package:todeo/domain/task/model/task.dart';
import 'package:todeo/domain/task/task_repository.dart';

@inject
class UpdateTaskUseCase {
  UpdateTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  void call(Task task) => _taskRepository.updateTask(task);
}
