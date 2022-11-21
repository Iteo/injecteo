import 'package:di_example/core/di/injection_modules.dart';

@helloInjectionModule
abstract class HelloRepository {
  Future<String> hello();
}
