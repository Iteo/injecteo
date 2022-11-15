import 'package:di_example/core/di/injection_modules.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

@inject
@counterInjectionModule
class CounterDataSource {
  CounterDataSource(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const String _counterKey = 'counter';

  Future<int> getValue() async {
    return _sharedPreferences.getInt(_counterKey) ?? 0;
  }

  Future<void> increment() async {
    final value = _sharedPreferences.getInt(_counterKey) ?? 0;
    final updated = value + 1;
    await _sharedPreferences.setInt(
      _counterKey,
      updated,
    );
  }
}
