import 'package:injecteo/injecteo.dart';

import 'di.config.dart';

final sl = GetItServiceLocator.instance;

@injecteoConfig
Future<void> configureDependencies(String env) => $injecteoConfig(
      sl,
      environment: env,
    );
