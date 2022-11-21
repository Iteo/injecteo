import 'package:injecteo/injecteo.dart';
import 'package:todeo/domain/task_list_notifier.dart';

@inject
class EmitTaskListChangeStreamUseCase {
  EmitTaskListChangeStreamUseCase(this._taskListChangeNotifier);

  final TaskListChangeNotifier _taskListChangeNotifier;

  void call(String action) => _taskListChangeNotifier.notify(action);
}
