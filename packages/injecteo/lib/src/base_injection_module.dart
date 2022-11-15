import 'dart:async';

import 'package:injecteo/injecteo.dart';

abstract class BaseInjectionModule {
  FutureOr<void> registerDependencies(
    ServiceLocator serviceLocator, {
    String? environment,
    EnvironmentFilter? environmentFilter,
  });
}
