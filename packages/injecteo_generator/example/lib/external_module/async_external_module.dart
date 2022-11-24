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
abstract class AsyncAbstractExternalModule {
  @preResolve
  Future<ModuleDependency> get dependency => ModuleDependency.getInstance();

  String sayHello() {
    return 'hello';
  }
}

@Named('AsyncFactoryExternalModule')
@Inject(as: AsyncAbstractExternalModule)
class AsyncFactoryExternalModule extends AsyncAbstractExternalModule {
  @factoryMethod
  static Future<AsyncFactoryExternalModule> create() async {
    final delay = Duration(milliseconds: 500);
    await Future.delayed(delay);
    return AsyncFactoryExternalModule();
  }
}
