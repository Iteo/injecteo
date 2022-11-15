import 'package:injecteo/src/annotation/inject.dart';

/// Annotated class will generate registerSingleton function
///
class Singleton extends Inject {
  const Singleton({
    this.dispose,
    super.as,
    super.env,
  });

  /// a dispose callback function
  final Function? dispose;
}

const singleton = Singleton();
