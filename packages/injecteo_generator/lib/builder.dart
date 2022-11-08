import 'package:build/build.dart';
import 'package:injecteo_generator/src/generators/dependency_generator.dart';
import 'package:injecteo_generator/src/generators/initializer_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder dependencyGeneratorBuilder(BuilderOptions options) {
  return LibraryBuilder(
    InjecteoDependencyGenerator(options),
    formatOutput: (generated) => generated.replaceAll(RegExp(r'//.*|\s'), ''),
    generatedExtension: '.injecteo.json',
  );
}

Builder initializerBuilder(BuilderOptions options) {
  return LibraryBuilder(
    InjecteoInitializerGenerator(),
    generatedExtension: '.config.dart',
  );
}
