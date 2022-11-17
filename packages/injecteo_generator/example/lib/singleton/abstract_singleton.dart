import 'package:injecteo/injecteo.dart';

abstract class AbstractSingleton {}

@Singleton(as: AbstractSingleton)
class AbstractSingletonImpl implements AbstractSingleton {}
