import 'package:injecteo/injecteo.dart';

import 'di.config.dart';

@InjecteoConfig(configFunctionName: "registerLoggerFeatureDependencies")
void registerLoggerDependencies(String env) =>
    registerLoggerFeatureDependencies(
      GetItServiceLocator.instance,
      environment: env,
    );
