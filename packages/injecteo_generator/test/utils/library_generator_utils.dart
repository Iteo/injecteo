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
  ExternalModuleConfig? externalModuleConfig, {
  List<DependencyConfig> dependencies = const [],
}) {
  if (externalModuleConfig != null) {
    return _buildExternalModuleClass(
      externalModuleConfig: externalModuleConfig,
      dependencies: dependencies,
    );
  }

  throw TestFailure('externalModuleConfig == null');
}

String runBuildInjectionModuleClass(
  InjectionModuleConfig? injectionModuleConfig, {
  List<DependencyConfig> dependencies = const [],
}) {
  if (injectionModuleConfig != null) {
    return _buildInjectionModuleClass(
      injectionModuleConfig: injectionModuleConfig,
      dependencies: dependencies,
    );
  }

  throw TestFailure('injectionModuleConfig == null');
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

DartEmitter _getDartEmitter() {
  return DartEmitter(
    orderDirectives: true,
    useNullSafetySyntax: true,
  );
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

  return _generateAcceptedCode(code);
}

String _buildInjectionModuleClass({
  required InjectionModuleConfig injectionModuleConfig,
  required List<DependencyConfig> dependencies,
}) {
  final generator = _getGenerator(dependencies);
  final code = generator.buildInjectionModuleClass(
    injectionModuleConfig: injectionModuleConfig,
    dependencyConfigs: dependencies.toSet(),
  );

  return _generateAcceptedCode(code);
}

String _generateAcceptedCode(Class code) {
  final emitter = _getDartEmitter();
  final acceptedCode = code.accept(emitter);

  return acceptedCode.toString();
}
