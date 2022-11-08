import 'package:fimber/fimber.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

@module
abstract class LoggerConfig {
  final _debugTree = DebugTree(useColors: true);

  @Singleton()
  LogTree get logTree => _debugTree;
}
