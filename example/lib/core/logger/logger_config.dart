import 'package:fimber/fimber.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

@externalModule
abstract class LoggerConfig {
  final _debugTree = DebugTree(useColors: true);

  @dev
  LogTree get logTree => _debugTree;

  @prod
  LogTree get prodTree => _debugTree;
}
