// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependency_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DependencyConfig _$$_DependencyConfigFromJson(Map<String, dynamic> json) =>
    _$_DependencyConfig(
      type: ImportableType.fromJson(json['type'] as Map<String, dynamic>),
      typeImplementation: ImportableType.fromJson(
          json['typeImplementation'] as Map<String, dynamic>),
      injectionModuleConfig: InjectionModuleConfig.fromJson(
          json['injectionModuleConfig'] as Map<String, dynamic>),
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
      externalModuleConfig: json['externalModuleConfig'] == null
          ? null
          : ExternalModuleConfig.fromJson(
              json['externalModuleConfig'] as Map<String, dynamic>),
      disposeFunctionConfig: json['disposeFunctionConfig'] == null
          ? null
          : DisposeFunctionConfig.fromJson(
              json['disposeFunctionConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DependencyConfigToJson(_$_DependencyConfig instance) =>
    <String, dynamic>{
      'type': instance.type,
      'typeImplementation': instance.typeImplementation,
      'injectionModuleConfig': instance.injectionModuleConfig,
      'dependencyType': _$DependencyTypeEnumMap[instance.dependencyType]!,
      'dependencies': instance.dependencies,
      'environments': instance.environments,
      'dependsOn': instance.dependsOn,
      'instanceName': instance.instanceName,
      'signalsReady': instance.signalsReady,
      'constructorName': instance.constructorName,
      'isAsync': instance.isAsync,
      'preResolve': instance.preResolve,
      'externalModuleConfig': instance.externalModuleConfig,
      'disposeFunctionConfig': instance.disposeFunctionConfig,
    };

const _$DependencyTypeEnumMap = {
  DependencyType.factory: 'factory',
  DependencyType.singleton: 'singleton',
  DependencyType.lazySingleton: 'lazySingleton',
};
