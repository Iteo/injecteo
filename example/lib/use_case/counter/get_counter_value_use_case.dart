import 'package:di_example/core/di/injection_modules.dart';
import 'package:di_example/domain/counter/counter_repository.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

@inject
@counterInjectionModule
class GetCounterValueUseCase {
  GetCounterValueUseCase(this._counterRepository);

  final CounterRepository<int> _counterRepository;

  Future<int> call() async {
    final value = await _counterRepository.getValue();
    return value;
  }
}
