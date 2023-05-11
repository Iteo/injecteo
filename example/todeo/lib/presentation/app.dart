import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todeo/presentation/routing/main_router.gr.dart';
import 'package:todeo/presentation/theme/app_colors.dart';

class App extends HookWidget {
  const App({
    required this.mainRouter,
    Key? key,
  }) : super(key: key);

  final MainRouter mainRouter;

  @override
  Widget build(BuildContext context) {
    final appColors = useAppThemeColors();

    return MaterialApp.router(
      title: 'todeo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: mainRouter.defaultRouteParser(),
      routerDelegate: mainRouter.delegate(),
      theme: ThemeData(
        scaffoldBackgroundColor: appColors.appBackground,
      ),
    );
  }
}
