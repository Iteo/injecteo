import 'package:fimber/fimber.dart';
import 'package:injecteo/injecteo.dart';
import 'package:todeo/core/app_env.dart';
import 'package:todeo/core/logger/logger.dart';

@externalModule
abstract class ConfigModule {
  @test
  @Singleton()
  AppEnv get testEnv => AppEnv.test();

  @dev
  @Singleton()
  AppEnv get devEnv => AppEnv.development();

  @prod
  @Singleton()
  AppEnv get prodEnv => AppEnv.production();

  @test
  @Singleton()
  LogTree get testLogTree => Logger.debugTree;

  @dev
  @Singleton()
  LogTree get devLogTree => Logger.debugTree;

  @prod
  @Singleton()
  LogTree get prodLogTree => Logger.debugTree;
}
