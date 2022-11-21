import 'package:injecteo/injecteo.dart';
import 'package:todeo/domain/task/model/task.dart';
import 'package:todeo/domain/task/task_repository.dart';

@inject
class GetTaskUseCase {
  GetTaskUseCase(this._taskRepository);

  final TaskRepository _taskRepository;

  Task call(String id) => _taskRepository.getTask(id);
}
