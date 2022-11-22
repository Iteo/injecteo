import 'package:injecteo/injecteo.dart';
import 'package:todeo/data/task/dtos/task_dto.dart';
import 'package:todeo/data/utils/bidirectional_data_mapper.dart';
import 'package:todeo/domain/task/model/task.dart';

@inject
class TaskDtoMapper extends BidirectionalDataMapper<TaskDto, Task> {
  @override
  TaskDto to(Task data) {
    return TaskDto(
      id: data.id,
      name: data.name,
      done: data.done,
      dueDate: data.dueDate,
    );
  }

  @override
  Task from(TaskDto data) {
    return Task(
      id: data.id,
      name: data.name,
      done: data.done,
      dueDate: data.dueDate,
    );
  }
}
