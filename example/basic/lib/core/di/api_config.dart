import 'package:injecteo/injecteo.dart';

@externalModule
abstract class ApiConfig {
  @dev
  String get devApiUrl => 'https://iteo.com';

  @prod
  String get prodApiUrl => 'https://iteo.com';
}
