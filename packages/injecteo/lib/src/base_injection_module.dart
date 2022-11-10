import 'package:injecteo/injecteo.dart';

abstract class BaseInjectionModule {
  Future<void> registerDependencies(ServiceLocator sl);
}
