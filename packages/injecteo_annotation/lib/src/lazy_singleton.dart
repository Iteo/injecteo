import 'package:injecteo_annotation/src/injectable.dart';

/// Annotated class will generate registerLazySingleton function
///
class LazySingleton extends Injectable {
  const LazySingleton({
    super.as,
    super.env,
    this.dispose,
  });

  /// a dispose callback function
  final Function? dispose;
}

const lazySingleton = LazySingleton();
