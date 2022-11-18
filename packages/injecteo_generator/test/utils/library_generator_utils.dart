import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:injecteo_generator/src/generators/library_generator.dart';
import 'package:injecteo_models/injecteo_models.dart';

String runLibraryGenerator(
  List<DependencyConfig> dependencies,
) {
  final generator = LibraryGenerator(
    dependencies: dependencies,
    configFunctionName: 'configureInjecteo',
  );

  final library = generator.generate();

  return DartFormatter().format(
    library
        .accept(
          DartEmitter(
            orderDirectives: true,
            useNullSafetySyntax: true,
          ),
        )
        .toString(),
  );
}

String runBuildRegisterFunction(
  DependencyConfig dependencyConfig, {
  List<DependencyConfig>? dependencies,
}) {
  final generator = LibraryGenerator(
    dependencies: dependencies ?? [],
    configFunctionName: 'configureInjecteo',
  );

  final code = generator.buildRegisterFunction(
    dependencyConfig: dependencyConfig,
    dependencyConfigs: dependencies?.toSet() ?? {},
  );

  final emitter = DartEmitter(
    orderDirectives: true,
    useNullSafetySyntax: true,
  );

  return code.accept(emitter).toString();
}
