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
abstract class AbstractSimpleModule {
  @preResolve
  @lazySingleton
  Future<ModuleDependency> get dependency => ModuleDependency.getInstance();
}

@Inject(as: AbstractSimpleModule)
class SimpleModule extends AbstractSimpleModule {
  String additionalMethod([String name = 'Joe']) {
    return 'Hello, $name';
  }

  @override
  String toString() {
    return '${this.runtimeType}';
  }
}
