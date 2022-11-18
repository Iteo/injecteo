import 'package:injecteo/injecteo.dart';

abstract class AbstractFactory {}

@Inject(as: AbstractFactory)
class AbstractFactoryImpl implements AbstractFactory {}
