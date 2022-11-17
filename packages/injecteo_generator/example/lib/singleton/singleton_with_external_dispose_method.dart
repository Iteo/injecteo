import 'package:injecteo/injecteo.dart';

@Singleton(dispose: disposeCallback)
class SingletonWithExternalDisposeMethod {
  void dispose() {
    print('Disposing example singleton via callback...');
  }
}

void disposeCallback(SingletonWithExternalDisposeMethod instance) =>
    instance.dispose();
