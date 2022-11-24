import 'package:injecteo/injecteo.dart';

class ModuleDependency {
  ModuleDependency._();

  static Future<ModuleDependency> getInstance() async {
    final delay = Duration(milliseconds: 100);
    await Future.delayed(delay);
    return ModuleDependency._();
  }
}

@externalModule
abstract class NamedModule {
  @lazySingleton
  @preResolve
  Future<ModuleDependency> get dependency => ModuleDependency.getInstance();
}

@Named('MyFancyModuleInstance')
@Inject(as: NamedModule)
class FancyNamedModule extends NamedModule {}

@Named('MyQuiteNormalNamedModuleInstance')
@Inject(as: NamedModule)
class QuiteNormalNamedModule extends NamedModule {}
