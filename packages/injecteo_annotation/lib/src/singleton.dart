import 'package:injecteo_annotation/injecteo_annotation.dart';

/// Annotated class will generate registerSingleton function
///
class Singleton extends Injectable {
  const Singleton({
    this.dispose,
    super.as,
    super.env,
  });

  /// a dispose callback function
  final Function? dispose;
}

const singleton = Singleton();
