import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generators/config_generator.dart';
import 'src/generators/dependency_generator.dart';

/// At first, library scans all the files, look for annotations and prepare .json dependency descriptions
///
Builder dependencyGeneratorBuilder(BuilderOptions options) {
  return LibraryBuilder(
    InjecteoDependencyGenerator(options),
    formatOutput: (generated) => generated.replaceAll(RegExp(r'//.*|\s'), ''),
    generatedExtension: '.injecteo.json',
  );
}

/// Iterates over dependency descriptions and generate initialize function and [InjectionModule] classes
///
Builder configBuilder(BuilderOptions options) {
  return LibraryBuilder(
    InjecteoConfigGenerator(),
    generatedExtension: '.config.dart',
  );
}
