import 'package:injecteo/injecteo.dart';

@singleton
class SingletonApiClient {
  @factoryMethod
  static Future<SingletonApiClient> create() async {
    //simulate some async initialize
    await Future.delayed(Duration(milliseconds: 1000));
    return SingletonApiClient();
  }

  String sayHello() {
    return 'hello';
  }
}
