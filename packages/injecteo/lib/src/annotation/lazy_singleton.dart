import 'package:injecteo/src/annotation/inject.dart';

/// Annotated class will generate registerLazySingleton function
///
class LazySingleton extends Inject {
  const LazySingleton({
    super.as,
    super.env,
    this.dispose,
  });

  /// a dispose callback function
  final Function? dispose;
}

const lazySingleton = LazySingleton();
