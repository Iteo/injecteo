import 'package:di_example/domain/counter/counter_repository.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

@inject
class IncrementCounterUseCase {
  IncrementCounterUseCase(this._counterRepository);

  final CounterRepository<int> _counterRepository;

  Future<void> call() {
    return _counterRepository.increment();
  }
}
