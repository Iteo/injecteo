import 'package:fimber/fimber.dart';
import 'package:todeo/core/di/injector.dart';

class Logger {
  static void setupLogger(String env) {
    debugTree.colorizeMap = customColorizeMap;
    Fimber.plantTree(getIt());
  }

  static final DebugTree debugTree = DebugTree(useColors: true);

  static void v(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.v(message, ex: ex, stacktrace: stacktrace);
  }

  static void w(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.w(message, ex: ex, stacktrace: stacktrace);
  }

  static void d(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.d(message, ex: ex, stacktrace: stacktrace);
  }

  static void e(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.e(message, ex: ex, stacktrace: stacktrace);
  }

  static final Map<String, ColorizeStyle> customColorizeMap = {
    'V': ColorizeStyle([AnsiStyle.foreground(AnsiColor.blue)]),
    'D': ColorizeStyle([AnsiStyle.foreground(AnsiColor.green)]),
    'W': ColorizeStyle([AnsiStyle.foreground(AnsiColor.yellow)]),
    'E': ColorizeStyle([AnsiStyle.foreground(AnsiColor.red)])
  };
}
