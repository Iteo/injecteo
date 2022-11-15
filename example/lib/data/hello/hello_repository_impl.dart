import 'package:di_example/core/di/injection_modules.dart';
import 'package:di_example/data/hello/hello_data_source.dart';
import 'package:di_example/domain/hello/hello_repository.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

@Singleton(as: HelloRepository)
@helloInjectionModule
class HelloRepositoryImpl implements HelloRepository {
  HelloRepositoryImpl(
    this._dataSource,
  );

  final HelloDataSource _dataSource;

  @override
  Future<String> hello() async {
    return _dataSource.hello();
  }
}
