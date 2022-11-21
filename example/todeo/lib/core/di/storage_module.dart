import 'package:injecteo/injecteo.dart';
import 'package:shared_preferences/shared_preferences.dart';

@externalModule
abstract class StorageModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
