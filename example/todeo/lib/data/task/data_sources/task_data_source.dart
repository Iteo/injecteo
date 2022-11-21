import 'dart:convert';

import 'package:injecteo/injecteo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todeo/data/task/dtos/task_dto.dart';

const String taskListKey = 'taskList';

@inject
class TaskDataSource {
  TaskDataSource(this.storage);

  final SharedPreferences storage;

  List<TaskDto> getTaskList() {
    List<String>? taskListData = storage.getStringList(taskListKey);

    return taskListData?.map((String task) => TaskDto.formJson(json.decode(task))).toList() ?? [];
  }

  Future<void> saveTaskList(List<TaskDto> taskList) async {
    List<String> taskListData = taskList.map((taskDto) => json.encode(taskDto).toString()).toList();

    await storage.setStringList(taskListKey, taskListData);
  }

  TaskDto getTask(String id) {
    return getTaskList().firstWhere((task) => task.id == id);
  }

  Future<void> updateTask(TaskDto task) async {
    final taskListDto = getTaskList();
    final index = taskListDto.indexWhere((elem) => elem.id == task.id);
    taskListDto[index] = task;

    await saveTaskList(taskListDto);
  }

  Future<void> addTask(TaskDto taskDto) async {
    final taskListDto = getTaskList();
    taskListDto.add(taskDto);

    await saveTaskList(taskListDto);
  }
}
