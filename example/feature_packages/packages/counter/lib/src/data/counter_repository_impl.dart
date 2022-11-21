import 'package:counter/src/data/counter_data_source.dart';
import 'package:counter/src/di/counter_injection_module.dart';
import 'package:counter/src/domain/counter_repository.dart';
import 'package:injecteo/injecteo.dart';

@counterInjectionModule
@Singleton(as: CounterRepository)
class CounterRepositoryImpl implements CounterRepository {
  CounterRepositoryImpl(
    this._counterDataSource,
  );

  final CounterDataSource _counterDataSource;

  @override
  int getValue() {
    final value = _counterDataSource.getValue();
    return value;
  }

  @override
  void increment() {
    return _counterDataSource.increment();
  }
}
