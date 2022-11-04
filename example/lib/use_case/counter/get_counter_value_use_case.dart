import 'package:di_example/domain/counter/counter_repository.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

@inject
class GetCounterValueUseCase {
  GetCounterValueUseCase(this._counterRepository);

  final CounterRepository<int> _counterRepository;

  Future<int> call() async {
    return _counterRepository.getValue();
  }
}
