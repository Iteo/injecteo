import 'package:injecteo/injecteo.dart';

@inject
class HelloFactory {
  String hello() {
    return 'hello';
  }
}

@inject
class FactoryWithDependency {
  FactoryWithDependency(this._helloFactory);

  final HelloFactory _helloFactory;

  String hello() {
    return _helloFactory.hello();
  }
}
