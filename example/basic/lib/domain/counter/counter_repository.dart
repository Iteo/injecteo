import 'package:di_example/core/di/injection_modules.dart';

@counterInjectionModule
abstract class CounterRepository<T extends Object> {
  Future<T> getValue();
  Future<void> increment();
}
