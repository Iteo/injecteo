import 'package:injecteo/injecteo.dart';

class InjectionModule {
  const InjectionModule({
    this.serviceLocator,
    this.env,
  });

  final ServiceLocator? serviceLocator;
  final String? env;
}

const injectionModule = InjectionModule();
