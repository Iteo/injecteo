import 'package:injecteo/injecteo.dart';
import 'package:todeo/domain/task/task_repository.dart';

@inject
class DeleteTaskUseCase {
  DeleteTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  void call(String taskId) => _taskRepository.deleteTask(taskId);
}
