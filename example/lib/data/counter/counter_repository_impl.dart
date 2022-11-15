import 'package:di_example/core/di/injection_modules.dart';
import 'package:di_example/core/logger/logger.dart';
import 'package:di_example/data/counter/counter_data_source.dart';
import 'package:di_example/domain/counter/counter_repository.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

@counterInjectionModule
@Singleton(as: CounterRepository<int>)
class CounterRepositoryImpl implements CounterRepository<int> {
  CounterRepositoryImpl(
    this._counterDataSource,
    this._logger,
  );

  final CounterDataSource _counterDataSource;
  final Logger _logger;

  @override
  Future<int> getValue() async {
    final value = await _counterDataSource.getValue();
    _logger.d('Current value: $value');
    return value;
  }

  @override
  Future<void> increment() async {
    return _counterDataSource.increment();
  }
}
