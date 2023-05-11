import 'package:counter/src/di/di.config.dart';
import 'package:injecteo/injecteo.dart';

@InjecteoConfig(configFunctionName: 'registerCounterFeatureDependencies')
void registerCounterDependencies(String env) => registerCounterFeatureDependencies(
      GetItServiceLocator.instance,
      environment: env,
    );
