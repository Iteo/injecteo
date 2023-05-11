import 'package:injecteo/injecteo.dart';
import 'package:todeo/core/app_env.dart';

import 'injector.config.dart';

final getIt = GetItServiceLocator.instance;

const mock = Environment(AppEnv.testName);
const dev = Environment(AppEnv.devName);
const prod = Environment(AppEnv.prodName);

@InjecteoConfig()
Future<void> configureDependencies(String env) async => $injecteoConfig(getIt, environment: env);
