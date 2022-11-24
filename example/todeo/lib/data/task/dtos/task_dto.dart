import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  TaskDto({
    required this.id,
    required this.name,
    required this.done,
    this.dueDate,
  });

  final String id;
  final String name;
  final bool done;
  final DateTime? dueDate;

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);

  factory TaskDto.formJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);
}
