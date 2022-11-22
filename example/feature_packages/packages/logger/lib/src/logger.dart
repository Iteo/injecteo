import 'package:fimber/fimber.dart';
import 'package:injecteo/injecteo.dart';
import 'package:logger/src/di/logger_injection_module.dart';

@loggerInjectionModule
@singleton
class Logger {
  Logger(LogTree logTree) {
    Fimber.plantTree(logTree);
  }

  void v(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.v(message, ex: ex, stacktrace: stacktrace);
  }

  void d(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.d(message, ex: ex, stacktrace: stacktrace);
  }

  void w(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.w(message, ex: ex, stacktrace: stacktrace);
  }

  void e(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.e(message, ex: ex, stacktrace: stacktrace);
  }
}
