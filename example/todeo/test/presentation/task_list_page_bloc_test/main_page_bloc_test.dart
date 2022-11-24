import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:todeo/domain/notifiaction/use_cases/register_local_notification_use_case.dart';
import 'package:todeo/domain/task/model/task.dart';
import 'package:todeo/domain/use_cases/get_task_list_change_stream_use_case.dart';
import 'package:todeo/domain/use_cases/get_task_list_use_case.dart';
import 'package:todeo/domain/use_cases/update_task_use_case.dart';
import 'package:todeo/presentation/page/task_list_page/task_list_page_cubit.dart';

import 'main_page_bloc_test.mocks.dart';

@GenerateMocks([
  GetTaskListUseCase,
  UpdateTaskUseCase,
  GetTaskListChangeStreamUseCase,
  RegisterLocalNotificationUseCase,
])
void main() {
  late GetTaskListUseCase getTaskListUseCase;
  late UpdateTaskUseCase updateTaskUseCase;
  late GetTaskListChangeStreamUseCase getTaskListChangeStreamUseCase;
  late RegisterLocalNotificationUseCase registerLocalNotificationUseCase;
  late TaskListPageCubit cubit;

  setUp(() {
    getTaskListUseCase = MockGetTaskListUseCase();
    updateTaskUseCase = MockUpdateTaskUseCase();
    getTaskListChangeStreamUseCase = MockGetTaskListChangeStreamUseCase();
    registerLocalNotificationUseCase = MockRegisterLocalNotificationUseCase();
    cubit = TaskListPageCubit(
      getTaskListUseCase,
      updateTaskUseCase,
      getTaskListChangeStreamUseCase,
      registerLocalNotificationUseCase,
    );
  });

  final List<Task> taskList = List<Task>.generate(
    5,
    (index) => Task(
      id: index.toString(),
      name: 'Task $index',
      done: false,
    ),
  ).toList();

  group('init', () {
    blocTest<TaskListPageCubit, TaskListPageState>(
      'load task list page and emit idle state',
      build: () {
        when(getTaskListUseCase()).thenAnswer((_) => taskList);
        when(getTaskListChangeStreamUseCase())
            .thenAnswer((_) => const Stream.empty());

        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        TaskListPageState.idle(taskList),
      ],
    );
  });
}
