import 'package:auto_route/auto_route.dart';
import 'package:todeo/presentation/page/task_list_page/task_list_page.dart';
import 'package:todeo/presentation/page/task_page/task_page.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: TaskListPage, initial: true),
    AutoRoute(page: TaskPage),
  ],
)
class $MainRouter {}
