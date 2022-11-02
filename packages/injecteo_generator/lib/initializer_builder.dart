import 'package:build/build.dart';
import 'package:injecteo_generator/src/generators/initializer_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder initializerBuilder(BuilderOptions options) {
  return LibraryBuilder(
    InjecteoInitializerGenerator(),
    generatedExtension: '.config.dart',
  );
}
