import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:injecteo_generator/src/generators/library_generator.dart';
import 'package:injecteo_models/injecteo_models.dart';

class TestUtils {
  String runLibraryGenerator(
    List<DependencyConfig> dependencies,
  ) {
    final library = LibraryGenerator(
      dependencies: dependencies,
      configFunctionName: 'configureInjecteo',
    ).generate();

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
}
