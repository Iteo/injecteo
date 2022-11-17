import 'package:injecteo/injecteo.dart';

@singleton
class SingletonWithDisposeMethod {
  @disposeMethod
  void dispose() {
    print('Disposing example singleton...');
  }
}
