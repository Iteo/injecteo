import 'package:injecteo/injecteo.dart';

import 'di.config.dart';

@InjecteoConfig(configFunctionName: "registerCounterFeatureDependencies")
void registerCounterDependencies(String env) =>
    registerCounterFeatureDependencies(
      GetItServiceLocator.instance,
      environment: env,
    );
