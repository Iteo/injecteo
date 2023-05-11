import 'package:counter/src/di/counter_injection_module.dart';
import 'package:injecteo/injecteo.dart';
import 'package:logger/logger.dart';

@singleton
@counterInjectionModule
class CounterDataSource {
  CounterDataSource(this._logger);
  final Logger _logger;
  int _counter = 0;

  int getValue() {
    return _counter;
  }

  void increment() {
    _logger.d('Before update: $_counter');
    _counter = _counter + 1;
    _logger.d('After update: $_counter');
  }
}
