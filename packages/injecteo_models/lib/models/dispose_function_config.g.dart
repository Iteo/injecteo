// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispose_function_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
