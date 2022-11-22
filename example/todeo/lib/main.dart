import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:todeo/core/logger/logger.dart';
import 'package:todeo/exports.dart';
import 'package:todeo/presentation/app.dart';

import 'core/bloc/simple_bloc_observer.dart';
import 'core/di/injector.dart';

Future<void> runMain(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();

  await configureDependencies(env);

  Logger.setupLogger(env);

  await runZonedGuarded<Future<void>>(() async {
    final mainRouter = MainRouter();
    Bloc.observer = SimpleBlocObserver();
    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useFallbackTranslations: true,
        child: HookedBlocConfigProvider(
          injector: () => getIt.get,
          builderCondition: (state) => state != null,
          listenerCondition: (state) => state != null,
          child: App(mainRouter: mainRouter),
        ),
      ),
    );
  }, (e, s) => Logger.e('Application error', ex: e, stacktrace: s));
}
