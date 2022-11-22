import 'package:fimber/fimber.dart';
import 'package:injecteo/injecteo.dart';

import 'di/logger_injection_module.dart';

@loggerInjectionModule
@externalModule
abstract class LoggerConfig {
  final _debugTree = DebugTree(useColors: true);

  @dev
  LogTree get debugLogTree => _debugTree;

  @test
  LogTree get testLogTree => _debugTree;

  @prod
  LogTree get prodLogTree => DebugTree(
        useColors: true,
        logLevels: ["W", "E"],
      );
}
