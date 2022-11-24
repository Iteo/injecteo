import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todeo/domain/task/model/task.dart';
import 'package:todeo/exports.dart';
import 'package:todeo/presentation/theme/app_colors.dart';
import 'package:todeo/presentation/theme/app_dimens.dart';
import 'package:todeo/presentation/theme/app_typography.dart';

class TaskCard extends HookWidget {
  const TaskCard({
    required this.task,
    required this.onChangeTaskStatus,
    Key? key,
  }) : super(key: key);

  final Task task;
  final Function(Task task) onChangeTaskStatus;

  @override
  Widget build(BuildContext context) {
    final colors = useAppThemeColors();
    final typography = useAppTypography();
    final DateFormat formatter = DateFormat('yyyy-MM-dd H:mm');

    return Card(
      elevation: AppDimens.s,
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.s,
        vertical: AppDimens.xs,
      ),
      child: Container(
        decoration: BoxDecoration(color: colors.taskCardBackground),
        child: ListTile(
          onTap: () => AutoRouter.of(context).push(
            TaskPageRoute(taskId: task.id),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppDimens.ml,
            vertical: AppDimens.s,
          ),
          leading: Container(
            padding: const EdgeInsets.only(
              right: AppDimens.sm,
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: AppDimens.one,
                  color: colors.appBackground,
                ),
              ),
            ),
            child: Checkbox(
              value: task.done,
              onChanged: (bool? value) {
                onChangeTaskStatus(
                  task.copyWith(done: value ?? false),
                );
              },
            ),
          ),
          title: Text(
            task.name,
            style: task.done
                ? typography.taskCardTextDone
                : typography.taskCardText,
          ),
          subtitle: Text(
              task.dueDate != null ? formatter.format(task.dueDate!) : '',
              style: typography.b2),
        ),
      ),
    );
  }
}
