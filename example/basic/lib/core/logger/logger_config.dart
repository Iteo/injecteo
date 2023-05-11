import 'package:di_example/core/di/injection_modules.dart';
import 'package:fimber/fimber.dart';
import 'package:injecteo/injecteo.dart';

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
        logLevels: ['W', 'E'],
      );
}
