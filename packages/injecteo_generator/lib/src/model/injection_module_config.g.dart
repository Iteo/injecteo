// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection_module_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InjectionModuleConfig _$$_InjectionModuleConfigFromJson(
        Map<String, dynamic> json) =>
    _$_InjectionModuleConfig(
      type: ImportableType.fromJson(json['type'] as Map<String, dynamic>),
      moduleName: json['moduleName'] as String,
    );

Map<String, dynamic> _$$_InjectionModuleConfigToJson(
        _$_InjectionModuleConfig instance) =>
    <String, dynamic>{
      'type': instance.type,
      'moduleName': instance.moduleName,
    };
