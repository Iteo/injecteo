import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:injecteo_generator/src/generators/library_generator.dart';
import 'package:injecteo_models/injecteo_models.dart';
import 'package:test/test.dart';

String runLibraryGenerator(
  List<DependencyConfig> dependencies,
) {
  final generator = _getGenerator(dependencies);
  final library = generator.generate();
  final emitter = _getDartEmitter();

  return DartFormatter().format(
    library.accept(emitter).toString(),
  );
}

String runBuildRegisterFunction(
  DependencyConfig dependencyConfig, {
  List<DependencyConfig>? dependencies,
}) {
  final generator = _getGenerator(dependencies);
  final code = generator.buildRegisterFunction(
    dependencyConfig: dependencyConfig,
    dependencyConfigs: dependencies?.toSet() ?? {},
  );
  final emitter = _getDartEmitter();

  return code.accept(emitter).toString();
}

String runBuildExternalModuleClass(
  DependencyConfig dependencyConfig, {
  List<DependencyConfig> dependencies = const [],
}) {
  final externalModuleConfig = dependencyConfig.externalModuleConfig;
  if (externalModuleConfig != null) {
    return _buildExternalModuleClass(
      externalModuleConfig: externalModuleConfig,
      dependencies: dependencies,
    );
  }

  throw TestFailure('externalModuleConfig == null');
}

String _buildExternalModuleClass({
  required ExternalModuleConfig externalModuleConfig,
  required List<DependencyConfig> dependencies,
}) {
  final generator = _getGenerator(dependencies);
  final code = generator.buildExternalModuleClass(
    externalModuleConfig: externalModuleConfig,
    dependencyConfigs: dependencies.toSet(),
  );
  final emitter = _getDartEmitter();
  final acceptedCode = code.accept(emitter);

  return acceptedCode.toString();
}

DartEmitter _getDartEmitter() {
  return DartEmitter(
    orderDirectives: true,
    useNullSafetySyntax: true,
  );
}

LibraryGenerator _getGenerator([
  List<DependencyConfig>? dependencies,
  String configFunctionName = 'configureInjecteo',
]) {
  return LibraryGenerator(
    dependencies: dependencies ?? [],
    configFunctionName: configFunctionName,
  );
}
