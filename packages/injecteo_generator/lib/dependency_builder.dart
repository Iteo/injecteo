import 'package:build/build.dart';
import 'package:injecteo_generator/src/generators/dependency_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder dependencyBuilder(BuilderOptions options) {
  return LibraryBuilder(
    InjecteoDependencyGenerator(options),
    formatOutput: (generated) => generated.replaceAll(RegExp(r'//.*|\s'), ''),
    generatedExtension: '.injecteo.json',
  );
}
