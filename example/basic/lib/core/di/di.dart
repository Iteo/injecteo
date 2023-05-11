import 'package:di_example/core/di/di.config.dart';
import 'package:injecteo/injecteo.dart';

final sl = GetItServiceLocator.instance;

@injecteoConfig
Future<void> configureDependencies(String env) => $injecteoConfig(
      sl,
      environment: env,
    );
