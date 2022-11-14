import 'package:di_example/core/di/logger_injection_module.dart';
import 'package:fimber/fimber.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

@loggerInjectionModule
@externalModule
abstract class LoggerConfig {
  final _debugTree = DebugTree(useColors: true);

  @dev
  LogTree get debugLogTree => _debugTree;

  @test
  LogTree get testLogTree => _debugTree;

  @prod
  LogTree get prodLogTree => _debugTree;
}
