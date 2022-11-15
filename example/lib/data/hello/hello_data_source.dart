import 'package:di_example/core/di/injection_modules.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

@helloInjectionModule
@inject
class HelloDataSource {
  Future<String> hello() async {
    return 'hello';
  }
}
