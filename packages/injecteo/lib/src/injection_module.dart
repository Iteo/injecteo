import 'package:injecteo/src/service_locator.dart';

abstract class InjectionModule {
  Future<void> registerDependencies({
    required ServiceLocator serviceLocator,
    required String env,
  });
}
