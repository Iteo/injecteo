// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injected_dependency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
