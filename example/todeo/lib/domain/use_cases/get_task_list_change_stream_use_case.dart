import 'package:injecteo/injecteo.dart';
import 'package:todeo/domain/task_list_notifier.dart';

@inject
class GetTaskListChangeStreamUseCase {
  GetTaskListChangeStreamUseCase(this._taskListChangeNotifier);

  final TaskListChangeNotifier _taskListChangeNotifier;

  Stream<String> call() => _taskListChangeNotifier.getStream();
}
