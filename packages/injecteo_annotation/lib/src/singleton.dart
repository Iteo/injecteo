import 'package:injecteo_annotation/injecteo_annotation.dart';

/// Annotated class will generate registerSingleton function
///
class Singleton extends Factory {
  const Singleton({
    this.dependsOn,
    this.dispose,
    super.as,
    super.env,
  });

  final List<Type>? dependsOn;

  /// a dispose callback function
  final Function? dispose;
}

const singleton = Singleton();
