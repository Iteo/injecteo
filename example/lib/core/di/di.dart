import 'package:injecteo/injecteo.dart';
import 'package:injecteo_annotation/injecteo_annotation.dart';

import 'di.config.dart';

final sl = GetItServiceLocator.instance;

@injecteoInitializer
Future<ServiceLocator> configureDependencies() => $injecteoInitializer(sl);
