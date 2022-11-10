// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
