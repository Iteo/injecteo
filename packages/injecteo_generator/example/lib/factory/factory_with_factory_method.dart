import 'package:injecteo/injecteo.dart';

@inject
class FactoryApiClient {
  @factoryMethod
  static Future<FactoryApiClient> create() async {
    //simulate some async initialize
    await Future.delayed(Duration(milliseconds: 1000));
    return FactoryApiClient();
  }

  String sayHello() {
    return 'hello';
  }
}
