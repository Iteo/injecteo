import 'package:freezed_annotation/freezed_annotation.dart';

import 'dependency_type.dart';
import 'dispose_function_config.dart';
import 'external_module_config.dart';
import 'importable_type.dart';
import 'injected_dependency.dart';
import 'injection_module_config.dart';

part 'dependency_config.freezed.dart';
part 'dependency_config.g.dart';

@freezed
class DependencyConfig with _$DependencyConfig {
  const factory DependencyConfig({
    required ImportableType type,
    required ImportableType typeImplementation,
    required InjectionModuleConfig injectionModuleConfig,
    @Default(DependencyType.factory) DependencyType dependencyType,
    @Default([]) List<InjectedDependency> dependencies,
    @Default([]) List<String> environments,
    @Default(false) bool isAsync,
    @Default(false) bool preResolve,
    String? instanceName,
    String? constructorName,
    ExternalModuleConfig? externalModuleConfig,
    DisposeFunctionConfig? disposeFunctionConfig,
  }) = _DependencyConfig;

  const DependencyConfig._();

  factory DependencyConfig.fromJson(Map<String, Object?> json) =>
      _$DependencyConfigFromJson(json);

  bool get isFromExternalModule => externalModuleConfig != null;
  bool get isFromInjectionModule => injectionModuleConfig != null;

  List<InjectedDependency> get positionalDependencies =>
      dependencies.where((d) => d.isPositional).toList();

  List<InjectedDependency> get namedDependencies =>
      dependencies.where((d) => !d.isPositional).toList();
}
