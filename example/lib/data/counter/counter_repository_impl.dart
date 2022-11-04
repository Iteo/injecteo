import 'package:di_example/data/counter/counter_data_source.dart';
import 'package:di_example/domain/counter/counter_repository.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

@Singleton(as: CounterRepository)
class CounterRepositoryImpl implements CounterRepository<int> {
  CounterRepositoryImpl(this._counterDataSource);

  final CounterDataSource _counterDataSource;

  @override
  Future<int> getValue() async {
    return _counterDataSource.getValue();
  }

  @override
  Future<void> increment() async {
    return _counterDataSource.increment();
  }
}
