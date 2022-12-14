import 'package:di_example/core/di/injection_modules.dart';
import 'package:di_example/domain/counter/counter_repository.dart';
import 'package:injecteo/injecteo.dart';

@inject
@counterInjectionModule
class IncrementCounterUseCase {
  IncrementCounterUseCase(this._counterRepository);

  final CounterRepository<int> _counterRepository;

  Future<void> call() {
    return _counterRepository.increment();
  }
}
