import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:todeo/exports.dart';
import 'package:todeo/presentation/theme/app_colors.dart';
import 'package:todeo/presentation/theme/app_dimens.dart';
import 'package:todeo/presentation/theme/app_typography.dart';
import 'package:todeo/presentation/widgets/app_bar.dart';
import 'package:todeo/presentation/widgets/error_message.dart';
import 'package:todeo/presentation/widgets/loader.dart';
import 'package:todeo/presentation/widgets/task_card.dart';

import 'task_list_page_cubit.dart';

class TaskListPage extends HookWidget {
  const TaskListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<TaskListPageCubit>();
    final state = useBlocBuilder(cubit);
    final colors = useAppThemeColors();
    final typography = useAppTypography();

    useEffect(() {
      cubit.init();
      return null;
    }, [cubit]);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Center(
          child: state.maybeMap(
            idle: (state) => state.taskList.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.taskList.length,
                    itemBuilder: (BuildContext context, int index) => TaskCard(
                      task: state.taskList[index],
                      onChangeTaskStatus: (task) =>
                          cubit.changeTaskStatus(task),
                    ),
                  )
                : Center(
                    child: Text(
                      LocaleKeys.main_page_empty_list.tr(),
                      style: typography.h1,
                    ),
                  ),
            loading: (_) => const Loader(),
            orElse: () => const ErrorMessage(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => AutoRouter.of(context).push(TaskPageRoute()),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: colors.appBarBackground,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: const [
            Expanded(
              child: SizedBox(height: AppDimens.xxl),
            ),
          ],
        ),
      ),
    );
  }
}
