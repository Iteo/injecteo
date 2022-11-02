// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DependencyConfig _$$_DependencyConfigFromJson(Map<String, dynamic> json) =>
    _$_DependencyConfig(
      type: ImportableType.fromJson(json['type'] as Map<String, dynamic>),
      typeImplementation: ImportableType.fromJson(
          json['typeImplementation'] as Map<String, dynamic>),
      dependencyType: $enumDecodeNullable(
              _$DependencyTypeEnumMap, json['dependencyType']) ??
          DependencyType.factory,
      dependencies: (json['dependencies'] as List<dynamic>?)
              ?.map(
                  (e) => InjectedDependency.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      environments: (json['environments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dependsOn: (json['dependsOn'] as List<dynamic>?)
              ?.map((e) => ImportableType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      instanceName: json['instanceName'] as String?,
      signalsReady: json['signalsReady'] as bool?,
      constructorName: json['constructorName'] as String?,
      isAsync: json['isAsync'] as bool? ?? false,
      preResolve: json['preResolve'] as bool? ?? false,
      moduleConfig: json['moduleConfig'] == null
          ? null
          : ModuleConfig.fromJson(json['moduleConfig'] as Map<String, dynamic>),
      disposeFunctionConfig: json['disposeFunctionConfig'] == null
          ? null
          : DisposeFunctionConfig.fromJson(
              json['disposeFunctionConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DependencyConfigToJson(_$_DependencyConfig instance) =>
    <String, dynamic>{
      'type': instance.type,
      'typeImplementation': instance.typeImplementation,
      'dependencyType': _$DependencyTypeEnumMap[instance.dependencyType]!,
      'dependencies': instance.dependencies,
      'environments': instance.environments,
      'dependsOn': instance.dependsOn,
      'instanceName': instance.instanceName,
      'signalsReady': instance.signalsReady,
      'constructorName': instance.constructorName,
      'isAsync': instance.isAsync,
      'preResolve': instance.preResolve,
      'moduleConfig': instance.moduleConfig,
      'disposeFunctionConfig': instance.disposeFunctionConfig,
    };

const _$DependencyTypeEnumMap = {
  DependencyType.factory: 'factory',
  DependencyType.singleton: 'singleton',
  DependencyType.lazySingleton: 'lazySingleton',
};

_$_ImportableType _$$_ImportableTypeFromJson(Map<String, dynamic> json) =>
    _$_ImportableType(
      name: json['name'] as String,
      import: json['import'] as String?,
      isNullable: json['isNullable'] as bool? ?? false,
      typeArguments: (json['typeArguments'] as List<dynamic>?)
              ?.map((e) => ImportableType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ImportableTypeToJson(_$_ImportableType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'import': instance.import,
      'isNullable': instance.isNullable,
      'typeArguments': instance.typeArguments,
    };

_$_DisposeFunctionConfig _$$_DisposeFunctionConfigFromJson(
        Map<String, dynamic> json) =>
    _$_DisposeFunctionConfig(
      name: json['name'] as String,
      isInstance: json['isInstance'] as bool? ?? false,
      importableType: json['importableType'] == null
          ? null
          : ImportableType.fromJson(
              json['importableType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DisposeFunctionConfigToJson(
        _$_DisposeFunctionConfig instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isInstance': instance.isInstance,
      'importableType': instance.importableType,
    };

_$_InjectedDependency _$$_InjectedDependencyFromJson(
        Map<String, dynamic> json) =>
    _$_InjectedDependency(
      type: ImportableType.fromJson(json['type'] as Map<String, dynamic>),
      paramName: json['paramName'] as String,
      instanceName: json['instanceName'] as String?,
      isPositional: json['isPositional'] as bool? ?? true,
    );

Map<String, dynamic> _$$_InjectedDependencyToJson(
        _$_InjectedDependency instance) =>
    <String, dynamic>{
      'type': instance.type,
      'paramName': instance.paramName,
      'instanceName': instance.instanceName,
      'isPositional': instance.isPositional,
    };

_$_ModuleConfig _$$_ModuleConfigFromJson(Map<String, dynamic> json) =>
    _$_ModuleConfig(
      isAbstract: json['isAbstract'] as bool,
      isMethod: json['isMethod'] as bool,
      type: ImportableType.fromJson(json['type'] as Map<String, dynamic>),
      initializerName: json['initializerName'] as String,
    );

Map<String, dynamic> _$$_ModuleConfigToJson(_$_ModuleConfig instance) =>
    <String, dynamic>{
      'isAbstract': instance.isAbstract,
      'isMethod': instance.isMethod,
      'type': instance.type,
      'initializerName': instance.initializerName,
    };
