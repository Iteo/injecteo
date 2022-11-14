import 'package:injecteo_annotation/injecteo_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

@externalModule
abstract class StorageModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
