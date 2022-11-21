import 'package:auto_route/auto_route.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:todeo/exports.dart';
import 'package:todeo/presentation/theme/app_colors.dart';
import 'package:todeo/presentation/theme/app_dimens.dart';
import 'package:todeo/presentation/theme/app_typography.dart';
import 'package:todeo/presentation/utils/app_const.dart';
import 'package:todeo/presentation/utils/input_from_data.dart';
import 'package:todeo/presentation/widgets/app_bar.dart';
import 'package:todeo/presentation/widgets/error_message.dart';

import 'task_page_cubit.dart';

class TaskPage extends HookWidget {
  TaskPage({this.taskId, Key? key}) : super(key: key);

  final String? taskId;
  final List<String>? formErrors = [];

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<TaskPageCubit>();
    final state = useBlocBuilder(
      cubit,
      buildWhen: (state) => state is! TaskPageStateSaved,
    );
    final typography = useAppTypography();
    final colors = useAppThemeColors();
    final nowDateTime = DateTime.now();

    useBlocListener<TaskPageCubit, TaskPageState>(
      cubit,
      (cubit, state, context) {
        state.mapOrNull(saved: (_) {
          AutoRouter.of(context).popForced();
        });
      },
    );

    useEffect(() {
      cubit.init(taskId);
      return null;
    }, [cubit]);

    return Scaffold(
        appBar: const CustomAppBar(
          leading: true,
        ),
        body: state.maybeMap(
          idle: (state) => _buildBody(
            context,
            cubit,
            state.taskName,
            typography,
            colors,
            nowDateTime,
            state.dueDate,
          ),
          orElse: () => const Center(
            child: ErrorMessage(),
          ),
        ));
  }

  Widget _buildBody(
    BuildContext context,
    TaskPageCubit cubit,
    InputFormData taskName,
    AppTypography typography,
    AppThemeColors colors,
    DateTime nowDateTime,
    DateTime? dueDate,
  ) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.xxl,
            vertical: AppDimens.xxxc,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: AppDimens.ml,
              ),
              Text(
                taskId == null ? LocaleKeys.task_add_label.tr() : LocaleKeys.task_update_label.tr(),
                style: typography.h1,
              ),
              const SizedBox(
                height: AppDimens.s,
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDimens.ml,
                      ),
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9 a-z A-Z]'),
                          ),
                        ],
                        style: typography.h3,
                        decoration: InputDecoration(
                          errorText: taskName.errorText,
                          errorStyle: typography.h3.copyWith(
                            color: colors.textError,
                          ),
                          labelText: LocaleKeys.task_name_label.tr(),
                          labelStyle: typography.h3,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AppDimens.s,
                            ),
                          ),
                        ),
                        onChanged: (value) => cubit.setTaskName(value),
                        initialValue: taskName.value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDimens.ml,
                      ),
                      child: DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        dateMask: dateTimeMask,
                        initialValue: dueDate != null ? dueDate.toString() : DateTime.now().toString(),
                        firstDate: DateTime(nowDateTime.year),
                        lastDate: DateTime(nowDateTime.year + 10, nowDateTime.month, nowDateTime.day),
                        dateLabelText: 'Date',
                        timeLabelText: 'Hour',
                        onChanged: (value) => cubit.setDueDate(value),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: AppDimens.ml),
                      height: AppDimens.xc,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color:
                              taskName.errorText != null ? colors.primaryButtonDisabledFill : colors.primaryButtonFill,
                          borderRadius: BorderRadius.circular(AppDimens.xl)),
                      child: TextButton(
                        onPressed: () => cubit.save(),
                        child: Text(
                          taskId == null ? LocaleKeys.operation_add.tr() : LocaleKeys.operation_update.tr(),
                          style: typography.buttonText,
                        ),
                      ),
                    ),
                    taskId != null
                        ? Container(
                            margin: const EdgeInsets.symmetric(vertical: AppDimens.ml),
                            height: AppDimens.xc,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: colors.primaryButtonFill, borderRadius: BorderRadius.circular(AppDimens.xl)),
                            child: TextButton(
                              onPressed: () => cubit.deleteTask(taskId!),
                              child: Text(
                                LocaleKeys.operation_delete.tr(),
                                style: typography.buttonText,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
