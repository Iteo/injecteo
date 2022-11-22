import 'package:todeo/domain/task/model/task.dart';

abstract class TaskRepository {
  List<Task> getTaskList();

  Future<void> addTask(Task task);

  Task getTask(String taskId);

  void updateTask(Task task);

  void deleteTask(String taskId);
}
