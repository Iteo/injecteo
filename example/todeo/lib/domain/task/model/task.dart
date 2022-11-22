import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    required String id,
    required String name,
    required bool done,
    DateTime? dueDate,
  }) = _Task;
}
