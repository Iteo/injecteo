import 'package:injecteo_annotation/src/factory.dart';

/// Annotated class will generate registerLazySingleton function
class LazySingleton extends Factory {
  const LazySingleton({
    super.as,
    super.env,
    this.dispose,
  });

  /// a dispose callback function
  final Function? dispose;
}

const lazySingleton = LazySingleton();
