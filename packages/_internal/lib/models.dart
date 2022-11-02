import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

enum DependencyType {
  factory,
  singleton,
  lazySingleton,
}

@freezed
class DependencyConfig with _$DependencyConfig {
  const factory DependencyConfig({
    required ImportableType type,
    required ImportableType typeImplementation,
    @Default(DependencyType.factory) DependencyType dependencyType,
    @Default([]) List<InjectedDependency> dependencies,
    @Default([]) List<String> environments,
    @Default([]) List<ImportableType> dependsOn,
    String? instanceName,
    bool? signalsReady,
    String? constructorName,
    @Default(false) bool isAsync,
    @Default(false) bool preResolve,
    ModuleConfig? moduleConfig,
    DisposeFunctionConfig? disposeFunctionConfig,
  }) = _DependencyConfig;

  const DependencyConfig._();

  factory DependencyConfig.fromJson(Map<String, Object?> json) =>
      _$DependencyConfigFromJson(json);

  bool get isFromModule => moduleConfig != null;

  List<InjectedDependency> get positionalDependencies =>
      dependencies.where((d) => d.isPositional).toList();

  List<InjectedDependency> get namedDependencies =>
      dependencies.where((d) => !d.isPositional).toList();
}

@freezed
class ImportableType with _$ImportableType {
  const factory ImportableType({
    required String name,
    String? import,
    @Default(false) bool isNullable,
    @Default([]) List<ImportableType> typeArguments,
  }) = _ImportableType;

  const ImportableType._();

  factory ImportableType.fromJson(Map<String, Object?> json) =>
      _$ImportableTypeFromJson(json);
}

@freezed
class DisposeFunctionConfig with _$DisposeFunctionConfig {
  const factory DisposeFunctionConfig({
    required String name,
    @Default(false) bool isInstance,
    ImportableType? importableType,
  }) = _DisposeFunctionConfig;

  factory DisposeFunctionConfig.fromJson(Map<String, Object?> json) =>
      _$DisposeFunctionConfigFromJson(json);
}

@freezed
class InjectedDependency with _$InjectedDependency {
  const factory InjectedDependency({
    required ImportableType type,
    required String paramName,
    String? instanceName,
    @Default(true) bool isPositional,
  }) = _InjectedDependency;

  const InjectedDependency._();

  factory InjectedDependency.fromJson(Map<String, Object?> json) =>
      _$InjectedDependencyFromJson(json);
}

@freezed
class ModuleConfig with _$ModuleConfig {
  const factory ModuleConfig({
    required bool isAbstract,
    required bool isMethod,
    required ImportableType type,
    required String initializerName,
  }) = _ModuleConfig;

  factory ModuleConfig.fromJson(Map<String, Object?> json) =>
      _$ModuleConfigFromJson(json);
}
