import 'package:injecteo/injecteo.dart';
import 'package:todeo/domain/notifiaction/notification_repository.dart';
import 'package:todeo/domain/task/model/task.dart';
import 'package:todeo/domain/task/task_repository.dart';

@inject
class GetTaskListUseCase {
  GetTaskListUseCase(
    this._taskRepository,
    this._notificationRepository,
  );

  final TaskRepository _taskRepository;
  final NotificationRepository _notificationRepository;

  List<Task> call() {
    final taskList = _taskRepository.getTaskList();
    _notificationRepository.cancelAllNotification();
    for (var task in taskList) {
      if (task.dueDate != null &&
          task.dueDate is DateTime &&
          task.dueDate!.isAfter(DateTime.now())) {
        _notificationRepository.createNotification(
          'Check your tasks',
          'The task ${task.name} time will run out',
          task.dueDate!.millisecondsSinceEpoch,
          'task reminder channel',
        );
      }
    }
    return taskList;
  }
}
